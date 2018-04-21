%%%%%%%%%%%%%%%%%%%%%%%%%%

% Test wedge graphing

%%%%%%%%%%%%%%%%%%%%%%%%%

%% Define stuff

numWedges = 20; %how many iterations
startYear = 2018; %when to start

yearbounds = [2018 2068];
figure;
xlim(yearbounds);
funcs = cell(1,numWedges+1);
funcs{1} =  @(t) 10*2.^((t-2018)/50); %base function
hold on


%% For loopies

for indW = 1:numWedges
    funcs{indW+1} = oneWedge(funcs{indW}, startYear, 'blue');
end