%%%

	clear;
	addpath('./funcs');
	addpath('./models');
	data_dir ='data/';

%%%

	Toffset_VGCC 	= 1910;
	Toffset_DA 		= 1910;
	Tstop			= 2100;
	Tstart    		= -30;
	Tend      		= 150;

	DA_delay  = [-2:0.2:5];

%%% Load model

	[model, tDA] = load_model(Toffset_VGCC, Toffset_DA, Tstop);

%%% Simulation

	sd   = cell(numel(DA_delay),1);
	for i = 1:numel(DA_delay);
		tDA.Value = DA_delay(i) + Toffset_VGCC;
		sd{i} = sbiosimulate(model);
	end;

%%% Plot the timing dependence of PKA

	NameMolecule = 'Ct';
	YminYmax = [0, 0.4];

	concs = max_concs(NameMolecule, sd, DA_delay, Tstart, Tend, Toffset_VGCC);
	plot_concs_timewindow(NameMolecule, DA_delay, concs, YminYmax);
	title('Max conc of PKA');
	save(sprintf('%s%s.txt', data_dir, NameMolecule), 'concs','-ascii');


%%% Plot the timing dependence of CaMKII

  	NameMolecule = 'ActiveCK';
	YminYmax = [0, 5];

	Tend = 20;
	concs = final_concs(NameMolecule, sd, DA_delay, Tend, Toffset_VGCC);
	plot_concs_timewindow(NameMolecule, DA_delay, concs, YminYmax);
	title('End conc of CaMKII');
	save(sprintf('%s%s.txt', data_dir, NameMolecule), 'concs','-ascii');


%%% Save DA delay

	save(sprintf('%sDA_delay.txt', data_dir), 'DA_delay','-ascii');

%%%
%%%

