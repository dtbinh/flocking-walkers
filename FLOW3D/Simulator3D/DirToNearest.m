function u=DirToNearest(n)
% function u=DirToNearest(n)
%
% u      normalized average direction vector from ego-Actor n to nearest Actor (OUTPUT)
% n      ego-Actor id (INPUT)

global N T t x y z p q r D v0 wpc

[m,d,u]=ActorNearest(n);
u=DirToActor(m,n);
u=VecNorm(u);