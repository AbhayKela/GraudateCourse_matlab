% This program is for the Project 1  (Non-Linear Controls)
% Created by Abhay Kela 
% Submitted on 2/18/2016
%% PROJECT 1 PART 1 
% Given equation: "thetadotdot+ sin(theta)=0 "
% x and xdot are the inital values for the trajectories
% For equillibrium points at center (circular region) 
% condition 1
tf=80;
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
%------------------------------------------------------------------------------------------------------------------------------------
%% PROJECT 1 PART 2 
% Given equation: "xdotdot+xdot-2*x=0 "
% x0 and xdot0 are the inital values for the trajectories
%For staight lines meeting at origin
tf0=20;
% condition 1
x0=0.01;
xdot0=0.01;
sim('Project1part2_abhaykela');
x35=x0; x36=xdot0;
% condition 2
x0=-0.01;
xdot0=-0.01;
sim('Project1part2_abhaykela');
x37=x0; x38=xdot0;
figure;
plot(x35,x36,x37,x38);
title('Plot 2:Phase Portrait of Linear Saddle Point [xdotdot+xdot-2x=0] ');
xlabel('x0=x');
ylabel('xdot0=xdot');
axis([-10 10 -10 10]);
grid on;
% condition 3
x0=5;
xdot0=-10;
sim('Project1part2_abhaykela');
x39=x0; x40=xdot0;
% condition 4
x0=-5;
xdot0=10;
sim('Project1part2_abhaykela');
x41=x0; x42=xdot0;
hold on;
plot (x39,x40,x41,x42); 
%% For right and left side trajectories
% condition 3
x0=-10;
xdot0=10;
sim('Project1part2_abhaykela');
x43=x0; x44=xdot0;
% condition 4
x0=10;
xdot0=-10;
sim('Project1part2_abhaykela');
x45=x0; x46=xdot0;
hold on;
plot (x43,x44,x45,x46);
% condition 5
x0=-8.2;
xdot0=10;
sim('Project1part2_abhaykela');
x43=x0; x44=xdot0;
% condition 6
x0=8.2;
xdot0=-10;
sim('Project1part2_abhaykela');
x45=x0; x46=xdot0;
plot (x43,x44,x45,x46);
% condition 7
x0=7;
xdot0=-10;
sim('Project1part2_abhaykela');
x47=x0; x48=xdot0;
% condition 8
x0=-7;
xdot0=10;
sim('Project1part2_abhaykela');
x49=x0; x50=xdot0;
hold on;
plot (x47,x48,x49,x50);
% condition 9
x0=5.2;
xdot0=-10;
sim('Project1part2_abhaykela');
x51=x0; x52=xdot0;
% condition 10
x0=-5.2;
xdot0=10;
sim('Project1part2_abhaykela');
x53=x0; x54=xdot0;
hold on;
plot (x51,x52,x53,x54);
%% For trajectories on top and bottom
% condition 11
x0=-0.1;
xdot0=-10;
sim('Project1part2_abhaykela');
x55=x0; x56=xdot0;
% condition 12
x0=0.1;
xdot0=10;
sim('Project1part2_abhaykela');
x57=x0; x58=xdot0;
hold on;
plot (x55,x56,x57,x58);
% condition 13
x0=3;
xdot0=-10;
sim('Project1part2_abhaykela');
x59=x0; x60=xdot0;
% condition 14
x0=-3;
xdot0=10;
sim('Project1part2_abhaykela');
x61=x0; x62=xdot0;
hold on;
plot (x59,x60,x61,x62);
% condition 15
x0=4.2;
xdot0=-10;
sim('Project1part2_abhaykela');
x63=x0; x64=xdot0;
% condition 16
x0=-4.2;
xdot0=10;
sim('Project1part2_abhaykela');
x65=x0; x66=xdot0;
hold on;
plot (x63,x64,x65,x66);
%% xs & xdots- input to simulink model Project1part2_abhaykelac
time=5;
sim('Project1part2c_abhaykela'); % eqn and t are input for the exact solution;
eqn=exp(-2*time);
figure (3);
plot (time,xs,time,eqn);
grid on; 
title('Plot 3: Comparing x vs time for the exact solution and simulink output');
xlabel('time (sec)');
ylabel('xs(Simulink)  /   exp(-2*t)(Exact Solution)');
legend('Simulink output','Exact solution x(t)=exp(-2*t)');
% --------------------------------------------------------------------END------------------------------------------------------------