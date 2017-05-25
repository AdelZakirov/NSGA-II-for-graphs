function state = statpop(pop, state)
% Function: state = statpop(pop, state)
% Description: Statistic Population.


N = length(pop);
rankVec = vertcat(pop.rank);
rankVec = sort(rankVec);

state.frontCount = rankVec(N);
state.firstFrontCount = length( find(rankVec==1) );



