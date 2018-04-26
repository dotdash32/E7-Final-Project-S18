function [] = checkConstraints(app)
            %checkConstraints See if we violate constraints
            %   row striping nx3 ~ each row is RGB val
            
            names = fieldnames(app.constraints); %get the name
            vals = num2cell(zeros(1,numel(names))); %all zeros
            app.usedConst = cell2struct(vals,names,2);
            if(~isfield(app.wedges, 'ID') || ~isfield(app.strat, 'ID')) %no wedges/strat
                return; %no wedges entered, can't check further
            end %if we have constraints
            for indID = 1:numel(app.strat) %through each selected wedge
                id = app.strat(indID).ID; %store temp ID num
                if(isempty(id))
                    continue; %skip this wedge
                end %if empty
                if(~ischar(app.wedges(id).Sector))
                    continue; %skip this wedge, idk, help me
                end %if not a char
                sectors = strsplit(app.wedges(id).Sector,','); %get cell of sectors
                for indSect = 1:numel(sectors) %through each sector
                    if(isfield(app.constraints, sectors{indSect})) %does the sector appear in constriants?
                        app.usedConst.(sectors{indSect}) =  ...
                            app.usedConst.(sectors{indSect}) + 1; %increment
                    end %if in constraints
                end %for sectors
            end %for id's
            pKids = []; %list of problem rows/children
            aler = ''; %char array of alerts
            for indCS = 1:numel(names) %loop through all fields
                if(app.usedConst.(names{indCS}) > app.constraints.(names{indCS}))
                    %more used than constraints
                    aler = [aler, sprintf('More %s wedges used than allowed! \n', names{indCS})];
                    pKids = [pKids indCS]; %add to keep track
                end %for 
            end %loop through fields
            outData = app.OutTable.Data; %pull data from the output table for count of ind. wedges
            pIds = []; %problematic IDs
            for indOut = 1:size(outData, 1) %through each row
                if(outData{indOut,4} > .5*app.tWedges.Value && app.tWedges.Value > 2)
                    pIds = [pIds outData{indOut,1}]; %add id to issue
                    aler = [aler, sprintf('Wedge %d is more than half your total wedges! \n', pIds(end))];
                end %if
            end %for data
            if(~isempty(aler)) %we have alerts
                aler = [aler sprintf('Please delete highlighted wedges until constriants are met.')];
                uialert(app.UIFigure,aler, 'Constraint Violations'); %display the alert
                app.GraphButton.Enable = 'off';
            else %no errors
                app.GraphButton.Enable = 'on'; % we can graph!
            end %disp alert
            % loop through strat again to see which are problematic
            pRow = []; %strat rows with problems to highlight
            for indID = 1:numel(app.strat) %through each selected wedge
                id = app.strat(indID).ID; %store temp ID num
                if(isempty(id))
                    continue; %skip this wedge
                end %if empty
                if(~ischar(app.wedges(id).Sector))
                    continue; %skip this wedge, idk, help me
                end %if not a char
                sectors = strsplit(app.wedges(id).Sector,','); %get cell of sectors
                for indSect = 1:numel(sectors) %through each sector
                    for indKid = 1:numel(pKids) %through each problem row
                        if(strcmp(names{indKid}, sectors{indSect}))
                            pRow = [pRow indID]; %add to thingy
                        end %if
                    end %for kids
                    %%%%%%%%%%%%%%%% REEMBER WHICH ROWS OF STRAT ARE PROBLEMATIC
                end %for sectors
                if(any(app.strat(indID).ID == pIds)) % strat has issue filled ID
                    pRow = [pRow indID]; %add to thingy
                end %if ID is over used
            end %for id's
            pRow = unique(pRow); %sort and eliminate dups
            colors = .94*ones(numel(app.strat),3); % make array for color highlighting
            colors(1:2:end,:) = 1; %set to white for striping
            colors(pRow,1) = 1; %RED
            colors(pRow, 2:3) = 0; %GB none
            app.StratTable.BackgroundColor = colors; %set the colors

        end