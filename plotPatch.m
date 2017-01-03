function hf = plotPatch(w)
% This function plots patch importance as shown in the paper.
% 
% Input:
%    w:   The dx1 weight vector (d=6272 for 49 landmarks in our case)
%
% Output:
%    hf:  Handle of the plotted figure
%

hf = figure; clf;
ms = importdata('data/MfModel_v1.0.mat');
pts = ms.neuShpAll;
pts([39:43,47:49],2) = pts([39:43,47:49],2)+8;
pts([39,43],2) = pts([39,43],2)-4;

idx = {1:5,6:10,11:14,15:19,[20:25 20],[26:31 26],[32:43 32],[44:49 44]};
hold on;
for ii = 1:numel(idx)
  plot(pts(idx{ii},1), pts(idx{ii},2),'k','linewidth',.5); 
end

% hold on;
scatter(pts(:,1),pts(:,2),190,w,'o',...
	'filled','MarkerEdgeColor',[0 0 0],'linewidth',1); axis ij off;
axis([-120,120,-100,100]);
pos = get(hf,'position');
set(hf,'position',[pos(1:2),500,400]);


