% This script is for the Homework 2 of Optimal Design
% To compare following parameters for the given methods
% 1. Solution Time
% 2. Solution Accuracy
% 3. Sensitivity to convergence Parameter
%% BISECTION METHOD
function []=HW2_Bisection_f_AbhayKela()
fprintf('Solution by Bisection method in terms of f for different convergence parameters\n\n');
syms x;
f(x)=(0.00028292*(x^4))+(0.0027409*(x^3))-(0.069844*(x^2))-(1.1007*x)+7.7362;
df=vpa(diff(f)); % Derivative of the given function
xopt=vpasolve(df);
xopt=xopt(real(xopt)>=-20&real(xopt)<=20&imag(xopt)==0); % Optimum value from derivative of the given function
fxopt=vpa(f(xopt));
%% for convergence parameter, e= 0.1 
tic
e=0.1;
x1=-20; % Left value
x2=20; % Right value
xm=(x1+x2)/2; % first prediction of the root
fxm=vpa(f(xm));
fx=abs((fxm-fxopt)/fxopt);
i=1; % For number of iteration for x
while fx>e;
    if df(xm)<0
        x1=xm;
    elseif df(xm)>0
        x2=xm;
    end
    xm=(x1+x2)/2;
    i=i+1;
    fxm=vpa(f(xm));
    fxm=double(fxm);
    fx=abs((fxm-fxopt)/fxopt);    
end
% For the percent accuracy 
% fx=abs((fxm-fxopt)/fxopt);
fc=(1-(abs((fxm-fxopt)/fxopt)))*100;
fprintf('For the value of convergence e --> %f\n',e);
toc
fprintf('Solution Accuracy in percent for(f_tilda) --> %f\n',double(fc));
fprintf('The minimum value of F --> %f\n',double(fxm));
fprintf('The optimum value X --> %f\n',double(xm));
fprintf('Total number of iteration i --> %f\n',i);
fprintf('------------------------------------------------------------\n\n\n');
%% for convergence parameter, e= 0.01 
tic
e=0.01;
x1=-20; % Left value
x2=20; % Right value
xm=(x1+x2)/2; % first prediction of the root
fxm=vpa(f(xm));
fx=abs((fxm-fxopt)/fxopt);
i=1; % For number of iteration for x
while fx>e;
    if df(xm)<0
        x1=xm;
    elseif df(xm)>0
        x2=xm;
    end
    xm=(x1+x2)/2;
    i=i+1;
    fxm=vpa(f(xm));
    fxm=double(fxm);
    fx=abs((fxm-fxopt)/fxopt);    
end
% For the accuracy 
fc=(1-(abs((fxm-fxopt)/fxopt)))*100;
fprintf('For the value of convergence e --> %f\n',e);
toc
fprintf('Solution Accuracy in percent for(f_tilda) --> %f\n',double(fc));
fprintf('The minimum value of F --> %f\n',double(fxm));
fprintf('The optimum value X --> %f\n',double(xm));
fprintf('Total number of iteration i --> %f\n',i);
fprintf('------------------------------------------------------------\n\n\n');
%% for convergence parameter, e= 0.001 
tic
e=0.001;
x1=-20; % Left value
x2=20; % Right value
xm=(x1+x2)/2; % first prediction of the root
fxm=vpa(f(xm));
fx=abs((fxm-fxopt)/fxopt);
i=1; % For number of iteration for x
while fx>e;
    if df(xm)<0
        x1=xm;
    elseif df(xm)>0
        x2=xm;
    end
    xm=(x1+x2)/2;
    i=i+1;
    fxm=vpa(f(xm));
    fxm=double(fxm);
    fx=abs((fxm-fxopt)/fxopt);    
end
% For the percent accuracy 
fc=(1-(abs((fxm-fxopt)/fxopt)))*100;
fprintf('For the value of convergence e --> %f\n',e)
toc
fprintf('Solution Accuracy in percent for(f_tilda) --> %f\n',double(fc))
fprintf('The minimum value of F --> %f\n',double(fxm))
fprintf('The optimum value X --> %f\n',double(xm))
fprintf('Total number of iteration i --> %f\n',i)
fprintf('------------------------------------------------------------\n\n\n')
end
