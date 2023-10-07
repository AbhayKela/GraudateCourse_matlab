% This program is for the Intro to optimal design homework number 5
clc;clear;
syms x1 x2
x = linspace(0,5);
y = linspace(0,5);
[x1, x2 ] = meshgrid(x,y);
fx=(5*x1)-(3*x2);
g1=(5*x1)-(3*x2)-2;
h1=(3*x1)+(6*x2)-4;
[c,h]= contour(x1,x2,fx,[-10,-5,0,5,10,15,20,25],'k'); clabel(c,h);
hold on;
xlabel('x1'); ylabel('x2');
title('HW#5.3'); grid minor;
g11=[0,0];
h22=[0,0];
contour(x1,x2,g1,g11,'--r');
hold on;
contour(x1,x2,h1,h22,'--m');
hold on;
legend('Function Contour','g1','h')