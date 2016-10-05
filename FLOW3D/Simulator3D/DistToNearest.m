function d=DistToNearest(n)
% function d=DistToNearest(n)
%
% d      distance from ego-Actor to his nearest neighbor (OUTPUT)
% n      ego-Actor id (INPUT)

global N T t x y p q D v0 wpc

[m,d,u]=ActorNearest(n);
