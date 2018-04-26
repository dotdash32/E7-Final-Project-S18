function [strat] = sortStrat(strat)
%sortStrat Sort strategies by yearstart
%   Bubble sort, first by start year, then by ID

    m = numel(strat); %how many items
    swaps = 1; %preset
    while(swaps == 1) %while we doing stuff inside
        swaps = 0; %reset counter
        for indS = 1:m-1
            if(strat(indS+1).StartYear < strat(indS).StartYear)
                %out of order
                temp = strat(indS); %temp fill
                strat(indS) = strat(indS+1); %flip order
                strat(indS+1) = temp; %fill it back up
                swaps = 1; %we did a sort
            elseif(strat(indS+1).StartYear == strat(indS).StartYear && ...
                    strat(indS+1).ID < strat(indS).ID)
                %The id's are not in order
                temp = strat(indS); %temp fill
                strat(indS) = strat(indS+1); %flip order
                strat(indS+1) = temp; %fill it back up
                swaps = 1; %we did a sort
            end %if sorter
        end %for each wedge
    end %while swapping
end

