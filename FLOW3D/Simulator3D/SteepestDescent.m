function u=SteepestDescent(FH,da,n)
% function u=SteepestDescent(FH,da,n)
%
% u      steepest descent direction for function F at current location of n-th Actor (OUTPUT)
% FH     function handle to function F (INPUT)
% da     used as dx and dy to compute partial derivatives of F (INPUT)
% n      ego-Actor id (INPUT)

global N T t x y z p q r D v0 wpc

x1=x(t,:);
y1=y(t,:);
z1=z(t,:);
x2=x1; x2(n)=x2(n)+da;
y2=y1; y2(n)=y2(n)+da;
z2=z1; z2(n)=z2(n)+da;

p0=FH(x2,y1,z1,t,n)-FH(x1,y1,z1,t,n);
q0=FH(x1,y2,z1,t,n)-FH(x1,y1,z1,t,n);
r0=FH(x1,y1,z2,t,n)-FH(x1,y1,z1,t,n);
u=-VecNorm([p0,q0,r0]);