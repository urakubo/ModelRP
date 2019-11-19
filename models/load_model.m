%%%
%%%
%%%

function [model, tDA] = load_model(Toffset_VGCC, Toffset_DA, Tstop);


%	TYPE = 'D2'; DAbasal = 0.5; STIM = 'Dip';
	TYPE = 'D1'; DAbasal = 0.0; STIM = 'Burst';
	SVR		 = 30;
	SVRspine = 30;
	durDA = 0.4;

	%%
	%% MSN
	%%
	init_species = InitSpecies(SVR, DAbasal, SVRspine);
	init_params  = InitParams(SVR, SVRspine);
	[model, species, params] = DefineModel(init_species, init_params, Tstop);
	InitReacs(model, species, params, TYPE);

	%%
	%% Set event
	%%
	switch TYPE
   		case {'D1','D1_Pav'}
      		set(species{'D2R','Obj'}, 'InitialAmount', 0);
      		set(species{'A2AR','Obj'}, 'InitialAmount', 0);
   		case 'D2'
      		set(species{'D1R','Obj'}, 'InitialAmount', 0);
      		set(species{'AC5sub0','Obj'}, 'InitialAmount', 0);
      		set(species{'AC5sub1','Obj'}, 'InitialAmount', 0);
      		set(species{'AC5sub2','Obj'}, 'InitialAmount', 0);
		end

	switch STIM
   		case 'Burst'
			if DAbasal == 0.0
				run('event_DA_Increase.m');
			elseif DAbasal == 0.5
				run('event_DA_Increase2.m');
			end
   		case 'Dip'
      		run('event_DA_Decrease.m');
	end
	


