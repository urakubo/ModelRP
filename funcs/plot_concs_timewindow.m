%%
%%
%%
function fig = plot_concs_timewindow(tname, DA_delay, concs, YminYmax)

	fig = figure('pos',[200 200 300 200],'PaperUnits','inches','PaperPosition',[2 2 2.5 2]);
	ax1 = axes('Position',[0.2 0.2 0.6 0.5]);
	ax1.ActivePositionProperty = 'Position';

	plot( DA_delay, concs, 'k-', 'LineWidth', 2);
	xlabel('DA delay (s)');
	ylabel(sprintf('%s (uM)', tname),'Interpreter', 'none');
	xlim([floor(min(DA_delay)), ceil(max(DA_delay))]);
	ylim(YminYmax);
	hold on;
	plot( [0 0], YminYmax, 'r:');
	box off;
	set(gca,'TickDir','out');

