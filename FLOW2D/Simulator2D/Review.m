cd ..\Viewer
h=actxserver('WScript.Shell');
h.Run('..\Viewer\DBV01.exe'); pause(3);
h.AppActivate('..\Viewer\DBV01.exe');
cd ..\Simulator2D