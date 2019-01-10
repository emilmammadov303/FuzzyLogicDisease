clc;
clear;
clear all;

global mu_xi X mu_X;
lowLimit=0; hLimitAge=70; hLimitPiece=70; hLimitDisease=100;

A = lowLimit:5:hLimitPiece;   Y = lowLimit:5:hLimitAge;

for i=1:size(A,2)
    for j=1:size(Y,2)
    totalArea = 0;

%Numerik Girisler
a = A(i);  y = Y(j);

%Bulanik Kumelerin Olusturulmasi
    %Yas
trapezoid(lowLimit,0,0,25,35,hLimitAge,y);               ageL = mu_xi;
trapezoid(lowLimit,25,33,48,60,hLimitAge,y);             ageM = mu_xi;
trapezoid(lowLimit,48,60,90,90,hLimitAge,y);             ageH = mu_xi;
    %Adet
trapezoid(lowLimit,0,0,5,15,hLimitPiece,a);              pieceL = mu_xi;
Cauchy(lowLimit,hLimitPiece,15,8,2.5,a);                 pieceM = mu_xi;
Cauchy(lowLimit,hLimitPiece,70,33,2.5,a);                pieceH = mu_xi;
    %Hastalik
triangleOut(lowLimit,0,0,25,hLimitDisease);              diseaseL = mu_X;
triangleOut(lowLimit,0,25,50,hLimitDisease);             diseaseLM = mu_X;
triangleOut(lowLimit,25,50,75,hLimitDisease);            diseaseM = mu_X;
triangleOut(lowLimit,50,75,100,hLimitDisease);           diseaseMH = mu_X;
triangleOut(lowLimit,75,100,100,hLimitDisease);          diseaseH = mu_X;

%kurallar ve gerektirme islemleri ile sonuc kumeleri

res1 = min(pieceL,ageL) * diseaseL;
res2 = min(pieceL,ageM) * diseaseLM;
res3 = min(pieceL,ageH) * diseaseM;
res4 = min(pieceM,ageL) * diseaseLM;
res5 = min(pieceM,ageM) * diseaseM;
res6 = min(pieceM,ageH) * diseaseMH;
res7 = min(pieceH,ageL) * diseaseLM;
res8 = min(pieceH,ageM) * diseaseM;
res9 = min(pieceH,ageH) * diseaseMH;
res10 = min(pieceL,ageL) * diseaseLM;
res11 = min(pieceL,ageM) * diseaseM;
res12 = min(pieceL,ageH) * diseaseMH;
res13 = min(pieceM,ageL) * diseaseM;
res14 = min(pieceM,ageM) * diseaseM;
res15 = min(pieceM,ageH) * diseaseMH;
res16 = min(pieceH,ageL) * diseaseM;
res17 = min(pieceH,ageM) * diseaseMH;
res18 = min(pieceH,ageH) * diseaseH;
res19 = min(pieceL,ageM) * diseaseM;
res20 = min(pieceL,ageH) * diseaseMH;
res21 = min(pieceM,ageM) * diseaseMH;
res22 = min(pieceM,ageH) * diseaseMH;
res23 = min(pieceH,ageM) * diseaseH;
res24 = min(pieceH,ageH) * diseaseH;

aggregation = max(max(max(max(max(res1,res2),max(res3,res4)),max(max(res5,res6),max(res7,res8))),max(max(max(res9,res10),max(res11,res12)),max(max(res13,res14),max(res15,res16)))),max(max(max(res17,res18),max(res19,res20)),max(max(res21,res22),max(res23,res24))));



totalArea = sum(aggregation);
if totalArea == 0
    'Total Area is Zero';
end
z(i, j) = sum(aggregation.*X)/totalArea;
    end
end

[a,y] = meshgrid(A,Y);
surf(a,y,z);
xlabel('AGE');
ylabel('PIECE');
zlabel('DISEASE');


