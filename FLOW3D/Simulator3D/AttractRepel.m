function u=AttractRepel(A,n)
% function u=AttractRepel(A,n)
% Combined Attraction / Repulsion of entire group on actor n
%
% u     the direction given by the rule (OUTPUT)
% A     N-by-N matrix, A(n,n1)>0 determines strength of attraction of actor n1 to actor n
%       A(n,n1)>0 means attraction, A(n,n1)<0 means repulsion (INPUT)
% n      ego-Actor id (INPUT)

global N T t x y z p q r D v0 wpc
global flag;
N=size(A,1);
x1=x(t,n);
y1=y(t,n);
z1=z(t,n);
u=[0 0 0];
for i=1:N
    x2=x(t,i);
    y2=y(t,i);
    z2=z(t,i);
    dx=x2-x1;
    dy=y2-y1;
    dz=z2-z1;
    u=u+A(n,i)*[dx dy dz];
end
u=VecNorm(u);
