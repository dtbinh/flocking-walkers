function d=DistToHood(d,n)
% function d=DistToHood(d,n)
%
% d      distance from ego-Actor to centroid of his d-radius neighborhood (OUTPUT)
% d      radius of neighborhood (INPUT)
% n      ego-Actor id (INPUT)

global N T t x y p q D v0 wpc

hood=ActorHood(d,n)
x0=mean(x(t,hood));
y0=mean(y(t,hood));
d=sqrt((x(t,n)-x0)^2+(y(t,n)-y0)^2);
