function yamuk(altsinir,a,c,d,b,ustsinir,xi)
global X mu_X mu_xi;

alfa=1; X1=altsinir:0.001:a-0.001; X2=a:0.001:c-0.001; X3=c:0.001:d-0.001; X4=d:0.001:b-0.001; X5=b:0.001:ustsinir;
mu_X1=zeros(size(X1)); mu_X2=alfa*(X2-a)/(c-a); mu_X3=alfa*ones(size(X3)); mu_X4=alfa*(X4-b)/(d-b); mu_X5=zeros(size(X5));

X=[X1 X2 X3 X4 X5]; mu_X=[mu_X1 mu_X2 mu_X3 mu_X4 mu_X5]; plot(X,mu_X)

if xi>=a&xi<=c
    mu_xi=alfa*(xi-a)/(c-a);
elseif xi>c&xi<=d
mu_xi=alfa;
elseif xi>d&xi<=b
    mu_xi=alfa*(xi-b)/(d-b);
else
    mu_xi=0;
end