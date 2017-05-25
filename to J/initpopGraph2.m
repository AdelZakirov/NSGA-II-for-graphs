function pop = initpopGraph2(opt, pop, graph)
% TODO! description
N = length(pop);
M = length(graph);
ratio = 0.5;
b = cell(N,1);
index = [];
for i = 1:N
    nodes = 1:M;
    chromosome_length = randi([round(M*0.05), round(M*ratio)]);
    index = randi(length(nodes),1,chromosome_length); 
    b{i} = nodes(index);
    nodes(index) = [];
    rng('shuffle')
    index = randi(length(nodes),1,chromosome_length); 
    b{i} = [b{i}; nodes(index)];
end
for i = 1:N
pop(i).var = b{i};
end