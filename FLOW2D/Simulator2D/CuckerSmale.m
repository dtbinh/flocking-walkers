function u=CuckerSmale(b,n)
% function u=CuckerSmale(b,n)
% 
% INPUT
% b      the exponential factor of the Cucker-Smale model (INPUT)
% n      ego-Actor id (INPUT)
%
% OUTPUT
% u      normalized direction vector of the Cucker-Smale model (OUTPUT)

global N T t x y p q D v0 wpc Others


for i=1:N
    Aij(i,i)=1;
    for j=i+1:N
        Aij(i,j)=1/(1+(x(t,i)-x(t,j))^2+(y(t,i)-y(t,j))^2)^(b);
        Aij(j,i)=Aij(i,j);
    end
end

u=[p(t,:)-p(t,n);q(t,:)-q(t,n)]*Aij(:,n)+[p(t,n);q(t,n)];
u=VecNorm(u);


%
% hood=ActorHood(d,n);
% 
% p0=0; q0=0;
% if length(hood)>1
% 	p0=mean(p(t,hood));
% 	q0=mean(q(t,hood));
% end
% u=VecNorm([p0,q0]);