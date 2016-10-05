function u=DirOfHood(d,ang,n)
% function u=DirOfHood(d,ang,n)
%
% INPUT
% d      radius of neighborhood (center is at (x(t,n),y(t,n)) (INPUT)
% ang    angle of perception (INPUT)
% n      ego-Actor id (INPUT)
% 
% OUTPUT
% u      normalized average direction vector of d-radius neighborhood of n-th Actor (OUTPUT)

global N T t x y p q D v0 wpc Others

hood=ActorHood(d,ang,n);

p0=0; q0=0;
if length(hood)>0
	p0=mean(p(t,hood));
	q0=mean(q(t,hood));
end
u=VecNorm([p0,q0]);