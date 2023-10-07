clc; clear all; close all;

%% Update Relation for x

syms x1 x2 lambda1 lambda2 

f = (x1.^2) + (2.*x2.^2) - (3.*x1) - (2.*x2) + (2.*x1.*x2);
g1 = (2.*x1) + x2 - 1;
g2 = x2 + 3;

A = f + lambda1*g1 + (g1^2) + lambda2*g2 + (g2^2)

dA_dx1 = simplify(diff(A,x1,1))

dA_dx2 = simplify(diff(A,x2,1))

solution_A = solve(dA_dx1,dA_dx2,'x1','x2')

x1 = simplify(solution_A.x1)

x2 = simplify(solution_A.x2)

%% Starting Point for lambda = [0 0]

clear all;

syms x1 x2 

f = (x1.^2) + (2.*x2.^2) - (3.*x1) - (2.*x2) + (2.*x1.*x2);
g1 = (2.*x1) + x2 - 1;
g2 = x2 + 3;

df_dx1 = simplify(diff(f,x1,1))

df_dx2 = simplify(diff(f,x2,1))

solution = solve(df_dx1,df_dx2,'x1','x2')

x1 = simplify(solution.x1)

x2 = simplify(solution.x2)

%% Starting Point for lambda = [19/2 49/2]

clear all;

lambda1 = 19/2;
lambda2 = 49/2;

syms x1 x2 

f = (x1.^2) + (2.*x2.^2) - (3.*x1) - (2.*x2) + (2.*x1.*x2);
g1 = (2.*x1) + x2 - 1;
g2 = x2 + 3;

df_dx1 = simplify(diff(f,x1,1))

df_dx2 = simplify(diff(f,x2,1))

dg1_dx1 = simplify(diff(g1,x1,1))

dg1_dx2 = simplify(diff(g1,x2,1))

dg2_dx1 = simplify(diff(g2,x1,1))

dg2_dx2 = simplify(diff(g2,x2,1))

eq1 = df_dx1 + lambda1*dg1_dx1 + lambda2*dg2_dx1

eq2 = df_dx2 + lambda1*dg1_dx2 + lambda2*dg2_dx2

solution = solve(eq1,eq2,'x1','x2')

x1 = simplify(solution.x1)

x2 = simplify(solution.x2)

%% Stationary Points for each iteration for lambda = [0 0]

clear all;

format rat;

% x_1

lambda1_0 = 0;
lambda2_0 = 0;

x1_0 = 2;
x2_0 = (-1/2);

x1_1 = (3*lambda2_0/22) - (5*lambda1_0/22) + (17/11)
x2_1 = (lambda1_0/22) - (5*lambda2_0/22) - (31/22)

lambda1_1 = lambda1_0 + 2*max((2*(x1_1) + (x2_1) - 1),(-lambda1_0/2)) 
lambda2_1 = lambda2_0 + 2*max(((x2_1) + 3),(-lambda2_0/2)) 

% x_2

x1_2 = (3*lambda2_1/22) - (5*lambda1_1/22) + (17/11)
x2_2 = (lambda1_1/22) - (5*lambda2_1/22) - (31/22)

lambda1_2 = lambda1_1 + 2*max((2*(x1_2) + (x2_2) - 1),(-lambda1_1/2)) 
lambda2_2 = lambda2_1 + 2*max(((x2_2) + 3),(-lambda2_1/2)) 

% x_3

x1_3 = (3*lambda2_2/22) - (5*lambda1_2/22) + (17/11)
x2_3 = (lambda1_2/22) - (5*lambda2_2/22) - (31/22)

lambda1_3 = lambda1_2 + 2*max((2*(x1_3) + (x2_3) - 1),(-lambda1_2/2)) 
lambda2_3 = lambda2_2 + 2*max(((x2_3) + 3),(-lambda2_2/2)) 

% x_4

x1_4 = (3*lambda2_3/22) - (5*lambda1_3/22) + (17/11)
x2_4 = (lambda1_3/22) - (5*lambda2_3/22) - (31/22)

lambda1_4 = lambda1_3 + 2*max((2*(x1_4) + (x2_4) - 1),(-lambda1_3/2)) 
lambda2_4 = lambda2_3 + 2*max(((x2_4) + 3),(-lambda2_3/2)) 




