function FLOW()
% function FLOW()
% GUI for the FLOcking Walkers (FLOW) Matlab Toolbox
%
% 2012-2013 L. Eleftheriou and Ath. Kehagias
%

%% INITIALIZATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
%global bg1h

%% LOAD THE RULES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
K=0;
fid=fopen('FunctionList.txt','r');
while ~feof(fid)
    line1= fgetl(fid);
    if ~isempty(line1)
       K = K+1;
       ETRule(K).string=line1;
    end
end
fclose(fid);

%% THE GUI %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% create base GUI / figure
fh= figure('Visible','on','Name','NonLinear Walkers','Resize','off','NumberTitle','off','MenuBar','none','Color',[0.8 0.8 0.8],'Position',[201,51,710,710]);

% create the menus
m1h=uimenu('Label','File');
uimenu(m1h,'Label','Load Script','Callback',@ScriptLoadC);
uimenu(m1h,'Label','Save Script','Callback',@ScriptSaveC);
uimenu(m1h,'Label','Exit','Callback',@GUICloseC);
m2h=uimenu('Label','Help');
uimenu(m2h,'Label','Quick Start','Callback',@HelpQuickC);
uimenu(m2h,'Label','User Manual','Callback',@HelpManualC);
uimenu(m2h,'Label','About NonLinearWalkers','Callback',@HelpAboutC);

% create titles
T(1).H = uicontrol(fh,'Style','text','String','Simulation Pars','BackgroundColor',[0.8 0.8 0.8],'HorizontalAlignment','left','FontSize',14,'FontWeight','bold','Position',[10,651,200,50]);
T(2).H = uicontrol(fh,'Style','text','String','Weights','BackgroundColor',[0.8 0.8 0.8],'HorizontalAlignment','left','FontSize',14,'FontWeight','bold','Position',[225,651,100,50]);
T(3).H = uicontrol(fh,'Style','text','String','Rules','BackgroundColor',[0.8 0.8 0.8],'HorizontalAlignment','left','FontSize',14,'FontWeight','bold','Position',[310,651,100,50]);

% create labels / editboxes for Simulation Parameters
T(4).H= uicontrol(fh,'Style','text','String','NumOfAgents','BackgroundColor',[0.8 0.8 0.8],'HorizontalAlignment','left','Position',[10,621,100,50]);
T(5).H= uicontrol(fh,'Style','text','String','NumOfSteps','BackgroundColor',[0.8 0.8 0.8],'HorizontalAlignment','left','Position',[10,591,100,50]);
T(6).H= uicontrol(fh,'Style','text','String','WorldSize','BackgroundColor',[0.8 0.8 0.8],'HorizontalAlignment','left','Position',[10,561,100,50]);
T(7).H= uicontrol(fh,'Style','text','String','DeltaTime','BackgroundColor',[0.8 0.8 0.8],'HorizontalAlignment','left','Position',[10,531,100,50]);
T(8).H= uicontrol(fh,'Style','text','String','Speed','BackgroundColor',[0.8 0.8 0.8],'HorizontalAlignment','left','Position',[10,501,100,50]);
ETPars(1).H=uicontrol(fh,'Style','edit','String','10','Position',[110 651 50 20],'HorizontalAlignment','left','BackGround','white','Callback',@EdTextC);
ETPars(2).H=uicontrol(fh,'Style','edit','String','1000','Position',[110 621 50 20],'HorizontalAlignment','left','BackGround','white','Callback',@EdTextC);
ETPars(3).H=uicontrol(fh,'Style','edit','String','100','Position',[110 591 50 20],'HorizontalAlignment','left','BackGround','white','Callback',@EdTextC);
ETPars(4).H=uicontrol(fh,'Style','edit','String','1','Position',[110 561 50 20],'HorizontalAlignment','left','BackGround','white','Callback',@EdTextC);
ETPars(5).H=uicontrol(fh,'Style','edit','String','5','Position',[110 531 50 20],'HorizontalAlignment','left','BackGround','white','Callback',@EdTextC);

% create labels for World Boundaries
bgh=uibuttongroup('Parent',fh,'Title','World Boundaries','BackgroundColor',[0.8 0.8 0.8],'Units','pixels','Position',[10,391,152,100]);
bg1h =uicontrol(bgh,'Style','radiobutton','String','Reflective','BackgroundColor',[0.8 0.8 0.8],'Units','pixels','Position',[10,35,100,50]);
bg2h =uicontrol(bgh,'Style','radiobutton','String','Toroidal','BackgroundColor',[0.8 0.8 0.8],'Units','pixels','Position',[10,02,100,50]);
save bg1h bg1h

% create labels / editboxes for Viewer Parameters
T(9).H = uicontrol(fh,'Style','text','String','Viewer Pars','BackgroundColor',[0.8 0.8 0.8],'HorizontalAlignment','left','FontSize',14,'FontWeight','bold','Position',[10,320,200,50]);
T(10).H= uicontrol(fh,'Style','text','String','Anim. Speed','BackgroundColor',[0.8 0.8 0.8],'HorizontalAlignment','left','Position',[10,290,100,50]);
T(11).H= uicontrol(fh,'Style','text','String','Camera Ds','BackgroundColor',[0.8 0.8 0.8],'HorizontalAlignment','left','Position',[10,260,100,50]);
T(12).H= uicontrol(fh,'Style','text','String','Camera Da','BackgroundColor',[0.8 0.8 0.8],'HorizontalAlignment','left','Position',[10,230,100,50]);
T(13).H= uicontrol(fh,'Style','text','String','Time Scale ','BackgroundColor',[0.8 0.8 0.8],'HorizontalAlignment','left','Position',[10,200,100,50]);
T(14).H= uicontrol(fh,'Style','text','String','Terrain Scale','BackgroundColor',[0.8 0.8 0.8],'HorizontalAlignment','left','Position',[10,170,100,50]);
T(15).H= uicontrol(fh,'Style','text','String','Actor Scale','BackgroundColor',[0.8 0.8 0.8],'HorizontalAlignment','left','Position',[10,140,100,50]);
ETPars(6).H=uicontrol(fh,'Style','edit','String','60','Position',[110 320 50 20],'HorizontalAlignment','left','BackGround','white','Callback',@EdTextC);
ETPars(7).H=uicontrol(fh,'Style','edit','String','1','Position',[110 290 50 20],'HorizontalAlignment','left','BackGround','white','Callback',@EdTextC);
ETPars(8).H=uicontrol(fh,'Style','edit','String','5','Position',[110 260 50 20],'HorizontalAlignment','left','BackGround','white','Callback',@EdTextC);
ETPars(9).H=uicontrol(fh,'Style','edit','String','3','Position',[110 230 50 20],'HorizontalAlignment','left','BackGround','white','Callback',@EdTextC);
ETPars(10).H=uicontrol(fh,'Style','edit','String','1','Position',[110 200 50 20],'HorizontalAlignment','left','BackGround','white','Callback',@EdTextC);
ETPars(11).H=uicontrol(fh,'Style','edit','String','20','Position',[110 170 50 20],'HorizontalAlignment','left','BackGround','white','Callback',@EdTextC);

% create labels /editboxes for Obstacles
T(16).H = uicontrol(fh,'Style','text','String','Obstacles','BackgroundColor',[0.8 0.8 0.8],'HorizontalAlignment','left','FontSize',14,'FontWeight','bold','Position',[10,100,200,50]);
ETPars(12).H=uicontrol(fh,'Style','edit','String','[   ]','Position',[10 100 160 20],'HorizontalAlignment','left','BackGround','white','Callback',@EdTextC);

% create labels / editboxes for Weights and Rules
for i=1:K
	ETWeight(i).H=uicontrol(fh,'Style','edit','String','0.0','Position',[260 710-(i+1)*30 40 20],'HorizontalAlignment','left','BackGround','white','Callback',@EdTextC);
	ETRule(i).H  =uicontrol(fh,'Style','edit','Value',i,'String',ETRule(i).string,'Position',[310 710-(i+1)*30 300 20],'HorizontalAlignment','left','BackGround','white','Callback',@EdTextC,'Enable','on','ButtonDownFcn',@EdTextB);
end
ETWeight(K+1).H=uicontrol(fh,'Style','edit','String','0.0','Position',[260 710-(K+2)*30 40 20],'HorizontalAlignment','left','BackGround','white','Callback',@EdTextC);
T(16).H= uicontrol(fh,'Style','text','String','GLOBAL RULE WEIGHT','BackgroundColor',[0.8 0.8 0.8],'HorizontalAlignment','left','Position',[310,705-(K+3)*30,200,50],'FontSize',10,'FontWeight','bold');

% create RUN!!! button
pb09h=uicontrol(fh,'Style','pushbutton','String','RUN!!!','Position',[610 10 90 30],'FontSize',13,'FontWeight','bold','Callback',@RunButtonC);
pb08h=uicontrol(fh,'Style','pushbutton','String','View Again','Position',[510 10 90 30],'FontSize',11,'FontWeight','bold','Callback',@ViewButtonC);

% save handles to GUI form data
save Data fh ETPars ETWeight ETRule K

%% End of Main GUI specification  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% CALLBACK FUNCTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Executes on pressing the Run Button %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function RunButtonC(hObject, eventdata)
load bg1h
SaveScript('xp00.m');
%feval(@xp00);
run xp00

%% Executes on pressing the ViewAgain Button %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ViewButtonC(hObject, eventdata)
cd ..\Viewer
h=actxserver('WScript.Shell');
h.Run('..\Viewer\DBV01.exe'); pause(3);
h.AppActivate('..\Viewer\DBV01.exe');
cd ..\Simulator2D

%% Executes on editing EditTexts %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function EdTextC(hObject,eventdata)
load Data
s1 = get(hObject,'String');
save Data fh ETPars ETWeight ETRule K

%% Executes on Right Click on Rule / Opens HELP POPUP %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function EdTextB(hObject,eventdata)
global fh1
%get(hObject,'Value')
s1=get(hObject,'String');
[s21 s22]=strtok(s1,'=');
fname=[strtok(s22(2:end),'(') '.m'];

fid=fopen(fname,'r');
k=0;
line1=fgetl(fid);
while ~feof(fid)
    line1= fgetl(fid);
    if (~isempty(line1) && line1(1)=='%')
       k = k+1;
       HelpText(k).string=line1;
	   %disp(HelpText(k).string)
	else
		break
    end
end
fh1=figure('Name',fname,'NumberTitle','off','UserData',get(hObject,'Value'),'MenuBar','none','Position',[301,301,900,200]);
pb_close=uicontrol(fh1,'Style','pushbutton','String','Close','Position',[691 1 100 20],'FontSize',10,'FontWeight','bold','Callback',@CloseButtonC);
pb_reset=uicontrol(fh1,'Style','pushbutton','String','Reset','Position',[795 1 100 20],'FontSize',10,'FontWeight','bold','Callback',@ResetButtonC);

axis off
for i=1:k
	if i==1; FontWeight='Bold'; else; FontWeight='Normal'; end
	text(0,1-i/10,HelpText(i).string(2:end),'FontName','Courier','FontWeight', FontWeight);
end

%%%%%%%%%%%%%%%%%%%%%%%%%
function CloseButtonC(hObject, eventdata)
global fh1
close(fh1)

function ResetButtonC(hObject, eventdata)
%global ETRule
%global ETWeight
load Data
global fh1
%if (get(fh,'CurrentCharacter')=={'shift'})
% eventdata.Modifier;
% if (strcmp(eventdata.Modifier,'control')==1)
%     set(hObject,'String',ETRule(get(hObject,'Value')).string);
%     set(ETWeight(get(hObject,'Value')).H,'String','0.0');
% end
set(ETRule(get(fh1,'UserData')).H,'String',ETRule(get(fh1,'UserData')).string);
set(ETWeight(get(fh1,'UserData')).H,'String','0.0');
close(fh1)


%% ?????????????????????????????? %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function LoadScriptC(hObject, eventdata)
%% ??? REMOVE THIS ????
%{
global ETRule
global K
for k=1:K
disp(get(ETRule(k).H,'String'))
end
%}
%% Write Parameters in Script File %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function SaveScript(fname)
%global bg1h
load data;
load bg1h;

%disp(get(ETPars(1).H,'String'))

%fid=fopen('xp00.m','w');
fid=fopen(fname,'w');
fname1=strtok(fname,'.');
fprintf(fid,['function ' fname1 '()\n'] );
fprintf(fid,'clear all\n');
fprintf(fid,'fh1=figure(998); clf; set(fh1,''NumberTitle'',''off''); set(fh1,''Name'',''Dynamic Trajectories'')\n');
fprintf(fid,'fh2=figure(999); clf; set(fh2,''NumberTitle'',''off''); set(fh2,''Name'',''Static Trajectories'')\n');

fprintf(fid,['fname=''' fname1 ''';\n']);
fprintf(fid,'addpath ../Simulator2D\n');
fprintf(fid,'%%----------------------------------------- SIMULATION PARAMETERS -----------------------------------------\n');
fprintf(fid,'pars.obstacles=%s;\n',get(ETPars(12).H,'String'));
fprintf(fid,'pars.N=%s;\n',get(ETPars(1).H,'String'));
fprintf(fid,'pars.T=%s;\n',get(ETPars(2).H,'String'));
fprintf(fid,'pars.Bnds=%s;\n',get(ETPars(3).H,'String'));
fprintf(fid,'pars.dt=%s;\n',get(ETPars(4).H,'String'));
fprintf(fid,'pars.v0=%s;\n',get(ETPars(5).H,'String'));
get(bg1h,'Value');
if get(bg1h,'Value')==1
	fprintf(fid,'pars.world=''Reflect'';\n');
else
	fprintf(fid,'pars.world=''Clip'';\n');
end
fprintf(fid,'tt=[0:0.3:1000]''; pars.WP=50*[cos(1*tt),sin(3*tt)];\n');                               %!!!!!!!!!!!!!!!! This needs fixing
fprintf(fid,'%%-------------------------------------------- RULES PARAMETERS -------------------------------------------\n');
for i=1:K;
	a=num2str(i);
	b=get(ETWeight(i).H,'String');
	c=get(ETRule(i).H,'String');
	fprintf(fid,'w(%s)=%s; 	pars.rules(%s).rule=''%s;'';\n',a,b,a,c);
end
fprintf(fid,'pars.w=w;\n');
fprintf(fid,'pars.c=%s;\n',get(ETWeight(K+1).H,'String'));
fprintf(fid,'%%------------------------------------------- VIEWER PARAMETERS -------------------------------------------\n');
fprintf(fid,'VAnim=%s;\n',get(ETPars(6).H,'String'));
fprintf(fid,'CamDs=%s;\n',get(ETPars(7).H,'String'));
fprintf(fid,'CamDa=%s;\n',get(ETPars(8).H,'String'));
fprintf(fid,'InterpStep=%s;\n',get(ETPars(9).H,'String'));
fprintf(fid,'ScaleTerrain=%s;\n',get(ETPars(10).H,'String'));
fprintf(fid,'ScaleActor=%s;\n',get(ETPars(11).H,'String'));
fprintf(fid,'SaveVuPars(VAnim,CamDs,CamDa,InterpStep,ScaleTerrain,ScaleActor,pars);\n');

fprintf(fid,'%%--------------------------------------------- RUN SIMULATION  -------------------------------------------\n');
fprintf(fid,'[x,y,p,q]=ActSim(pars);\n');
fprintf(fid,'figure(999); plot(x(1:pars.T-1,:),y(1:pars.T-1,:))\n');
fprintf(fid,'%%----------------------------------------------- SAVE DATA -----------------------------------------------\n');
fprintf(fid,'X=reshape(x'',pars.T*pars.N,1); save([fname ''_x.txt''],''X'',''-ascii'')\n');
fprintf(fid,'Y=reshape(y'',pars.T*pars.N,1); save([fname ''_y.txt''],''Y'',''-ascii'')\n');
fprintf(fid,'feval(''system'',[''copy  '' fname ''_x.txt ..\\Viewer\\x.txt'']);\n');
fprintf(fid,'feval(''system'',[''copy  '' fname ''_y.txt ..\\Viewer\\y.txt'']);\n');
fprintf(fid,'%%----------------------------------------------- RUN VIEWER ----------------------------------------------\n');
fprintf(fid,'cd ..\\Viewer\n');
fprintf(fid,'h=actxserver(''WScript.Shell'');\n');
fprintf(fid,'h.Run(''..\\Viewer\\DBV01.exe''); pause(3);\n');
fprintf(fid,'h.AppActivate(''..\\Viewer\\DBV01.exe'');\n');
fprintf(fid,'cd ..\\Simulator2D\n');
fclose(fid);

%% Executes on choosing menu File/Save %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ScriptSaveC(hObject, eventdata)
try
    load Data;
    FileName1 = uiputfile;
    save Data fh ETPars ETWeight ETRule K;
    SaveScript([strtok(FileName1,'.') '.m']);
catch
end
%% Executes on choosing menu File/Open %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ScriptLoadC(hObject, eventdata)
try

load Data;
FileName1 = uigetfile;
fid=fopen(FileName1);

for i=1:7; fgetl(fid); end
strng=fgetl(fid);
[L,R]=strtok(strng,'=');
J=length(R);
set(ETPars(12).H,'String',R(2:J-1));
for i=1:5
	strng=fgetl(fid);
	[L,R] = strtok(strng,'=');
	J=length(R);
	set(ETPars(i).H,'String',R(2:J-1));
end
for i=1:3; fgetl(fid); end
i=0;
strng=fgetl(fid);
while length(strng)~=9
	i=i+1;
	[L,R] = strtok(strng,';');
	[LL,LR]=strtok(L,'=');LR=strtrim(LR); J=length(LR);
	set(ETWeight(i).H,'String',LR(2:J));

	[RL,RR]=strtok(R,'=');J=length(RR);set(ETRule(i).H,'String',num2str(RR(3:J-3)));
	strng=fgetl(fid);
end
strng=fgetl(fid); [L,R] = strtok(strng,'=');J=length(R);set(ETWeight(i+1).H,'String',R(2:J-1));
strng=fgetl(fid);
for i=6:11
	strng=fgetl(fid);
	[L,R] = strtok(strng,'=');
	J=length(R);
	set(ETPars(i).H,'String',R(2:J-1))
end


fclose(fid);

save Data fh ETPars ETWeight ETRule K;


catch
end
%% Executes on chooing menu Help/QuickStart %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function HelpQuickC(hObject, eventdata)
winopen('QuickHelp.pdf')

%% Executes on chooing menu Help/Manual  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function HelpManualC(hObject, eventdata)
winopen('QuickHelp.pdf')

%% Executes on chooing menu Help/About FLOW %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function HelpAboutC(hObject, eventdata)
winopen('QuickHelp.pdf')

function GUICloseC(hObject, eventdata)
load Data
close(fh)