function u=DirOfActor(m,n)
% function u=DirOfActor(n)
%
% u      normalized direction vector of Actor m (OUTPUT)
% n      no. of Actor whose direction we seek (INPUT)

global N T t x y z p q r D v0 wpc

if 0<m & m<=N & m~=n
	p0=p(t,m);
	q0=q(t,m);
    r0=r(t,m);
	u=VecNorm([p0,q0,r0]);
else
	u=[0,0,0];
end