function d=DistToActor(m,n)
% function d=DistToActor(m,n)
%
% INPUT
% m       target Actor (INPUT)
% n      ego-Actor id (INPUT)
% 
% OUTPUT
% d       distance from ego-Actor to m-th Actor (OUTPUT)

global N T t x y p q D v0 wpc

d=D(n,m);