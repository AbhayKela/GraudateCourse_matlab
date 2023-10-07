% This program is for the Project 2:Part 1a (State Plane Portrait Plot)  (Non-Linear Controls)
% Created by Abhay Kela 
% Submitted on 03/03/2016
% Given equations as below:
% x1dot=x1((x1*x1)+(x2*x2)-4)+x2'
% x2dot=x2((x1*x1)+(x2*x2)-4)-x1'
% x1 & x2 are the inital values for the trajectories
% Due to the dynamics of non linear system, using different end time for
% different initial conditions
%% PROJECT 2 PART 1a 
clc;clear;close;
tf=10;
% For Inner circle trajectory
%condition 1
x1=0;
x2=-2;
sim('Project2_1a_AbhayKela');
plot (x1,x2);
xlabel('x1');
ylabel('x2');
title('State Plane Plot:x1dot=x1*((x1*x1)+(x2*x2)-4)+x2, x2dot=x2*((x1*x1)+(x2*x2)-4)-x1');
axis([-5 5 -5 5]);
grid minor;
%condition 2
x1=0;
x2=2;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 3
x1=2;
x2=0;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 4
x1=-2;
x2=0;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 5
x1=-1.998;
x2=0;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 6
x1=1.998;
x2=0;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 7
x1=0;
x2=-1.998;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 8
tf=10;
x1=0;
x2=1.998;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 9
x1=0.0025;
x2=1.6;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 10
x1=-0.0025;
x2=-1.6;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
% condition 11
x1=1.6;
x2=-0.5;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 12 
x1=-1.6;
x2=0.3;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
% %condition 
tf=10;
x1=-0.5;
x2=-1.5;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
% %condition 
tf=10;
x1=0;
x2=1;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
% %condition 
tf=10;
x1=0;
x2=-1;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%% For outer circle trajectories
%condition 
x1=1.5;
x2=-1.5;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 
x1=1.5;
x2=1.5;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 
x1=-1.5;
x2=1.5;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 
tf=0.28;
x1=-1.5;
x2=-1.5;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%------------------------------------------
%condition 
tf=10;
x1=1.805;
x2=-1.1;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 
x1=-1.805;
x2=1.1;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 
x1=1.805;
x2=1.1;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
% %condition 
tf=0.27;
x1=-1.805;
x2=-1.1;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%------------------------------------------
%condition 
tf=10;
x1=-2.1;
x2=0;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 
x1=2.1;
x2=0;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 
x1=0;
x2=2.1;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
% %condition 
tf=0.3;
x1=0;
x2=-2.1;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%--------------------------------------------------------------------
%condition 
tf=10;
x1=-2;
x2=0.6;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 
x1=2;
x2=-0.6;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 
x1=2;
x2=0.6;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
% %condition 
tf=0.35;
x1=-2;
x2=-0.6;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%-------------------------------------------------------------------
%condition
tf=10;
x1=1.2;
x2=1.2;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 
x1=1.2;
x2=-1.2;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 
x1=-1.2;
x2=1.2;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
% %condition 
tf=10;
x1=-1.5;
x2=-0.995;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%---------------------------------------------------------------
%condition 
tf=5;
x1=0.2;
x2=2.0;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 
x1=-0.5;
x2=2.0;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 
tf=0.35;
x1=0.5;
x2=-2.0;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
% %condition 
tf=0.35;
x1=-0.5;
x2=-2.0;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%----------------------------------------------------------------------
%condition 
tf=10;
x1=-1;
x2=1.80;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 
x1=1;
x2=-1.80;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%condition 
x1=1;
x2=1.80;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
% %condition 
tf=0.35;
x1=-1;
x2=-1.80;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
%-------------------------------------------------------------------------

% %condition 
tf=10;
x1=0.5;
x2=1.5;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);

% %condition 
tf=10;
x1=-1;
x2=1.5;
sim('Project2_1a_AbhayKela');
hold on;
plot (x1,x2);
