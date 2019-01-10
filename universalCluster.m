global X mu_X mu_xi
altsinir=-20; ustsinir=20;
SE(altsinir,ustsinir,-15,-2,0); x_A=X; mu_A=mu_X;
ucgen(altsinir,-20,-10,0,ustsinir,0); x_B=X; mu_B=mu_X;
ucgen(altsinir,-10,0,10,ustsinir,0); x_C=X; mu_C=mu_X;
ucgen(altsinir,0,10,20,ustsinir,0); x_D=X; mu_D=mu_X;
SE(altsinir,ustsinir,15,2,0); x_E=X; mu_E=mu_X;
plot(x_A,mu_A,'k', x_B,mu_B,'k',x_C,mu_C,'k', x_D,mu_D,'k', x_E,mu_E,'k')
