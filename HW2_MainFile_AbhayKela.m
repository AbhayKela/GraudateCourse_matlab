% This is tha main file for executing home work # 2 of Optimal Design
function []=HW2_MainFile_AbhayKela ()
clc;
clear;
close;
format;
fprintf('Home Work # 2::Intro to Optimal Design::Submitted by Abhay Kela on 22 Feb 2016\n\n');
% Given range of function -20<=x<=20; 
x1=-20; 
x2=20;
syms x;
f(x)=(0.00028292*(x^4))+(0.0027409*(x^3))-(0.069844*(x^2))-(1.1007*x)+7.7362;
df=vpa(diff(f)); % Derivative of the given function
xopt=vpasolve(df);
xopt=xopt(real(xopt)>=-20&real(xopt)<=20&imag(xopt)==0);
foptimal=f(xopt);
% Print optimum value of function and x, obtained from analytical method
xoptimal=double(xopt);
foptimal=double(foptimal);
fprintf('The true optimum value of X obtained from the analytical method---> %f\n',xoptimal);
fprintf('The true optimum value of function from the analytical method-----> %f\n',foptimal);
fprintf('=================================================================================================\n');
%
%%
%To find the optimum value of x and function using x_tilda & Bisection Method
HW2_Bisection_x_AbhayKela

fprintf('=================================================================================================\n');


%%
%To find the optimum value of x and function using f_tilda & Bisection Method
HW2_Bisection_f_AbhayKela

fprintf('=================================================================================================\n');



%% 
%To find the optimum value of x and function using x_tilda & Powell's Method
HW2_PowellMethod_x_AbhayKela

fprintf('=================================================================================================\n');


%%
%To find the optimum value of x and function using f_tilda & Bisection Method
HW2_PowellMethod_f_AbhayKela

fprintf('=================================================================================================\n');

%%
%To find the optimum value of x and function using x_tilda & Cubic Search Method
HW2_Cubicsearch_x_AbhayKela

fprintf('=================================================================================================\n');

%%
%To find the optimum value of x and function using f_tilda & Cubic Search Method
HW2_Cubicsearch_f_AbhayKela


fprintf('=================================================================================================\n');

%%
%To find the optimum value of x and function using f_tilda & Golden Section Method
HW2_Goldensection_AbhayKela


fprintf('=================================================================================================\n');

end 

