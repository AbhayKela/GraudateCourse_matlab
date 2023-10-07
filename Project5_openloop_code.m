% This script is for optimal PID control 
clear;clc;close;
sim('Project5_openloop');
figure(1);plot(t,X); grid minor;xlabel('time (sec)');ylabel('output, x');title('open loop response for a unit step input for 10 sec');