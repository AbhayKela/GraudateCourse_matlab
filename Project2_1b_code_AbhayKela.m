% This program is for the Project 2:Part 1b  (Non-Linear Controls)
% Created by Abhay Kela 
% Submitted on 03/03/2016
% Given equations as below:
% x1dot=x1((x1*x1)+(x2*x2)-4)+x2'
% x2dot=x2((x1*x1)+(x2*x2)-4)-x1'
% x1 & x2 are the inital values for the trajectories
clc,clear;
x1=10;
x2=10;
z0=[x1,x2];
z=fminsearch('Project2_1b_AbhayKela',z0);
xe=z(1);
ye=z(2);
fprintf('Project2:Part 1b: Using fminsearch, following are the equillibrium points\n\n');
fprintf('xe= %g\n',xe);
fprintf('ye= %g\n',ye);