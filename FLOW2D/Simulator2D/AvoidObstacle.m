function u=AvoidObstacle(obstacles,n)

global N T t x y p q D v0 wpc
NumOfObs=size(obstacles,1);
c=obstacles(:,1:2);
r=obstacles(:,3);
u=[0 0];
for i=1:NumOfObs
    if norm([x(t,n)-c(i,1) y(t,n)-c(i,2)])<=2*r(i)
        if abs(q(t,n)/p(t,n)*c(i,1)-c(i,2)+y(t,n)-q(t,n)/p(t,n)*x(t,n))/sqrt(q(t,n)^2/p(t,n)^2+1)<=4/3*r(i)
            
            dir2point=DirToPoint(c(i,:),n);
            dir2point=[dir2point 0];
            cr_pr=cross(dir2point,[p(t,n) q(t,n) 0]);
            sgn=sign(cr_pr(3));
            dir2point=DirToPoint(c(i,:),n);
            ang=sgn*pi/2;
            u0=VecNorm([cos(ang) -sin(ang);sin(ang) cos(ang)]*dir2point');
            u=u+(1+2*rand(1))*u0';
        end
    end
end
u=VecNorm(u);