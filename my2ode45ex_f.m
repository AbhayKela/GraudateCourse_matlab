function [dx]=my2ode45ex_f(t,x)
dx(1,1) =-0.7*x(1)+0.8*x(2);
dx(2,1)=-6.4*x(1)-0.1*x(2)+1;
end 