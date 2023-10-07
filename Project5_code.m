% This script is for optimal PID control 
clear;clc;close;
global Kp Kd Ki;
Kp=1;
Ki=1;
Kd=0.1;
x0=[Kp;Ki;Kd];
x=fminsearch('Project5_function',x0);
display(x);
sim('Project5_model');
figure(1);plot(time,y); grid minor;xlabel('time (sec)');ylabel('output, y');title('closed loop output for 2 sec');
figure(2);plot(time,u); grid minor;xlabel('time (sec)');ylabel('controller effort, u');title('controller effort responses, u for 2 sec');
display (stepinfo(y,time));