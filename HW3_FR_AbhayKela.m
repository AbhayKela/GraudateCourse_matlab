% This script is for the Homework 3.4 Fletcher Reeves 
% The given function is 
% f(x1,x2)=(4*(x1)*(x1))+((x2)*(x2))-(5*(x1))+(3*(x1)*(x2));
% Initial condition [4;-4]
%% Iteration 1
clc,clear,close;
format rat;
display('OPTIMAL DESIGN: HOMEWORK 3.4 : FLETCHER REEVES');
display('Iteration 1--> (Referring values from Steepest Descent method)');
x1=(5153/2192);x2=-(2433/548);
s0_1=-15;s0_2=-4;
% derivative of function in with respect to x1
display('Iteration 2-->')
df1_1=(8*(x1))-5+(3*(x2));
df1_2=(2*(x2))+(3*(x1));
display(x1); display(x2);display(s0_1);display(s0_2);display(df1_1);display(df1_2);
beta_0=((df1_1)^2+(df1_2)^2)/((s0_1)^2+(s0_2)^2);
s1_dash=-(df1_1)+(beta_0)*(s0_1);
s2_dash=-(df1_2)+(beta_0)*(s0_2);
display(beta_0);display(s1_dash);display(s2_dash);
s1=s1_dash;s2=s2_dash;
% alpha in terms of x1,s1,x2& s2 obtained in 3.2 section of this homework report
alpha=((5*s1)-(8*x1*s1)-(2*x2*s2)-(3*x1*s2)-(3*x2*s1))/((8*s1*s1)+(2*s2*s2)+(6*s1*s2));
display(alpha)
x11_dash=x1+(alpha*s1_dash);
x12_dash=x2+(alpha*s2_dash);
x1=x11_dash;x2=x12_dash;
display('Iteration 3-->')
df2_1=(8*1.4286)-5+(-3*2.1429);
df2_2=(-2*2.1429)+(3*1.4286);
display(df2_1);display(df2_2);
fprintf('As the value of derivative reaches to 0, no further iteration is required');
%% Contour Plot
X11=linspace(-2,5);
X12=linspace(-8,4);
[X1,X2]=meshgrid(X11,X12);
fx= (4.*X1.^2) + (X2.^2) - (5.*X1) + (3.*X1.*X2);
% optimal point 
X_OPT1=10/7;X_OPT2=(-15/7);
X1_dash=[4;717/305;1.4286;10/7];
X2_dash=[-4;-2433/548;-2.1429;-15/7];
[C,h]=contour(X1,X2,fx,[-3,0,5,10]);
clabel(C,h)
title('Plot 3.4: Flecture Reeves Method'); 
xlabel('X1');
ylabel('X2');
hold on;
grid minor;
plot ((10/7),(-15/7),'bo');
hold on;
plot (4,-4,'ko');
plot(X1_dash,X2_dash,'--r*');
legend('Function Contour','Optimal point','Starting point','Iteration point');
