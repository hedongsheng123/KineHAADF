function  Savesimuandcoord(hhardball,hsimu,hfft,hfftima,newcc,hname)

%global newc
savename=get(hname,'string');

if (exist(strcat(savename,'_hardball.jpg'),'file')==2)||(exist(strcat(savename,'_simu.jpg'),'file')==2)||(exist(strcat(savename,'_FFT.jpg'),'file')==2)||(exist(strcat(savename,'_coor.xyz'),'file')==2)
    warningMessage=sprintf('The file has already exsited!')
    uiwait(msgbox( warningMessage))
else
    
[image1,X]=getframe(hhardball);
imwrite(image1,strcat(savename,'_hardball.jpg'))

[image1,X]=getframe(hsimu);
imwrite(image1,strcat(savename,'_simu.jpg'))

if get(hfft,'Value')
[image1,X]=getframe(hfftima);
imwrite(image1,strcat(savename,'_FFT.jpg'))
end

imagedata=get(hsimu,'Children');
imagedata=get(imagedata,'CData');
saveaction=['save ' savename '.txt' ' imagedata -ascii'];
eval(saveaction);

peroidtable={'H','He',...
    'Li','Be','B','C','N','O','F','Ne',...
    'Na','Mg','Al','Si','P','S','Cl','Ar',...
    'K','Ca','Sc','Ti','V','Cr','Mn','Fe','Co','Ni','Cu','Zn','Ga','Ge','As','Se','Br','Kr',...
    'Rb','Sr','Y','Zr','Nb','Mo','Tc','Ru','Rh','Pd','Ag','Cd','In','Sn','Sb','Te','I','Xe',...
    'Cs','Ba','La','Ce','Pr','Nd','Pm','Sm','Eu','Gd','Td','Dy','Ho','Er','Tm','Yb','Lu','Hf','Ta','W','Re','Os','Ir','Pt','Au','Hg','TI','Pb','Bi','Po','At','Rn',...
    'Fr','Ra','Ac','Th','Pa','U','Np','Pu','Am','Cm','Bk','Cf','Es','Fm','Md','No','Lr'
    };
Newc(:,1)=peroidtable(newcc(:,1));
kk={newcc(:,2:4)};
Newc(:,2:4)=kk;

filename= strcat(savename,'coor.xyz');
fid=fopen(filename,'w');
fprintf(fid,'%d\r\n\r\n',length(Newc));

for i=1:length(Newc)-1
    fprintf(fid,'%s\t',Newc{i,1});  
    fprintf(fid,'%d\t%d\t%d\r\n',newcc(i,2:4));  
end

 fprintf(fid,'%s\t',Newc{i+1,1});  
    fprintf(fid,'%d\t%d\t%d',newcc(i+1,2:4));  

fclose(fid);
end


end

