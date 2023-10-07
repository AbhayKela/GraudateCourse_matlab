% This script is for the Homework 3.4 Fletcher Reeves 
% The given function is 
% f(x1,x2)=(4*(x1)*(x1))+((x2)*(x2))-(5*(x1))+(3*(x1)*(x2));
% Initial condition [4;-4]
%% Iteration 1
clc,clear,close;
format rat;
display('OPTIMAL DESIGN: HOMEWORK 3.6 : BRANDON FLECTURE GOLDFARB SHANNO METHOD');
display('Iteration 1--> (Referring values from Steepest Descent method)');
x01=4;x02=-4;x11=(5153/2192);x12=-(2433/548);
df01=15;df02=4;
df11=(8*(x11))-5+(3*(x12));
df12=(2*(x12))+(3*(x11));
df1=[df11;df12];
display('Iteration 1-->');
p11=x11-x01;p12=x12-x02;
p=[p11;p12];
display (p);
y11_dash=df11-df01;y12_dash=df12-df02;
y=[y11_dash;y12_dash];
sigma1=(p)'*(y);
display(sigma1);
hessian=[1,0;0,1];
tau=(y)'*hessian*(y);
display(tau);
D0_dash=(((sigma1+tau)/(sigma1)^2)*(p)*(p)')-(1/(sigma1)^2*(hessian)*y*(hessian*y)');
D0_dash=[-761/1066,-11/34;-11/34,-233/1962];
display(D0_dash);
H1=hessian+D0_dash;display(H1);
s1_dash=(-H1)*(df1);
display(s1_dash);
% The above code is for first iteration only; further values are calculated
% using above code only with changing the values of X vector, s vector and
% then calculating respective alpha and other method respective values using given imperical formulas .
%% Contout plot 
X11=linspace(-2,5);
X12=linspace(-8,4);
[X1,X2]=meshgrid(X11,X12);
fx= (4.*X1.^2) + (X2.^2) - (5.*X1) + (3.*X1.*X2);
% optimal point 
X_OPT1=10/7;X_OPT2=(-15/7);
X1_dash=[4;717/305;10/7];
X2_dash=[-4;-2433/548;-15/7];
[C,h]=contour(X1,X2,fx,[-3,0,5,10]);
clabel(C,h)
title('Plot 3.6: Broydon Flecture Goldfarb Shanno Method'); 
xlabel('X1');
ylabel('X2');
hold on;
grid minor;
plot ((10/7),(-15/7),'bo');
hold on;
plot (4,-4,'ko');
plot(X1_dash,X2_dash,'--r.');
legend('Function Contour','Optimal point','Starting point','Iteration point');
