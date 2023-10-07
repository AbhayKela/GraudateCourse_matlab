function KelaAbhay_Project2
clc;clear;
disp ('Executing file "KelaAbhay_Project2"');
reader ='project2.inp';
input  = fopen(reader,'r');
fscanf (input,'%s',[1,1]);
numnod = fscanf(input,'%g',[1 1]);
numel  = fscanf(input,'%g',[1 1]);
set_d  = fscanf(input,'%g',[5 numnod]);
set_e  = fscanf(input,'%g',[4 numel]);
A=set_e';
B=set_d';
E = 210e9;               % N per square meter
nue = 0.3;
theta = 0.0175;          % Angle of twist (rad/m)
fun=E*theta/(1+nue);
%% Stiffness matrix
K=zeros(numnod,numnod);  % global stiffness matrix
bf=zeros(numnod,1);      % body forces
for n=1:numel;
    b1=B(A(n,3),3)-B(A(n,4),3);
    b2=B(A(n,4),3)-B(A(n,2),3);
    b3=B(A(n,2),3)-B(A(n,3),3);
    c1=B(A(n,4),2)-B(A(n,3),2);
    c2=B(A(n,2),2)-B(A(n,4),2);
    c3=B(A(n,3),2)-B(A(n,2),2);
    Ad= abs((1/2)*det([1 B(A(n,2),2) B(A(n,2),3);1 B(A(n,3),2) B(A(n,3),3);1 B(A(n,4),2) B(A(n,4),3)]));
    y=[b1*b1+c1*c1,b1*b2+c1*c2,b1*b3+c1*c3;b1*b2+c1*c2,b2*b2+c2*c2,b2*b3+c2*c3;b1*b3+c1*c3,b3*b2+c3*c2,b3*b3+c3*c3]/(4*Ad);
    i=A(n,2);                               % Node 1 for element 1
    j=A(n,3);                               % Node 2 for element 1
    k=A(n,4);                               % Node 3 for element 1
    K(i,i)=K(i,i)+y(1,1);
    K(i,j)=K(i,j)+y(1,2);
    K(i,k)=K(i,k)+y(1,3);
    K(j,i)=K(j,i)+y(2,1);
    K(j,j)=K(j,j)+y(2,2);
    K(j,k)=K(j,k)+y(2,3);
    K(k,i)=K(k,i)+y(3,1);
    K(k,j)=K(k,j)+y(3,2);
    K(k,k)=K(k,k)+y(3,3);
    i=A(n,2);
    j=A(n,3);
    k=A(n,4);
    y1=Ad*[1/6 1/12 1/12;1/12 1/6 1/12;1/12 1/12 1/6]*[fun,fun,fun]';
    bf(i,1)=bf(i,1)+y1(1,1);
    bf(j,1)=bf(j,1)+y1(2,1);
    bf(k,1)=bf(k,1)+y1(3,1);
end
%%
% Modifying in place
f=zeros(numnod,1); % Body forces
u=zeros(numnod,1); % Global stiffness
for i=1:numnod;
    j=1:numnod;
    if B(i,4)==1;  % For boundary flag 1
        u(i)=B(i,5);
        K(i,j)=0;
        K(i,i)=1;
        bf(i,1)=0;
    else
        f(i)=B(i,5); % BC value
    end
end
for i=1:numnod;
    j=1:numnod;
    if B(i,4)==1;
        u(i)=B(i,5);
        K(i,j)=0;
        K(i,i)=1;
        f(j)=f(j)-K(j,i)*u(i,1);
        f(i)=u(i);
        K(j,i)=0;
        K(i,i)=1;
    end
end
%% Generating the body force vector
P=f+bf;
U=K\P; % Nodal displacement
K=zeros(numnod,numnod);
bf=zeros(numnod,1);
for n=1:numel;
    b1=B(A(n,3),3)-B(A(n,4),3);
    b2=B(A(n,4),3)-B(A(n,2),3);
    b3=B(A(n,2),3)-B(A(n,3),3);
    c1=B(A(n,4),2)-B(A(n,3),2);
    c2=B(A(n,2),2)-B(A(n,4),2);
    c3=B(A(n,3),2)-B(A(n,2),2);
    Area=[1 B(A(n,2),2) B(A(n,2),3);1 B(A(n,3),2) B(A(n,3),3);1 B(A(n,4),2) B(A(n,4),3)];
    Ad=abs(0.5*det(Area));
    y2=[b1*b1+c1*c1 b1*b2+c1*c2 b1*b3+c1*c3;b1*b2+c1*c2 b2*b2+c2*c2 b2*b3+c2*c3;b1*b3+c1*c3 b3*b2+c3*c2 b3*b3+c3*c3]/(4*Ad);
    
    i=A(n,2);
    j=A(n,3);
    k=A(n,4);
    K(i,i)=K(i,i)+y2(1,1);
    K(i,j)=K(i,j)+y2(1,2);
    K(i,k)=K(i,k)+y2(1,3);
    K(j,i)=K(j,i)+y2(2,1);
    K(j,j)=K(j,j)+y2(2,2);
    K(j,k)=K(j,k)+y2(2,3);
    K(k,i)=K(k,i)+y2(3,1);
    K(k,j)=K(k,j)+y2(3,2);
    K(k,k)=K(k,k)+y2(3,3);
    i=A(n,2);
    j=A(n,3);
    k=A(n,4);
    y3=Ad*[1/6 1/12 1/12;1/12 1/6 1/12;1/12 1/12 1/6]*[fun fun fun]';
    bf(i,1)=bf(i,1)+y3(1,1);
    bf(j,1)=bf(j,1)+y3(2,1);
    bf(k,1)=bf(k,1)+y3(3,1);
end
%%
% Finding the vaules of T & Tau
T=0;
Tau_zy=zeros(numel,1);
Tau_zx=zeros(numel,1);
Tau_max=zeros(numel,1);
for n=1:numel;
    b1=B(A(n,3),3)-B(A(n,4),3);
    b2=B(A(n,4),3)-B(A(n,2),3);
    b3=B(A(n,2),3)-B(A(n,3),3);
    c1=B(A(n,4),2)-B(A(n,3),2);
    c2=B(A(n,2),2)-B(A(n,4),2);
    c3=B(A(n,3),2)-B(A(n,2),2);
    Area=[1 B(A(n,2),2) B(A(n,2),3);1 B(A(n,3),2) B(A(n,3),3);1 B(A(n,4),2) B(A(n,4),3)];
    Ad=abs((1/2)*det(Area));
    i=A(n,2);
    j=A(n,3);
    k=A(n,4);
    phi=(2/3)*Ad*(U(i,1)+U(j,1)+U(k,1));
    T=T+phi;
    Tau_zy(n,1) = Tau_zy(n,1)- ((b1/(2*Ad))*U(i,1)+b2/(2*Ad)*U(j,1)+b3/(2*Ad)*U(k,1));
    Tau_zx(n,1) = Tau_zx(n,1)+ (c1/(2*Ad)*U(i,1)+c2/(2*Ad)*U(j,1)+c3/(2*Ad)*U(k,1));
    Tau_max(n,1)= Tau_max(n,1)+ (sqrt(Tau_zy(n,1)*Tau_zy(n,1)+ Tau_zx(n,1)* Tau_zx(n,1)));
end
%% Printing value of torque, nodes and stress function
tau_max=max(Tau_max);
fprintf ('\n---------------------------------------------------------');
fprintf ('\n\tTorque(N-m)    \t\t Tau_max(N/m^2)\n');
fprintf ('\t%13.6e',T);
fprintf ('\t\t%13.6e\n',tau_max);
fprintf ('\n');
fprintf ('---------------------------------------------------------');
fprintf ('  \n\tNode Number  \t  Stress Function Value(N/m) \n');
fprintf ('\n');
%% Printing values of Maximum Tau, Tau_zx, Tau_zy and Tau_max in N/m^2
for i=1:numnod;
    fprintf ('\t %5d\t',B(i,1));
    fprintf ('\t\t\t\t%13.6e\n',U(i,1));
end
fprintf ('------------------------------------------------------------------------------------------------');
fprintf ('\n');
fprintf ('  Element Number \t\tTau_zx(N/m^2) \t\t\tTau_zy(N/m^2)     \t\t  Tau(N/m^2)\n');
fprintf ('\n');
z=zeros(numnod,1);
for i=1:numel;
    z(i,1)= A(i,1);
    z(i,2)= Tau_zx(i,1);
    z(i,3)= Tau_zy(i,1);
    z(i,4)=  Tau_max(i,1);
    fprintf ('\t  %5d\t',A(i,1));
    fprintf ('\t\t\t%13.6e\t',Tau_zx(i,1));
    fprintf ('\t\t%13.6e',Tau_zy(i,1));
    fprintf ('\t\t\t%13.6e\n', Tau_max(i,1));
end
fprintf ('------------------------------------------------------------------------------------------------\n\n');
end


