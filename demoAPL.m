% This demo computes patch importance using the Active Patch Learning (APL)
% algorithm, with help of ths SPAMS toolbox. Please make sure to build SPAMS
% with the dependencies of your machine. This code was tested on Mac OSX 64-bit.
% Please feel free to contact me if you found any bugs. :)
%
% Contact: Kaili Zhao (kailizhao@bupt.edu.cn)
%
% Ref: 
%   [1] Zhao, Kaili, et al. "Joint patch and multi-label learning for 
%       facial action unit detection." CVPR2015.
%   [2] Zhao, Kaili, et al. "Joint patch and multi-label learning for 
%       facial action unit and holistic expression recognition." TIP2016.

aulist = [1,12]; % list of AUs for experiment (AU1 and AU12)

for iAU = aulist
    
    % Patch Learning with SPAMS
    addpath('spams-matlab/build/') % SPAMS toolbox
    data = load('data/Data');      % load features and labels
    feat = double(data.feat); 
    label = data.label(:, iAU);    % take AU12 for example

    % SPAMS settings for Patch learning 
    param.loss   = 'logistic';
    param.regul  = 'group-lasso-l2';
    param.max_it = 500;
    param.tol    = 1e-3;
    param.size_group = 128;
    param.groups = int32(reshape(repmat(1:49,128,1), 1, []));

    w0 = zeros(6272,1);  % initialize w as zeros
    lambda = 1e-3;       % lambda can be selected in 10.^([-3 -4 -5 -6]);

    param.lambda = lambda;
    [w, optim_info] = mexFistaFlat(label,feat,w0,param);

    % Plot patch importance
    g12  = w / max(w);
    wg12 = getImportance(g12);
    plotPatch(wg12);  

    % Save figure to file
    savename = ['au',num2str(iAU),'_g.pdf'];
    eval(['print -dpdf ', savename]);
    fprintf('Saved patch importance to %s\n', savename);
    colormap jet; colorbar;
end