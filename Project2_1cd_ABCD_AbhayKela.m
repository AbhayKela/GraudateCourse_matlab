% This program is for the Project 2  (Non-Linear Controls)
% Created by Abhay Kela 
% Submitted on 03/03/2016
% Given equations as below:
% x1dot=x1((x1*x1)+(x2*x2)-4)+x2'
% x2dot=x2((x1*x1)+(x2*x2)-4)-x1'
% x1 & x2 are the inital values for the trajectories
clc;clear;
tf=10;
x1=2.76177e-05;
x2=-7.24581e-06;
[A, B ,C ,D]=linmod('Project2_1c_nl_AbhayKela');
fprintf('Project2:Part 1c: Following are the required value of A, B, C & D matrices\n\n');
display(A);
display(B);
display(C);
display(D);
fprintf('\n\n');
fprintf('Project2:Part 1d: Following are the required Eigen values,Damping Ratio & Natural Frequency\n\n');
damp(A); 