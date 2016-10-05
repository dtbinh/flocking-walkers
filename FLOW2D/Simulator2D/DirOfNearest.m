function u=DirOfNearest(n)
% function u=DirOfNearest(n)
% 
% INPUT
% n      ego-Actor id (INPUT)
%
% OUTPUT
% u      normalized direction vector of Actor nearest to ego-Actor n (OUTPUT)

global N T t x y p q D v0 wpc

[m,d,u]=ActorNearest(n);
p0=p(t,m);
q0=q(t,m);
u=VecNorm([p0,q0]);