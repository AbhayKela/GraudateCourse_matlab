% This program is for the Projec 1  (Non-Linear Controls)
% Created by Abhay Kela 
% Submitted on 2/18/2016
%% PROJECT 1 PART 1 
% Given equation: "thetadotdot+ sin(theta)=0 "
tf=80;
% x and xdot are the inital values for the trajectories
% For equillibrium points at center (circular region) 
% condition 1
x=0;
xdot=0.5;
sim('Project1part1_abhaykela');
x1=x; x2=xdot;
% condition 2

x=0; 
xdot=1.0;
sim('Project1part1_abhaykela');
x3=x; x4=xdot;
% condition 3
x=0;
xdot=1.5;
sim('Project1part1_abhaykela');
x5=x; x6=xdot;
plot(x1,x2,x3,x4,x5,x6);
grid on; 
title('Plot 1: Phase Portrait of Pendulum [thetadotdot+sin(theta)=0] ');
xlabel('x=theta');
ylabel('xdot=thetadot');
axis([-10 10 -4 4]);
%  For equillibrium points at left(circular region)
% condition 4
x=-6;
xdot=0.5;
sim('Project1part1_abhaykela');
x7=x; x8=xdot;
% condition 5
x=-6;
xdot=1.0;
sim('Project1part1_abhaykela');
x9=x; x10=xdot;
% condition 6
x=-6;
xdot=1.5;
sim('Project1part1_abhaykela');
x11=x; x12=xdot;
hold on;
plot(x7,x8,x9,x10,x11,x12);

%  For equillibrium points at right(circular region) 
% condition 7
x=6;
xdot=0.5;
sim('Project1part1_abhaykela');
x13=x; x14=xdot;
% condition 8
x=6;
xdot=1.0;
sim('Project1part1_abhaykela');
x15=x; x16=xdot;
% condition 9
x=6;
xdot=1.5;
sim('Project1part1_abhaykela');
x17=x; x18=xdot;
hold on;
plot(x13,x14,x15,x16,x17,x18);

%% For waves like trajectories on top 
% Condition 10
x=-10;
xdot=0.8;
sim('Project1part1_abhaykela');
x19=x; x20=xdot;
% Condition 11
x=-10;
xdot=1.8;
sim('Project1part1_abhaykela');
x21=x; x22=xdot;
% Condition 12
x=-10;
xdot=2.8;
sim('Project1part1_abhaykela');
x23=x; x24=xdot;
hold on;
plot(x19,x20,x21,x22,x23,x24);

%% For waves like trajectories on bottom
% Condition 13
x=10;
xdot=-0.8;
sim('Project1part1_abhaykela');
x25=x; x26=xdot;
% Condition 14
x=10;
xdot=-1.8;
sim('Project1part1_abhaykela');
x27=x; x28=xdot;
% Condition 15
x=10;
xdot=-2.8;
sim('Project1part1_abhaykela');
x29=x; x30=xdot;
hold on;
plot(x25,x26,x27,x28,x29,x30);
%% For other 3 equillibrium points 
% Condition 16
x=-(9.4248);
xdot=0.001;
sim('Project1part1_abhaykela');
x31=x; x32=xdot;
% Condition 17
x=(9.4248);
xdot=-0.001;
sim('Project1part1_abhaykela');
x33=x; x34=xdot;
hold on;
plot(x31,x32,x33,x34);
% Condition 18
x=-9.4248;
xdot=0;
sim('Project1part1_abhaykela');
x67=x; x68=xdot;
% Condition 19
x=9.4248;
xdot=0;
sim('Project1part1_abhaykela');
x69=x; x70=xdot;
hold on;
plot(x67,x68,x69,x70);
