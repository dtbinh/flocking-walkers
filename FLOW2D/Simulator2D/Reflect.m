function Reflect(Bnds)
% function Reflect(Bnds)
%
% INPUT
% Bnds          specifies the square -Bnds<=x<=Bnds, -Bnds<=y<=Bnds (INPUT)

global N T t x y p q D v0 wpc

for n=1:N
	if x(t+1,n)>Bnds; x(t+1,n)=2*Bnds-x(t+1,n); p(t+1,n)=-p(t+1,n); end
	if x(t+1,n)<-Bnds; x(t+1,n)=-2*Bnds-x(t+1,n); p(t+1,n)=-p(t+1,n); end
	if y(t+1,n)>Bnds; y(t+1,n)=2*Bnds-y(t+1,n); q(t+1,n)=-q(t+1,n); end
	if y(t+1,n)<-Bnds; y(t+1,n)=-2*Bnds-y(t+1,n); q(t+1,n)=-q(t+1,n); end
end        
    
