function u=DirOfActor(m,n)
% function u=DirOfActor(n)
% 
% INPUT
% m      no. of Actor whose direction we seek (INPUT)
% n      ego-actor
% 
% OUTPUT
% u      normalized direction vector of Actor m (OUTPUT)

global N T t x y p q D v0 wpc



if 0<m & m<=N & m~=n
	p0=p(t,m);
	q0=q(t,m);
	u=VecNorm([p0,q0]);
else
	u=[0,0];
end