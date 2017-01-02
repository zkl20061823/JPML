% Plot patches 
% Created by [1]Zhao, Kaili, et al. "Joint patch and multi-label learning for 
%facial action unit detection." CVPR2015, TIP2016.

g12  = importdata('mat/au12.mat');
% normalize feature
g12  = g12  / max(g12);
wg12 = getWeight(g12);
%% plot
plotPatch(wg12);  print -dpdf au12_g.pdf;
