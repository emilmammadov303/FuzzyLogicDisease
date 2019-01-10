clc;
clear;
clear all;

global mu_xi X mu_X;
lowLimit=0; hLimitYear=70; hLimitPiece=70; hLimitAge=90; hLimitDisease=100;

%Numerik Girisler
xi=10; yi=10; zi=45; ki=0;

%Bulanik Kumelerin Olusturulmasi
    %Sene
triangle(lowLimit,0,0,10,hLimitYear,xi);                 yearL = mu_xi;
Cauchy(lowLimit,hLimitYear,13,8,1.5,xi);                 yearM = mu_xi;
Cauchy(lowLimit,hLimitYear,70,40,2.6,xi);                yearH = mu_xi;
    %Adet
trapezoid(lowLimit,0,0,5,15,hLimitPiece,yi);             pieceL = mu_xi;
Cauchy(lowLimit,hLimitPiece,15,8,2.5,yi);                pieceM = mu_xi;
Cauchy(lowLimit,hLimitPiece,70,33,2.5,yi);               pieceH = mu_xi;
    %Yas
trapezoid(lowLimit,0,0,25,35,hLimitAge,zi);            ageL = mu_xi;
trapezoid(lowLimit,25,33,48,60,hLimitAge,zi);          ageM = mu_xi;
trapezoid(lowLimit,48,60,90,90,hLimitAge,zi);          ageH = mu_xi;
    %Hastalik
triangle(lowLimit,0,0,25,hLimitDisease,ki);              diseaseL = mu_X;
triangle(lowLimit,0,25,50,hLimitDisease,ki);             diseaseLM = mu_X;
triangle(lowLimit,25,50,75,hLimitDisease,ki);            diseaseM = mu_X;
triangle(lowLimit,50,75,100,hLimitDisease,ki);           diseaseMH = mu_X;
triangle(lowLimit,75,100,100,hLimitDisease,ki);          diseaseH = mu_X;

%kurallar ve gerektirme islemleri ile sonuc kumeleri

res1 = min(min(yearL,pieceL),ageL) * diseaseL;
res2 = min(min(yearL,pieceL),ageM) * diseaseLM;
res3 = min(min(yearL,pieceL),ageH) * diseaseM;
res4 = min(min(yearL,pieceM),ageL) * diseaseLM;
res5 = min(min(yearL,pieceM),ageM) * diseaseM;
res6 = min(min(yearL,pieceM),ageH) * diseaseMH;
res7 = min(min(yearL,pieceH),ageL) * diseaseLM;
res8 = min(min(yearL,pieceH),ageM) * diseaseM;
res9 = min(min(yearL,pieceH),ageH) * diseaseMH;
res10 = min(min(yearM,pieceL),ageL) * diseaseLM;
res11 = min(min(yearM,pieceL),ageM) * diseaseM;
res12 = min(min(yearM,pieceL),ageH) * diseaseMH;
res13 = min(min(yearM,pieceM),ageL) * diseaseM;
res14 = min(min(yearM,pieceM),ageM) * diseaseM;
res15 = min(min(yearM,pieceM),ageH) * diseaseMH;
res16 = min(min(yearM,pieceH),ageL) * diseaseM;
res17 = min(min(yearM,pieceH),ageM) * diseaseMH;
res18 = min(min(yearM,pieceH),ageH) * diseaseH;
res19 = min(min(yearH,pieceL),ageM) * diseaseM;
res20 = min(min(yearH,pieceL),ageH) * diseaseMH;
res21 = min(min(yearH,pieceM),ageM) * diseaseMH;
res22 = min(min(yearH,pieceM),ageH) * diseaseMH;
res23 = min(min(yearH,pieceH),ageM) * diseaseH;
res24 = min(min(yearH,pieceH),ageH) * diseaseH;

aggregation = max(max(max(max(max(res1,res2),max(res3,res4)),max(max(res5,res6),max(res7,res8))),max(max(max(res9,res10),max(res11,res12)),max(max(res13,res14),max(res15,res16)))),max(max(max(res17,res18),max(res19,res20)),max(max(res21,res22),max(res23,res24))));
plot(X,aggregation);

totalArea = sum(aggregation);
if totalArea == 0
    'Total area is zero';
end
z = sum(aggregation.*X)/totalArea;
h=[z,z,z,z,z,z,z,z,z,z,z];
line(h,0:0.1:1,'Color','red','LineStyle','--');
xlabel(['z = ', num2str(z)]);


