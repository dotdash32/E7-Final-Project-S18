function [newFunc] = oneWedge(func,startYear,color)
%oneWedge Graph one wedge
%   func is function handle of last line
%   startYear is when the wedge is started
%   color is what color to make the wedge

%   Basic idea: intake function, find value at start year, and +50 years.
%   From there, do a linreg on exponential function and create new
%   exponential function.  Then use fill from startYear to end and enclose
%   the wedge from the above function and the current one

    endYear = 2068; %make it more adjustable
    boundar(1,:) = [startYear,startYear+50];
    boundar(2,:) = func(boundar(1,:)); % x and y bounds
    if(boundar(2,2) > boundar(2,1)) %above, so use exp func
        A = [1 0; 1 50]; %A is basically constant
        b = log(boundar(2,:)-[0,1])'; %log of y, with second value being one less
        c = A\b; %lin reg
        newFunc = @(t) boundar(2,1)*exp(c(2)*(t-startYear)); %define
    else % below or flatline, so gotta be straight
        newFunc = @(t) (((boundar(2,2)-1)-boundar(2,1))/50)*(t- ...
            startYear)+ boundar(2,1); %define linear function
    end %if statement
    x = startYear:endYear; %what are the x vals to check?
    xRev = endYear:-1:startYear; %go in reverse
    % fill boundaries are upper function for all x, lower function for all
    % x, but in reverse
    ydata = [func(x) newFunc(xRev)]; %y bounds
    fill([x,xRev],ydata, color);
end

