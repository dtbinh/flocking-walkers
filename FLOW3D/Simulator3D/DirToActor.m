function u=DirToActor(m,n)
% function u=DirToActor(m,n)
%
% u      normalized direction vector from ego-Actor to target Actor m (OUTPUT)
% m      no. of target Actor (INPUT)
% n      ego-Actor id (INPUT)

global N T t x y z p q r D v0 wpc

p0=x(t,m)-x(t,n);
q0=y(t,m)-y(t,n);
r0=z(t,m)-z(t,n);
u=VecNorm([p0,q0,r0]);