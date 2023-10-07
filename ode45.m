% my2ode45ex_m
% define the initial condition array
%  first value defines x1(0), second defines x2(0)
x0=[0;0];
% defines the solution time interval
t=0:0.01:20;
% use ode45 to obtain the numerical solution 
[t_out,x_out]= ode45(@my2ode45ex_f,t,x0);
% plot the numerical solution
x1=x_out(:,1);
x2=x_out(:,2);
figure (1), plot (t_out, x1,t_out,x2)
grid, xlabel ('time (sec)'), ylabel ('output,x1 and x2')
legend ('x1', 'x2')