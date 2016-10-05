function u=DirToHood(d,n)
% function u=DirToHood(d,n)
%
% u      normalized average direction vector of n-th Actor to his d-radius neighborhood (OUTPUT)
% d      radius of neighborhood (center is at (x(t,n),y(t,n)) (INPUT)
% n      ego-Actor id (INPUT)

global N T t x y z p q r D v0 wpc

hood=ActorHood(d,n);
r1=HoodCenter(d,n);

p0=r1(1)-x(t,n);
q0=r1(2)-y(t,n);
r0=r1(3)-z(t,n);
u=VecNorm([p0,q0,r0]);