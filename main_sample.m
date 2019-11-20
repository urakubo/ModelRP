%%% Initial

	clear;
	addpath('./funcs');

%%% Model definition

	Tstop = 10;
	init_species = InitSpecies();
	init_params  = InitParams();
	[model, species, params] = DefineModel(init_species, init_params, Tstop);
	InitReacs(model);

	% set (species{'B','Obj'}, 'ConstantAmount', true);

%%% Simulation

	sd = sbiosimulate(model);

%%% Graph plot

	XLIM = [0, Tstop];
	YLIM = [0, 2];
	targ_molecules = {{'A','B','C'},{'S','E','P'}};
	col = {'r','g','b'};

	figure;
	for j = 1:2;
		subplot(1,2,j)
		plot_profs_prep(XLIM, YLIM)
		plot_prof(targ_molecules{j}, sd, col)
		legend(targ_molecules{j});
	end

%%%
%%% Define species, parameters, and reactions
%%%

function species = InitSpecies
	species   = {
		'A'		, 2	;
		'B'		, 1	;
		'C'		, 0	;
		'S'		, 2	;
		'E'		, 0.1	;
		'P'		, 0
		};
end

function params = InitParams
	params  = {
		'kf'		, 0.5	;
		'kb'		, 0.5	;
		'Km'		, 1	;
		'kcat'		, 10
		};
end

function InitReacs(model);
	Reac21('A','B','C', 'kf','kb', model)	; % A + B <-kb kf-> C
	ReacEnz('S','E','P', 'Km','kcat', model); % S  -(E)-> P
end



%%%
%%% Figure plot
%%%

function plot_prof(tname, sd, col)

	T = sd.Time;
	for i = 1:numel(tname)
		tid = find( strcmp( sd.DataNames, tname{i} ) );
		DATA = sd.Data(:,tid);
		plot( T, DATA, '-', 'Color', col{i});
	end

end

function plot_profs_prep(XLIM, YLIM)

	xlabel('Time (s)');
	ylabel('Concentration (uM)');
	xlim(XLIM);
	ylim(YLIM);
	axis square;
	box off;
	set(gca,'TickDir','out');
	hold on;

end


