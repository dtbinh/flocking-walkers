function u=Flock(davoid,dhood,ang,n)
% function u=Flock(davoid,dhood,n)
%
% INPUT
% davoid avoidance radius (INPUT)
% dhood  alignment neigborhood radius (INPUT)
% n      ego-Actor id (INPUT)
% 
% OUTPUT
% u      direction vector to effect flocking (OUTPUT)

global N T t x y p q D v0 wpc

u1=DirOfHood(dhood,ang,n);
u2=AvoidNearestActor(davoid,n);

u=u1+u2;
