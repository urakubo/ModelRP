%%
%%
%%
function max_val = max_concs(tname, sd, Timing, Tstart, Tend, Toffset)
	max_val = [];
	for i = 1: numel(Timing);
		tid = find( strcmp( sd{1}.DataNames, tname ) );
		time = sd{i}.Time - Toffset;
		data = sd{i}.Data(:,tid);
		id = find((time >= Tstart)&(time <= Tend));
		max_val = [max_val, max(data(id))];
	end;
end

