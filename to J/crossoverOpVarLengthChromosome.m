function pop = crossoverOpVarLengthChromosome(opt, pop, state)
% Function: pop = crossoverOp(opt, pop, state)
% Description: Crossover operator. All of the individuals would be do crossover, but
%   only "crossoverFraction" of design variables of an individual would changed.
%

%*************************************************************************
% 1. Check for the parameters
%*************************************************************************
% determine the crossover method
strfun = lower(opt.crossover{1});
numOptions = length(opt.crossover) - 1;
[crossoverOpt{1:numOptions}] = opt.crossover{2:end};

switch( strfun )
    case 'intermediate'
        fun = @crsIntermediate;
    otherwise
        fun = @VarLengthChromosome;
end

nVar = opt.numVar;

% "auto" crossover fraction
if( ischar(opt.crossoverFraction) )
    if( strcmpi(opt.crossoverFraction, 'auto') )
        fraction = 2.0 / nVar;
    else
        error('NSGA2:CrossoverOpError', 'The "crossoverFraction" parameter should be scalar or "auto" string.');
    end
else
    fraction = opt.crossoverFraction;
end


for ind = 1:2:length(pop)    % Popsize should be even number
        % Create children
        [child1, child2] = fun( pop(ind).var, pop(ind+1).var, fraction, opt );
        
        % Round
        for v = 1:nVar
            if( opt.vartype(v) == 2)
                child1.var(v) = round( child1.var(v) );
                child2.var(v) = round( child2.var(v) );
            end
        end

        % Bounding limit
       % child1.var = varlimit(child1.var, opt.lb, opt.ub);
       % child2.var = varlimit(child2.var, opt.lb, opt.ub);
        
        pop(ind).var     = child1;
        pop(ind+1).var   = child2;
    
end



function [child1, child2] = crsIntermediate(parent1, parent2, fraction, options)
% Function: [child1, child2] = crsIntermediate(parent1, parent2, fraction, options)
% Description: (For real coding) Intermediate crossover. (Same as Matlab's crossover 
%   operator)
%       child = parent1 + rand * Ratio * ( parent2 - parent1)
% Parameters: 
%   fraction : crossover fraction of variables of an individual
%   options = ratio



if( length(options)~=1 || ~isnumeric(options{1}))
    error('NSGA2:CrossoverOpError', 'Crossover operator parameter error!');
end

ratio = options{1};

child1 = parent1;
child2 = parent2;

nVar = length(parent1.var);
crsFlag = rand(1, nVar) < fraction;

randNum = rand(1,nVar);     % uniformly distribution

child1.var = parent1.var + crsFlag .* randNum .* ratio .* (parent2.var - parent1.var);
child2.var = parent2.var - crsFlag .* randNum .* ratio .* (parent2.var - parent1.var);

function [child1, child2] = VarLengthChromosome(parent1, parent2, fraction, opt)
%     if( length(options)~=1 || ~isnumeric(options{1}))
%         error('NSGA2:CrossoverOpError', 'Crossover operator parameter error!');
%     end
%         child1 = [];
%         child2 = [];
    if (rand(1) > (1-opt.crossover{1,2}))    
        N = length(parent1);
        M = length(parent2);
        r1 = randi([1, min(N,M)]);
        N1 = min(N,M);
        M1 = max(N,M);
        if(N1 == M1)
            %throw('SHIT!')
            r1 = randi([1, N1]);
            parentMin = parent1;
            parentMax = parent2;
            child1 = [parentMin(:,1:r1), parentMax(:,r1+1:M1)];
            child2 = [parentMax(:,1:r1), parentMin(:,r1+1:M1)];
        else
        % random numbers for variable chromosome lenghts crossover
            r1 = randi([1, N1]);
            r2 = randi([N1+1, M1]);
            % crossover of two different-length chromosomes
            if (N <= M)
                parentMin = parent1;
                parentMax = parent2;
                child1 = [parentMin(:,1:r1), parentMax(:,r1+1:r2)];
                child2 = [parentMax(:,1:r1), parentMin(:,r1+1:N1), parentMax(:,r2+1:M1)];
            else
                parentMin = parent2;
                parentMax = parent1;
                child2 = [parentMin(:,1:r1), parentMax(:,r1+1:r2)];
                child1 = [parentMax(:,1:r1), parentMin(:,r1+1:N1), parentMax(:,r2+1:M1)];
            end

        end
%         child1 = [parent1(:,1:r1), parent2(:,r1+1:M)];
%         child2 = [parent2(:,1:r1), parent1(:,r1+1:N)];
    else
        child1 = parent1;
        child2 = parent2;
    end
    



