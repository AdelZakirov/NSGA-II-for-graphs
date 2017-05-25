function pop = mutationOpInt(opt, pop, state, M)
% Function: pop = mutationOpInt(opt, pop, state)
% Description: Mutation Operator. All of the individuals would do mutation, but
%   only "mutationFraction" of design variables of an individual would changed.

%*************************************************************************
% 1. Check for the parameters
%*************************************************************************
% mutation method
strfun = lower(opt.mutation{1});
numOptions = length(opt.mutation) - 1;
[mutationopt{1:numOptions}] = opt.mutation{2:end};

switch (strfun)
    case 'gaussian'
        fun = @mutationRand;
    otherwise
        error('NSGA2:MutationOpError', 'No support mutation operator!');
end

nVar = opt.numVar;

% "auto" mutation fraction
if( ischar(opt.mutationFraction) )
    if( strcmpi(opt.mutationFraction, 'auto') )
        fraction = 2.0 / nVar;
    else
        error('NSGA2:MutationOpError', 'The "mutationsFraction" parameter should be scalar or "auto" string.');
    end
else
    fraction = opt.mutationFraction;
end


% All of the individual would be modified, but only 'mutationFraction' of design
% variables for an individual would be changed.
for ind = 1:length(pop)
        child.var = fun( pop(ind).var, opt, state, fraction, M);      
       % child.var = varlimit(child.var, opt.lb, opt.ub);
        pop(ind).var = child.var;
end




function child = mutationRand( parent, opt, state, fraction, M)
    if (rand(1)> (1-opt.mutation{1,2}))
        N = length(parent);
        % choose mutation point randomly
        mutationPoint = randi([1,N]);
        % choose mutation randomly
        % M - initial graph size
        mutation1 = randi([1,M-1],1,1);
        mutation2 = randi([2,M],1,1);
        mutation = [mutation1, mutation2];
        % mutate
        mutatedParent = parent;
        mutatedParent(:,mutationPoint) = mutation;%parent(:,mutationPoint) + mutation;
        child = mutatedParent;
    else
        child = parent;
    end






