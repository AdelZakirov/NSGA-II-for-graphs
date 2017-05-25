function [y, cons] = test_obj(chromosome, list)
%*************************************************************************

y = [0,0];
cons = [0,0];

y(2) = fitnessFunctionCompression(chromosome, length(list));
% y(1) = fitnessFunctionSimilarity2(list, chromosome, 1);
y(1) = fitnessFunctionLoss5(list, chromosome, 1);

% calculate the constraint violations
cons(1) = 0;
cons(2) = 0;
% c = x(2) + 9*x(1) - 6;
% if(c<0)
%     cons(1) = abs(c);
% end
% 
% c = -x(2) + 9*x(1) - 1;
% if(c<0)
%     cons(2) = abs(c);
% end

