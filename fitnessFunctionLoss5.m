function fitness = fitnessFunctionLoss5(list, chromosome, bonus)
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
nodes = 1:length(list);
nodes(chromosome) = [];
list(nodes,:) = [];
nears = cell2mat(list');
neighbours = setdiff(nears, chromosome);
ln = length(neighbours);
allinaction = [chromosome, neighbours];

cl = length(allinaction);
k_full = cl*(cl-1)/2; % all possible links in chromosome and connected nodes
k_chromosome = sum(cellfun(@length, list))/2; % all exististing links
k_neighbours = ln*(ln-1)/2; % all links between connected with chromosome nodes

fake_links = k_full - k_chromosome - k_neighbours;
% allPossibleNonExsLinks = 1123*1122/2 - 2108; % for ecoli
% allPossibleNonExsLinks = 1508*1507/2 - 4552; % fallout
% allPossibleNonExsLinks = 508*507/2 - 1623; % oblivion
% allPossibleNonExsLinks = 612*611/2 - 893; % skyrim
allPossibleNonExsLinks = 151*150/2 - 208; % falloutnv
fitness = 1 - fake_links/allPossibleNonExsLinks;
