function imp = getImportance(w)
% Given a weight vector w, compute patch importance of each group into ww(i) 

imp = zeros(49,1);
for iPatch = 1:49
	imp(iPatch) = norm(w((iPatch-1)*128+1:iPatch*128));
end
imp = imp / max(imp);
