function [x,y,z,p,q,r]=ActSim(pars)
% function [x,y,p,q]=ActSim(pars)

global N T t x y z p q r D v0 wpc

cp=[-4.0657 -5.4502 4.8301];

K=length(pars.rules);
FN=fieldnames(pars);
for (i=1:length(FN))
    var=genvarname(FN{i});
    eval([var '=pars.' FN{i} ';']);
end

% initialization
x=2*Bnds*(rand(1,N)-0.5);
y=2*Bnds*(rand(1,N)-0.5);
z=2*Bnds*(rand(1,N)-0.5);
a(1,:)=2*pi*(rand(1,N)-0.5);
a2(1,:)=2*pi*(rand(1,N)-0.5);
p(1,:)=cos(a);
q(1,:)=sin(a).*cos(a2);
r(1,:)=sin(a).*sin(a2);
M=size(WP,1);
wpc=zeros(M,N); wpc(1,:)=1;
global flag;
flag=zeros(3,1);
% main loop
for t=1:T-1
    D=ActorsDist();	
    for n=1:N

		u1=[p(t,n) q(t,n) r(t,n)];
		u2=zeros(1,3);
		for k=1:K
			if w(k)>0
				eval(pars.rules(k).rule);
				du(k,:)=u;
				u2=u2+w(k)*du(k,:);
			end
		end
		u2=VecNorm(u2);
		u0=(1-c)*u1+c*u2;
		u=VecNorm(u0);
		p(t+1,n)=u(1);
		q(t+1,n)=u(2);
        r(t+1,n)=u(3);
		x(t+1,n)=x(t,n)+u(1)*v0*dt;
		y(t+1,n)=y(t,n)+u(2)*v0*dt;
        z(t+1,n)=z(t,n)+u(3)*v0*dt;
    end
    eval([pars.world '(Bnds);']);
    pause(0.01)
    if t>1
        cp=campos;
    end
    figure(998)
%     hold on
	if length(pars.world)==7 & pars.world=='Reflect'
        
		plot3(x(t:t+1,:),y(t:t+1,:),z(t:t+1,:),'.-'); hold on
		plot3(x(t+1,:),y(t+1,:),z(t+1,:),'o','MarkerSize',2); hold off;hold off
        campos(cp);
        grid on;
 %        view(30+0.4*t,30-0.06*t)
	else
		plot3(x(t,:),y(t,:),z(t,:),'*'); hold on
		plot3(x(t,:),y(t,:),z(t,:),'o'); hold off
        campos(cp);
        grid on;
    end
    
	axis([-Bnds Bnds -Bnds Bnds -Bnds Bnds]);
end
x(T,:)=1e5*ones(1,N);
y(T,:)=1e5*ones(1,N);
z(T,:)=1e5*ones(1,N);
save