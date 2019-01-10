clc;
clear;
clear all;

global mu_xi;
lowLimit=0; hLimitYear=70; hLimitPiece=70;
x = 13;  y=10;

a1 = 0;         b1 = 0;         c1 = 0;
a2 = 0.25;      b2 = 0.25;      c2 = 0.25;
a3 = 0.5;       b3 = 0.5;       c3 = 0.5;
a4 = 0.75;      b4 = 0.75;      c4 = 0.75;
a5 = 1;         b5 = 1;         c5 = 1;

%Bulanik Kumelerin Olusturulmasi
    %YEAR
triangle(lowLimit,0,0,10,hLimitYear,x);                 yearL = mu_xi;
Cauch(lowLimit,hLimitYear,13,8,1.5,x);                  yearM = mu_xi;
Cauchy(lowLimit,hLimitYear,70,40,2.6,x);                yearH = mu_xi;
    %PIECE
trapezoid(lowLimit,0,0,5,15,hLimitPiece,y);             pieceL = mu_xi;
Cauchy(lowLimit,hLimitPiece,15,8,2.5,y);                pieceM = mu_xi;
Cauchy(lowLimit,hLimitPiece,70,33,2.5,y);               pieceH = mu_xi;
    %DISEASE
z1 = a1*x + b1*y + c1;
z2 = a2*x + b2*y + c2;
z3 = a3*x + b3*y + c3;
z4 = a4*x + b4*y + c4;
z5 = a5*x + b5*y + c5;


    %Kurallar
w1 = min(yearL,pieceL);
w2 = min(yearL,pieceM);
w3 = min(yearL,adetCok);

w4 = min(yearM,pieceL);
w5 = min(yearM,pieceM);
w6 = min(yearM,adetCok);

w7 = min(yearH,pieceL);
w8 = min(yearH,pieceM);
w9 = min(yearH,adetCok);

SAT = w1*z1 + w2*z2 + w3*z2 + w4*z2 + w5*z3 + w6*z3 + w7*z3 + w8*z3 + w9*z5;



totalWeight = w1 + w2 + w3 + w4 + w5 + w6 + w7 + w8 + w9;
if totalWeight == 0
    'TW = 0'
end
z = SAT/totalWeight

h=[z,z,z,z,z,z,z,z,z,z,z];
line(h,0:0.1:1,'Color','red','LineStyle','--');
xlabel(['z = ', num2str(z)]);


