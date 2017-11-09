function y=EfectoWahWah(damp,minf,maxf,Fs,Fw,x)
Q1 = 2*damp;
Fc = minf;
F1 = 2*sin((pi*Fc)/Fs);
y(1) = F1*x(1);
yl = F1*y(1);
yaux = y(1);
delta = Fw/Fs;
for n=2:length(x),
    if Fc + delta > maxf | Fc + delta < minf 
        delta =  -delta;
    end
    Fc = Fc+ delta;
    F1 = 2*sin((pi*Fc)/Fs);
    yh = x(n)-yl-Q1*yaux;
    y(n) = F1*yh+yaux;
    yl=F1*y(n)+yl;
    yaux=y(n);
end
maxy = max(abs(y));
y = y/maxy;

end
