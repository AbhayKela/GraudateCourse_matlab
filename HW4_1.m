% This script is for the Homework 4.1 
% The given function is 
% min f(x1,x2)= (x1)^2+(2*(x2^2))-(3*(x1))-(2*x2))+(2*x1*x2);
% Constraints: 
% g1=(2.*x1)+(x2)-1;  
% g2=(x2+3);
%% Calculate Function optimum and true optimum values
clc;clear;close;
syms x1 x2
fx = (x1.^2)+(2.*(x2.^2))-(3.*x1)-(2.*x2)+(2.*x1.*x2);%% function f(x)
% Function optimal points 
df_1=diff(fx,x1,1);
df_2=diff(fx,x2,1);
fun_opt=solve(df_1,df_2,'x1','x2');
x1_opt=fun_opt.x1; display (x1_opt);
x2_opt=fun_opt.x2; display (x2_opt);
% True optimal points
g1=(2.*x1)+(x2)-1;
g2=(x2+3);
true_opt=solve(g1,g2,'x1','x2');
x1_t_opt=true_opt.x1;display (x1_t_opt)
x2_t_opt=true_opt.x2;display (x2_t_opt);
% Function Contour 
x = linspace(-2,5);
y = linspace(-5,2);
[x1, x2 ] = meshgrid(x,y);
fx = (x1.^2)+(2.*(x2.^2))-(3.*x1)-(2.*x2)+(2.*x1.*x2);%% function f(x)
[c,h]= contour(x1,x2,fx,[0,5,10,15,20,25]); clabel(c,h);
xlabel('x1'); ylabel('x2');
title('4.1 To graph the function and constraint with optimal point'); 
grid minor; hold on;
%% Plot Constraints 
g11=[0,0];
g22=[0,0];
% True optimal points
g1=(2.*x1)+(x2)-1;
g2=(x2+3);
c1=contour(x1,x2,g1,g11,'--r');
c2=contour(x1,x2,g2,g22,'--b');
hold on;
plot(2,-1/2,'*r');
hold on;
plot (x1_t_opt,x2_t_opt,'*k');
legend('Function Contour','g1(x)','g2(x)','Function optimal point','True Constrained Optimal Point');