function d=DistToGroup(G,n)
% function d=DistToGroup(G,n)
%
% d      distance from ego-Actor to centroid of group G (OUTPUT)
% G      target group of Actors (INPUT)
% n      ego-Actor id (INPUT)

global N T t x y p q D v0 wpc

x0=mean(x(t,G));
y0=mean(y(t,G));
d=sqrt((x(t,n)-x0)^2+(y(t,n)-y0)^2);
