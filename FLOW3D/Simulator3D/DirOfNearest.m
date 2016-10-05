function u=DirOfNearest(n)
% function u=DirOfNearest(n)
%
% u      normalized direction vector of Actor nearest to ego-Actor n (OUTPUT)
% n      ego-Actor id (INPUT)

global N T t x y z p q r D v0 wpc

[m,d,u]=ActorNearest(n);
p0=p(t,m);
q0=q(t,m);
r0=r(t,m);
u=VecNorm([p0,q0,r0]);