function u=DirToGroup(G,n)
% function u=DirToGroup(G,n)
%
% u       normalized average direction vector from ego-Actor n to group G (OUTPUT)
% G       set (really vector) which contains members of group
% n      ego-Actor id (INPUT)

global N T t x y z p q r D v0 wpc

x0=mean(x(t,G));
y0=mean(y(t,G));
z0=mean(z(t,G));

p0=x0-x(t,n);
q0=y0-y(t,n);
r0=z0-z(t,n);
u=VecNorm([p0,q0,r0]);