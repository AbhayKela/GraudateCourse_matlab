% This script is for the Homework 2 of Optimal Design
% To compare following parameters for the given methods
% 1. Solution Time
% 2. Solution Accuracy
% 3. Sensitivity to convergence Parameter
%% BISECTION METHOD
function []=HW2_Bisection_x_AbhayKela()
fprintf('Solution by Bisection method in terms of X for different convergence parameters\n\n');
syms x;
f(x)=(0.00028292*(x^4))+(0.0027409*(x^3))-(0.069844*(x^2))-(1.1007*x)+7.7362;
df=vpa(diff(f)); % Derivative of the given function
xopt=vpasolve(df);
xopt=xopt(real(xopt)>=-20&real(xopt)<=20&imag(xopt)==0);
%%
tic
e=0.1;
i=1; % For number of iteration for x
x1=-20; % Left value
x2=20; % Right value
xm=(x1+x2)/2; % first prediction of the root
ax=abs((xm-xopt)/xopt);
while ax>=e;
    if df(xm)<0
        x1=xm;
    elseif df(xm)>0
        x2=xm;
    end
    xm=(x1+x2)/2;
    i=i+1;
    ax=abs((xm-xopt)/xopt);
    fxm=vpa(f(xm));
    fxm=double(fxm);
end
% For the percent accuracy 
ac=(1-(abs((xm-xopt)/xopt)))*100;
fprintf('For the value of convergence e --> %f\n',e);
toc
fprintf('Solution Accuracy in percent for(x_tilda) --> %f\n',double(ac));
fprintf('The minimum value of F --> %f\n',double(fxm));
fprintf('The optimum value X --> %f\n',double(xm));
fprintf('Total number of iteration i --> %f\n',i);
fprintf('------------------------------------------------------------\n\n\n');
%%
tic
e=0.01;
i=1;
x1=-20; % Left value
x2=20; % Right value
xm=(x1+x2)/2;
ax=abs((xm-xopt)/xopt);
while ax>=e;
    if df(xm)<0
        x1=xm;
    elseif df(xm)>0
        x2=xm;
    end
    xm=(x1+x2)/2;
    i=i+1;
    ax=abs((xm-xopt)/xopt);
    fxm=vpa(f(xm));
    fxm=double(fxm);
end
% For the percent accuracy 
ac=(1-(abs((xm-xopt)/xopt)))*100;
fprintf('For the value of convergence e --> %f\n',e);
toc
fprintf('Solution Accuracy in percent for(x_tilda) --> %f\n',double(ac));
fprintf('The minimum value of F --> %f\n',double(fxm));
fprintf('The optimum value X --> %f\n',double(xm));
fprintf('Total number of iteration i --> %f\n',i);
fprintf('------------------------------------------------------------\n\n\n');
%%
tic
e=0.001;
i=1;
x1=-20; % Left value
x2=20; % Right value
xm=(x1+x2)/2;
ax=abs((xm-xopt)/xopt);
while ax>=e;
    if df(xm)<0
        x1=xm;
    elseif df(xm)>0
        x2=xm;
    end
    xm=(x1+x2)/2;
    i=i+1;
    ax=abs((xm-xopt)/xopt);
    fxm=vpa(f(xm));
    fxm=double(fxm);
end
% For the percent accuracy 
ac=(1-(abs((xm-xopt)/xopt)))*100;
fprintf('For the value of convergence e --> %f\n',e);
toc
fprintf('Solution Accuracy in percent for(x_tilda) --> %f\n',double(ac));
fprintf('The minimum value of F --> %f\n',double(fxm));
fprintf('The optimum value X --> %f\n',double(xm));
fprintf('Total number of iteration i --> %f\n',i);
fprintf('------------------------------------------------------------\n\n\n');
end
