function ww = getWeight(w)

ww = zeros(49,1);
for iPatch = 1:49
	ww(iPatch) = norm(w((iPatch-1)*128+1:iPatch*128));
end
ww = ww / max(ww);