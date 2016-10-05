function Others=OthersCoordinates(n)
global a N T v dt zor zoo zoa Bnds x y p q t A D
for k=1:N
    temp=turn_vector(-A(n),[p(t,k);q(t,k)]);
    Others(k,:)=temp';
end
