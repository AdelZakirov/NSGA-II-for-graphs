function fitness = fitnessFunctionLoss3(list, chromosome, bonus)
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
list2 = list;
nodes = 1:length(list1);
nodes(chromosome) = [];
list1(nodes,:) = {0};
% edges1 = list2edges(list1);
% edges = edges1;
% edges(any(edges==0,2),:)=[];
% q = edges(:,1)==edges(:,2);
% edges(q,:) = [];
% edges = unique(sort(edges,2),'rows');
% % inter = ismember(edges(:,2),edges(:,1));

clear edges1
list2(nodes,:) = [];
allLinksInCompressions = cell2mat(list2');
linkedNodes = unique(sort(allLinksInCompressions));
n = length(chromosome);
m = length(linkedNodes);
k = length(allLinksInCompressions);
fitness = n * m/2 - k;
%allPossibleNonExsLinks = 1123*1122/2 - 2108; % for ecoli
% allPossibleNonExsLinks = 690*689/2 - 1082;
allPossibleNonExsLinks = 1508*1507/2 - 4552; % fallout
fitness = 1 - fitness/allPossibleNonExsLinks;
% numberOfEdgesBetweenCompressedNodes = sum(inter);
% % numberOfEdgesBetweenCompressedOrOtherNodes = length(edges);
% numberOfEdgesBetweenCompressedAndOtherNodes = length(edges) - length(intersection);
% numberOfCompressedNodes = length(chromosome);
% 
% fitness1 = numberOfEdgesBetweenCompressedNodes * numberOfEdgesBetweenCompressedAndOtherNodes;
% fitness2 = numberOfCompressedNodes * (numberOfCompressedNodes - 1) / 2 - numberOfEdgesBetweenCompressedNodes;
% allPossibleNonExsLinks = 1123*1122/2 - 2108;
% % edges(any(edges==0,2),:)=[];
% % q = edges(:,1)==edges(:,2);
% % edges(q,:) = [];
% % edges = unique(sort(edges,2),'rows');
% 
% % 2108 is total number of edges
% fitness = 1 - (fitness1 + fitness2)/allPossibleNonExsLinks ;
