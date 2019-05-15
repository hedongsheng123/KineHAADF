function [ Out ] = readcoor( filepos )
%   read in coordinates

peroidtable={'H','He',...
    'Li','Be','B','C','N','O','F','Ne',...
    'Na','Mg','Al','Si','P','S','Cl','Ar',...
    'K','Ca','Sc','Ti','V','Cr','Mn','Fe','Co','Ni','Cu','Zn','Ga','Ge','As','Se','Br','Kr',...
    'Rb','Sr','Y','Zr','Nb','Mo','Tc','Ru','Rh','Pd','Ag','Cd','In','Sn','Sb','Te','I','Xe',...
    'Cs','Ba','La','Ce','Pr','Nd','Pm','Sm','Eu','Gd','Td','Dy','Ho','Er','Tm','Yb','Lu','Hf','Ta','W','Re','Os','Ir','Pt','Au','Hg','TI','Pb','Bi','Po','At','Rn',...
    'Fr','Ra','Ac','Th','Pa','U','Np','Pu','Am','Cm','Bk','Cf','Es','Fm','Md','No','Lr'
    };

FID=fopen(filepos,'r');

line=fgets(FID);
Tollength=1;
while  ischar(line)
     XX(Tollength,1:4)=textscan(line,'%s %f32 %f32 %f32');
    line=fgets(FID);
   Tollength=Tollength+1;
end

DDD=cellfun(@isempty,XX);
XX(DDD)={NaN};

SYN(1:4)=0;
for i=1:Tollength-1
    SYN(1)=iscellstr(XX{i,1});
    SYN(2)=1-isnan(XX{i,2});
    SYN(3)=1-isnan(XX{i,3});
    SYN(4)=1-isnan(XX{i,4});
    if (sum(SYN(1:4))<4)
     Stalin = i;
   end   
end

for i=1:Tollength-1-Stalin
   [m,Out(i,1)]=ind2sub(size(peroidtable),strmatch(XX{i+Stalin,1},peroidtable,'exact'));
end

Out(1:(Tollength-1-Stalin),2:4)=cell2mat(XX((Stalin+1):(Tollength-1),2:4));

fclose('all');

end

