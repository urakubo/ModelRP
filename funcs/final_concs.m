%%
%%
%%
function end_val = final_concs(tname, sd, Concs, Tend, Toffset)

	end_val = [];
	for i = 1: numel(Concs);
		tid = find( strcmp( sd{1}.DataNames, tname ) );
		time = sd{i}.Time - Toffset;
		data = sd{i}.Data(:,tid);
		[time, index] = unique(time);
		vq = interp1(time,data(index),Tend);
		end_val = [end_val, vq];
	end;

