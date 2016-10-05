function u=FollowWayPoints(WP,d0,doff,n)
% function u=FollowWayPoints(WP,d0,doff,n)
%
% INPUT
% WP       list of waypoint coordinates (INPUT)
% d0       distance at which waypoint is achieved (INPUT)
% doff     offset when more than one Actors follow same waypoint (INPUT)
% n        the ego-Actor id (INPUT)
%
% OUTPUT
% u        direction vector required to follow current waypoint (OUTPUT)

global N T t x y p q D v0 wpc

r1=[x(t,n),y(t,n)];
i=find(wpc(:,n)==1);
if length(i)~=1
	u=[0,0];
else
	r2=WP(i,:);
	if norm(r1-r2)<d0
		wpc(i,n)=0;
		i=i+1;
		if i<=size(WP,1); 
			wpc(i,n)=1; 
			r2=WP(i,:);
        else
            wpc(i-size(WP,1),n)=1;
            r2=WP(i-size(WP,1),:);
        end
        
	end
	u=DirToPoint(r2,n);
end
	
		