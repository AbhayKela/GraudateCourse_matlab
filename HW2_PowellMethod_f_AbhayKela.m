% This program is for the Homework 2 of Optimal Design
% To compare following parameters for the given methods
% 1. Solution Time
% 2. Solution Accuracy
% 3. Sensitivity to convergence Parameter
%% POWELL'S METHOD
function []=HW2_PowellMethod_f_AbhayKela()
fprintf('Solution by Powell Method in terms of f for different convergence parameters\n\n');
syms x;
f(x)=(0.00028292*(x^4))+(0.0027409*(x^3))-(0.069844*(x^2))-(1.1007*x)+7.7362;
df=vpa(diff(f)); % Derivative of the given function
xopt=vpasolve(df);
xopt=xopt(real(xopt)>=-20&real(xopt)<=20&imag(xopt)==0);
fxopt=vpa(f(xopt)); % Optimum value from derivative of the given function
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
fxm=vpa(f(xm));
i=1; % For number of iteration
fax=abs((fxm-fxopt)/fxopt);
while fax>=e;
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
    i=i+1;   
    fxm=vpa(f(xm));
    fxm=double(fxm);
    fax=abs((fxm-fxopt)/fxopt);     
end
% For the percent accuracy 
fc=(1-(abs((fxm-fxopt)/fxopt)))*100;
fprintf('For the value of convergence e --> %f\n',e);
toc
fprintf('Solution Accuracy in percent for(f_tilda) --> %f\n',double(fc));
fprintf('The minimum value of F --> %f\n',fxm);
fprintf('The optimum value X --> %f\n',xm);
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
fxm=vpa(f(xm));
i=1; % For number of iteration
fax=abs((fxm-fxopt)/fxopt);
while fax>=e;
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
    i=i+1;   
    fxm=vpa(f(xm));
    fxm=double(fxm);
    fax=abs((fxm-fxopt)/fxopt);     
end
% For the percent accuracy 
fc=(1-(abs((fxm-fxopt)/fxopt)))*100;
fprintf('For the value of convergence e --> %f\n',e);
toc
fprintf('Solution Accuracy in percent for(f_tilda) --> %f\n',double(fc));
fprintf('The minimum value of F --> %f\n',fxm);
fprintf('The optimum value X --> %f\n',xm);
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
fxm=vpa(f(xm));
i=1; % For number of iteration
fax=abs((fxm-fxopt)/fxopt);
while fax>=e;
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
    i=i+1;   
    fxm=vpa(f(xm));
    fxm=double(fxm);
    fax=abs((fxm-fxopt)/fxopt);     
end
% For the percent accuracy 
fc=(1-(abs((fxm-fxopt)/fxopt)))*100;
fprintf('For the value of convergence e --> %f\n',e);
toc
fprintf('Solution Accuracy in percent for(f_tilda) --> %f\n',double(fc));
fprintf('The minimum value of F --> %f\n',fxm);
fprintf('The optimum value X --> %f\n',xm);
fprintf('Total number of iteration i --> %f\n',i);
fprintf('------------------------------------------------------------\n\n\n');
end 