global X mu_X mu_xi
altsinir=0; ustsinir=15;
SE(altsinir,ustsinir,4,-1,5.5); x_A=X; mu_A=mu_X; mu_xi_A=mu_xi;
yamuk(altsinir,3,4,5,6,ustsinir,5.5); x_C=X; mu_C=mu_X; mu_xi_C=mu_xi;
ucgen(altsinir,4,9,12,ustsinir,5.5); x_B=X; mu_B=mu_X; mu_xi_B=mu_xi;

mu_AVEYAB=max(mu_C, mu_B);
mu_Den=max(mu_AVEYAB, mu_A);
plot(x_C,mu_C,'--',x_B,mu_B,'--',x_A,mu_A,'--',x_B, mu_Den,'k')

mu_VEYA_xi=max(mu_xi_C,mu_xi_B)