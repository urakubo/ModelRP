# Signaling models for dopamine-dependent temporal contiguity in striatal synaptic plasticity

![System requirements](https://img.shields.io/badge/platform-matlab2017b%20or%20newer-green.svg)
[![License: GPL v3](https://img.shields.io/badge/license-MIT-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

## Abstract
Animals remember temporal links between their actions and subsequent rewards. We previously discovered a synaptic mechanism underlying such reward learning in D1 receptor (D1R)-expressing spiny projection neurons (D1 SPN) of the striatum. Dopamine (DA) bursts promote dendritic spine enlargement in a time window of only a few seconds after paired pre- and post-synaptic spiking (pre–post pairing), which is termed as reinforcement plasticity (RP). The previous study has also identified underlying signaling pathways; however, it still remains unclear how the signaling dynamics leads to RP. In the present study, we first developed a computational model of signaling dynamics of D1 SPNs. The D1 SPN model successfully reproduced experimentally observed PKA activity, including its critical time window. In this model, adenylate cyclase type 1 (AC1) in the spines/thin dendrites played a pivotal role as a coincidence detector of pre–post pairing and DA burst, whereas well-known AC5 seemed to work in the somas. We also found that the smallness of the spines/thin dendrites is crucial for the short time window of the PKA activity. We then developed a D2 SPN model, and this model again predicted the critical time window for RP that depended on the timing of pre–post pairing and phasic DA dip. In the D2 SPN model, AC1 again worked for the coincidence detector. We further simulated the signaling pathway toward CaMKII and clarified the role of the downstream molecules of AC1 as the integrators of transient input signals into persistent spine enlargement. Finally, we discuss how such timing windows guide animals' reward learning.

## System requirements

Matlab plus the toolbox SimBiology. We confirmed the safe executions of sample programs on Matlab 2017b and 2018a on Microsoft Windows10.

## Installation

1. Download source code from the github site:

	- git clone https://github.com/urakubo/ModelRP.git

2. Execute main_sample.m, then the following image will appear.

<BR>
<p align="center">
  <img src="imgs/sample.png" alt="Output of the sample program" width="600">
</p>
<BR>

3. Execute main_fig_timing.m and main_fig_prof.m, and confirm the images of the time windows for RP and the related molecular activities.

<BR>
<p align="center">
  <img src="imgs/PKA_CaMKII.png" alt="Output of main_fig_timing.m" width="600">
</p>
<BR>

## Nano extension on SimBiology

We wrote utility functions for the implementation of RP signaling model on SimBiology/Matlab. The program [main_example.m](./main_sample.m) demonstrates how to use them. First, the extensions become callable by adding the path "./func":
```
addpath('./funcs');
``` 
Define the cell variables "init_species" and "init_params," and call the function "DefineModel" to build a SimBiology model object:
```
init_species   = {
		'A'		, 2	;
		'B'		, 1	;
		'C'		, 0
		};

init_params   = {
		'kf'		, 0.5	;
		'kb'		, 0.5
		};

Tstop = 10;
[model, species, params] = DefineModel(init_species, init_params, Tstop);
```
Add reactions by calling the functions, Reac11, Reac12, Reac21, ReacChannel, ReacEnz, etc., as follows:
```
Reac21('A','B','C', 'kf','kb', model)	; % A + B <-kb kf-> C
```
Finally, run the SimBiology simulation and plot the simulation results:
```
sd = sbiosimulate(model);

tid = find( strcmp( sd.DataNames, 'C' ) );
plot( sd.Time, sd.Data(:,tid) , '-');
```
The D1/D2 RP signaling models (called from "main_fig_prof.m" and "main_fig_timing.m") are defined in "./models/load_model.m". 

## License

This project is licensed under the MIT license - see the [LICENSE](LICENSE) file for details.

## Reference
Signaling models for dopamine-dependent temporal contiguity in striatal synaptic plasticity

Hidetoshi Urakubo, Sho Yagishita, Haruo Kasai, and Shin Ishii

PLoS Comp. Biol., 16(7): e1008078.
https://doi.org/10.1371/journal.pcbi.1008078

2020/8/5

Correspondence: hurakubo@gmail.com
