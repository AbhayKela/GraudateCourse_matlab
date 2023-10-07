sim ('simulink2')
figure (1), plot (time,y,time,exp(-0.2*time))
grid on 
ylabel ('solution output, y')
xlabel ('time (sec)')
legend ('Simulink solution','Exact solution')