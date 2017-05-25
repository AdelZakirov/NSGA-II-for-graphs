load('yeastClean.mat');
uniqueEdgeList = unique(sort(yeastClean,2),'rows');
G1 = graph(uniqueEdgeList(:,1),uniqueEdgeList(:,2));
A2 = adjacency(G1);
A21 = adjmatrix2list(A2)';