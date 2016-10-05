function A=ActorsAngl()
global a N T v dt zor zoo zoa Bnds x y p q t A D
A=zeros(N,1);
for k=1:N
    A(k)=mod(atan2(q(t,k),p(t,k)),2*pi);
end
