function u=DirToActor(m,n)
% function u=DirToActor(m,n)
%
% INPUT
% m      no. of target Actor (INPUT)
% n      ego-Actor id (INPUT)
%
% OUTPUT
% u      normalized direction vector from ego-Actor to target Actor m (OUTPUT)

global N T t x y p q D v0 wpc

p0=x(t,m)-x(t,n);
q0=y(t,m)-y(t,n);
u=VecNorm([p0,q0]);