% Patch Learning with SpAms
clc;
clear all;

addpath(genpath('spams-matlab')) %SPAMS toolbox
load('ckData');% load features and labels
feat = double(temp);
label = out(:,[12]);


%% Patch Learning 
param.loss   = 'logistic';
param.regul  = 'group-lasso-l2';
%param.lambda = 10.^([-3 -4 -5 -6]);
param.max_it = 500;
param.tol    = 1e-4;
param.size_group = 128;

param.groups = int32(reshape(repmat(1:49,128,1), 1, []));

W0 = zeros(6272,1);
lambda = 10.^(-4);

param.lambda = lambda;
[w optim_info] = mexFistaFlat(label,feat,W0,param);

save('mat/au12','w')
