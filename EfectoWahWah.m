function y=EfectoWahWah(damp,minf,maxf,Fs,Fw,x)
Q1 = 2*damp;
Fc = minf;
F1 = 2*sin((pi*Fc)/Fs);
y(1) = F1*x(1);
delta = Fw/Fs;

for n=2:length(x),
    if Fc + delta > maxf | Fc + delta < minf 
        delta =  -delta;
    end
    Fc = Fc+ delta;
    F1 = 2*sin((pi*Fc)/Fs);
    y(n) = F1*x(n)-F1*Q1*y(n-1)+y(n-1)-F1*F1*sum(y(1:n-1));
end
%normalise
maxy = max(abs(y));
y = y/maxy;

end
