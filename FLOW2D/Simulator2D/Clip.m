function Clip(Bnds)
% function Clip(Bnds)
%
% INPUT
% Bnds          specifies the torus -Bnds<=x<=Bnds, -Bnds<=y<=Bnds (INPUT)

global N T t x y p q D v0 wpc

for n=1:N
	if x(t+1,n)>Bnds; x(t+1,n)=x(t+1,n)-2*Bnds; end
	if x(t+1,n)<-Bnds; x(t+1,n)=x(t+1,n)+2*Bnds; end
	if y(t+1,n)>Bnds; y(t+1,n)=y(t+1,n)-2*Bnds; end
	if y(t+1,n)<-Bnds; y(t+1,n)=y(t+1,n)+2*Bnds; end
end        
