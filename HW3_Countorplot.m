% This script is for the Homework 3.1 Contour plot with starting point and  
% The given function is 
% f(x1,x2)=(4*(x1)*(x1))+((x2)*(x2))-(5*(x1))+(3*(x1)*(x2));
% Initial condition [4;-4]
clc,clear,close;
% Initial points 
x0=[4;-4];
%% Contour Plot
X11=linspace(-2,5);
X12=linspace(-8,4);
[X1,X2]=meshgrid(X11,X12);
fx= (4.*X1.^2) + (X2.^2) - (5.*X1) + (3.*X1.*X2);
[C,h]=contour(X1,X2,fx,[-3,0,5,10]);
clabel(C,h)
xlabel('X1');
ylabel('X2');
title('Plot 3.1: Contour plot for given function with Starting & Optimal Point');
hold on;
grid minor;
% Plot optimal point
plot ((10/7),(-15/7),'b*');text((10/7),(-15/7),'  Optimal Point');
hold on;
% Plot initial point
plot (4,-4,'r*');text(4,-4,'  Starting Point');
legend('Function Contour','Optimal point','Starting point');