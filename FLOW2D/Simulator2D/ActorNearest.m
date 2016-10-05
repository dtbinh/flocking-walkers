function [m,d,u]=ActorNearest(n)
% function [m,d,u]=ActorNearest(n)
%
% INPUT
% n      ego-Actor id (INPUT)
% 
% OUTPUT
% m      Actor nearest to ego-Actor n (OUTPUT)
% d      distance of Actor nearest to ego-Actor n (OUTPUT)
% u      normalized direction vector of
% Actor nearest to ego-Actor n (OUTPUT)


global N T t x y p q D v0 wpc

Dn=D(n,:); Dn(n)=1e10;
[d m]=min(Dn);
u=[x(t,m)-x(t,n) y(t,m)-y(t,n)];
u=VecNorm(u);