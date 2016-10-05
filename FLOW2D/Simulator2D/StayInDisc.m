function u=StayInDisc(d0,n)
% function u=StayInDisc(d0,n)
%
% INPUT
% d0      disc radius (INPUT)
% n      ego-Actor id (INPUT)
% 
% OUTPUT
% u       direction vector to keep ego-Actorin disc of center [0,0] and radius d (OUTPUT)

global N T t x y p q D v0 wpc

x1=x(t,n);
y1=y(t,n);
d=norm([x1 y1]);
if d>d0
    u=DirToPoint([0,0],n);
else
    u=[0 0];
end
