function fitness = fitnessFunctionSimilarity(list, chromosome, bonus)
% This fuction is implementation of fitness function described in 
% "Evolving Graph Compression using Similarity Measures for Bioinformatics Applications" by
% Joseph Alexander Brown, Sheridan Houghteny, Tyler Kennedy Collinsy, Qiang Qu(2016)
%
% list - adj list of graph being processed
% chromosome - chomosome made from the graph
% bonus - if one of the roots is member of opposite list
% suppose that chromosome is a two-row array
% and adj list is a colomn

fitness = 0;
for i = 1:length(chromosome)
    % searching a node in first row (roots) of adj list
    L1 = list{chromosome(1,i)}; 
    L2 = list{chromosome(2,i)};
    if(chromosome(1,i) == chromosome(2,i))
        continue;
    else
        fitness = fitness + length(intersect(L1,L2)); % size of inetsection of two lists
        % if one of the roots is member of opposite list (L1 or L2) 
        % we are adding bonus to fitness
        if (ismember(chromosome(1,i),L2) || ismember(chromosome(2,i),L1)) 
            fitness = fitness + bonus;                                   
        end
    end
end
