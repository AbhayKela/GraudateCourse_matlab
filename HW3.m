% Program for home work 3  
% Created by Abhay Kela 
% Created on July 16, 2015
% Problem statement  1
x1=[0:1:10] % be any variable 
y1=exp (x1) % y is an exponential function of x
plot (x1,y1)
hold on   % hold on to call all the functions in one graph
y2= sin (x1) % y is sine function of x
plot (x1,y2)
hold on % hold on to call all the functions in one graph
a=5; % given values 
b=2; % given values
c=4; % given values
y3=(a*x1.^2)+(b*x1)+(c) % y as a given function on variable x 
                        % and constants a,b & C
plot (x1,y3)
hold on % hold on to call all the functions in one graph
y4= sqrt(x1)
plot (x1,y4)
grid on


% Problem statement 2
x2=[0:1:10]; % be any variable 
y5=exp (x2); % y is an exponential function of x
subplot (4,1,1); % plotting in first row, 1 column 
plot (x2,y5)
xlabel ('Func of x');
ylabel ('Exp func of x');
title ('Func of X Vs y')
grid on
hold on   % hold on to call all the functions in one graph
y6= sin (x2); % y is sine function of x
subplot (4,1,2) % plotting in second row first column
plot (x2,y6)
xlabel ('Func of x');
ylabel ('Sine func of x');
grid on
hold on % hold on to call all the functions in one graph
a=5; % given values 
b=2; % given values
c=4; % given values
y7=(a*x2.^2)+(b*x2)+(c) % y as a given function on variable x 
% and constants a,b & C
subplot (4,1,3) % plotting in 3rd row first column 
plot (x2,y7)
xlabel ('Func of x');
ylabel ('given func of x');
grid on
hold on % hold on to call all the functions in one graph
y8= sqrt(x2);
subplot (4,1,4) % plotting in 4th row first column
plot (x2,y8)
xlabel ('Func of x');
ylabel ('Sqart func of x');
grid on

% Problem statement 3
x3=[-pi:0.1:pi]; % be any variable 
y9=sin (x3); % y is an sin function of x
subplot (3,1,1); % plotting in first row, 1 column 
plot (x3,y9,'--r')
xlabel ('Func of x');
ylabel ('Sine func of x');
title ('Func of X Vs y');
grid on
hold on
y10=sin (2.*x3); % y is an sin function of x
subplot (3,1,2); % plotting in first row, 1 column 
plot (x3,y10,'-b')
xlabel ('Func of x');
ylabel ('Sine func of x');
title ('Func of X Vs y');
grid on
hold on
y11=sin (3.*x3); % y is an sin function of x
subplot (3,1,3); % plotting in first row, 1 column 
plot (x3,y11,':g')
xlabel ('Func of x');
ylabel ('Sine func of x');
title ('Func of X Vs y');
grid on

% Problem statement 4
% t is the time in years 
% 0 represents 1965 and 45 represents 2010 with increment if 1.5 years
t=[0:1.5:45]  
% d be the density of transistor 
d= 30* 2.^(t/1.5)
% n be the number of transistor per square inch for 45 years
n=2.*d
plot (t,n,'-g');
legend ('boxon');
hold on
semilogx (t,'--r');
hold on
semilogy (n,':b');
legend ('t Vs n','Semilog of t', 'Semilog n')
xlabel ('Time in years');
ylabel('Numbers of semiconductors')
grid on 

% Problem statement 5
% m is the time in months starting from january to december
m= {'Jan','Feb','Mar','April','May','June','July','Aug','Sept','Oct','Nov','Dec'};
Y1=[2342 4363 3212 4565 8776 7679 6532 2376 2238 4509 5643 1137];
Y2=[2343 5766 4535 4718 3422 2200 3454 7865 6543 4508 2312 4566];
figure 
subplot (2,1,1)
bar (Y1)
ylabel ('Inventory of screws for 2004')
title ('Months Vs Number of screws')
set(gca, 'XTickLabel', m)
subplot (2,1,2)
bar (Y2)
ylabel ('Inventory of screws for 2005')
title ('Months Vs Number of screws')
set(gca, 'XTickLabel', m)

% Problem statement 6
% the bl=elow program shall draw a relation between the physical properties
% of metals
% p is the percent of cold work needed
p=[10 15 20 25 30 40 50 60 68];
% ye is the yield strength of metal in Mpa
ye=[275 310 340 360 375 390 400 407 410];
% de is the ductility of metals in percent
de=[43 30 23 17 12 7 4 3 2];
plotyy (p,ye,p,de)

% Problem statement 7
% Let x be any given function
x=-5:0.5:5;
% Let y be any given function
y=-5:0.5:5;
% let z be the function of x & y
z=(sqrt((X.^2)+(Y.^2)));
Z=sin (z)
[X,Y]= meshgrid (x,y)
mesh (X,Y,Z)
% Using the contour plot function
contour (Z)