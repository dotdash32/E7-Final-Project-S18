function [Data] = outputTable(wedges,strat)
%outputTable Create output data based on strategy
%   ID;StrategyName;Sector;NumberUsed;TotalCost;Challenges
%   10;Wind Electricity;Electricity;2;4;Local opposition

%   Which data structure to count number of times wedgeIDs appear
%   Ideas: 

numUsed = numel(strat); %how many wedges are used
list = [strat(1).ID; 1]; %intialize with one strat thingy
for indIt = 2:numUsed %loop through every wedge, start at 2
    indices = list(1,:) == strat(indIt).ID; %where does it appear?
    if(any(indices)) %one value is nonzero
        list(2,indices) = list(2,indices) + 1; %increment
    elseif(all(indices == 0)) %the ID doesn't show up
    list([1 2], end+1) = [strat(indIt).ID 1]; %start count
    end % if
end %for loop
%sort the list
swaps = 1;
while swaps == 1 %while we have swappies
    swaps = 0; %set it as zero, check at end of loop
    for indS = 1:size(list,2)-1
        if(list(1,indS) > list(1,indS+1))
            tempL = list(:,indS+1); %temp container
            list(:,indS+1) = list(:,indS); %move it over
            list(:,indS) = tempL; %back into place
            swaps = 1; %reset counter
        end %if
    end %for loop
end %sorting while loop
%Create the data table
Data = cell(size(list,2),6); %preallocate
for indR = 1: size(list,2)
    tempID = list(1,indR); %ID of current item
    Data{indR,1} = tempID;
    Data{indR,2} = wedges(tempID).StrategyName; 
    Data{indR,3} = wedges(tempID).Sector;
    Data{indR,4} = list(2,indR); % total count from bottom row
    Data{indR,5} = list(2,indR) * wedges(tempID).Cost; %num used * ind cost
    Data{indR,6} = wedges(tempID).Challenges; 
end %for filling data table
end

