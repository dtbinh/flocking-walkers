function u=DirOfField(FH,n)
% function u=DirOfField(FH,n)
%
% u       normalized direction vector as given by function handle FH (OUTPUT)
% FH      handle to function u=F(x,y,t,n); which gives direction field (INPUT) 
%         F is a function of coords (x,y) (for all actors); current actor n is also provided
% n       ego-Actor id (INPUT)

global N T t x y z p q r D v0 wpc

x1=x(t,:);
y1=y(t,:);
z1=z(t,:);

u=FH(x1,y1,z1,t,n);
u=VecNorm(u);