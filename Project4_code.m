% This script is for the Project # 4: Nonlinear Controls
% Abhay Kela 
clc;clear;close;
% Constant parameter switch:const_p_sw=input ('[1]:constant, [0]:vary)
const_p_sw=0;
if (isempty(const_p_sw))
    const_p_sw=1;
end 
% signum_sw=input ('[1]:signum,[0]:saturation)
signum_sw=1;
if (isempty(signum_sw))
    signum_sw=1; 
end
% Input gain average values 
alpha1_c=1.5;alpha2_c=2;b_c=5.5;
%Initial conditions 
x0=0;xdot0=pi/2;
% Sliding mode control gain values 
lambda=20;phi=0.1;ita=0.1;
b_upp=7;b_low=4;
b_hat=sqrt(b_upp*b_low);b_hat_inv=inv(b_hat) ;
beta=sqrt(b_upp/b_low);
tf=10;dt=0.001;
sim('Project4');
sdot=(xdotdot-xdotdot_d)+lambda*(xdot-xdot_d);
%% Plotting 
figure(1);plot(t,x,t,x_d);grid minor;title('closed loop response');
xlabel('t(sec)');ylabel('x & x\_d');legend('x','x_d');

figure(2);plot(t,xdot,t,xdot_d);grid minor;title('closed loop response');
xlabel('t(sec)');ylabel('xdot & xdot\_d');legend('xdot','xdot_d');

figure(3);plot(t,x_tilda);grid minor;title('closed loop error response');
xlabel('t(sec)');ylabel('x\_tilda=x-x\_d');

figure(4);plot(t,xdot_tilda);grid minor;title('closed loop error response');
xlabel('t(sec)');ylabel('xdot\_tilda=xdot-xdot\_d');

figure(5);plot(t,s.*sdot,t,-ita.*abs(s));grid minor;title('sliding condition');
xlabel('t(sec)');ylabel('s.*sdot & -ita*abs(s)');legend('s.*sdot','-ita*abs(s)');

figure(6);plot(t,K);grid minor;title('switching gain');
xlabel('time(sec)');ylabel('switching gain, K');

figure(7);plot(t,u);grid minor;title('controller effort');
xlabel('t(sec)');ylabel('controller effort,u');

figure(8);plot(t,alpha1,t,alpha2,t,b);grid minor;title('varitation of system parameter');
xlabel('time(sec)');ylabel('alpha1 & alpha2 & b');legend('alpha1','alpha2','b');


