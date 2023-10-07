clc; clear all; close all;

%% Plotting

clear all;

epsilon = -0.1;

syms x1 x2 rp

f = (x1.^2) + (2.*x2.^2) - (3.*x1) - (2.*x2) + (2.*x1.*x2);
g1 = (2.*x1) + x2 - 1;
g2 = x2 + 3;

X1 = -2:0.1:5;

X2 = -5:0.1:2;

[X1, X2] = meshgrid(X1,X2);

F = subs(f,{x1,x2},{X1,X2});
G1 = subs(g1,{x1,x2},{X1,X2});
G2 = subs(g2,{x1,x2},{X1,X2});

for i = 1:length(X2)
    
    for j = 1:length(X1)
        
        if G1(i,j)<=epsilon
            g_bar_1(i,j) = -(1/G1(i,j));
        else
            g_bar_1(i,j) = -(((2*epsilon)-G1(i,j))/(epsilon^2));
        end
        
        if G2(i,j)<=epsilon
            g_bar_2(i,j) = -(1/G2(i,j));
        else
            g_bar_2(i,j) = -(((2*epsilon)-G2(i,j))/(epsilon^2));
        end
        
    end
    
end

rp_1 = 1;
rp_01 = 0.1;
        
PHI_rp_1 = F + rp_1.*(g_bar_1 + g_bar_2);
PHI_rp_01 = F + rp_01.*(g_bar_1 + g_bar_2);

PHI_min_rp_1 = 1e10;
PHI_min_rp_01 = 1e10;

for i = 1:length(X2)
    
    for j = 1:length(X1)
        
        if PHI_rp_1(i,j)<PHI_min_rp_1
           PHI_min_rp_1 = PHI_rp_1(i,j);
           X1_min_rp_1 = X1(i,j);
           X2_min_rp_1 = X2(i,j);
        end
        
         if PHI_rp_01(i,j)<PHI_min_rp_01
           PHI_min_rp_01 = PHI_rp_01(i,j);
           X1_min_rp_01 = X1(i,j);
           X2_min_rp_01 = X2(i,j);
        end
      
    end
    
end

v = [0, 5, 10, 15, 20, 25];
v1 = [0 0];
v2 = [0 0];

subplot(1,2,1)
[C,h] = contour(X1, X2, PHI_rp_1, v);
clabel(C,h)
hold on
contour(X1, X2, G1, v1,'--k');
hold on
contour(X1, X2, G2, v2,'--r');
hold on
plot(X1_min_rp_1,X2_min_rp_1,'*')
text(X1_min_rp_1,X2_min_rp_1,'Optimal Point')
grid on
grid minor
title('Homework 4 Problem 3: Extended Interior Penalty Function Method (r_p=1)')
xlabel('x_1')
ylabel('x_2')
% legend('Pseudo Objective Function Contours','g_1','g_2','Optimal Point')

subplot(1,2,2)
[C,h] = contour(X1, X2, PHI_rp_01, v);
clabel(C,h)
hold on
contour(X1, X2, G1, v1,'--k');
hold on
contour(X1, X2, G2, v2,'--r');
hold on
plot(X1_min_rp_01,X2_min_rp_01,'*')
text(X1_min_rp_01,X2_min_rp_01,'Optimal Point')
grid on
grid minor
title('Homework 4 Problem 3: Extended Interior Penalty Function Method (r_p=0.1)')
xlabel('x_1')
ylabel('x_2')
% legend('Pseudo Objective Function Contours','g_1','g_2','Optimal Point')
