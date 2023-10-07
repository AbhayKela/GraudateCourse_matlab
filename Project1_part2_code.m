% This program is for the Projec 1  (Non-Linear Controls)
% Created by Abhay Kela 
% Submitted on 2/18/2016
%% PROJECT 1 PART 2 
% Given equation: "xdotdot+ xdot- 2*x=0 "
tf0=20;
% x0 and xdot0 are the inital values for the trajectories
%For staight lines meeting at origin &  For equillibrium points at center (circular region) 
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
%%
% xs & xdots- input to simulink model Project1part2_abhaykelac
time=5;
sim('Project1part2c_abhaykela');

% eqn and t are input for the exact solution;
eqn=exp(-2*time);
figure (3);
plot (time,xs,time,eqn);
grid on; 
title('Plot 3: Comparing x vs time for the exact solution and simulink output');
xlabel('time (sec)');
ylabel('x=xs');
legend('Simulink output','Exact solution x(t)=exp(-2*t)');