function r=HoodCenter(d,ang,n)
% function r=HoodCenter(d,n)
%
% r       (x,y) centroid coords of n-th Actor's d-radius neighborhood (OUTPUT)
% d       radius of neighborhood (center is at (x(t,n),y(t,n)) (INPUT)
% n      ego-Actor id (INPUT)

global N T t x y p q D v0 wpc

hood=ActorHood(d,ang,n);
if length(hood)>0
    x0=mean(x(t,hood));
    y0=mean(y(t,hood));
end
r=[x0,y0];
