% This program is to calculate the pressue and fluid flow in the pipe system

function Kela_Project1
clc;
close all;
disp ('Executing file "Kela_project1"');
filein= 'project1.inp';
in1= fopen(filein,'r');
fscanf (in1,'%s',[1,1]); % header to the file
numnod  =  fscanf (in1,'%g',[1,1]); % number of nodes
numel   =  fscanf (in1,'%g',[1,1]); % number of elements
visc    =  fscanf (in1,'%g',[1,1]); % viscosity of fluid (N-s/sq.meter)
density =  fscanf (in1,'%g',[1,1]); % density of fluid  (Kg/cubic meter)
g       =  fscanf (in1,'%g',[1,1]); % accln due to gravity (m/sec sq.)
set_d   =  fscanf (in1,'%g',[5 numnod]);
% reading the 7X5 matrix for nodes, x-co-ordinate, y-coordinate, bcflag, bcvalue
set_d   = set_d';
set_e   = fscanf (in1,'%g',[4 numel]);
% reading the 8X4 matrix for number of elements,connected nodes, and diameter of pipe
set_e   = set_e'; % transposing to get the required matrix
NODE=set_d(:,1);
bcflag  = set_d(:,4);           % Boundary condition flag mode from set_d
bcvalue = set_d(:,5);           % Boundary condition values from set_d
node1=set_e(:,2);               % Node1 vector
node2=set_e(:,3);               % Node2 vector
Global = zeros(numnod,numnod);  % Stiffness global matrix
Body_force=zeros(numnod,1);     % Body force global matrix
dia=set_e(:,4);               % Reading element diameters
theta=zeros(numel,1);           % Building dummy theta matrix
xcoord=set_d(:,2);
ycoord=set_d(:,3);
elength=zeros(numel,1);
Flow=zeros(numnod,1);
K=zeros(numel,1);
bf_value=zeros(numnod,1);
Pressure=zeros(numnod,1);
%%
% for i1=1:numnod % for loop to elements
for i=1:numel
    theta(i,1)= atand((ycoord(node2(i))-ycoord(node1(i)))/(xcoord(node2(i))-xcoord(node1(i)))); % Theta vector for element 1
    elength(i,1)=sqrt((xcoord(node2(i))-xcoord(node1(i))).^2+(ycoord(node2(i))-ycoord(node1(i))).^2); % Calculating element
    % length vector for element i1
    K(i,1)=(pi.*((dia(i)).^4)/(128*visc.*elength(i))); % Calculating element stiffness value.    
end
%% Calculating body force matrix
for i=1:numel
    bf_value(i,1)=((pi.*(dia(i)).^4)/(128.*visc))*(density.*g.*sind(theta(i)));
    BF= zeros (numnod,1); % Getting dummy body force matrix
    BF(node1(i))=-1.*bf_value(i);
    BF(node2(i))=1*bf_value(i);
    Body_force=(Body_force) + BF; % Calculating body force
end
%% Calculating global matrix
for i=1:numel
    G=zeros(numnod,numnod); % Getting dummy global matrix
    G(node1(i),node1(i))=1* K(i);
    G(node1(i),node2(i))=-1*K(i);
    G(node2(i),node1(i))=-1*K(i);
    G(node2(i),node2(i))=1*K(i);
    Global = Global + G; % Calculating global matrix
end
% Reading
for i=1:numnod;
    if (bcflag(i)==0);
        Flow(i,1)=bcvalue(i);           % Generating flow rate (cubic meter/sec) matrix
    else
        Pressure(i,1)=bcvalue(i) ;     % Generating pressure (N/sq. meter)matrix
    end
end
%% Solving by modifying in place.
G1=Global;
for i= 1:numnod % i be variable matrix with dimension of (numnode,1)   
    if bcflag(i)==1; 
        for j=1:numnod;
             if j==i
                G1(j,i)=G1(j,i)/G1(j,i);            
             else                
                G1(j,i)=G1(i,j)*Pressure(i); %
                Flow(j)= Flow(j)-G1(j,i);
                G1(j,i)=0;                
             end 
        end   
        for k=1:numnod
            if k==i
                 G1(i,k)=G1(i,k);                
            else
               G1(i,k)=0;
            end
            
            Flow(i)=Pressure(i).*G1(i,i);
        end  
     end    
end

%%
Red_Global=Flow+(Body_force);
Pressure=G1\Red_Global;
Flow= ((Global)*(Pressure))-(Body_force);
% For the given value of flow to be zero considering the input value
for i = 1:numnod
    if bcflag(i,1) ==0;
        Flow(i,1) = bcvalue(i,1);
    end
end
% For the given value of pressure to be zero considering the input value
for j = 1:numnod
    if bcflag(j,1) ==1;
        Pressure(j,1) = bcvalue(j,1);
    end
end
fprintf('\n\nnode number \tnodal pressure(N/sq.meter)\t\tnodal flow(cubic meter/sec)\n')
fprintf('-----------xxx----------------------------xxx-------------------------------\n')
for i=1:numnod
    fprintf('%5d\t\t \t\t%13.6e\t\t\t\t\t%13.6e\n',NODE(i),Pressure(i),Flow(i));    
end
end














