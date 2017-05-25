function result = nsga2_2(opt, pop, state, ngen, maxgen, varargin)
result.pops = pop;
results.states = state;
results.opt = opt;
% state = state(500);
% pop = pop(500,:);
AdjList = varargin{1};
graphSize = length(AdjList);
% global variables
global STOP_NSGA;   %STOP_NSGA : used in GUI , if STOP_NSGA~=0, then stop the optimizaiton
STOP_NSGA = 0;
opt.maxGen = maxgen;
%*************************************************************************
% NSGA2 iteration
%*************************************************************************
while( ngen < opt.maxGen && STOP_NSGA==0)
    % 0. Display some information
	ngen = ngen+1;
    state.currentGen = ngen;
    fprintf('\n\n************************************************************\n');
    fprintf('*      Current generation %d / %d\n', ngen, opt.maxGen);
    fprintf('************************************************************\n');
    
    % 1. Create new population
    newpop = selectOp(opt, pop);
    newpop = crossoverOpVarLengthChromosome(opt, newpop, state);
    newpop = mutationOpInt(opt, newpop, state, graphSize);
    [newpop, state] = evaluate(opt, newpop, state, varargin{:});

    % 2. Combine the new population and old population : combinepop = pop + newpop
    combinepop = [pop, newpop];
    
    % 3. Fast non dominated sort
    [opt, combinepop] = ndsort(opt, combinepop);
    
    % 4. Extract the next population
    pop = extractPop(opt, combinepop);

    % 5. Save current generation results
%     state.totalTime = toc(tStart);
    state = statpop(pop, state);
    
    result.pops(ngen, :) = pop;
    result.states(ngen)  = state;
    result.opt(ngen)  = opt;
    
    save_as_png(pop,opt,ngen);
    % 6. plot current population and output
%     if( mod(ngen, opt.plotInterval)==0 )
%         plotnsga(result, ngen);
%     end
%     if( mod(ngen, opt.outputInterval)==0 )
%         opt = callOutputfuns(opt, state, pop);
%     end
    
end

% call output function for closing file
opt = callOutputfuns(opt, state, pop, -1);

% close worker processes
if( strcmpi(opt.useParallel, 'yes'))
    poolobj = gcp('nocreate');
    delete(poolobj);
end

% toc(tStart);


