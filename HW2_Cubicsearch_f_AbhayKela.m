% This script is for the Homework 2 of Optimal Design
% To compare following parameters for the given methods
% 1. Solution Time
% 2. Solution Accuracy
% 3. Sensitivity to convergence Parameter
%% CUBIC SEARCH
function []= HW2_Cubicsearch_f_AbhayKela()
fprintf('Solution by Cubic search in terms of f for different convergence parameters\n\n');
syms x;
f(x)=0.00028292*(x^4)+0.0027409*(x^3)-0.069844*(x^2)-1.1007*(x)+7.7362;
df= vpa(diff(f));
xopt=vpasolve(df);
xopt=xopt(real(xopt)>=-20&real(xopt)<=20&imag(xopt)==0);
fxopt=vpa(f(xopt));
%% For the value of convegence e= 0.1
tic
x1=-20;
x2=20;
f1=vpa(f(x1));
f2=vpa(f(x2));
df1=vpa(df(x1));
df2=vpa(df(x2));
dfopt=vpa(df(xopt));
a0=vpa(f1);
a1=vpa((f2-f1)/(x2-x1));
a2=vpa((df1-a1)/(x1-x2));
a3=vpa((df2-a1-(a2*(x2-x1)))/((x2-x1)^2)); % Check the formula
fds=a0+(a1*(x-x1))+(a2*(x-x1)*(x-x2))+(a3*((x-x1)^2)*(x-x2));
dfds=a1+(a2*(x-x1))+(a2*(x-x2))+(a3*((x-x1)^2))+(2*a3*(x-x1)*(x-x2));
xm=vpasolve(dfds);
xm=xm(real(xm)>=x1&real(xm)<=x2&imag(xm)==0);
fxm=vpa(f(xm));
fxa=abs((fxm-fxopt)/fxopt);
e=0.1;
i=1;
while fxa>=e;
    if df(xm)>0
        x1=x1;
        x2=xm;
        f1=vpa(f(x1));
        f2=vpa(f(x2));
        df1=vpa(df(x1));
        df2=vpa(df(x2));
        a0=vpa(f1);
        a1=vpa((f2-f1)/(x2-x1));
        a2=vpa((df1-a1)/(x1-x2));
        a3=vpa((df2-a1-(a2*(x2-x1)))/((x2-x1)^2)); 
        fds=a0+(a1*(x-x1))+(a2*(x-x1)*(x-x2))+(a3*((x-x1)^2)*(x-x2));
        dfds=a1+(a2*(x-x1))+(a2*(x-x2))+(a3*((x-x1)^2))+(2*a3*(x-x1)*(x-x2));
        xm=vpasolve(dfds);
        xm=xm(real(xm)>=x1&real(xm)<=x2&imag(xm)==0);
        xm=double(xm);
        fxm=vpa(f(xm));
        fxm=double(fxm);
    elseif df(xm)<0
        x2=x2;
        x1=xm;
        f1=vpa(f(x1));
        f2=vpa(f(x2));
        df1=vpa(df(x1));
        df2=vpa(df(x2));
        a0=f1;
        a1=vpa((f2-f1)/(x2-x1));
        a2=vpa((df1-a1)/(x1-x2));
        a3=vpa((df2-a1-(a2*(x2-x1)))/((x2-x1)^2)); % Check the formula
        fds=a0+(a1*(x-x1))+(a2*(x-x1)*(x-x2))+(a3*((x-x1)^2)*(x-x2));
        dfds=a1+(a2*(x-x1))+(a2*(x-x2))+(a3*((x-x1)^2))+(2*a3*(x-x1)*(x-x2));
        xm=vpasolve(dfds);
        xm=xm(real(xm)>=x1&real(xm)<=x2&imag(xm)==0);
        xm=double(xm);
        fxm=vpa(f(xm));
        fxm=double(fxm);
    end
    fxa=abs((fxm-fxopt)/fxopt);
    i=i+1;
end
% For the percent accuracy 
fc=(1-(abs((fxm-fxopt)/fxopt)))*100;
fprintf('For the value of convergence e --> %f\n',e);
toc
fprintf('Solution Accuracy in percent for(f_tilda) --> %f\n',double(fc));
fprintf('The minimum value of F --> %f\n',double(fxm));
fprintf('The optimum value X --> %f\n',double(xm));
fprintf('Total number of iteration i --> %f\n',i);
fprintf('------------------------------------------------------------\n\n\n');
%% For the value of convegence e= 0.01
tic
x1=-20;
x2=20;
f1=vpa(f(x1));
f2=vpa(f(x2));
df1=vpa(df(x1));
df2=vpa(df(x2));
dfopt=vpa(df(xopt));
a0=vpa(f1);
a1=vpa((f2-f1)/(x2-x1));
a2=vpa((df1-a1)/(x1-x2));
a3=vpa((df2-a1-(a2*(x2-x1)))/((x2-x1)^2)); % Check the formula
fds=a0+(a1*(x-x1))+(a2*(x-x1)*(x-x2))+(a3*((x-x1)^2)*(x-x2));
dfds=a1+(a2*(x-x1))+(a2*(x-x2))+(a3*((x-x1)^2))+(2*a3*(x-x1)*(x-x2));
xm=vpasolve(dfds);
xm=xm(real(xm)>=x1&real(xm)<=x2&imag(xm)==0);
fxm=vpa(f(xm));
fxa=abs((fxm-fxopt)/fxopt);
e=0.01;
i=1;
while fxa>=e;
    if df(xm)>0
        x1=x1;
        x2=xm;
        f1=vpa(f(x1));
        f2=vpa(f(x2));
        df1=vpa(df(x1));
        df2=vpa(df(x2));
        a0=vpa(f1);
        a1=vpa((f2-f1)/(x2-x1));
        a2=vpa((df1-a1)/(x1-x2));
        a3=vpa((df2-a1-(a2*(x2-x1)))/((x2-x1)^2)); % Check the formula
        fds=a0+(a1*(x-x1))+(a2*(x-x1)*(x-x2))+(a3*((x-x1)^2)*(x-x2));
        dfds=a1+(a2*(x-x1))+(a2*(x-x2))+(a3*((x-x1)^2))+(2*a3*(x-x1)*(x-x2));
        xm=vpasolve(dfds);
        xm=xm(real(xm)>=x1&real(xm)<=x2&imag(xm)==0);
        xm=double(xm);
        fxm=vpa(f(xm));
        fxm=double(fxm);
    elseif df(xm)<0
        x2=x2;
        x1=xm;
        f1=vpa(f(x1));
        f2=vpa(f(x2));
        df1=vpa(df(x1));
        df2=vpa(df(x2));
        a0=f1;
        a1=vpa((f2-f1)/(x2-x1));
        a2=vpa((df1-a1)/(x1-x2));
        a3=vpa((df2-a1-(a2*(x2-x1)))/((x2-x1)^2)); % Check the formula
        fds=a0+(a1*(x-x1))+(a2*(x-x1)*(x-x2))+(a3*((x-x1)^2)*(x-x2));
        dfds=a1+(a2*(x-x1))+(a2*(x-x2))+(a3*((x-x1)^2))+(2*a3*(x-x1)*(x-x2));
        xm=vpasolve(dfds);
        xm=xm(real(xm)>=x1&real(xm)<=x2&imag(xm)==0);
        xm=double(xm);
        fxm=vpa(f(xm));
        fxm=double(fxm);
    end
    fxa=abs((fxm-fxopt)/fxopt);
    i=i+1;
end
% For the percent accuracy 
fc=(1-(abs((fxm-fxopt)/fxopt)))*100;
fprintf('For the value of convergence e --> %f\n',e);
toc
fprintf('Solution Accuracy in percent for(f_tilda) --> %f\n',double(fc));
fprintf('The minimum value of F --> %f\n',double(fxm));
fprintf('The optimum value X --> %f\n',double(xm));
fprintf('Total number of iteration i --> %f\n',i);
fprintf('------------------------------------------------------------\n\n\n');
%% For the value of convegence e= 0.001
tic
x1=-20;
x2=20;
f1=vpa(f(x1));
f2=vpa(f(x2));
df1=vpa(df(x1));
df2=vpa(df(x2));
dfopt=vpa(df(xopt));
a0=vpa(f1);
a1=vpa((f2-f1)/(x2-x1));
a2=vpa((df1-a1)/(x1-x2));
a3=vpa((df2-a1-(a2*(x2-x1)))/((x2-x1)^2)); % Check the formula
fds=a0+(a1*(x-x1))+(a2*(x-x1)*(x-x2))+(a3*((x-x1)^2)*(x-x2));
dfds=a1+(a2*(x-x1))+(a2*(x-x2))+(a3*((x-x1)^2))+(2*a3*(x-x1)*(x-x2));
xm=vpasolve(dfds);
xm=xm(real(xm)>=x1&real(xm)<=x2&imag(xm)==0);
fxm=vpa(f(xm));
fxa=abs((fxm-fxopt)/fxopt);
e=0.001;
i=1;
while fxa>e;
    if df(xm)>0
        x1=x1;
        x2=xm;
        f1=vpa(f(x1));
        f2=vpa(f(x2));
        df1=vpa(df(x1));
        df2=vpa(df(x2));
        a0=vpa(f1);
        a1=vpa((f2-f1)/(x2-x1));
        a2=vpa((df1-a1)/(x1-x2));
        a3=vpa((df2-a1-(a2*(x2-x1)))/((x2-x1)^2)); % Check the formula
        fds=a0+(a1*(x-x1))+(a2*(x-x1)*(x-x2))+(a3*((x-x1)^2)*(x-x2));
        dfds=a1+(a2*(x-x1))+(a2*(x-x2))+(a3*((x-x1)^2))+(2*a3*(x-x1)*(x-x2));
        xm=vpasolve(dfds);
        xm=xm(real(xm)>=x1&real(xm)<=x2&imag(xm)==0);
        xm=double(xm);
        fxm=vpa(f(xm));
        fxm=double(fxm);
    elseif df(xm)<0
        x2=x2;
        x1=xm;
        f1=vpa(f(x1));
        f2=vpa(f(x2));
        df1=vpa(df(x1));
        df2=vpa(df(x2));
        a0=f1;
        a1=vpa((f2-f1)/(x2-x1));
        a2=vpa((df1-a1)/(x1-x2));
        a3=vpa((df2-a1-(a2*(x2-x1)))/((x2-x1)^2)); % Check the formula
        fds=a0+(a1*(x-x1))+(a2*(x-x1)*(x-x2))+(a3*((x-x1)^2)*(x-x2));
        dfds=a1+(a2*(x-x1))+(a2*(x-x2))+(a3*((x-x1)^2))+(2*a3*(x-x1)*(x-x2));
        xm=vpasolve(dfds);
        xm=xm(real(xm)>=x1&real(xm)<=x2&imag(xm)==0);
        xm=double(xm);
        fxm=vpa(f(xm));
        fxm=double(fxm);
    end
    fxa=abs((fxm-fxopt)/fxopt);
    i=i+1;
end
% For the percent accuracy 
fc=(1-(abs((fxm-fxopt)/fxopt)))*100;
fprintf('For the value of convergence e --> %f\n',e);
toc
fprintf('Solution Accuracy in percent for(f_tilda) --> %f\n',double(fc));
fprintf('The minimum value of F --> %f\n',double(fxm));
fprintf('The optimum value X --> %f\n',double(xm));
fprintf('Total number of iteration i --> %f\n',i);
fprintf('------------------------------------------------------------\n\n\n');
end

