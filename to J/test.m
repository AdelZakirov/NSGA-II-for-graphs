
options = nsgaopt();                    % create default options structure
% options.popsize = 50;                   % populaion size
% options.maxGen  = 100;                  % max generation

options.numObj = 2;                     % number of objectives
options.numVar = 2;                     % number of design variables
options.numCons = 0;                    % number of constraints
options.lb = [0.1  0];                  % lower bound of x
options.ub = [1    5];                  % upper bound of x
options.objfun = @test_obj;             % objective function handle
% options.plotInterval = 1;             % interval between two calls of "plotnsga". 

load('EcoliAdjList.mat')
result = nsga2(options,EcoliAdjList);                % begin the optimization!


