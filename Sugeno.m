clc;
clear;
clear all;

global mu_xi;
altsinir=0; ustsinirSene=70; ustsinirAdet=70;
x = 13;  y=10;

a1 = 0;         b1 = 0;         c1 = 0;
a2 = 0.25;      b2 = 0.25;      c2 = 0.25;
a3 = 0.5;       b3 = 0.5;       c3 = 0.5;
a4 = 0.75;      b4 = 0.75;      c4 = 0.75;
a5 = 1;         b5 = 1;         c5 = 1;

%Bulanik Kumelerin Olusturulmasi
    %Sene
ucgen(altsinir,0,0,10,ustsinirSene,x);                 seneAz = mu_xi;
CauchyEgrisi(altsinir,ustsinirSene,13,8,1.5,x);        seneOrta = mu_xi;
CauchyEgrisi(altsinir,ustsinirSene,70,40,2.6,x);       seneCok = mu_xi;
    %Adet
yamuk(altsinir,0,0,5,15,ustsinirAdet,y);               adetAz = mu_xi;
CauchyEgrisi(altsinir,ustsinirAdet,15,8,2.5,y);        adetOrta = mu_xi;
CauchyEgrisi(altsinir,ustsinirAdet,70,33,2.5,y);       adetCok = mu_xi;
    %Hastalik
z1 = a1*x + b1*y + c1;
z2 = a2*x + b2*y + c2;
z3 = a3*x + b3*y + c3;
z4 = a4*x + b4*y + c4;
z5 = a5*x + b5*y + c5;


    %Kurallar
w1 = min(seneAz,adetAz);
w2 = min(seneAz,adetOrta);
w3 = min(seneAz,adetCok);

w4 = min(seneOrta,adetAz);
w5 = min(seneOrta,adetOrta);
w6 = min(seneOrta,adetCok);

w7 = min(seneCok,adetAz);
w8 = min(seneCok,adetOrta);
w9 = min(seneCok,adetCok);

SAT = w1*z1 + w2*z2 + w3*z2 + w4*z2 + w5*z3 + w6*z3 + w7*z3 + w8*z3 + w9*z5;



toplam_agirlik = w1 + w2 + w3 + w4 + w5 + w6 + w7 + w8 + w9;
if toplam_agirlik == 0
    'Deneme'
end
z = SAT/toplam_agirlik

h=[z,z,z,z,z,z,z,z,z,z,z];
line(h,0:0.1:1,'Color','red','LineStyle','--');
xlabel(['z = ', num2str(z)]);


