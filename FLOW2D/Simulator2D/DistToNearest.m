function d=DistToNearest(n)
% function d=DistToNearest(n)
%
% INPUT
% n      ego-Actor id (INPUT)
%
% OUTPUT
% d      distance from ego-Actor to his nearest neighbor (OUTPUT)


global N T t x y p q D v0 wpc

[m,d,u]=ActorNearest(n);
