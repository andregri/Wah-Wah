function y=EfectoWahWah(damp,minf,maxf,Fs,Fw,x)
Q1 = 2*damp;
Fc = minf;
F1 = 2*sin((pi*Fc)/Fs);
y(1) = F1*x(1);
ysum = 0;
delta = Fw/Fs;

for n=2:length(x),
    if Fc + delta > maxf | Fc + delta < minf 
        delta =  -delta;
    end
    Fc = Fc+ delta;
    F1 = 2*sin((pi*Fc)/Fs);
    y(n) = F1*x(n)+(1-F1*Q1)*y(n-1)-F1*F1*ysum;
	ysum = ysum + y(n);
end
%normalise
maxy = max(abs(y));
y = y/maxy;

end
