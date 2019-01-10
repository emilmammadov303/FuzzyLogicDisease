global X mu_X mu_xi
lowLimit=0; highLimit=15;
SE(lowLimit,highLimit,4,-1,5.5); x_A=X; mu_A=mu_X; mu_xi_A=mu_xi;
ucgen(lowLimit,4,9,12,highLimit,5.5); x_B=X; mu_B=mu_X; mu_xi_B=mu_xi;

mu_AorB=mu_A+mu_B-(mu_A.*mu_B);
plot(x_A,mu_A,'--',x_B,mu_B,'--',x_B, mu_AorB,'k')

mu_OR_xi=mu_xi_A+mu_xi_B-(mu_xi_A.*mu_xi_B)