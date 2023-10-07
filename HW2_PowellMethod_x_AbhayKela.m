% This program is for the Homework 2 of Optimal Design
% To compare following parameters for the given methods
% 1. Solution Time
% 2. Solution Accuracy
% 3. Sensitivity to convergence Parameter
%% POWELL'S METHOD
function []=HW2_PowellMethod_x_AbhayKela()
fprintf('Solution by Powell Method in terms of X for different convergence parameters\n\n');
syms x;
f(x)=(0.00028292*(x^4))+(0.0027409*(x^3))-(0.069844*(x^2))-(1.1007*x)+7.7362;
df=vpa(diff(f)); % Derivative of the given function
xopt=vpasolve(df);
xopt=xopt(real(xopt)>=-20&real(xopt)<=20&imag(xopt)==0);% Optimum value from derivative of the given function
%% For the value of accuracy epsilon = 0.1  
tic
e=0.1;
x1=-20; % Extreme left value
x2=0;   % Middle value
x3=20;  % Extreme right value
f1=vpa(f(x1));
f2=vpa(f(x2));
f3=vpa(f(x3));
a1=(f2-f1)/(x2-x1);
a2=(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))/(x3-x2);
xm=vpa(((x2+x1)/2)-(a1/(2*a2)));
i=1; % For number of iteration
ax=abs((xm-xopt)/xopt);
while ax>e;
    if xm<x1;
        x3=x2;
        x2=x1;
        x1=xm;
        f1=vpa(f(x1));
        f2=vpa(f(x2));
        f3=vpa(f(x3));
        a1=(f2-f1)/(x2-x1);
        a2=(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))/(x3-x2);
    elseif xm<x2;
        x3=x2;
        x2=xm;
        f1=vpa(f(x1));
        f2=vpa(f(x2));
        f3=vpa(f(x3));
        a1=(f2-f1)/(x2-x1);
        a2=(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))/(x3-x2);
    elseif xm<x3
        x1=x2;
        x2=xm;
        f1=vpa(f(x1));
        f2=vpa(f(x2));
        f3=vpa(f(x3));
        a1=(f2-f1)/(x2-x1);
        a2=(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))/(x3-x2);
    else xm>x3;
        x1=x2;
        x2=x3;
        x3=xm;
        f1=vpa(f(x1));
        f2=vpa(f(x2));
        f3=vpa(f(x3));
        a1=(f2-f1)/(x2-x1);
        a2=(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))/(x3-x2);
    end
    xm=(((x2+x1)/2)-(a1/(2*a2)));
    xm=double(xm);
    fxm=vpa(f(xm));
    fxm=double(fxm);
    i=i+1;
    ax=abs((xm-xopt)/xopt);
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
%% For the value of accuracy epsilon = 0.01  
tic
e=0.01;
x1=-20; % Extreme left value
x2=0;   % Middle value
x3=20;  % Extreme right value
f1=vpa(f(x1));
f2=vpa(f(x2));
f3=vpa(f(x3));
a1=(f2-f1)/(x2-x1);
a2=(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))/(x3-x2);
xm=vpa(((x2+x1)/2)-(a1/(2*a2)));
i=1; % For number of iteration
ax=abs((xm-xopt)/xopt);
while ax>e;
    if xm<x1;
        x3=x2;
        x2=x1;
        x1=xm;
        f1=vpa(f(x1));
        f2=vpa(f(x2));
        f3=vpa(f(x3));
        a1=(f2-f1)/(x2-x1);
        a2=(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))/(x3-x2);
    elseif xm<x2;
        x3=x2;
        x2=xm;
        f1=vpa(f(x1));
        f2=vpa(f(x2));
        f3=vpa(f(x3));
        a1=(f2-f1)/(x2-x1);
        a2=(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))/(x3-x2);
    elseif xm<x3
        x1=x2;
        x2=xm;
        f1=vpa(f(x1));
        f2=vpa(f(x2));
        f3=vpa(f(x3));
        a1=(f2-f1)/(x2-x1);
        a2=(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))/(x3-x2);
    else xm>x3;
        x1=x2;
        x2=x3;
        x3=xm;
        f1=vpa(f(x1));
        f2=vpa(f(x2));
        f3=vpa(f(x3));
        a1=(f2-f1)/(x2-x1);
        a2=(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))/(x3-x2);
    end
    xm=(((x2+x1)/2)-(a1/(2*a2)));
    xm=double(xm);
    fxm=vpa(f(xm));
    fxm=double(fxm);
    i=i+1;
    ax=abs((xm-xopt)/xopt);
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
%% For the value of accuracy epsilon = 0.001  
tic
e=0.001;
x1=-20; % Extreme left value
x2=0;   % Middle value
x3=20;  % Extreme right value
f1=vpa(f(x1));
f2=vpa(f(x2));
f3=vpa(f(x3));
a1=(f2-f1)/(x2-x1);
a2=(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))/(x3-x2);
xm=vpa(((x2+x1)/2)-(a1/(2*a2)));
i=1; % For number of iteration
ax=abs((xm-xopt)/xopt);
while ax>e;
    if xm<x1;
        x3=x2;
        x2=x1;
        x1=xm;
        f1=vpa(f(x1));
        f2=vpa(f(x2));
        f3=vpa(f(x3));
        a1=(f2-f1)/(x2-x1);
        a2=(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))/(x3-x2);
    elseif xm<x2;
        x3=x2;
        x2=xm;
        f1=vpa(f(x1));
        f2=vpa(f(x2));
        f3=vpa(f(x3));
        a1=(f2-f1)/(x2-x1);
        a2=(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))/(x3-x2);
    elseif xm<x3
        x1=x2;
        x2=xm;
        f1=vpa(f(x1));
        f2=vpa(f(x2));
        f3=vpa(f(x3));
        a1=(f2-f1)/(x2-x1);
        a2=(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))/(x3-x2);
    else xm>x3;
        x1=x2;
        x2=x3;
        x3=xm;
        f1=vpa(f(x1));
        f2=vpa(f(x2));
        f3=vpa(f(x3));
        a1=(f2-f1)/(x2-x1);
        a2=(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))/(x3-x2);
    end
    xm=(((x2+x1)/2)-(a1/(2*a2)));
    xm=double(xm);
    fxm=vpa(f(xm));
    fxm=double(fxm);
    i=i+1;
    ax=abs((xm-xopt)/xopt);
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