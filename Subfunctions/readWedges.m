function wedges = readWedges(file_name)
%readWedges get wedges info into struct

    %%%%%%%%%%
%     file_name = '../wedges.txt'; %TESTING ONLY
    %%%%%%%%%%
    
    fid = fopen(file_name);%open file
    line = fgetl(fid);
    header = strsplit(line, ';'); %split at semicolons
    wedges = struct(); %make struct
    for indField = 1:numel(header)
        wedges.(header{indField}) = NaN; %make all the fields w/ dummy val
    end
    line = fgetl(fid);
    while(~isnumeric(line))
        parts = strsplit(line, ';');
        for indF = 1:numel(header)
            if(~isnan(str2double(parts{indF})))
                parts{indF} = str2double(parts{indF}); %conver to doubles
            end %if
            wedges(parts{1}).(header{indF})= parts{indF};
                %add each part into the struct, ID is also it's position

        end %for loop
        line = fgetl(fid);
    end% while loop
        

end