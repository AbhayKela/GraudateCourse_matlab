function J=Project5_function(x)
global Kp Kd Ki

%Control gains from optimization parameter vector "x"
Kp=x(1);
Ki=x(2);
Kd=x(3);

[tsim,xsim,ysim]=sim('Project5_model');
% x=length(ysim);
u=ysim(:,3);
error=(ysim(:,2)-ysim(:,1));
Q=5555;
R=0.6;
J=trapz(Q*error.*error+R*u.*u)*0.01
