% This script is for the Homework 3.3 Steepest Descent 
% The given function is 
% f(x1,x2)=(4*(x1)*(x1))+((x2)*(x2))-(5*(x1))+(3*(x1)*(x2));
% Initial condition [4;-4]
%% Iteration 1
clc,clear,close;
format rat;
display('OPTIMAL DESIGN: HOMEWORK 3.3 : STEEPEST DESCENT');
display('Iteration 1--->');
% initial condition
x1=4;
x2=-4;
display(x1); display(x2);
f=(4*(x1)*(x1))+((x2)*(x2))-(5*(x1))+(3*(x1)*(x2));
% derivative of function in with respect to x1
df1=(8*(x1))-5+(3*(x2));
df2=(2*(x2))+(3*(x1));
s1=-15;s2=-4;
display(s1);display(s2);
% alpha in terms of x1,s1,x2& s2 obtained in 3.2 section of this homework report
alpha=((5*s1)-(8*x1*s1)-(2*x2*s2)-(3*x1*s2)-(3*x2*s1))/((8*s1*s1)+(2*s2*s2)+(6*s1*s2));
display(alpha);
x11_dash=x1+(alpha*s1);
x12_dash=x2+(alpha*s2);
%% Iteration 2
display('Iteration 2--->');
df1_x11=(8*(x11_dash))-5+(3*(x12_dash));
df2_x11=(2*(x12_dash))+(3*(x11_dash));
s1=(-df1_x11);s2=(-df2_x11);
x1=x11_dash;
x2=x12_dash;
display(x1); display(x2);display(s1);display(s2);
alpha=((5*s1)-(8*x1*s1)-(2*x2*s2)-(3*x1*s2)-(3*x2*s1))/((8*s1*s1)+(2*s2*s2)+(6*s1*s2));
display(alpha);
x21_dash=x1+(alpha*s1);
x22_dash=x2+(alpha*s2);
%% Iteration 3
display('Iteration 3--->');
df1_x11=(8*(x21_dash))-5+(3*(x22_dash));
df2_x11=(2*(x22_dash))+(3*(x21_dash));
s1=(-df1_x11);s2=(-df2_x11);
x1=x11_dash;
x2=x12_dash;
display(x1); display(x2);display(s1);display(s2);
alpha=((5*s1)-(8*x1*s1)-(2*x2*s2)-(3*x1*s2)-(3*x2*s1))/((8*s1*s1)+(2*s2*s2)+(6*s1*s2));
display(alpha);
display('x1 & x2 after third iteration--->');
x31_dash=x1+(alpha*s1);
x32_dash=x2+(alpha*s2);
x1=x31_dash;x2=x32_dash;
display(x1);display(x2);
%% Contour Plot
X11=linspace(-2,5);
X12=linspace(-8,4);
[X1,X2]=meshgrid(X11,X12);
fx= (4.*X1.^2) + (X2.^2) - (5.*X1) + (3.*X1.*X2);
% optimal point 
X_OPT1=10/7;X_OPT2=(-15/7);
X1_dash=[4;717/305;1100/607;1231/786];
X2_dash=[-4;-2433/548;-559/231;-1116/449];
[C,h]=contour(X1,X2,fx,[-3,0,5,10]);
clabel(C,h)
title('Plot for Steepest Descent Method'); 
xlabel('X1');
ylabel('X2');
hold on;
grid minor;
plot ((10/7),(-15/7),'bo');
hold on;
plot (4,-4,'ko');
plot(X1_dash,X2_dash,'--r.');
legend('Function Contour','Optimal point','Starting point','Iteration point');