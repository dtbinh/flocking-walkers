function r=HoodCenter(d,n)
% function r=HoodCenter(d,n)
%
% r       (x,y) centroid coords of n-th Actor's d-radius neighborhood (OUTPUT)
% d       radius of neighborhood (center is at (x(t,n),y(t,n)) (INPUT)
% n      ego-Actor id (INPUT)

global N T t x y z p q r D v0 wpc

hood=ActorHood(d,n);
x0=mean(x(t,hood));
y0=mean(y(t,hood));
z0=mean(z(t,hood));
r=[x0,y0,z0];
