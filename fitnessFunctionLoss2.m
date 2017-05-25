function fitness = fitnessFunctionLoss2(list, chromosome, bonus)
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
list1 = list;
nodes = 1:length(list1);
nodes(chromosome) = [];
list1(nodes,:) = {0};
edges = list2edges(list1);
% edges(any(edges==0,2),:)=[];
% q = edges(:,1)==edges(:,2);
% edges(q,:) = [];
% edges = unique(sort(edges,2),'rows');

% 2108 is total number of edges
fitness = (2108 - length(edges))/2108;
