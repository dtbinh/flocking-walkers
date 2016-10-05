function hood=ActorHood(d,AOP,n)
% function hood=ActorHood(d,n)
%
% INPUT
% d       the radius of the intended neighborhood
% AOP     the angle of the intended neighborhood(Angle of Perception)
% n       ego-Actor id (INPUT)
%
% OUTPUT
% hood    the neighborhood of the n-th actor (not containing itself)

global N T t x y p q D v0 wpc Others

hood=find(D(:,n)<d & abs(atan2(Others(:,2),Others(:,1)))<=AOP/2);
hood=setdiff(hood,n);