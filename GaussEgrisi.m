function GaussEgrisi(altsinir,ustsinir,c,sigma,xi)
global X mu_X mu_xi;

X=altsinir:0.001:ustsinir;
mu_X=exp(-(X-c).^2/(2*sigma^2))
plot(X,mu_X)

mu_xi=exp(-(xi-c)^2/(2*sigma)^2)
end