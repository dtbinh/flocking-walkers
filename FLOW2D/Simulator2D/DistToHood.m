function d=DistToHood(d,AOP,n)
% function d=DistToHood(d,AOP,n)
%
% INPUT
% d      radius of neighborhood (INPUT)
% n      ego-Actor id (INPUT)
%
% OUTPUT
% d      distance from ego-Actor to centroid of
%        his d-radius neighborhood (OUTPUT)



global N T t x y p q D v0 wpc

hood=ActorHood(d,AOP,n)
x0=mean(x(t,hood));
y0=mean(y(t,hood));
d=sqrt((x(t,n)-x0)^2+(y(t,n)-y0)^2);
