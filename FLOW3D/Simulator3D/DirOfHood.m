function u=DirOfHood(d,n)
% function u=DirOfHood(d,n)
%
% u      normalized average direction vector of d-radius neighborhood of n-th Actor (OUTPUT)
% d      radius of neighborhood (center is at (x(t,n),y(t,n)) (INPUT)
% n      ego-Actor id (INPUT)

global N T t x y z p q r D v0 wpc

hood=ActorHood(d,n);

p0=0; q0=0; r0=0;
if length(hood)>1
	p0=mean(p(t,hood));
	q0=mean(q(t,hood));
    r0=mean(r(t,hood));
end
u=VecNorm([p0,q0,r0]);