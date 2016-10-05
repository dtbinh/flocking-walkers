function [x,y,p,q]=ActSim(pars)
% function [x,y,p,q]=ActSim(pars)


% global variables
global N T t x y p q D v0 wpc A Others


% importing the variables from the "pars" struct
K=length(pars.rules);
FN=fieldnames(pars);
for (i=1:length(FN))     % example: if we have a variable "pars.test123",
    var=genvarname(FN{i}); % member of the struct, we generate a variable 
    eval([var '=pars.' FN{i} ';']); % named "test123"
end
% initialization
x=2*Bnds*(rand(1,N)-0.5); 
y=2*Bnds*(rand(1,N)-0.5);
a(1,:)=2*pi*(rand(1,N)-0.5); 
p(1,:)=cos(a);
q(1,:)=sin(a);
M=size(WP,1);
wpc=zeros(M,N); wpc(1,:)=1;
global flag;
flag=zeros(3,1);
% main loop
for t=1:T-1
    D=ActorsDist();	
    A=ActorsAngl();
% rule computation
    for n=1:N
        Others=OthersCoordinates(n);
		u1=[p(t,n) q(t,n)];
		u2=zeros(1,2);
		for k=1:K
			if w(k)>0
				eval(pars.rules(k).rule);
				du(k,:)=u;
				u2=u2+w(k)*du(k,:);
			end
        end
% obstacle avoidance
        if size(obstacles,1)>0
            u=AvoidObstacle(obstacles,n);
            du(k+1,:)=u;
            u2=u2+100*du(k+1,:);
        end
        
% direction and position update
		u2=VecNorm(u2);
		u0=(1-c)*u1+c*u2;
		u=VecNorm(u0);
		p(t+1,n)=u(1);
		q(t+1,n)=u(2);
		x(t+1,n)=x(t,n)+u(1)*v0*dt;
		y(t+1,n)=y(t,n)+u(2)*v0*dt;
        
    end
    eval([pars.world '(Bnds);']);
    pause(0.01)
    figure(998)
    
    
% obstacle design
    if length(obstacles)>0
        for i=1:size(obstacles,1)
            xc=[obstacles(i,1)-obstacles(i,3):0.1:obstacles(i,1)+obstacles(i,3)];
            k1=obstacles(i,2)+sqrt(obstacles(i,3)^2-(xc-obstacles(i,1)).^2);
            k2=obstacles(i,2)-sqrt(obstacles(i,3)^2-(xc-obstacles(i,1)).^2);
            plot(xc,k1);hold on;
            plot(xc,k2);hold on;
        end
    end
    
% reflect-clip
	if strcmp(world,'Reflect')==1
		plot(x(t:t+1,:),y(t:t+1,:),'.-'); hold on
		plot(x(t+1,:),y(t+1,:),'o','MarkerSize',2); hold off
	else
		plot(x(t,:),y(t,:),'*'); hold on
		plot(x(t,:),y(t,:),'o'); hold off
	end

	axis([-Bnds Bnds -Bnds Bnds]);
end
x(T,:)=1e5*ones(1,N);
y(T,:)=1e5*ones(1,N);

save;