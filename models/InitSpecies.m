%%
%%
%%

%%
function init_species = InitSpecies(SVR, DAbasal, SVRspine);
%%
	InitPDE		 = 0.04		; 
	InitD1R		 = 0.02		; 
	InitD2R		 = 0.02		; 
	InitGolf	 = 0.5		; 
	InitGi		 = 0.5		; 
	InitGbc		 = 0.3		; 
	InitCaPump   = 0.04		; 
	InitVGCCplus = 0.0667   ; 
	InitAC1		 = 0.0668	; 
	InitRGS      = 0.133	;
	InitBasalAC  = 0		;

%%
	if (SVR > 0.3)
		InitAC5		= 0.14;
		disp('Spine')
	else
		InitAC5 = 0.035;
		InitAC1 = 0.0668;
		disp('Soma')
	end
%%%
	InitPDE			= SVR * InitPDE		;
	InitD1R			= SVR * InitD1R		;
	InitD2R			= SVR * InitD2R		;
	InitGolf		= SVR * InitGolf	;
	InitGi			= SVR * InitGi		;
	InitGbc			= SVR * InitGbc		;
	InitAC1			= SVR * InitAC1		;
	InitBasalAC 	= SVR * InitBasalAC	;
	InitRGS 		= SVR * InitRGS		;
%%%
	InitCaPump   = SVR * InitCaPump 	;
	InitVGCCplus = SVR * InitVGCCplus 	;
%%%
	fprintf('AC1 conc: %g uM \n', InitAC1	);
	fprintf('AC5 conc: %g uM \n', InitAC5	);
	fprintf('Gi conc  : %g uM \n', InitGi	);
	fprintf('Golf conc: %g uM \n', InitGolf	);
	fprintf('Gbc conc : %g uM \n', InitGbc	);
	fprintf('InitD1R conc: %g uM \n', InitD1R	);
	fprintf('InitD2R conc: %g uM \n', InitD2R	);
	fprintf('InitAC1 conc: %g uM \n', InitAC1	);
	fprintf('Basal AC conc: %g uM \n', InitBasalAC	);
	fprintf('Init RGS conc: %g uM \n', InitRGS	);
	fprintf('Init PDE conc: %g uM \n', InitPDE	);


	init_species   = {
		'AllGolf'		, 0				;
		'AllGi'			, 0				;
%
		'ATP'			, 2000			;
		'cAMP'			, 0				;
		'AMP'			, 0				;
		'PDE'			, InitPDE		;
		'actAC'			, 0.05			;
		'DA'			, 0				;
		'BuffDA'		, 2				;
		'DA_BuffDA'		, 0				;
		'D1R'			, InitD1R		;
		'DA_D1R'		, 0				;
		'D2R'			, InitD2R		;
		'A2AR'			, InitD2R		;
		'DA_D2R'		, 0				;
		'DA_basalB'		, DAbasal		;
		'DA_basal'		, DAbasal		;
		'Gbc'			, InitGbc		; % * SVR	;
		'Golf_Gbc'		, InitGolf		;
		'Golf_GDP'		, 0				;
		'Golf_GTP'		, 0				;
		'Gi_GDP'		, 0				;
		'Gi_GTP'		, 0				;
		'Gi_Gbc'		, InitGi		;
		'BasalAC'		, InitBasalAC	;
		'ActAC5'		, 0				;
		'AC5sub0'		, InitAC5		;
		'AC5sub1'			, InitAC5	;
		'Golf_bound_AC5'	, 0			;
		'AC5sub1_Golf_GDP'	, 0			;
		'AC5sub1_Golf_GTP'	, 0			;
		'AC5sub2'			, InitAC5	;
		'Gi_unbound_AC5'	, 0			;
		'AC5sub2_Gi_GDP'	, 0			;
		'AC5sub2_Gi_GTP'	, 0			;

		'ActAC1'			, 0			;
		'ACsub0'			, InitAC1	;

		'ACsub1'			, InitAC1	;
		'Golf_bound_AC'		, 0			;
		'ACsub1_Golf_GDP'	, 0			;
		'ACsub1_Golf_GTP'	, 0			;

		'ACsub2'			, InitAC1	;
		'Gi_unbound_AC'		, 0			;
		'ACsub2_Gi_GDP'		, 0			;
		'ACsub2_Gi_GTP'		, 0			;

		'ActiveAC'			, 0			;
		'RGS'				, InitRGS	;
		'ACsub3'			, InitAC1	;
		'Ca_ext'			, 1			;
		'Ca'				, 0			;
		'CaPump'			, InitCaPump;
		'ACsub_CaM'			, InitAC1	;
		'N0C0'				, 100		;
		'N1C0'				, 0			;
		'N2C0'				, 0			;
		'N0C1'				, 0			;
		'N0C2'				, 0			;
		'N1C1'				, 0			;
		'N1C2'				, 0			;
		'N2C1'				, 0			;
		'N2C2'				, 0			;
		'AC_CaM'			, 0			;
		'AC1_N0C0'			, 0			;
		'AC1_N1C0'			, 0			;
		'AC1_N2C0'			, 0			;
		'AC1_N0C1'			, 0			;
		'AC1_N0C2'			, 0			;
		'AC1_N1C1'			, 0			;
		'AC1_N1C2'			, 0			;
		'AC1_N2C1'			, 0			;
		'AC1_N2C2'			, 0			;
		'AC2_N0C0'			, 0			;
		'AC2_N1C0'			, 0			;
		'AC2_N2C0'			, 0			;
		'AC2_N0C1'			, 0			;
		'AC2_N0C2'			, 0			;
		'AC2_N1C1'			, 0			;
		'AC2_N1C2'			, 0			;
		'AC2_N2C1'			, 0			;
		'AC2_N2C2'			, 0			;
		'AC3_N0C0'			, 0			;
		'AC3_N1C0'			, 0			;
		'AC3_N2C0'			, 0			;
		'AC3_N0C1'			, 0			;
		'AC3_N0C2'			, 0			;
		'AC3_N1C1'			, 0			;
		'AC3_N1C2'			, 0			;
		'AC3_N2C1'			, 0			;
		'AC3_N2C2'			, 0			;
		'CB'				, 120		;
		'Ca_CB'				, 0			;
		'R2C2'				, 4			;
		'R2C2cAMP'			, 0			;
		'R2C2cAMP2'			, 0			;
		'R2C2cAMP3'			, 0			;
		'R2C2cAMP4'			, 0			;
		'R2C1cAMP4'			, 0			;
		'R2C0cAMP4'			, 1			;
		'Ct'				, 0			;
		'PP1'				, 2			;
		'D'					, 50		;
		'D34p'				, 0			;
		'PP2B'				, 1			;
		'D_PP1'				, 0			;
		'D34p_PP1'			, 0			;
		'D34p_tot'			, 0			;
		'VGCC'				, 0			;
		'VGCCplus'			, InitVGCCplus	;
		'VGCC_dummy'		, 0			;
		'Epac'				, 1			;
		'Epac_cAMP'			, 0			;
		'Kd_Epac'			, 11		;
		'SVR'				, SVR		;
%
		'CK'				, 40		;
		'CK_N1C2'			, 0			;
		'CK_N2C2'			, 0			;
		'CK_N2C1'			, 0			;
		'CKp'				, 0			;
		'CKp_N2C1'			, 0			;
		'CKp_N2C2'			, 0			;
		'CKp_N1C2'			, 0			;
		'TotalCK'			, 0			;
		'ActiveCK'			, 0			;
		'ActiveRatio'		, 0			;
		'ActivationFactor'	, 0			;
		};


