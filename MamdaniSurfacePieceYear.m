clc;
clear;
clear all;

global mu_xi X mu_X;
altsinir=0; ustsinirSene=70; ustsinirAdet=70; ustsinirHastalik=100;

A = altsinir:5:ustsinirAdet;   S = altsinir:5:ustsinirSene;

for i=1:size(A,2)
    for j=1:size(S,2)
    toplam_alan = 0;

%Numerik Girisler
a = A(i);  s = S(j);

%Bulanik Kumelerin Olusturulmasi

    %Adet
yamuk(altsinir,0,0,5,15,ustsinirAdet,a);               adetAz = mu_xi;
CauchyEgrisi(altsinir,ustsinirAdet,15,8,2.5,a);        adetOrta = mu_xi;
CauchyEgrisi(altsinir,ustsinirAdet,70,33,2.5,a);       adetCok = mu_xi;
    %Sene
ucgen(altsinir,0,0,10,ustsinirSene,s);                 seneAz = mu_xi;
CauchyEgrisi(altsinir,ustsinirSene,13,8,1.5,s);        seneOrta = mu_xi;
CauchyEgrisi(altsinir,ustsinirSene,70,40,2.6,s);       seneCok = mu_xi;
    %Hastalik
ucgenCik(altsinir,0,0,25,ustsinirHastalik);             hastAz = mu_X;
ucgenCik(altsinir,0,25,50,ustsinirHastalik);            hastAoa = mu_X;
ucgenCik(altsinir,25,50,75,ustsinirHastalik);           hastOrta = mu_X;
ucgenCik(altsinir,50,75,100,ustsinirHastalik);          hastOca = mu_X;
ucgenCik(altsinir,75,100,100,ustsinirHastalik);         hastCok = mu_X;

%kurallar ve gerektirme islemleri ile sonuc kumeleri

sonuc1 = min(seneAz,adetAz) * hastAz;
sonuc2 = min(seneAz,adetAz) * hastAoa;
sonuc3 = min(seneAz,adetAz) * hastOrta;
sonuc4 = min(seneAz,adetOrta) * hastAoa;
sonuc5 = min(seneAz,adetOrta) * hastOrta;
sonuc6 = min(seneAz,adetOrta) * hastOca;
sonuc7 = min(seneAz,adetCok) * hastAoa;
sonuc8 = min(seneAz,adetCok) * hastOrta;
sonuc9 = min(seneAz,adetCok) * hastOca;
sonuc10 = min(seneOrta,adetAz) * hastAoa;
sonuc11 = min(seneOrta,adetAz) * hastOrta;
sonuc12 = min(seneOrta,adetAz) * hastOca;
sonuc13 = min(seneOrta,adetOrta) * hastOrta;
sonuc14 = min(seneOrta,adetOrta) * hastOrta;
sonuc15 = min(seneOrta,adetOrta) * hastOca;
sonuc16 = min(seneOrta,adetCok) * hastOrta;
sonuc17 = min(seneOrta,adetCok) * hastOca;
sonuc18 = min(seneOrta,adetCok) * hastCok;
sonuc19 = min(seneCok,adetAz) * hastOrta;
sonuc20 = min(seneCok,adetAz) * hastOca;
sonuc21 = min(seneCok,adetOrta) * hastOca;
sonuc22 = min(seneCok,adetOrta) * hastOca;
sonuc23 = min(seneCok,adetCok) * hastCok;
sonuc24 = min(seneCok,adetCok) * hastCok;

birlestirme = max(max(max(max(max(sonuc1,sonuc2),max(sonuc3,sonuc4)),max(max(sonuc5,sonuc6),max(sonuc7,sonuc8))),max(max(max(sonuc9,sonuc10),max(sonuc11,sonuc12)),max(max(sonuc13,sonuc14),max(sonuc15,sonuc16)))),max(max(max(sonuc17,sonuc18),max(sonuc19,sonuc20)),max(max(sonuc21,sonuc22),max(sonuc23,sonuc24))));
plot(X,birlestirme);



toplamAlan = sum(birlestirme);
if toplamAlan == 0
    'Toplam Alan Sifirdir';
end
z(i, j) = sum(birlestirme.*X)/toplamAlan;
    end
end

[a,s] = meshgrid(A,S);
surf(a,s,z);
xlabel('Adet');
ylabel('Sene');
zlabel('Hastalik');


