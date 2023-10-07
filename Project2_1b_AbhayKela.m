% This program is for the Project 2  (Non-Linear Controls)
% Created by Abhay Kela 
% Submitted on 03/03/2016
% Given equations as below:
% x1dot=x1((x1*x1)+(x2*x2)-4)+x2'
% x2dot=x2((x1*x1)+(x2*x2)-4)-x1'
% x1 & x2 are the inital values for the trajectories
function J=Project2_1b_AbhayKela(z)
x1=z(1);
x2=z(2);
x1dot=x1*((x1*x1)+(x2*x2)-4)+x2;
x2dot=x2*((x1*x1)+(x2*x2)-4)-x1;
J=(x1dot*x1dot)+(1000*(x2dot*x2dot));
end