load('C:\Work\Joseph Lab\data\games_outputs\falloutnv\cities2.mat')
create_adj_mat
figure
G = graph(am);
G.Nodes.NodeColors = c2;
p = plot(G)
p.NodeCData = G.Nodes.NodeColors;
r1 = rand(1,length(c2));
r2 = rand(1,length(c2));
p.XData = p.XData + c2'+r1;
p.YData = p.YData + r2;
p.MarkerSize = 4;
% p.YData = 
colorbar
colormap jet
title('Fallout New Vegas')


cand = res(137).var';
c3 = c2;
c3(cand) = c3(cand(1));
figure 
G = graph(am);
G.Nodes.NodeColors = c3;
p = plot(G)
p.NodeCData = G.Nodes.NodeColors;
p.XData = p.XData + c2'+r1;
p.YData = p.YData + r2;
p.MarkerSize = 4;
% p.YData = 
colorbar
colormap jet
title('Fallout New Vegas')