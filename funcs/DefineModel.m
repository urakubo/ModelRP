
%%%
%%%
%%%
function  [model, species, params] = DefineModel(init_species_, init_params_, stop_time);

	if nargin==2;
		stop_time = 100;
	end
	init_species = cell2table(init_species_, 'VariableNames', {'Name','Conc'});
	init_species.Properties.RowNames = init_species_(:,1);
	init_params = cell2table(init_params_, 'VariableNames', {'Name','Param'});
	init_params.Properties.RowNames = init_params_(:,1);


	model        = sbiomodel('Test enz');
	compartment  = addcompartment(model,'Cell body');
	configObj = getconfigset(model);
	set(configObj, 'StopTime', stop_time);

	params  = SetParams(init_params_, model);
	species = SetSpecies(init_species_, model, compartment);

	%%
	%% Simulation config
	%%
	configsetObj = getconfigset(model);
	set(configsetObj.SolverOptions, 'AbsoluteTolerance', 1.000000e-08);
	set(configsetObj.SolverOptions, 'RelativeTolerance', 1.000000e-05);


