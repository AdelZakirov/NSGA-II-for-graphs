function edges = list2edges(A)
edges = [];
for i = 1:length(A)
    for k = 1:length(A{i})
        B(k,1) = i;
        B(k,2) = A{i}(k);
    end
    edges = [edges; B];
end

% edges = B;