function u=DirOfGroup(G,n)
% function u=DirOfGroup(G,n)
%
% INPUT
% G       array which contains members of group for every actor
% n       ego-actor
% 
% OUTPUT
% u       normalized average direction vector for group G (OUTPUT)

global N T t x y p q D v0 wpc

% p0=0; q0=0;
% if length(G)>0
% 	p0=mean(p(t,G));
% 	q0=mean(q(t,G));
% end
% u=VecNorm([p0,q0]);

p0=0; q0=0;
index1=0;
for i=1:N
    if G(n,i)==1
        p0=p0+p(t,i);
        q0=q0+q(t,i);
        index1=index1+1;
    end
end
u=VecNorm([p0,q0]);