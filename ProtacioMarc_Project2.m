function ProtacioMarc_Project2
% clc; clear all; close all;

% Physical Properties
E = 210e9;                                  % [N/m^2]
nu = 0.3;                                   % [-]
theta_prime = 0.0175;                       % [rad/m]

% Input File
filein  = 'project2.inp';
in1  = fopen(filein,'r');

header = fscanf(in1,'%s',[1 1]);

%% Extract Number of Nodes and Elements

num_nodes_elements = fscanf(in1,'%f',[1 2]);
[nodes,elements] = Number_Nodes_Elements(num_nodes_elements);

%% Extract Node Data

[node_number,x,y,bcflag,int_grad_psi_n,psi] = Node_Data(nodes,in1);

%% Extract Element Data 

[element_number,element_node_1,element_node_2,element_node_3,A,a1,a2,a3,b1,b2,b3,c1,c2,c3] = Element_Data(elements,in1,x,y);

%% Form Global Stiffness Matrix

Global = Global_Stiffness_Matrix(nodes,elements,element_node_1,element_node_2,element_node_3,A,b1,b2,b3,c1,c2,c3);

%% Form Force Vector

Force = Force_Vector(nodes,elements,E,theta_prime,nu,A,element_node_1,element_node_2,element_node_3);

%% Modify in Place and solve for psi and int_grad_psi_n

[psi,int_grad_psi_n] = Solution(Global,int_grad_psi_n,Force,nodes,bcflag,psi);

%% Solve for Torque and Shear Stresses

[T_element,tau_zx_element,tau_zy_element,tau_element,T,tau_max,element_max_tau] = Torque_Shear(elements,A,element_node_1,psi,element_node_2,element_node_3,b1,b2,b3,c1,c2,c3);

%% Print Solution to Command Window

fprintf(' torque T (N-m)     tau_max over all elements (N/(m^2))\n')
fprintf(' %13.6e               %13.6e\n\n',T,tau_max)

fprintf(' node number     stress function value (N/m)\n')
for i=1:nodes
    
    fprintf('  %5d                 %13.6e\n',node_number(i),psi(i))
   
end

fprintf('\n element number      tau_zx (N/(m^2))       tau_zy (N/(m^2))      tau (N/(m^2))\n')
for i=1:elements
    
    fprintf('    %5d             %13.6e           %13.6e       %13.6e\n',element_number(i),tau_zx_element(i),tau_zy_element(i),tau_element(i))
   
end

end

%==========================================================================
%==========================================================================
% Functions
%==========================================================================
%==========================================================================

%% Function used to extract the Number of Nodes and Elements

function [nodes,elements] = Number_Nodes_Elements(num_nodes_elements)

nodes = num_nodes_elements(1);
elements = num_nodes_elements(2);

end

%% Function used to extract Node Data

function [node_number,x,y,bcflag,int_grad_psi_n,psi] = Node_Data(nodes,in1)

psi = zeros(nodes,1);
int_grad_psi_n = zeros(nodes,1);

for i=1:nodes

node_data = fscanf(in1,'%f',[1 5]);
node_number(i) = node_data(1);    
x(i) = node_data(2);
y(i) = node_data(3);
bcflag(i) = node_data(4);
if bcflag(i)==0
    int_grad_psi_n(i) = node_data(5);
else
    psi(i) = node_data(5);
end
    
end

end

%% Function used to extract Element Data

function [element_number,element_node_1,element_node_2,element_node_3,A,a1,a2,a3,b1,b2,b3,c1,c2,c3] = Element_Data(elements,in1,x,y)

A = zeros(elements,1);
a1 = zeros(elements,1);
a2 = zeros(elements,1);
a3 = zeros(elements,1);

b1 = zeros(elements,1);
b2 = zeros(elements,1);
b3 = zeros(elements,1);

c1 = zeros(elements,1);
c2 = zeros(elements,1);
c3 = zeros(elements,1);

for i=1:elements

element_data = fscanf(in1,'%f',[1 4]);
element_number(i) = element_data(1);
element_node_1(i) = element_data(2);
element_node_2(i) = element_data(3);
element_node_3(i) = element_data(4);

A_det_matrix =[1 x(element_node_1(i)) y(element_node_1(i));
               1 x(element_node_2(i)) y(element_node_2(i));
               1 x(element_node_3(i)) y(element_node_3(i))];

A(i) = 0.5*det(A_det_matrix);
           
a1(i) = (x(element_node_2(i))*y(element_node_3(i))) - (x(element_node_3(i))*y(element_node_2(i)));
a2(i) = (x(element_node_3(i))*y(element_node_1(i))) - (x(element_node_1(i))*y(element_node_3(i)));
a3(i) = (x(element_node_1(i))*y(element_node_2(i))) - (x(element_node_2(i))*y(element_node_1(i)));

b1(i) = y(element_node_2(i)) - y(element_node_3(i));
b2(i) = y(element_node_3(i)) - y(element_node_1(i));
b3(i) = y(element_node_1(i)) - y(element_node_2(i));

c1(i) = x(element_node_3(i)) - x(element_node_2(i));
c2(i) = x(element_node_1(i)) - x(element_node_3(i));
c3(i) = x(element_node_2(i)) - x(element_node_1(i));
 
end

end

%% Function used to form Global Stiffness Matrix

function Global = Global_Stiffness_Matrix(nodes,elements,element_node_1,element_node_2,element_node_3,A,b1,b2,b3,c1,c2,c3)

Global = zeros(nodes,nodes);

for i=1:elements

Empty_Stiffness = zeros(nodes,nodes);

Empty_Stiffness(element_node_1(i),element_node_1(i)) = b1(i)*b1(i) + c1(i)*c1(i); 
Empty_Stiffness(element_node_1(i),element_node_2(i)) = b1(i)*b2(i) + c1(i)*c2(i);
Empty_Stiffness(element_node_1(i),element_node_3(i)) = b1(i)*b3(i) + c1(i)*c3(i); 

Empty_Stiffness(element_node_2(i),element_node_1(i)) = b2(i)*b1(i) + c2(i)*c1(i);
Empty_Stiffness(element_node_2(i),element_node_2(i)) = b2(i)*b2(i) + c2(i)*c2(i);
Empty_Stiffness(element_node_2(i),element_node_3(i)) = b2(i)*b3(i) + c2(i)*c3(i);

Empty_Stiffness(element_node_3(i),element_node_1(i)) = b3(i)*b1(i) + c3(i)*c1(i);
Empty_Stiffness(element_node_3(i),element_node_2(i)) = b3(i)*b2(i) + c3(i)*c2(i);
Empty_Stiffness(element_node_3(i),element_node_3(i)) = b3(i)*b3(i) + c3(i)*c3(i);

Stiffness = (1/(4*A(i)))*Empty_Stiffness;

Global = Global + Stiffness;

 end
 
end

%% Function used to form Force Vector

function Force = Force_Vector(nodes,elements,E,theta_prime,nu,A,element_node_1,element_node_2,element_node_3)

Force = zeros(nodes,1);

for i=1:elements
    
f1(i) = (E*theta_prime)/(1 + nu);
f2(i) = (E*theta_prime)/(1 + nu);
f3(i) = (E*theta_prime)/(1 + nu);

f = [f1(i); f2(i); f3(i)];

Force_term = A(i)*[(1/6) (1/12) (1/12);
                   (1/12) (1/6) (1/12);
                   (1/12) (1/12) (1/6)];

Element_Empty_Force = Force_term*f;                   
                 
Empty_Force = zeros(nodes,1);

Empty_Force(element_node_1(i)) = Element_Empty_Force(1);
Empty_Force(element_node_2(i)) = Element_Empty_Force(2);
Empty_Force(element_node_3(i)) = Element_Empty_Force(3);

Force = Force + Empty_Force;
    
end

end

%% Function used to Modify in Place and solve for psi and int_grad_psi_n

function [psi,int_grad_psi_n] = Solution(Global,int_grad_psi_n,Force,nodes,bcflag,psi)

R_Global = Global;
R_int_grad_psi_n = int_grad_psi_n;
R_Force = Force;

for i=1:nodes
    
    if bcflag(i)==1
                
        for j = 1:nodes
            if j~=i
            R_Global(j,i) = R_Global(j,i)*psi(i);
            R_int_grad_psi_n(j) = R_int_grad_psi_n(j) - R_Global(j,i);
            R_Global(j,i) = 0;
            else
                R_Global(j,i) = R_Global(j,i);
            end
        end
        
        for k = 1:nodes
            if k~=i
            R_Global(i,k) = 0;
            else
            R_Global(i,k) = R_Global(i,k);
            end
        end
        
       R_int_grad_psi_n(i) = psi(i)*R_Global(i,i) ;
       R_Force(i) = 0;
            
       else
       R_Global = R_Global;
        
    end   
        
end

R_RHS =  R_int_grad_psi_n + R_Force;
 
psi = R_Global\R_RHS;

int_grad_psi_n = (Global*psi) - Force;

end

%% Function used to Solve for Torque and Shear Stresses

function [T_element,tau_zx_element,tau_zy_element,tau_element,T,tau_max,element_max_tau] = Torque_Shear(elements,A,element_node_1,psi,element_node_2,element_node_3,b1,b2,b3,c1,c2,c3)

for i=1:elements
    
   T_element(i) = (2/3)*A(i)*(psi(element_node_1(i)) + psi(element_node_2(i)) + psi(element_node_3(i)));
   
   tau_zx_element(i) = (1/(2*A(i)))*(psi(element_node_1(i))*c1(i) + psi(element_node_2(i))*c2(i) + psi(element_node_3(i))*c3(i));
   
   tau_zy_element(i) = -(1/(2*A(i)))*(psi(element_node_1(i))*b1(i) + psi(element_node_2(i))*b2(i) + psi(element_node_3(i))*b3(i));
   
   tau_element(i) = sqrt((tau_zx_element(i)^2) + (tau_zy_element(i)^2));
    
end
         
T = sum(T_element);

[tau_max element_max_tau]  = max(tau_element);

end





