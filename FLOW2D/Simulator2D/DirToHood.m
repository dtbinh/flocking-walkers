function u=DirToHood(d,ang,n)
% function u=DirToHood(d,n)
%
% INPUT
% d      radius of neighborhood (center is at (x(t,n),y(t,n)) (INPUT)
% ang    angle of perception (INPUT)
% n      ego-Actor id (INPUT)
% 
% OUTPUT
% u      normalized average direction vector of n-th Actor to his d-radius neighborhood (OUTPUT)

global N T t x y p q D v0 wpc Others

hood=ActorHood(d,ang,n);
r=HoodCenter(d,ang,n);

p0=r(1)-x(t,n);
q0=r(2)-y(t,n);
u=VecNorm([p0,q0]);