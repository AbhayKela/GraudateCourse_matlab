clear;clc;
sim ('simulink_3')
plot (time,y),grid on 
ylabel ('Output, y')
xlabel ('time (sec)')
hold on; 
plot (time,y),grid on
ylabel ('solution output, y')
xlabel ('time (sec)')
legend ('Simulink solution','Exact solution')