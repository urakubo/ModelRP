%%
%%
%%
function init_params = InitParams(SVRtarg, SVRspine);

	SVR = SVRtarg/SVRspine;


	% alpha	= 100;
	beta1	= 1.600000e-03;
	beta2	= 1.040000e-01;
	gamma	= 2.870000e-02;

	koff_R_N = 22000		;
	koff_T_C = 2600			;
	koff_R_C = 6.500000e+00	;

	spec  = {
		'Zero'				, 0			;
		'DApulse'			, 10		;
%%
%% DA-D1R,D2R production
%%

		'kdec_DA'			, 50		; %%
		'kinc_DA'			, 50		; %%

		'kon_DA_BuffDA'		, 0			; %%
		'koff_DA_BuffDA'	, 0			; %%
		'kf_DA_D1R'			, 24		; %%
		'kb_DA_D1R'			, 50		; %%
		'kf_DA_D2R'			, 10		; %%
		'kb_DA_D2R'			, 100		; %%


%%%
%%% Golf ===> Changed!!!
%%%
		'Km_exch_Golf'			, 2			* SVR; %
		'kcat_exch_Golf'		, 66.667	/ SVR; %
		'kcat_exch_Golf_A2AR'	, 80		/ SVR; %
		'kcat_hyd_Golf'			, 50				; % %%%%%%%% Remove it!
%
		'kon_AC_GolfGTP'		, 40		/ SVR; %
		'koff_AC_GolfGTP'		, 4				 ;
		'kon_AC_GolfGDP'		, 40		/ SVR; %
		'koff_AC_GolfGDP'		, 40			 ;
%%
		'kon_AC5_GolfGTP'		, 10		/ SVR; %
		'koff_AC5_GolfGTP'		, 1				 ;	
		'kon_AC5_GolfGDP'		, 10		/ SVR; %
		'koff_AC5_GolfGDP'		, 10			 ;	
%%
		'kon_Gbc_Golf'			, 10		/ SVR; % 
%%%
%%% Gi
%%%
		'Km_exch_Gi'		, 0.2			* SVR; %
		'kcat_exch_Gi'		, 800			/ SVR; %
%
		'Km_hyd_Gi'			, 12			* SVR; %
		'kcat_hyd_Gi'		, 72			/ SVR; %
%
		'kon_AC_GiGTP'		, 40			/ SVR; %%%
		'koff_AC_GiGTP'		, 2					 ; %%%
		'kon_AC_GiGDP'		, 8				/ SVR; %%%
		'koff_AC_GiGDP'		, 20				 ; %%%
%
		'kon_AC5_GiGTP'		, 20			/ SVR; %%%
		'koff_AC5_GiGTP'	, 1					 ; %%%
		'kon_AC5_GiGDP'		, 2				/ SVR; %%%
		'koff_AC5_GiGDP'	, 5					 ; %%%
%
		'kon_Gbc_Gi'		, 10			/ SVR; %%%
%%
%% AC1 cAMP production PDE degradation
%%
		'Km_PDE'			, 0.05			;% 
		'kcat_PDE'			, 0.3			;%
%%
%% cAMP - PKA reaction
%%
		'kon_A'				, 2 			; %
		'koff_A'			, 10			; %
%
		'kon_C'				, 10			;
		'koff_C'			, 40			;
%
		'BasalAC'			, 0.01			;
%
%%
%% DARPP32 phosphorylation & PP1 binding
%%
		'kcat_T34P'			, 5.0	;
		'Km_T34P'			, 2.4	;
		'kcat_T34DP'		, 0.5	;
		'Km_T34DP'			, 1.6	;
%
		'kon_D32p_PP1'		, 2;	;
		'koff_D32p_PP1'		, 0.01	;
		'koff_D32_PP1'		, 0.5	;
%%
%% CaMKII
%%

	% CaM binding

		'kon_CK_CaM'		, 50		;
		'koff_CK_CaM'		, 10		;
		'kon_CKp_CaM'		, 50		;
		'koff_CKp_CaM'		, 0.001		;

	% Autophosphorylation

		'tmpCK_Rate'		, 20		; %%20
		'tmpCK'				, 0			;
		'leakCKp'			, 0			;
%
		'kcat_PP1'			, 10		;
		'Km_PP1'			, 10		;
%
		'CtSd'				, 1				;
%
		'kpump_Ca'			, 1600		; %%%%%% ?????
		'kon_CB'			, 75		;
		'koff_CB'			, 29.5		;
		'kdeact_VGCC'		, 33.35		;
		'kinflux_Ca'		, 2500		;
%%
%% cAMP generation
%%

		'kcat_decomp'		, 0.33			;
		'Km_decomp'			, 0.05			;
		'kcat_synth'		, 100			;
		'Km_synth'			, 1				;

%%
%% AC-CaM binding
%%

		'Km_AC'				, 0.1		;% 
		'kcat_AC'			, 100		;% 
%
		'kon_AC_CaM'		, 50	; %% temp = *5
		'koff_AC_CaM'		, 20	; %% temp = *5
%
		'kup_AC'			, 4.0		;
		'kdown_AC'			, 4.0		;
%
		'kon_AC_CaM_g'		, 1.435000e-01		;
		'kon_AC_CaM_g_b2'	, 1.492400e-02		;
		'kon_AC_CaM_g_b2_b1', 2.387840e-05		;
		'kon_AC_CaM_b2_b1'	, 8.320000e-04		;
		'kon_AC_CaM_b2'		, 5.200000e-01		;
%
		'kon_T_C'			, 84			;
		'kon_T_N'			, 770			;
		'koff_T_N'			, 160000		;
		'kon_R_C'			, 25			;
		'kon_R_N'			, 32000			;
%
		'koff_R_N'			, koff_R_N			;
		'koff_T_C'			, koff_T_C			;
		'koff_R_C'			, koff_R_C			;
		'koff_R_N_g'		, koff_R_N * gamma	;
		'koff_T_C_b1'		, koff_T_C * beta1	;
		'koff_R_C_b2'		, koff_R_C * beta2	;
%%
%% cAMP-Epac binding
%%
		'kon_Epac_cAMP'		, 0.022; %
		'koff_Epac_cAMP'	, 10.0
		};
%%
%%
	init_params = cell2table( spec, 'VariableNames', {'Name','Param'});
	init_params.Properties.RowNames = spec(:,1);
%%
%%
	spec2  = {
	%
		'kon_T_C'	;
		'koff_T_C'	;
		'kon_T_N'	;
		'koff_T_N'	;
		'kon_R_C'	;
		'koff_R_C'	;
		'kon_R_N'	;
		'koff_R_N'	;
		'koff_R_N_g' 	;
		'koff_T_C_b1' 	;
		'koff_R_C_b2' 	;
	%
		'kon_C'		;
		'koff_C'	;
		'kon_A'		;
		'koff_A'
	};
%%
%%
	spec2_rev = cell(numel(spec2),2);
	for i = 1:numel(spec2);
		spec2_rev{i,1} = sprintf('_2%s', spec2{i});
		spec2_rev{i,2} = 2 * init_params{ spec2{i} , 'Param'};
	end;
	init_params2 = cell2table( spec2_rev, 'VariableNames', {'Name','Param'} );
	init_params2.Properties.RowNames = spec2_rev(:,1);
	init_params = vertcat(init_params, init_params2);
%%
%%
	spec2  = {
		'kon_A'		;
		'koff_A'
	};
%%
%%
	spec4_rev = cell(numel(spec2),2);
	for i = 1:numel(spec2);
		spec4_rev{i,1} = sprintf('_4%s', spec2{i});
		spec4_rev{i,2} = 4 * init_params{ spec2{i} , 'Param'};
	end;
	init_params4 = cell2table( spec4_rev, 'VariableNames', {'Name','Param'} );
	init_params4.Properties.RowNames = spec4_rev(:,1);
	init_params = vertcat(init_params, init_params4);
%%
%%
	spec10_rev = cell(numel(spec2),2);
	for i = 1:numel(spec2);
		spec10_rev{i,1} = sprintf('_10%s', spec2{i});
		spec10_rev{i,2} = 10 * init_params{ spec2{i} , 'Param'};
	end;
	init_params10 = cell2table( spec10_rev, 'VariableNames', {'Name','Param'} );
	init_params10.Properties.RowNames = spec10_rev(:,1);
	init_params = vertcat(init_params, init_params10);
%%
%%
	spec16_rev = cell(numel(spec2),2);
	for i = 1:numel(spec2);
		spec16_rev{i,1} = sprintf('_16%s', spec2{i});
		spec16_rev{i,2} = 16 * init_params{ spec2{i} , 'Param'};
	end;
	init_params16 = cell2table( spec16_rev, 'VariableNames', {'Name','Param'} );
	init_params16.Properties.RowNames = spec16_rev(:,1);
	init_params = vertcat(init_params, init_params16);



