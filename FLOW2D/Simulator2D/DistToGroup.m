function d=DistToGroup(G,n)
% function d=DistToGroup(G,n)
%
% INPUT
% G      target group of Actors (INPUT)
% n      ego-Actor id (INPUT)
%
% OUTPUT
% d      distance from ego-Actor to centroid of group G (OUTPUT)



global N T t x y p q D v0 wpc

% x0=mean(x(t,G));
% y0=mean(y(t,G));

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


d=sqrt((x(t,n)-x0)^2+(y(t,n)-y0)^2);
