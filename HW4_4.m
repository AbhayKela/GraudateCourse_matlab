%% To update relation of x
clc;clear;
syms x1 x2 lambda1 lambda2
fx=(x1.^2)+(2.*(x2.^2))-(3.*x1)-(2.*x2)+(2.*x1.*x2);
g1=(2.*x1)+(x2)-1;
g2=(x2+3);
A=fx+(lambda1*g1)+(g1^2)+(lambda2*g2)+(g2^2);
dA_x1=diff(A,x1,1);dA_x2=diff(A,x2,1);
sol_A=solve(dA_x1,dA_x2,'x1','x2');
x1=sol_A.x1; display (x1)
x2=sol_A.x2; display (x2)
%% Starting point for lambda = [0 0]
clear;
syms x1 x2 
fx=(x1.^2)+(2.*(x2.^2))-(3.*x1)-(2.*x2)+(2.*x1.*x2);
g1=(2.*x1)+(x2)-1;
g2=(x2+3);
df_x1=diff(fx,x1,1);df_x2=diff(fx,x2,1);
sol_fx=solve(df_x1,df_x2,'x1','x2');
x1=sol_fx.x1;display(x1);
x2=sol_fx.x2;display(x2);
%% For lambda=[19/2 49/2]
clear;
syms x1 x2 
lambda1=19/2;lambda2=49/2;
fx=(x1.^2)+(2.*(x2.^2))-(3.*x1)-(2.*x2)+(2.*x1.*x2);
g1=(2.*x1)+(x2)-1;
g2=(x2+3);
df_x1=diff(fx,x1,1);df_x2=diff(fx,x2,1);
dg1_x1=diff(g1,x1,1);dg1_x2=diff(g1,x2,1);
dg2_x1=diff(g2,x1,1);dg2_x2=diff(g2,x2,1);
equ1=df_x1+(lambda1*dg1_x1)+(lambda2*dg2_x1);
equ2=df_x2+(lambda1*dg1_x2)+(lambda2*dg2_x2);
sol_equ=solve(equ1,equ2,'x1','x2');
x1=sol_equ.x1;display(x1);
x2=sol_equ.x2;display(x2);
%% Stationary Points for each iteration for lambda=[0 0];
clear;
% x_1
lambda1=0;lambda2=0;
x1_0=2;x2_0=(-1/2);
x1_1=(3*lambda2/22)-(5*lambda1/22)+(17/11);
x2_1=(lambda1/22)-(5*lambda2/22)+(-31/22);
lambda11=lambda1+2*max((2*(x1_1)+(x2_1)-1),(-lambda1/2));
lambda12=lambda2+2*max(((x2_1)+3),(-lambda2/2));
% x_2
x1_2=(3*lambda12/22)-(5*lambda11/22)+(17/11);
x2_2=(lambda11/22)-(5*lambda12/22)+(-31/22);
lambda21=lambda11+2*max((2*(x1_1)+(x2_1)-1),(-lambda11/2));
lambda22=lambda12+2*max(((x2_1)+3),(-lambda12/2));
%x_3
x1_3=(3*lambda22/22)-(5*lambda21/22)+(17/11);
x2_3=(lambda21/22)-(5*lambda22/22)+(-31/22);
lambda31=lambda21+2*max((2*(x1_1)+(x2_1)-1),(-lambda21/2));
lambda32=lambda22+2*max(((x2_1)+3),(-lambda22/2));
%x_4
x1_4=(3*lambda32/22)-(5*lambda31/22)+(17/11);
x2_4=(lambda31/22)-(5*lambda32/22)+(-31/22);
lambda31=lambda31+2*max((2*(x1_1)+(x2_1)-1),(-lambda31/2));
lambda32=lambda32+2*max(((x2_1)+3),(-lambda32/2));
%% Plot the function
x = linspace(-5,5);
y = linspace(-9,1);
[x1, x2 ] = meshgrid(x,y);
fx = (x1.^2)+(2.*(x2.^2))-(3.*x1)-(2.*x2)+(2.*x1.*x2);%% function f(x)
g1=(2.*x1)+(x2)-1; % Constraint 1  
g2=(x2+3); % Constraint 2 
[c,h]= contour(x1,x2,fx,[0,5,10,15,20,25]); clabel(c,h);
xlabel('x1'); ylabel('x2');
title('4.4 Augemented Lagrangian Multiplier Method for different lambda'); 
grid minor; hold on;
% Constraints 
g11=[0,0];
g22=[0,0];
c1=contour(x1,x2,g1,g11,'--r');
hold on,
c2=contour(x1,x2,g2,g22,'--k');
hold on;
X111=[2;17/11;202/121;2397/1331;3746/1987;1569/811];
X222=[-0.5;-31/22;-501/242;-1017/412;-1438/533;-1205/426];
plot(X111,X222,'-b*');
hold on;
X333=[0;30/11;328/121;1245/508;1539/680];
X444=[-8;-72/11;-620/121;-2791/661;-1179/319];
plot(X333,X444,'-m*');
hold on;
plot (2,-3,'r*');
hold on;
legend('Pseudo Function Contour','g1(x)','g2(x)','Progression towards optimal for lambda=[0,0]','Progression towards optimal for lambda=[19/2,49/2]','True optimal point');
%% Stationary Points for each iteration for lambda=[19/2 49/2];
clear;
% x_1
lambda1=(19/2);lambda2=(49/2);
x1_0=2;x2_0=(-1/2);
x1_1=(3*lambda2/22)-(5*lambda1/22)+(17/11);
x2_1=(lambda1/22)-(5*lambda2/22)+(-31/22);
lambda11=lambda1+2*max((2*(x1_1)+(x2_1)-1),(-lambda1/2));
lambda12=lambda2+2*max(((x2_1)+3),(-lambda2/2));
% x_2
x1_2=(3*lambda12/22)-(5*lambda11/22)+(17/11);
x2_2=(lambda11/22)-(5*lambda12/22)+(-31/22);
lambda21=lambda11+2*max((2*(x1_1)+(x2_1)-1),(-lambda11/2));
lambda22=lambda12+2*max(((x2_1)+3),(-lambda12/2));
%x_3
x1_3=(3*lambda22/22)-(5*lambda21/22)+(17/11);
x2_3=(lambda21/22)-(5*lambda22/22)+(-31/22);
lambda31=lambda21+2*max((2*(x1_1)+(x2_1)-1),(-lambda21/2));
lambda32=lambda22+2*max(((x2_1)+3),(-lambda22/2));
%x_4
x1_4=(3*lambda32/22)-(5*lambda31/22)+(17/11);
x2_4=(lambda31/22)-(5*lambda32/22)+(-31/22);
lambda31=lambda31+2*max((2*(x1_1)+(x2_1)-1),(-lambda31/2));
lambda32=lambda32+2*max(((x2_1)+3),(-lambda32/2));
%% Plot the function
