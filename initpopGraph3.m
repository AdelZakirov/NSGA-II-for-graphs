function pop = initpopGraph3(opt, pop, graph)
% TODO! description
N = length(pop);
M = length(graph);
ratio = 1;
b = cell(N,1);

for i = 1:N
    chromosome_length = randi([2, round(M*ratio)]);
    b{i} = randperm(M,chromosome_length); 
    rng('shuffle')
end

for i = 1:N
    pop(i).var = b{i};
end 