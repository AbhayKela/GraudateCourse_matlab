% This script is for the Homework 2 of Optimal Design
% To compare following parameters for the given methods
% 1. Solution Time
% 2. Solution Accuracy
% 3. Sensitivity to convergence Parameter
%% GOLDENSECTION METHOD
function []=HW2_Goldensection_AbhayKela()
fprintf('Solution by Golden Section method for different convergence parameters\n\n');
syms x;
f(x)=vpa((0.00028292*(x^4))+(0.0027409*(x^3))-(0.069844*(x^2))-(1.1007*x)+7.7362);
df=vpa(diff(f));
xopt=vpasolve(df);
xopt=xopt(real(xopt)>=-20&real(xopt)<=20&imag(xopt)==0);
fxopt=vpa(f(xopt));
%% For the convergence value of e=0.1
tic
e=0.1;
xl=-20; % Extreme left value
fl=vpa(f(xl));
xr=20; % Extreme right value
fr=vpa(f(xr));
N =(-2.075*log(e))+3;
N =ceil(N);
tau=0.381966;
x1=((1-tau)*xl)+(tau*xr);
x2=((tau*xl)+((1-tau)*xr));
f1=vpa(f(x1));
f2=vpa(f(x2));
i=3;
while i<N
    i=i+1;
    if f1>f2
        xl=x1;
        fl=f1;
        x1=x2;
        f1=f2;
        x2=(tau*xl)+((1-tau)*xr);
        f2=vpa(f(x2));
    else
        xr=x2;
        fr=f2;
        x2=x1;
        f2=f1;
        x1=((1-tau)*xl)+(tau*xr);
        f1=vpa(f(x1));
    end 
end
if f1<f2;
    fxm = double(f1);
    xm = double(x1);
else
    fxm =double(f2);
    xm = double(x2);
end
ac=(1-(abs((xm-xopt)/xopt)))*100;
fc=(1-(abs((fxm-fxopt)/fxopt)))*100;
fprintf('For the value of convergence e --> %f\n',e);
toc
fprintf('Solution Accuracy in percent for(x_tilda) --> %f\n',double(ac));
fprintf('Solution Accuracy in percent for(f_tilda) --> %f\n',double(fc));
fprintf('The minimum value of F --> %f\n',double(fxm));
fprintf('The optimum value X --> %f\n',double(xm));
fprintf('Total number of iteration i --> %f\n',i);
fprintf('------------------------------------------------------------\n\n\n');
%% For the convergence value of e=0.01
tic
e=0.01;
xl=-20; % Extreme left value
fl=vpa(f(xl));
xr=20; % Extreme right value
fr=vpa(f(xr));
N =(-2.075*log(e))+3;
N =ceil(N);
tau=0.381966;
x1=((1-tau)*xl)+(tau*xr);
x2=((tau*xl)+((1-tau)*xr));
f1=vpa(f(x1));
f2=vpa(f(x2));
i=3;
while i<N
    i=i+1;
    if f1>f2
        xl=x1;
        fl=f1;
        x1=x2;
        f1=f2;
        x2=(tau*xl)+((1-tau)*xr);
        f2=vpa(f(x2));
    else
        xr=x2;
        fr=f2;
        x2=x1;
        f2=f1;
        x1=((1-tau)*xl)+(tau*xr);
        f1=vpa(f(x1));
    end 
end
if f1<f2;
    fxm = double(f1);
    xm = double(x1);
else
    fxm =double(f2);
    xm = double(x2);
end
ac=(1-(abs((xm-xopt)/xopt)))*100;
fc=(1-(abs((fxm-fxopt)/fxopt)))*100;
fprintf('For the value of convergence e --> %f\n',e);
toc
fprintf('Solution Accuracy in percent for(x_tilda) --> %f\n',double(ac));
fprintf('Solution Accuracy in percent for(f_tilda) --> %f\n',double(fc));
fprintf('The minimum value of F --> %f\n',double(fxm));
fprintf('The optimum value X --> %f\n',double(xm));
fprintf('Total number of iteration i --> %f\n',i);
fprintf('------------------------------------------------------------\n\n\n');
%% For the convergence value of e=0.001
tic
e=0.001;
xl=-20; % Extreme left value
fl=vpa(f(xl));
xr=20; % Extreme right value
fr=vpa(f(xr));
N =(-2.075*log(e))+3;
N =ceil(N);
tau=0.381966;
x1=((1-tau)*xl)+(tau*xr);
x2=((tau*xl)+((1-tau)*xr));
f1=vpa(f(x1));
f2=vpa(f(x2));
i=3;
while i<N
    i=i+1;
    if f1>f2
        xl=x1;
        fl=f1;
        x1=x2;
        f1=f2;
        x2=(tau*xl)+((1-tau)*xr);
        f2=vpa(f(x2));
    else
        xr=x2;
        fr=f2;
        x2=x1;
        f2=f1;
        x1=((1-tau)*xl)+(tau*xr);
        f1=vpa(f(x1));
    end 
end
if f1<f2;
    fxm = double(f1);
    xm = double(x1);
else
    fxm =double(f2);
    xm = double(x2);
end
ac=(1-(abs((xm-xopt)/xopt)))*100;
fc=(1-(abs((fxm-fxopt)/fxopt)))*100;
fprintf('For the value of convergence e --> %f\n',e);
toc
fprintf('Solution Accuracy in percent for(x_tilda) --> %f\n',double(ac));
fprintf('Solution Accuracy in percent for(f_tilda) --> %f\n',double(fc));
fprintf('The minimum value of F --> %f\n',double(fxm));
fprintf('The optimum value X --> %f\n',double(xm));
fprintf('Total number of iteration i --> %f\n',i);
end 


