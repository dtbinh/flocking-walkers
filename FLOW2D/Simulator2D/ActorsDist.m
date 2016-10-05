function D=ActorsDist()
% function D=ActorsDist()
% 
% OUTPUT
% D      N-by-N matrix of pairwise distances of all actors (OUTPUT)

global N T t x y p q D v0 wpc

D=zeros(N,N);
for n1=1:N
	for n2=n1+1:N
		D(n1,n2)=norm([x(t,n1)-x(t,n2),y(t,n1)-y(t,n2)]);
		D(n2,n1)=D(n1,n2);
	end
end
