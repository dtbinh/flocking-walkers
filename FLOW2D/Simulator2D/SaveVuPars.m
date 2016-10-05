function SaveVuPars(VAnim,CamDs,CamDa,InterpStep,ScaleTerrain,ScaleActor,pars)
% function SaveVuPars(VAnim,CamDs,CamDa,InterpStep,
% ScaleTerrain,ScaleActor,pars)
% 
% Saves the visualization parameters in DBVin.txt
fid=fopen('../Viewer/DBVin.txt','w');
fprintf(fid,'%5i #NumAgents\n',pars.N);
fprintf(fid,'%5i #WorldBounds\n',pars.Bnds);
fprintf(fid,'%5i #Vanim\n',VAnim);
fprintf(fid,'%5i #CamDs\n',CamDs);
fprintf(fid,'%5i #CamDa\n',CamDa);
fprintf(fid,'%5i #InterpStep\n',InterpStep);
fprintf(fid,'%5i #ScaleTerrain\n',ScaleTerrain);
fprintf(fid,'%5i #ScaleActor\n',ScaleActor);
fprintf(fid,'x.txt # x-coordinates file\n');
fprintf(fid,'y.txt # z-coordinates file\n');
fclose(fid);
