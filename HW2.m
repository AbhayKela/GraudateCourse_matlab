% Program to complete the home work #2
% Created by Abhay Kela 
% Created on July 08, 2015

% The length of the conductor is given in feets, converting it in meters
L=3*0.3048
% The seperation distance given in mm, converting it in meters
d=40*0.001
% The radius of the conductor is given in cm, converting it in meters
r=100*0.001
% The permissivity of the conductor is given by p, 
p=8.854*10^(-2)

% The capacitance of the conductor is given by 
C=(pi*p*L)/log((d-r)/r)



% To verify for approximately 10 values of x, sinhx=(e^x-e^-x)/2
% Mention the values of x in 1X10 matrix
x=[1:1:10];
Z=sinh(x)
y=(exp(x)-exp(-x))/2
eq(Z,y)

% To find the displacement of oscillating spring
% Let x be the displacement at time t
% Let t be the time of oscillation in sec
t=[1:1:10];
% Let w be the angular frequency in rad/sec
w=0.6;
% Let A be the maximum displacement in cm
A= 4;

x=A*cos(w.*t)


% Program to find the mean, median and standard deviation of given array
% Let G be the given array
G=[58,69,38,95,84,77,96,99,73,85,92,94,89,44,98,76,80,85];

Me= mean(G)
Med= median(G)
SD=std(G)


% Program to matlab expressions
% Let A be the matrix 
A= [1,4,2
    2,4,100
    7,9,7
    3,pi,42];
B=log(A)

% Create matrix C with just the second row of matrix B
C= B(2,:)

% Evaluate the sum of second row of elements B
S=sum(B,2)

% Creating the matrix by multiplying the second column of B and first
% column of A

D= B(:,2).*A(:,1)




% Program the given matrix function 
% Let a, b & c are the given matrices 
a=[15 3 22; 3 8 5; 14 3 82];
b=[1;5;6];
c=[12 18 5 2];
c(:,4)=[]


% Program to create matrix d from the third column of matrix a
d=a(:,3)


% Program to find the magic matrix of 6X6
T=magic (6)
Lk= sum(T)
Jk=sum (diag(T))

% Program to extract the 3X3 matrix from T and to find if its a magic matrix
Mn=T(1:3,1:3)
G=sum(Mn)

y=4+Mn
r=sum(y)


