function [] = expWedges(numWedges)
%expWedges Graph exponential wedges
%   Detailed explanation goes here

    strtYr = 2017; %start year, might have to change?
    x = 2017:2067;
    funcs{1} = @(t) 10*2.^((t-strtYr)/50);
    plot(x,funcs{1}(x))
    hold on;
    for indW = 2:numWedges %for each wedge
        A = [1 (x(1)-strtYr); 1 (x(end)-strtYr)];
        b = log(funcs{indW-1}(x([1,end])) - [0,1])'; %create b array
        c = A\b; %linreg
        funcs{indW} = @(t) funcs{indW-1}(x(1))*exp(c(2)*(t - strtYr)); %func
        plot(x, funcs{indW}(x));
    end
        
end

