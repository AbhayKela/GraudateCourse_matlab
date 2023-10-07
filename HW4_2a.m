clc;clear;close;
syms x1 x2
fx = (x1.^2)+(2.*(x2.^2))-(3.*x1)-(2.*x2)+(2.*x1.*x2);%% function f(x)
g1=(2.*x1)+(x2)-1; % Constraint 1  
g2=(x2+3); % Constraint 2 
%%  pseudo objective function for rp=1
phi1=fx+1.*((g1).^2+(g2).^2);
% phi=fx+1.*(((max(0,g1)).^2+(max(0,g2)).^2));
df_phi1_x1=diff(phi1,x1,1);
df_phi1_x2=diff(phi1,x2,1);
phi_opt=solve(df_phi1_x1,df_phi1_x2,'x1','x2');
display('For rp=1');
x1_phi_1=phi_opt.x1; display (x1_phi_1);
x2_phi_1=phi_opt.x2; display (x2_phi_1);
%%  Plot pseudo objective function for rp=1
x = linspace(-2,5);
y = linspace(-5,2);
[x1, x2 ] = meshgrid(x,y);
fx = (x1.^2)+(2.*(x2.^2))-(3.*x1)-(2.*x2)+(2.*x1.*x2);%% function f(x)
g1=(2.*x1)+(x2)-1; % Constraint 1  
g2=(x2+3); % Constraint 2 
phi1=fx+1.*((max(0,g1)).^2+(max(0,g2)).^2);
[c,h]= contour(x1,x2,phi1,[0,5,10,15,20,25]); clabel(c,h);
xlabel('x1'); ylabel('x2');
title('4.2a Exterior Penalty Function method for rp=1'); 
grid minor; hold on;
% Constraints 
g11=[0,0];
g22=[0,0];
c1=contour(x1,x2,g1,g11,'--r');
c2=contour(x1,x2,g2,g22,'--b');
legend('Pseudo Function Contour','g1(x)','g2(x)');
%%  pseudo objective function for rp=10
clear;
syms x1 x2
fx = (x1.^2)+(2.*(x2.^2))-(3.*x1)-(2.*x2)+(2.*x1.*x2);%% function f(x)
g1=(2.*x1)+(x2)-1; % Constraint 1  
g2=(x2+3); % Constraint 2 
phi2=fx+10.*((g1).^2+(g2).^2);
% phi=fx+rp_1.*(((max(0,g1)).^2+(max(0,g2)).^2));
df_phi2_x1=diff(phi2,x1,1);
df_phi2_x2=diff(phi2,x2,1);
phi_opt=solve(df_phi2_x1,df_phi2_x2,'x1','x2');
display('For rp=10');
x1_phi_2=phi_opt.x1; display (x1_phi_2);
x2_phi_2=phi_opt.x2; display (x2_phi_2);
%%  Plot pseudo objective function for rp=10
figure;
x = linspace(-2,5);
y = linspace(-5,2);
[x1, x2 ] = meshgrid(x,y);
fx = (x1.^2)+(2.*(x2.^2))-(3.*x1)-(2.*x2)+(2.*x1.*x2);%% function f(x)
g1=(2.*x1)+(x2)-1; % Constraint 1  
g2=(x2+3); % Constraint 2 
phi2=fx+10.*((max(0,g1)).^2+(max(0,g2)).^2);
[c,h]= contour(x1,x2,phi2,[0,5,10,15,20,25]); clabel(c,h);
xlabel('x1'); ylabel('x2');
title('4.2a Exterior Penalty Function method for rp=10'); 
grid minor; hold on;
% Constraints 
g11=[0,0];
g22=[0,0];
c1=contour(x1,x2,g1,g11,'--r');
c2=contour(x1,x2,g2,g22,'--b');
legend('Pseudo Function Contour','g1(x)','g2(x)');