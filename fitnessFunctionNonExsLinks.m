function fitness = fitnessFunctionNonExsLinks(list, chromosome, bonus)
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
total 
list1 = list;
nodes = 1:length(list1);
nodes(chromosome) = [];
list1(nodes,:) = [];
allLinksInCompressions = cell2mat(list1');
linkedNodes = unique(sort(allLinksInCompressions));
edgesInCompression = list2edges(list1);
numberOfRepetitions = length(allLinksInCompressions) - length(linkedNodes);
numberOfLinkedNodes = length(linkedNodes);
numberOfCompressedNodes = length(chromosome);
% nonexisting links between compressed nodes and left nodes that appears after compression 
nonexistingLinks1 = numberOfLinkedNodes * numberOfCompressedNodes - length(edgesInCompression);
% nonexisting links in compressed part
nonexistingLinks2 = numberOfCompressedNodes * (numberOfCompressedNodes - 1) / 2 - (length(allLinksInCompressions) - numberOfRepetitions);

fitness = (nonexistingLinks1 + nonexistingLinks2)/;
% 2108 is total number of edges
fitness = (2108 - length(edges))/2108;
