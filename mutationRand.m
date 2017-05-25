function child = mutationRand( parent, opt, state, fraction, M)
    N = length(parent);
    % choose mutation point randomly
    mutationPoint = randi([1,N]);
    % choose mutation randomly
    % M - initial graph size
    mutation = randi([1,M],2,1);
    % mutate
    mutatedParent = parent;
    mutatedParent(:,mutationPoint) = parent(:,mutationPoint) + mutation;
    child = mutatedParent;
end