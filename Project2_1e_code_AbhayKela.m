% This program is for the Project 2  (Non-Linear Controls)
% Created by Abhay Kela 
% Submitted on 03/03/2016
% Given equations as below:
% x1dot=x1((x1*x1)+(x2*x2)-4)+x2'
% x2dot=x2((x1*x1)+(x2*x2)-4)-x1'
% x1 & x2 are the inital values for the trajectories
clc;clear;close;
tf=10;
x1=2.76177e-05;
x2=-7.24581e-06;
[A, B ,C ,D]=linmod('Project2_1c_nl_AbhayKela');
sys= ss(A,B,C,D);
display(A);
display(B);
display(C);
display(D);
damp(A);
[Wn,zeta,eig] = damp(sys);
clc;
x1e=2.76177e-05;
x2e=-7.24581e-06;
%--------------------------------------------------------------------------
% condition: 1 for x1(0)=x2(0)=0.4 & 5 second time history
x1=0.4;
x2=0.4;
sim('Project2_1c_nl_AbhayKela');
x10ss=x1-x1e;
x20ss=x2-x2e;
xss=[x10ss;x20ss];
sim('Project2_1c_l_AbhayKela');
figure (1);plot(t,x11,t,x1lin+x1e);
legend('Nonlinear','linear');
xlabel('t (sec)');
ylabel('x1 (non-linear) / x1lin+x1e(linear)');
title('Project 2: Part 1e for initial condition x10=0.4 & x20=0.4');
grid on;
figure (2);plot(t,x22,t,x2lin+x2e);
legend('Nonlinear','linear');
xlabel('t (sec)');
ylabel('x2 (non-linear) / x2lin+x2e(linear)');
title('Project 2: Part 1e for initial condition x10=0.4 & x20=0.4');
grid on;
%-------------------------------------------------------------------------
% condition: 2 for x1(0)=x2(0)=1 & 5 second time history
x1=1;
x2=1;
sim('Project2_1c_nl_AbhayKela');
x10ss=x1-x1e;
x20ss=x2-x2e;
xss=[x10ss;x20ss];
sim('Project2_1c_l_AbhayKela');
figure (3);plot(t,x11,t,x1lin+x1e);
legend('Nonlinear','linear');
xlabel('t (sec)');
ylabel('x1 (non-linear) / x1lin+x1e(linear)');
title('Project 2: Part 1e for initial condition x10=x20=1');
grid on;
figure (4);plot(t,x22,t,x2lin+x2e);
legend('Nonlinear','linear');
xlabel('t (sec)');
ylabel('x2 (non-linear) / x2lin+x2e(linear)');
title('Project 2: Part 1e for initial condition x10=x20=1');
grid on;
%-------------------------------------------------------------------------
% condition: 3 for x1(0)=x2(0)=1.4 & 5 second time history
x1=1.4;
x2=1.4;
sim('Project2_1c_nl_AbhayKela');
x10ss=x1-x1e;
x20ss=x2-x2e;
xss=[x10ss;x20ss];
sim('Project2_1c_l_AbhayKela');
figure (5);plot(t,x11,t,x1lin+x1e);
legend('Nonlinear','linear');
xlabel('t (sec)');
ylabel('x1 (non-linear) / x1lin+x1e(linear)');
title('Project 2: Part 1e for initial condition x10=x20=1.4');
grid on;
figure (6);plot(t,x22,t,x2lin+x2e);
legend('Nonlinear','linear');
xlabel('t (sec)');
ylabel('x2 (non-linear) / x2lin+x2e(linear)');
title('Project 2: Part 1e for initial condition x10=x20=1.4');
grid on;
%-------------------------------------------------------------------------
% condition: 4 for x1(0)=x2(0)=sqrt(2) & 5 second time history
x1=sqrt(2);
x2=sqrt(2);
sim('Project2_1c_nl_AbhayKela');
x10ss=x1-x1e;
x20ss=x2-x2e;
xss=[x10ss;x20ss];
sim('Project2_1c_l_AbhayKela');
figure (7);plot(t,x11,t,x1lin+x1e);
legend('Nonlinear','linear');
xlabel('t (sec)');
ylabel('x1 (non-linear) / x1lin+x1e(linear)');
title('Project 2: Part 1e for initial condition x10=x20=sqrt(2)');
grid on;
figure (8);plot(t,x22,t,x2lin+x2e);
legend('Nonlinear','linear');
xlabel('t (sec)');
ylabel('x2 (non-linear) / x2lin+x2e(linear)');
title('Project 2: Part 1e for initial condition x10=x20=sqrt(2)');
grid on;