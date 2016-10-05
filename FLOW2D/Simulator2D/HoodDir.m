function u=HoodDir(d,n)
% function u=HoodDir(d,n)
%
% u      normalized direction vector of average direction of n-th Actor's d-radius neighborhood (OUTPUT)
% d      radius of neighborhood (center is at (x(t,n),y(t,n)) (INPUT)
% n      ego-Actor id (INPUT)

global N T t x y p q D v0 wpc

hood=ActorHood(dhood,n);
p0=mean(p(t,hood));
q0=mean(q(t,hood));
u=VecNorm([p0,q0]);
