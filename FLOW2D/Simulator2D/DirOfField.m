function u=DirOfField(FH,n)
% function u=DirOfField(FH,n)
% 
% INPUT
% FH      handle to function u=F(x,y,t,n); which gives direction field (INPUT) 
%         F is a function of coords (x,y) (for all actors); current actor n is also provided
% n       ego-Actor id (INPUT)
% 
% OUTPUT
% u       normalized direction vector as given by function handle FH (OUTPUT)
 
global N T t x y p q D v0 wpc

x1=x(t,:);
y1=y(t,:);

u=FH(x1,y1,t,n);
u=VecNorm(u);