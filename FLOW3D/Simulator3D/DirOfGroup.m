function u=DirOfGroup(G)
% function u=DirOfGroup(G)
%
% u       normalized average direction vector for group G (OUTPUT)
% G       set (really vector) which contains members of group

global N T t x y z p q r D v0 wpc

p0=0; q0=0; r0=0;
if length(G)>0
	p0=mean(p(t,G));
	q0=mean(q(t,G));
    r0=mean(r(t,G));
end
u=VecNorm([p0,q0,r0]);