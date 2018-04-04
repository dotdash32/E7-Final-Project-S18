function constraints = readConstraints(file_name)
    fid = fopen(file_name);%open file
    line = fgetl(fid);
    header = strsplit(line); %split at semicolons
    constraints = struct(); %make struct
    line = fgetl(fid);
    while(~isnumeric(line))
        parts = strsplit(line);
        parts{2} = str2double(parts{2}); %conver to doubles
        constraints.(parts{1})= parts{2};
            %add each part into the struct, ID is also it's position
        line = fgetl(fid);
    end% while loop
        

end