x=0:pi/100:2*pi;
y1=cos(x*4);
y2= sin(x);
Y=[y1;y2];
plot (x,Y)
xlabel('x');ylabel('y');