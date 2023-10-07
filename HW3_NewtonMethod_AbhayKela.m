% This script is for the Homework 3.7 Powell's Method
% The given function is 
% f(x1,x2)=(4*(x1)*(x1))+((x2)*(x2))-(5*(x1))+(3*(x1)*(x2));
% Initial condition [4;-4]
%% Iteration 1
clc,clear,close;
format rat;
display('OPTIMAL DESIGN: HOMEWORK 3.8 : NEWTON METHOD');
display('Iteration 1--->');
x01=4;
x02=-4;
x0=[4;-4];
display(x0);
f=(4*(x01)*(x01))+((x02)*(x02))-(5*(x01))+(3*(x01)*(x02));
% derivative of function in with respect to x1
df1=(8*(x01))-5+(3*(x02));
df2=(2*(x02))+(3*(x01));
df=[df1;df2];
display(df);
H=[8,3;3,2];
s0=(inv(H))*df;
% The above code is for first iteration only; further values are calculated
% using above code only with changing the values of X vector, s vector and
% the ncalculating respective alpha and other method respective values .
%% Contout plot 
X11=linspace(-2,5);
X12=linspace(-8,4);
[X1,X2]=meshgrid(X11,X12);
fx= (4.*X1.^2) + (X2.^2) - (5.*X1) + (3.*X1.*X2);
% optimal point 
X_OPT1=10/7;X_OPT2=(-15/7);
X1_dash=[4;10/7];
X2_dash=[-4;-15/7];
[C,h]=contour(X1,X2,fx,[-3,0,5,10]);
clabel(C,h)
title('Plot 3.8: Newton Method'); 
xlabel('X1');
ylabel('X2');
hold on;
grid minor;
plot ((10/7),(-15/7),'bo');
hold on;
plot (4,-4,'ko');
plot(X1_dash,X2_dash,'--r.');
legend('Function Contour','Optimal point','Starting point','Iteration point');
