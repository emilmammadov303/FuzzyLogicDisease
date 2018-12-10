function SE(altsinir,ustsinir,m,sigma,xi)
global X mu_X mu_xi;

X=altsinir:0.001:ustsinir;
mu_X=1./(1+exp(-(X-m)*sigma));

plot(X,mu_X)

mu_xi=1/(1+exp(-(xi-m)*sigma))