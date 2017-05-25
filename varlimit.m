function var = varlimit(var, lb, ub)
% Function: var = varlimit(var, lb, ub)
% Description: Limit the variables in [lb, ub].

numVar = length(var);
for i = 1:numVar
    if( var(i) < lb(i) )
        var(i) = lb(i);
    elseif( var(i) > ub(i) )
        var(i) = ub(i);
    end
end

