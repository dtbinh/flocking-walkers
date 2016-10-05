function d=DistToActor(m,n)
% function d=DistToActor(m,n)
%
% d       distance from ego-Actor to m-th Actor (OUTPUT)
% m       target Actor (INPUT)
% n      ego-Actor id (INPUT)

global N T t x y p q D v0 wpc

d=D(n,m);