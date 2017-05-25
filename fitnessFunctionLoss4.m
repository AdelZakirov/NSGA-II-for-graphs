function fitness = fitnessFunctionLoss4(list, chromosome, bonus)

fitness = 0;
list2 = list;
nodes = 1:length(list2);
nodes(chromosome) = [];
list2(nodes,:) = [];
allLinksInCompressions = cell2mat(list2');

for i = 1:length(list2)-1
   for j = 2:length(list2) 
       fitness = fitness + length(setxor(list2{i,1},list2{j,1}));
   end
end

%allPossibleNonExsLinks = 1123*1122/2 - 2108; % for ecoli
allPossibleNonExsLinks = 690*689/2 - 1082;
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
