clc;
clear;
clear all;

global mu_xi;
lowLimit=0; hLimitYear=70; hLimitPiece=70; hLimitDisease=100;

X = lowLimit:5:hLimitYear;    Y = lowLimit:5:hLimitPiece;
a1 = 0;         b1 = 0;         c1 = 0;
a2 = 0.25;      b2 = 0.25;      c2 = 0.25;
a3 = 0.5;       b3 = 0.5;       c3 = 0.5;
a4 = 0.75;      b4 = 0.75;      c4 = 0.75;
a5 = 1;         b5 = 1;         c5 = 1;

for i=1:size(X,2)
    for j=1:size(Y,2)
    totalWeight = 0;
    
x = X(i);   y = Y(j);


%Bulanik Kumelerin Olusturulmasi
    %Sene
triangle(lowLimit,0,0,10,hLimitYear,x);                 seneAz = mu_xi;
Cauchy(lowLimit,hLimitYear,13,8,1.5,x);                 seneOrta = mu_xi;
Cauchy(lowLimit,hLimitYear,70,40,2.6,x);                seneCok = mu_xi;
    %Adet
trapezoid(lowLimit,0,0,5,15,hLimitPiece,y);             adetAz = mu_xi;
Cauchy(lowLimit,hLimitPiece,15,8,2.5,y);                adetOrta = mu_xi;
Cauchy(lowLimit,hLimitPiece,70,33,2.5,y);               adetCok = mu_xi;
    %Hastalik
z1 = a1*x + b1*y + c1;
z2 = a2*x + b2*y + c2;
z3 = a3*x + b3*y + c3;
z4 = a4*x + b4*y + c4;
z5 = a5*x + b5*y + c5;


    %Kurallar
w1 = min(yearL,pieceL);
w2 = min(yearL,pieceM);
w3 = min(yearL,pieceH);

w4 = min(yearM,pieceL);
w5 = min(yearM,pieceM);
w6 = min(yearM,pieceH);

w7 = min(yearH,pieceL);
w8 = min(yearH,pieceM);
w9 = min(yearH,pieceH);

SAT = w1*z1 + w2*z2 + w3*z2 + w4*z2 + w5*z3 + w6*z3 + w7*z3 + w8*z3 + w9*z5;

totalWeight = w1 + w2 + w3 + w4 + w5 + w6 + w7 + w8 + w9;
if totalWeight == 0
    'Deneme'
end
z(i,j) = SAT/totalWeight;

    end
end

surf(X,Y,z);
