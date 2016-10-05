function r=GroupCenter(G)
% function r=GroupCenter(G)
%
% r      (x,y) centroid coordinates of group G (OUTPUT)
% G      set (Matlab vector( which containes members of group (INPUT)

global N T t x y p q D v0 wpc

x0=mean(x(t,G));
y0=mean(y(t,G));
r=[x0,y0];
