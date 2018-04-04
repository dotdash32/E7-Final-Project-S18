function strat = readStrat(file_name)
    fid = fopen(file_name);%open file
    line = fgetl(fid);
    header = strsplit(line); %split at semicolons
    strat = struct(); %make struct
    for indField = 1:numel(header)
        strat.(header{indField}) = NaN; %make all the fields w/ dummy val
    end
    line = fgetl(fid);
    indSpot = 1; %increment through each spot
    while(~isnumeric(line))
        parts = strsplit(line);
        for indF = 1:numel(header)
            if(~isnan(str2double(parts{indF})))
                parts{indF} = str2double(parts{indF}); %conver to doubles
            end %if
            strat(indSpot).(header{indF})= parts{indF};
                %add each part into the struct, ID is also it's position

        end %for loop
        line = fgetl(fid);
        indSpot = indSpot + 1; %next spot
    end% while loop
end
