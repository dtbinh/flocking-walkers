function u=DirToNearest(n)
% function u=DirToNearest(n)
%
% INPUT
% n      ego-Actor id (INPUT)
% 
% OUTPUT
% u      normalized average direction vector from ego-Actor n to nearest Actor (OUTPUT)

global N T t x y p q D v0 wpc

[m,d,u]=ActorNearest(n);
u=DirToActor(m,n);
u=VecNorm(u);