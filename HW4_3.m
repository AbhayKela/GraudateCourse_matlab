clc;clear;
syms x1 x2 
e = -0.1;
fx=(x1.^2)+(2.*(x2.^2))-(3.*x1)-(2.*x2)+(2.*x1.*x2);
g1=(2.*x1)+(x2)-1;
g2=(x2+3);

X1=-2:0.1:5;
X2=-5:0.1:2;
[X1, X2 ] = meshgrid(X1,X2);
Fx=(X1.^2)+(2.*(X2.^2))-(3.*X1)-(2.*X2)+(2.*X1.*X2);
G1=(2.*X1)+(X2)-1;
G2=X2+3;
for i=1:length(X2)
    for j=1:length(X1)
        if G1(i,j)<=e;
            P1(i,j)=(-1/G1(i,j));
        else
            P1(i,j)=(-(2.*e-G1(i,j))/e.^2);
        end
        if G2(i,j)<=e;
            P2(i,j)=(-1/G2(i,j));
        else
            P2(i,j)=(-(2.*e-G2(i,j))/e.^2);
        end        
    end
end
%% For rpd=1 & rpd=0.1
rpd_1=1;
rpd_2=0.1;
phi_rpd_1=Fx+rpd_1.*(P1+P2);
phi_rpd_2=Fx+rpd_2.*(P1+P2);
phi_m=1e12;
for i=1:length(X2)
    for j=1:length(X1)
        if phi_rpd_1(i,j)<phi_m
            phi_m=phi_rpd_1(i,j);
            x1_m_1=X1(i,j);
            x2_m_1=X2(i,j);
        end   
         if phi_rpd_2(i,j)<phi_m
            phi_m=phi_rpd_2(i,j);
            x1_m_2=X1(i,j);
            x2_m_2=X2(i,j);
         end 
    end
end
[c,h]= contour(X1,X2,phi_rpd_1,[0,5,10,15,20,25]); clabel(c,h);
hold on;
xlabel('x1'); ylabel('x2');
title('4.3 Extended interior penalty function method rp_ dash=1'); grid minor;
g11=[0,0];
g22=[0,0];
c1=contour(X1,X2,G1,g11,'--r');
hold on;
c2=contour(X1,X2,G2,g22,'--b');
hold on;
plot (1.9,-3.4,'*r');
hold on,
legend('Pseudo Objective function','g1','g2','Optimal Point')
%% 
figure;
[c,h]= contour(X1,X2,phi_rpd_2,[0,5,10,15,20,25]); clabel(c,h);
hold on;
xlabel('x1'); ylabel('x2');
title('4.3 Extended interior penalty function method rp_ dash=0.1'); grid minor;
g11=[0,0];
g22=[0,0];
c1=contour(X1,X2,G1,g11,'--r');
hold on;
c2=contour(X1,X2,G2,g22,'--b');
hold on;
plot (1.9,-3.1,'*r');
hold on,
legend('Pseudo Objective function','g1','g2','Optimal Point')