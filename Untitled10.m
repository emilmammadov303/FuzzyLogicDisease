clc;
clear;
clear all;

global X mu_X mu_xi;
altsinir=0; ustsinirSene=80; ustsinirAdet=70; ustsinirYas=90; ustsinirHastalik=100;

%Numerik Girisler
xi=38.4; yi=10; zi=20; ki=0;

%Bulanik Kumelerin Olusturulmasi
    %Sene
ucgen(altsinir,0,0,15,ustsinirSene,xi);         seneAz = mu_xi;
yamuk(altsinir,4,10,35,60,ustsinirSene,xi);     seneOrta = mu_xi;
yamuk(altsinir,20,45,80,80,ustsinirSene,xi);    seneCok = mu_xi;
    %Adet
yamuk(altsinir,0,0,10,34,ustsinirAdet,yi);      adetAz = mu_xi;
yamuk(altsinir,5,25,45,65,ustsinirAdet,yi);     adetOrta = mu_xi;
yamuk(altsinir,36,55,70,70,ustsinirAdet,yi);    adetCok = mu_xi;
    %Yas
yamuk(altsinir,0,0,20,35,ustsinirYas,zi);       yasAz = mu_xi;
yamuk(altsinir,16,27,50,60,ustsinirYas,zi);     yasOrta = mu_xi;
yamuk(altsinir,40,60,90,90,ustsinirYas,zi);     yasCok = mu_xi;
    %Hastalik
ucgen(altsinir,0,0,25,ustsinirHastalik,ki);     hastAz = mu_X;
ucgen(altsinir,0,25,50,ustsinirHastalik,ki);    hastAoa = mu_X;
ucgen(altsinir,25,50,75,ustsinirHastalik,ki);   hastOrta = mu_X;
ucgen(altsinir,50,75,100,ustsinirHastalik,ki);  hastOca = mu_X;
ucgen(altsinir,75,100,100,ustsinirHastalik,ki); hastCok = mu_X;

%kurallar ve gerektirme islemleri ile sonuc kumeleri

sonuc1 = min(min(seneAz,adetAz),yasAz) * hastAz;
sonuc2 = min(min(seneAz,adetAz),yasOrta) * hastAoa;
sonuc3 = min(min(seneAz,adetAz),yasCok) * hastOrta;
sonuc4 = min(min(seneAz,adetOrta),yasAz) * hastAoa;
sonuc5 = min(min(seneAz,adetOrta),yasOrta) * hastOrta;
sonuc6 = min(min(seneAz,adetOrta),yasCok) * hastOca;
sonuc7 = min(min(seneAz,adetCok),yasAz) * hastAoa;
sonuc8 = min(min(seneAz,adetCok),yasOrta) * hastOrta;
sonuc9 = min(min(seneAz,adetCok),yasCok) * hastOca;


sonuc10 = min(min(seneOrta,adetAz),yasAz) * hastAoa;
sonuc11 = min(min(seneOrta,adetAz),yasOrta) * hastOrta;
sonuc12 = min(min(seneOrta,adetAz),yasCok) * hastOca;
sonuc13 = min(min(seneOrta,adetOrta),yasAz) * hastOrta;
sonuc14 = min(min(seneOrta,adetOrta),yasOrta) * hastOrta;
sonuc15 = min(min(seneOrta,adetOrta),yasCok) * hastOca;
sonuc16 = min(min(seneOrta,adetCok),yasAz) * hastOrta;
sonuc17 = min(min(seneOrta,adetCok),yasOrta) * hastOca;
sonuc18 = min(min(seneOrta,adetCok),yasCok) * hastCok;


sonuc19 = min(min(seneCok,adetAz),yasOrta) * hastOrta;
sonuc20 = min(min(seneCok,adetAz),yasCok) * hastOca;
sonuc21 = min(min(seneCok,adetOrta),yasOrta) * hastOca;
sonuc22 = min(min(seneCok,adetOrta),yasCok) * hastOca;
sonuc23 = min(min(seneCok,adetCok),yasOrta) * hastCok;
sonuc24 = min(min(seneCok,adetCok),yasCok) * hastCok;

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


