
	%%
	%% Add event
	%%
	%{
	if exist('durDA') == 0
		durDA = 0.4;
	end
	%}
	tVGCC   = addparameter(model, 'Toffset_VGCC', Toffset_VGCC);
	tDA     = addparameter(model, 'Toffset_DA'  , Toffset_DA);
	durDA   = addparameter(model, 'durDA'  , durDA);

	set(species{'DA_basal','Obj'}, 'ConstantAmount', false);
	set(species{'DA_basal','Obj'}, 'BoundaryCondition', true);


	e1 = addevent(model,'time>=500', 'cAMP = 0.0');
	e1 = addevent(model,'time>=600', 'cAMP = 0.0');
	e1 = addevent(model,'time>=700', 'cAMP = 0.0');
	e1 = addevent(model,'time>=800', 'cAMP = 0.0');
	e1 = addevent(model,'time>=900', 'cAMP = 0.0');
	e1 = addevent(model,'time>=1000', 'cAMP = 0.0');
	e1 = addevent(model,'time>=1100', 'cAMP = 0.0');


	e1   = addevent(model,'time>=Toffset_DA+0'      , 'DA_basal = 0' );
	e1   = addevent(model,'time>=Toffset_DA+durDA'  , 'DA_basal = DA_basalB' );

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


