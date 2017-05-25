function pop = initpopGraph(opt, pop, graph)
N = length(pop);
M = length(graph);
ratio = 1.0;
b = cell(N,1);
for i = 1:N
    chromosome_length = randi([round(M*0.05), round(M*ratio)]);
    b{i} = randi(M,1,chromosome_length);
    rng('shuffle')
    b{i} = [b{i}; randi(M,1,chromosome_length)];
end
for i = 1:N
pop(i).var = b{i};
end