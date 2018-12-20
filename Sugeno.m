clc;
clear;
clear all;

global mu_xi X mu_X;
altsinir=0; ustsinirSene=70; ustsinirAdet=70; ustsinirYas=90; ustsinirHastalik=100;

%Numerik Girisler
xi=20; yi=20; zi=45; ki=0;

%Bulanik Kumelerin Olusturulmasi
    %Sene
ucgen(altsinir,0,0,10,ustsinirSene,xi);                 seneAz = mu_xi;
CauchyEgrisi(altsinir,ustsinirSene,13,8,1.5,xi);        seneOrta = mu_xi;
CauchyEgrisi(altsinir,ustsinirSene,70,40,2.6,xi);       seneCok = mu_xi;
    %Adet
yamuk(altsinir,0,0,5,15,ustsinirAdet,yi);               adetAz = mu_xi;
CauchyEgrisi(altsinir,ustsinirAdet,15,8,2.5,yi);        adetOrta = mu_xi;
CauchyEgrisi(altsinir,ustsinirAdet,70,33,2.5,yi);       adetCok = mu_xi;
    %Yas
yamuk(altsinir,0,0,25,35,ustsinirYas,zi);               yasAz = mu_xi;
yamuk(altsinir,25,33,48,60,ustsinirYas,zi);             yasOrta = mu_xi;
yamuk(altsinir,48,60,90,90,ustsinirYas,zi);             yasCok = mu_xi;
    %Hastalik
ucgen(altsinir,0,0,25,ustsinirHastalik,ki);             hastAz = mu_X;
ucgen(altsinir,0,25,50,ustsinirHastalik,ki);            hastAoa = mu_X;
ucgen(altsinir,25,50,75,ustsinirHastalik,ki);           hastOrta = mu_X;
ucgen(altsinir,50,75,100,ustsinirHastalik,ki);          hastOca = mu_X;
ucgen(altsinir,75,100,100,ustsinirHastalik,ki);         hastCok = mu_X;

%kurallar ve gerektirme islemleri ile sonuc kumeleri

sonuc1 = min(min(seneAz,adetAz),yasAz);
sonuc2 = min(min(seneAz,adetAz),yasOrta);
sonuc3 = min(min(seneAz,adetAz),yasCok);
sonuc4 = min(min(seneAz,adetOrta),yasAz);
sonuc5 = min(min(seneAz,adetOrta),yasOrta);
sonuc6 = min(min(seneAz,adetOrta),yasCok);
sonuc7 = min(min(seneAz,adetCok),yasAz);
sonuc8 = min(min(seneAz,adetCok),yasOrta);
sonuc9 = min(min(seneAz,adetCok),yasCok);


sonuc10 = min(min(seneOrta,adetAz),yasAz);
sonuc11 = min(min(seneOrta,adetAz),yasOrta);
sonuc12 = min(min(seneOrta,adetAz),yasCok);
sonuc13 = min(min(seneOrta,adetOrta),yasAz);
sonuc14 = min(min(seneOrta,adetOrta),yasOrta);
sonuc15 = min(min(seneOrta,adetOrta),yasCok);
sonuc16 = min(min(seneOrta,adetCok),yasAz);
sonuc17 = min(min(seneOrta,adetCok),yasOrta);
sonuc18 = min(min(seneOrta,adetCok),yasCok);


sonuc19 = min(min(seneCok,adetAz),yasOrta);
sonuc20 = min(min(seneCok,adetAz),yasCok);
sonuc21 = min(min(seneCok,adetOrta),yasOrta);
sonuc22 = min(min(seneCok,adetOrta),yasCok);
sonuc23 = min(min(seneCok,adetCok),yasOrta);
sonuc24 = min(min(seneCok,adetCok),yasCok);

birlestirme = max(max(max(max(max(sonuc1,sonuc2),max(sonuc3,sonuc4)),max(max(sonuc5,sonuc6),max(sonuc7,sonuc8))),max(max(max(sonuc9,sonuc10),max(sonuc11,sonuc12)),max(max(sonuc13,sonuc14),max(sonuc15,sonuc16)))),max(max(max(sonuc17,sonuc18),max(sonuc19,sonuc20)),max(max(sonuc21,sonuc22),max(sonuc23,sonuc24))));
plot(X,birlestirme);
length(X)
length(birlestirme)
toplamAlan = sum(birlestirme);
if toplamAlan == 0
    'Toplam Alan Sifirdir';
end
z = sum(birlestirme.*X)/toplamAlan;
h=[z,z,z,z,z,z,z,z,z,z,z];
line(h,0:0.1:1,'Color','red','LineStyle','--');
xlabel(['z = ', num2str(z)]);


