A= [1 2 3; 4 5 6;7 8 9];
M= [6 4; 2 3];
B=sum (A);
C=diag (A);
D= det (M);
E= rank (A)+rank (M);
A1= [1 2 3];
B1= [ 4 5 6];
C1= dot (A1, B1);
D1= cross (A1,B1);
B2=sort (M,6);
E1=expm (M);
L=logm(A);
S=sqrtm(A);
Z=eye(2)
M2=kron(A,Z)
[F, G]=eig(A)