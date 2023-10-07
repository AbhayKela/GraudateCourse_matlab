% This script is for the Homework 3.7 Powell's Method
% The given function is 
% f(x1,x2)=(4*(x1)*(x1))+((x2)*(x2))-(5*(x1))+(3*(x1)*(x2));
% Initial condition [4;-4]
%% Iteration 1
clc,clear,close;
format rat;
display('OPTIMAL DESIGN: HOMEWORK 3.7 : POWELLS METHOD WITH CONJUGATE DIRECTION');
display('Iteration 1--->');
% initial condition
x01=4;
x02=-4;
x0=[4;-4];
display(x0);
f=(4*(x01)*(x01))+((x02)*(x02))-(5*(x01))+(3*(x01)*(x02));
% derivative of function in with respect to x1
df1=(8*(x01))-5+(3*(x02));
df2=(2*(x02))+(3*(x01));
s1=1;s2=0;
s1_1=[s1;s2];
s1_2=[s2;s1];
display(s1_1);display(s1_2);
% alpha in terms of x1,s1,x2& s2 obtained in 3.2 section of this homework report
alpha=((5*s1)-(8*x01*s1)-(2*x02*s2)-(3*x01*s2)-(3*x02*s1))/((8*s1*s1)+(2*s2*s2)+(6*s1*s2));
display(alpha);
x1=x0+(alpha*s1_1);
display(x1);
x2=[17/8;-51/16];
display(x2);
sc_1=x2-x0;
display(sc_1);
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
X1_dash=[4;2.125;2.125;1.70296;1.70296;1.53668;1.42857];
X2_dash=[-4;-4;-3.1875;-3.00461;-2.55444;-2.601926;-2.14258];
[C,h]=contour(X1,X2,fx,[-3,0,5,10]);
clabel(C,h)
title('Plot 3.7: Powell Method of Conjugate Direction'); 
xlabel('X1');
ylabel('X2');
hold on;
grid minor;
plot (1.42857,-2.14258,'bo');
hold on;
plot (4,-4,'ko');
plot(X1_dash,X2_dash,'--r.');
hold on;
% For conjugate search direction
sc1=[4;1.702962;1.42857];
sc2=[-4;-3.004618;-2.14258];
plot(sc1,sc2,'--k*');
legend('Function Contour','Optimal point','Starting point','Iteration point','Conjugate Direction');