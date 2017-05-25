function png = save_as_png(pop, opt, ngen)
    fig = figure;
    hold on

    pareto1 = [];
    for i = 1:length(pop)
        plot(pop(i).obj(1), pop(i).obj(2), 'x','color','b')
        if(pop(i).rank == 1)
            pareto1 = [pareto1; pop(i).obj];
        end
    end
    pareto1 = sortrows(pareto1);
    plot(pareto1(:,1), pareto1(:,2), 'r-');
    strTitle = sprintf('Generation %d / %d', ngen, opt.maxGen);
    title(strTitle, 'interpreter', 'none');
    box on
    xlim([0 1.1])
    ylim([0 1.1])
    strObj1 = 'Pool of fake links';
    strObj2 = 'Compression ratio';
    xlabel(strObj1, 'interpreter', 'none');
    ylabel(strObj2, 'interpreter', 'none');
    saveas(fig,strcat('res\',num2str(ngen),'_of_500'),'png');
    close all
end