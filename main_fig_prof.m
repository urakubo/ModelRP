%%%

	clear;
	addpath('./funcs');
	addpath('./models');
	data_dir ='data/';

%%%

	Toffset_VGCC 	= 1910;
	Toffset_DA 	= 1910;
	Tstop		= 2100;
	Tstart    	= -30;
	Tend      	= 150;

	DA_delay  = [-1, 0, 0.3, 0.6, 1.0, 2];

%%% Load model

	[model, tDA] = load_model(Toffset_VGCC, Toffset_DA, Tstop);

%%% Simulation

	sd   = cell(numel(DA_delay),1);
	for i = 1:numel(DA_delay);
		tDA.Value = DA_delay(i) + Toffset_VGCC;
		sd{i} = sbiosimulate(model);
	end;

%%
%% Plot
%%
	Ymin 	  = 0;
	TNAME = {'D34p_tot',	'PP1',		'cAMP',		'ActAC1',	'Ct', 		'ActiveCK'};
	YMAX  = {10, 		2.5, 		3, 		0.05,		0.5, 		30};
	XLIM  = {[-10, 50],	[-10, 50],	[-1.5,5.5],	[-1.5,5.5],	[-10, 50], 	[-10, 50]};
	XTIC  = {[-10:10:50],	[-10:10:50],	[-2:5],		[-2:5],		[-10:10:50],	[-10:10:50]};


	col = jet(numel(sd));
	for i = 1:numel(TNAME);
		plot_profs_prep(XLIM{i}, [Ymin YMAX{i}], XTIC{i});
		title(TNAME{i},'Interpreter', 'none');
		for j = 1:numel(sd);
			plot_prof(TNAME{i}, sd{j}, Toffset_VGCC, col(j,:));
		end
		legend(num2str(DA_delay','%1.1f s'));
		legend('boxoff');
	end;


%%%
%%%
%%%

function id = plot_prof(tname, sd, Toffset, col)

	tid = find( strcmp( sd.DataNames, tname ) );
	T = sd.Time - Toffset;
	DATA = sd.Data(:,tid);
	id = plot( T, DATA, '-', 'LineWidth', 0.75, 'Color', col);

end

function fig = plot_profs_prep(XLIM, YLIM, XTIC)

	fig = figure('pos',[200 200 300 150],'PaperUnits','inches','PaperPosition',[2 2 3 1.5]);
	ax1 = axes('Position',[0.2 0.2 0.6 0.6]);
	ax1.ActivePositionProperty = 'Position';
	xlabel('Time (s)');
	ylabel('(uM)');
	xlim(XLIM);
	ylim(YLIM);
	set(gca,'XTick',XTIC);
	box off;
	set(gca,'TickDir','out');
	hold on;

end
