function u=GroupDir(G)
% function u=GroupDir(G)
%
% u      is the average direction of group G
% G      set (Matlab vector( which containes members of group (INPUT)

global N T t x y p q D v0 wpc

p0=mean(p(t,G));
q0=mean(q(t,G));
u=VecNorm([p0,q0]);
