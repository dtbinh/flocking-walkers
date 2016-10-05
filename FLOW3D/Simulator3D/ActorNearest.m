function [m,d,u]=ActorNearest(n)
% function [m,d,u]=ActorNearest(n)
%
% m      Actor nearest to ego-Actor n (OUTPUT)
% d      distance of Actor nearest to ego-Actor n (OUTPUT)
% u      normalized direction vector of Actor nearest to ego-Actor n (OUTPUT)
% n      ego-Actor id (INPUT)

global N T t x y z p q r D v0 wpc

Dn=D(n,:); Dn(n)=1e10;
[d m]=min(Dn);
u=[x(t,m)-x(t,n) y(t,m)-y(t,n) z(t,m)-z(t,n)];
u=VecNorm(u);