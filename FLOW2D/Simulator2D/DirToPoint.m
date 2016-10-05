function u=DirToPoint(r0,n)
% function u=DirToPoint(r0,n)
%
% INPUT
% r0     1-by-2 matrix r0=[x0,y0] contains the coordinates of the point (INPUT)
% n      ego-Actor id (INPUT)
% 
% OUTPUT
% u     direction from actor n to point r0=[x0,y0] (OUTPUT)

global N T t x y p q D v0 wpc

x0=r0(1);
y0=r0(2);
p0=x0-x(t,n);
q0=y0-y(t,n);
u=VecNorm([p0,q0]);