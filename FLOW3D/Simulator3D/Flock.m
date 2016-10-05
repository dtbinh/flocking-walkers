function u=Flock(davoid,dhood,n)
% function u=Flock(davoid,dhood,n)
%
% u      direction vector to effect flocking (OUTPUT)
% davoid avoidance radius (INPUT)
% dhood  alignment neigborhood radius (INPUT)
% n      ego-Actor id (INPUT)

global N T t x y z p q r D v0 wpc

u1=DirOfHood(dhood,n);
u2=AvoidNearestActor(davoid,n);

u=u1+u2;
