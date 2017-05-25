function fitness = fitnessFunctionLoss(list, chromosome, bonus)
% This modification of fitness function described in 
% "Evolving Graph Compression using Similarity Measures for Bioinformatics Applications" by
% Joseph Alexander Brown, Sheridan Houghteny, Tyler Kennedy Collinsy, Qiang Qu(2016)
% modification is based on founding comprassion loss as ratio of number of edges
% we lost while merging nodes and total number of edges in original graph
% list - adj list of graph being processed
% chromosome - chomosome made from the graph
% bonus - if one of the roots is member of opposite list
% suppose that chromosome is a two-row array
% and adj list is a colomn

fitness = 0;
% qq = find(mergenodes == 0);
% if (~isempty(qq))
%     pause
% end
for i = 1:length(chromosome)-1
    for k = i+1:length(chromosome)
    % searching a node in first row (roots) of adj list
        L1 = list{chromosome(i)}; 
        L2 = list{chromosome(k)};
        if(chromosome(i) == chromosome(k))
            continue;
        else
            fitness = fitness + length(intersect(L1,L2)); % size of inetsection of two lists
            % if one of the roots is member of opposite list (L1 or L2) 
            % we are adding bonus to fitness
            if (ismember(chromosome(i),L2) || ismember(chromosome(k),L1)) 
                fitness = fitness + bonus;                                   
            end
        end
    end
end
% 2108 is total number of edges
fitness = (2108 - fitness)/2108;
