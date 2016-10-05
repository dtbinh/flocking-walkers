function u=StayInDisc(d0,n)
% function u=StayInDisc(d0,n)
%
% u       direction vector to keep ego-Actorin disc of center [0,0] and radius d (OUTPUT)
% d0      disc radius (INPUT)
% n      ego-Actor id (INPUT)

global N T t x y z p q r D v0 wpc

x1=x(t,n);
y1=y(t,n);
z1=z(t,n);
d=norm([x1 y1 z1]);
if d>d0
    u=DirToPoint([0,0,0],n);
else
    u=[0 0 0];
end
