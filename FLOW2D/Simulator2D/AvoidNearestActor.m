function u=AvoidNearestActor(d0,n)
% function u=AvoidNearestActor(d0,n)
%
% INPUT
% d0      distance within which rule is applied (INPUT)
% n       ego-Actor id (INPUT)
% 
% OUTPUT
% u       direction vector from Actor nearest to ego-Actor, if he is within d; 
%         (otherwise zero vector) (OUTPUT)

global N T t x y p q D v0 wpc

[m,d,u]=ActorNearest(n);

if d<d0
	u=-u;
else
	u=[0,0];
end
