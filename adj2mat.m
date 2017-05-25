function A=adj2mat(name)
% takes an adjacency list and converts it into a sparse matrix

unix(['awk ''/^[^%]/ { for (i = 2 ; i <= NF; i++){print $1, $i, "1"}}'' < ' ...
name ' > /tmp/matlabtmpfile']);
A=spconvert(dlmread('/tmp/matlabtmpfile',' '));