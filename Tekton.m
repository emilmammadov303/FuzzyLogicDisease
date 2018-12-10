function Tekton(altsinir,a,ustsinir,xi)
global X mu_X mu_xi;

alfa=1; X1=altsinir:0.001:a-0.001; X2=a; X3=a+0.001:0.001:ustsinir;
mu_X1 = zeros(size(X1)); mu_X2=alfa; mu_X3=zeros(size(X3));
X=[X1 X2 X3]; mu_X=[mu_X1 mu_X2 mu_X3];
plot(X, mu_X);
line(a,0:0.01:alfa);
if xi==a
mu_xi=alfa;
else
mu_xi=0;
end