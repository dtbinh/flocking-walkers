function u=DirToGroup(G,n)
% function u=DirToGroup(G,n)
%
% INPUT
% G       array which contains members of group for every actor
% n       ego-Actor id (INPUT)
% 
% OUTPUT
% u       normalized average direction vector from ego-Actor n to group G (OUTPUT)

global N T t x y p q D v0 wpc

% x0=mean(x(t,G));
% y0=mean(y(t,G));
% 
% p0=x0-x(t,n);
% q0=y0-y(t,n);
% u=VecNorm([p0,q0]);

x0=0; y0=0;
index1=0;
for i=1:N
    if G(n,i)==1
        x0=x0+x(t,i);
        y0=y0+y(t,i);
        index1=index1+1;
    end
end
x0=x0/index1;
y0=y0/index1;
p0=x0-x(t,n);
q0=y0-y(t,n);
u=VecNorm([p0,q0]);