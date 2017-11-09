clc
[x,Fs]=audioread('acoustic.wav'); 
 %Limitamos a los 15 primeros segundos, para ficheros de larga duración 
if(length(x)>15*Fs) 
    x=x(1:15*Fs); 
end

damp = 0.05; 
minf=500; 
maxf=3000; 
Fw = 2000;
y=EfectoWahWah(damp,minf,maxf,Fs,Fw, x); 
sound(y,Fs)
