function u=DirToPoint(r0,n)
% function u=DirToPoint(r0,n)
%
% u     direction from actor n to point r0=[x0,y0] (OUTPUT)
% r     1-by-2 matrix r0=[x0,y0] contains the coordinates of the point (INPUT)
% n      ego-Actor id (INPUT)

global N T t x y z p q r D v0 wpc

x0=r0(1);
y0=r0(2);
z0=r0(3);
p0=x0-x(t,n);
q0=y0-y(t,n);
r0=z0-z(t,n);
u=VecNorm([p0,q0,r0]);