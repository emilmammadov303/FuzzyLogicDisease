function CauchyEgrisi(altsinir,ustsinir,c,sigma,n,xi)
global X mu_X mu_xi;

X=altsinir:0.001:ustsinir;
mu_X=1./(1+abs((X-c)/sigma).^(2*n));
plot(X,mu_X)

mu_xi=1/(1+abs((xi-c)/sigma)^(2*n))