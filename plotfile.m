% x=fscanf ('value of  x=?')
x=0:pi/100:2*pi;
y1=cos(x*4);y2= sin(x);
plot (x,y1,'-b')
hold on
plot(x,y2,'xg')
grid minor;
xlabel('0 to 2*pi');
ylabel('cos function & sin function of x');
% title('cosine and sin function of x');