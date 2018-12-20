clc;
clear;
clear all;

global mu_xi X mu_X;
altsinir=0; ustsinirYas=70; ustsinirAdet=70; ustsinirHastalik=100;

A = altsinir:5:ustsinirAdet;   Y = altsinir:5:ustsinirYas;

for i=1:size(A,2)
    for j=1:size(Y,2)
    toplam_alan = 0;

%Numerik Girisler
a = A(i);  y = Y(j);

%Bulanik Kumelerin Olusturulmasi
    %Yas
yamuk(altsinir,0,0,25,35,ustsinirYas,y);               yasAz = mu_xi;
yamuk(altsinir,25,33,48,60,ustsinirYas,y);             yasOrta = mu_xi;
yamuk(altsinir,48,60,90,90,ustsinirYas,y);             yasCok = mu_xi;
    %Adet
yamuk(altsinir,0,0,5,15,ustsinirAdet,a);               adetAz = mu_xi;
CauchyEgrisi(altsinir,ustsinirAdet,15,8,2.5,a);        adetOrta = mu_xi;
CauchyEgrisi(altsinir,ustsinirAdet,70,33,2.5,a);       adetCok = mu_xi;
    %Hastalik
ucgenCik(altsinir,0,0,25,ustsinirHastalik);             hastAz = mu_X;
ucgenCik(altsinir,0,25,50,ustsinirHastalik);            hastAoa = mu_X;
ucgenCik(altsinir,25,50,75,ustsinirHastalik);           hastOrta = mu_X;
ucgenCik(altsinir,50,75,100,ustsinirHastalik);          hastOca = mu_X;
ucgenCik(altsinir,75,100,100,ustsinirHastalik);         hastCok = mu_X;

%kurallar ve gerektirme islemleri ile sonuc kumeleri

sonuc1 = min(adetAz,yasAz) * hastAz;
sonuc2 = min(adetAz,yasOrta) * hastAoa;
sonuc3 = min(adetAz,yasCok) * hastOrta;
sonuc4 = min(adetOrta,yasAz) * hastAoa;
sonuc5 = min(adetOrta,yasOrta) * hastOrta;
sonuc6 = min(adetOrta,yasCok) * hastOca;
sonuc7 = min(adetCok,yasAz) * hastAoa;
sonuc8 = min(adetCok,yasOrta) * hastOrta;
sonuc9 = min(adetCok,yasCok) * hastOca;
sonuc10 = min(adetAz,yasAz) * hastAoa;
sonuc11 = min(adetAz,yasOrta) * hastOrta;
sonuc12 = min(adetAz,yasCok) * hastOca;
sonuc13 = min(adetOrta,yasAz) * hastOrta;
sonuc14 = min(adetOrta,yasOrta) * hastOrta;
sonuc15 = min(adetOrta,yasCok) * hastOca;
sonuc16 = min(adetCok,yasAz) * hastOrta;
sonuc17 = min(adetCok,yasOrta) * hastOca;
sonuc18 = min(adetCok,yasCok) * hastCok;
sonuc19 = min(adetAz,yasOrta) * hastOrta;
sonuc20 = min(adetAz,yasCok) * hastOca;
sonuc21 = min(adetOrta,yasOrta) * hastOca;
sonuc22 = min(adetOrta,yasCok) * hastOca;
sonuc23 = min(adetCok,yasOrta) * hastCok;
sonuc24 = min(adetCok,yasCok) * hastCok;

birlestirme = max(max(max(max(max(sonuc1,sonuc2),max(sonuc3,sonuc4)),max(max(sonuc5,sonuc6),max(sonuc7,sonuc8))),max(max(max(sonuc9,sonuc10),max(sonuc11,sonuc12)),max(max(sonuc13,sonuc14),max(sonuc15,sonuc16)))),max(max(max(sonuc17,sonuc18),max(sonuc19,sonuc20)),max(max(sonuc21,sonuc22),max(sonuc23,sonuc24))));



toplamAlan = sum(birlestirme);
if toplamAlan == 0
    'Toplam Alan Sifirdir';
end
z(i, j) = sum(birlestirme.*X)/toplamAlan;
    end
end

[a,y] = meshgrid(A,Y);
surf(a,y,z);
xlabel('Yas');
ylabel('Adet');
zlabel('Hastalik');


