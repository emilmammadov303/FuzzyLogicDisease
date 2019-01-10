clc;
clear;
clear all;

global mu_xi X mu_X;
lowLimit=0; hLimitYear=70; hLimitPiece=70; hLimitDisease=100;

A = lowLimit:5:hLimitPiece;   S = lowLimit:5:hLimitYear;

for i=1:size(A,2)
    for j=1:size(S,2)
    totalArea = 0;

%Numerik Girisler
a = A(i);  s = S(j);

%Bulanik Kumelerin Olusturulmasi

    %Adet
trapezoid(lowLimit,0,0,5,15,hLimitPiece,a);             pieceL = mu_xi;
Cauchy(lowLimit,hLimitPiece,15,8,2.5,a);                pieceM = mu_xi;
Cauchy(lowLimit,hLimitPiece,70,33,2.5,a);               pieceH = mu_xi;
    %Sene
triangle(lowLimit,0,0,10,hLimitYear,s);                 yearL = mu_xi;
Cauchy(lowLimit,hLimitYear,13,8,1.5,s);                 yearM = mu_xi;
Cauchy(lowLimit,hLimitYear,70,40,2.6,s);                yearH = mu_xi;
    %Hastalik
triangleOut(lowLimit,0,0,25,hLimitDisease);             diseaseL = mu_X;
triangleOut(lowLimit,0,25,50,hLimitDisease);            diseaseLM = mu_X;
triangleOut(lowLimit,25,50,75,hLimitDisease);           diseaseM = mu_X;
triangleOut(lowLimit,50,75,100,hLimitDisease);          diseaseMH = mu_X;
triangleOut(lowLimit,75,100,100,hLimitDisease);         diseaseH = mu_X;

%kurallar ve gerektirme islemleri ile sonuc kumeleri

res1 = min(yearL,pieceL) * diseaseL;
res2 = min(yearL,pieceL) * diseaseLM;
res3 = min(yearL,pieceL) * diseaseM;
res4 = min(yearL,pieceM) * diseaseLM;
res5 = min(yearL,pieceM) * diseaseM;
res6 = min(yearL,pieceM) * diseaseMH;
res7 = min(yearL,pieceH) * diseaseLM;
res8 = min(yearL,pieceH) * diseaseM;
res9 = min(yearL,pieceH) * diseaseMH;
res10 = min(yearM,pieceL) * diseaseLM;
res11 = min(yearM,pieceL) * diseaseM;
res12 = min(yearM,pieceL) * diseaseMH;
res13 = min(yearM,pieceM) * diseaseM;
res14 = min(yearM,pieceM) * diseaseM;
res15 = min(yearM,pieceM) * diseaseMH;
res16 = min(yearM,pieceH) * diseaseM;
res17 = min(yearM,pieceH) * diseaseMH;
res18 = min(yearM,pieceH) * diseaseH;
res19 = min(yearH,pieceL) * diseaseM;
res20 = min(yearH,pieceL) * diseaseMH;
res21 = min(yearH,pieceM) * diseaseMH;
res22 = min(yearH,pieceM) * diseaseMH;
res23 = min(yearH,pieceH) * diseaseH;
res24 = min(yearH,pieceH) * diseaseH;

aggregation = max(max(max(max(max(res1,res2),max(res3,res4)),max(max(res5,res6),max(res7,res8))),max(max(max(res9,res10),max(res11,res12)),max(max(res13,res14),max(res15,res16)))),max(max(max(res17,res18),max(res19,res20)),max(max(res21,res22),max(res23,res24))));
plot(X,aggregation);



totalArea = sum(aggregation);
if totalArea == 0
    'Total Area is zero';
end
z(i, j) = sum(aggregation.*X)/totalArea;
    end
end

[a,s] = meshgrid(A,S);
surf(a,s,z);
xlabel('PIECE');
ylabel('YEAR');
zlabel('DISEASE');


