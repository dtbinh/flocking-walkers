function xp00()
clear all
fh1=figure(998); clf; set(fh1,'NumberTitle','off'); set(fh1,'Name','Dynamic Trajectories'); rotate3d on;
fh2=figure(999); clf; set(fh2,'NumberTitle','off'); set(fh2,'Name','Static Trajectories')
fname='xp00';
addpath ../Simulator3D
%----------------------------------------- SIMULATION PARAMETERS -----------------------------------------
pars.N=20;
pars.T=1000;
pars.Bnds=100;
pars.dt=1;
pars.v0=5;
pars.world='Reflect';
tt=[0:0.3:1000]'; pars.WP=50*[cos(1*tt),sin(3*tt)];
%-------------------------------------------- RULES PARAMETERS -------------------------------------------
w(1)=0; 	pars.rules(1).rule='u=DirOfActor(1);';
w(2)=0.0; 	pars.rules(2).rule='u=DirOfField(FH,n);';
w(3)=0.0; 	pars.rules(3).rule='u=DirOfGroup(G);';
w(4)=0.0; 	pars.rules(4).rule='u=DirOfHood(d,n);';
w(5)=0.0; 	pars.rules(5).rule='u=DirOfNearest(n);';
w(6)=0; 	pars.rules(6).rule='u=DirToActor(1,n);';
w(7)=0.0; 	pars.rules(7).rule='u=DirToGroup(G,n);';
w(8)=0.0; 	pars.rules(8).rule='u=DirToHood(d,n);';
w(9)=0.0; 	pars.rules(9).rule='u=DirToNearest(n);';
w(10)=0.0; 	pars.rules(10).rule='u=DirToPoint(r0,n);';
w(11)=0.0; 	pars.rules(11).rule='u=AttractRepel(A,n);';
w(12)=0.1; 	pars.rules(12).rule='u=AvoidNearestActor(15,n);';
w(13)=0.0; 	pars.rules(13).rule='u=Flock(davoid,dhood,n);';
w(14)=0.0; 	pars.rules(14).rule='u=CuckerSmale(b,n);';
w(15)=0.1; 	pars.rules(15).rule='u=FollowWayPoints([50 50 50;50 -50 50;50 -50 -50;-50 -50 -50;-50 50 -50],20,2,n);';
w(16)=0.0; 	pars.rules(16).rule='u=StayInDisc(R0,n);';
w(17)=0.0; 	pars.rules(17).rule='u=SteepestDescent(FH,da,n);';
pars.w=w;
pars.c=0.3;
%--------------------------------------------- RUN SIMULATION  -------------------------------------------
[x,y,z,p,q,r]=ActSim(pars);
figure(999); plot3(x(1:pars.T-1,:),y(1:pars.T-1,:),z(1:pars.T-1,:));grid on;
