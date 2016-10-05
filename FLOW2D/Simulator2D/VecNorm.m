function un=vecnorm(u)
% function un=vecnorm(u)
% normalizes the vector u tp have unit length

d=norm(u);
if d>0
    un=u/d;
else
    un=[0 0];
end
