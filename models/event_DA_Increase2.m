
	%%
	%% Add event
	%%
	tVGCC   = addparameter(model, 'Toffset_VGCC', Toffset_VGCC);
	tDA     = addparameter(model, 'Toffset_DA'  , Toffset_DA);

	set(species{'DAbasal','Obj'}, 'ConstantAmount', false);
	set(species{'DAbasal','Obj'}, 'BoundaryCondition', true);



	e1 = addevent(model,'time>=500', 'cAMP = 0.0');
	e1 = addevent(model,'time>=600', 'cAMP = 0.0');
	e1 = addevent(model,'time>=700', 'cAMP = 0.0');
	e1 = addevent(model,'time>=800', 'cAMP = 0.0');
	e1 = addevent(model,'time>=900', 'cAMP = 0.0');
	e1 = addevent(model,'time>=1000', 'cAMP = 0.0');
	e1 = addevent(model,'time>=1100', 'cAMP = 0.0');


	e1 = addevent(model,'time>=Toffset_VGCC'		,'VGCC = VGCC + VGCCplus');
	e1 = addevent(model,'time>=Toffset_VGCC + 0.1'	,'VGCC = VGCC + VGCCplus');
	e1 = addevent(model,'time>=Toffset_VGCC + 0.2'	,'VGCC = VGCC + VGCCplus');
	e1 = addevent(model,'time>=Toffset_VGCC + 0.3'	,'VGCC = VGCC + VGCCplus');
	e1 = addevent(model,'time>=Toffset_VGCC + 0.4'	,'VGCC = VGCC + VGCCplus');
	e1 = addevent(model,'time>=Toffset_VGCC + 0.5'	,'VGCC = VGCC + VGCCplus');
	e1 = addevent(model,'time>=Toffset_VGCC + 0.6'	,'VGCC = VGCC + VGCCplus');
	e1 = addevent(model,'time>=Toffset_VGCC + 0.7'	,'VGCC = VGCC + VGCCplus');
	e1 = addevent(model,'time>=Toffset_VGCC + 0.8'	,'VGCC = VGCC + VGCCplus');
	e1 = addevent(model,'time>=Toffset_VGCC + 0.9'	,'VGCC = VGCC + VGCCplus');
	
	
	% 20Hz, 1s
	
	e1 = addevent(model,'time>=Toffset_DA + 0.0'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.05'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.10'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.15'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.20'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.25'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.30'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.35'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.40'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.45'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.50'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.55'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.60'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.65'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.70'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.75'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.80'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.85'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.90'	,'DA = DA + DApulse');
	e1 = addevent(model,'time>=Toffset_DA + 0.95'	,'DA = DA + DApulse');

