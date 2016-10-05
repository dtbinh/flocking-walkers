function u=Func04(x,y,t,n)

u1=VecNorm([-x(n),-y(n)])/norm([-x(n),-y(n)]);
%u2=-VecNorm([30-x(n),-y(n)])/norm([30-x(n),-y(n)]);
u=u1;

if (DistToPoint([0,0],n)<10)
    u=-u;
end