function [newcc] = Imasi(ha1,ha2,ha3,hZn,hGw,hIL,hIP,hShiftX,hShiftY,Out,hFFT,hsim,hmodel,hFFTi)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


Angle1=get(ha1,'Value')/360*2*pi;
Angle2=get(ha2,'Value')/360*2*pi;
Angle3=get(ha3,'Value')/360*2*pi;
Zn=str2double(get(hZn,'string'));
Gw=str2double(get(hGw,'string'));
IL=str2double(get(hIL,'string'));
IP=str2double(get(hIP,'string'));
ShiftX=get(hShiftX,'Value');
ShiftY=get(hShiftY,'Value');
FFT=get(hFFT,'Value');


Rx=[1 0 0
    0 cos(Angle1) sin(Angle1)
    0 -sin(Angle1) cos(Angle1)];

Ry=[cos(Angle2) 0 -sin(Angle2)
    0 1 0
    sin(Angle2) 0  cos(Angle2)];

Rz=[cos(Angle3) sin(Angle3) 0
    -sin(Angle3) cos(Angle3) 0
    0 0 1];

newc=((Rz*Ry*Rx)*Out(:,2:4)')';
newcc(:,1)=Out(:,1);
newcc(:,2:4)=newc;
pixell=IL/IP;
pixpos(:,1)=round((newc(:,1)-mean(newc(:,1))-ShiftY)/pixell+IP/2);
pixpos(:,2)=round((newc(:,2)-mean(newc(:,2))+ShiftX)/pixell+IP/2);

avico=find(0<pixpos(:,1)&pixpos(:,1)<IP&0<pixpos(:,2)&pixpos(:,2)<IP);
II=zeros(IP);
if length(avico)>=1
for i=1:length(avico)
II(pixpos(avico(i),1),pixpos(avico(i),2))=II(pixpos(avico(i),1),pixpos(avico(i),2))+Out(avico(i),1).^Zn;
end
end

Probe=zeros(IP);
[m,n]=meshgrid(1:IP,1:IP);
Probe=exp((-(m-IP/2).^2-(n-IP/2).^2)/2/(Gw/pixell)^2);
Simma=conv2(II,Probe,'same');

Simima=mat2gray(Simma);
axes(hsim)
imshow(Simima)

axes(hFFTi)
imshow([])
if FFT
    axes(hFFTi)
    SimimaFFT=mat2gray(log(abs(fftshift(fft2(Simma))+1)));
    Simimafft=mat2gray(SimimaFFT/max(max(SimimaFFT))*255);
     imshow(Simimafft);
   %SimimaFFT=mat2gray(log(abs(fftshift(fft2(Simma,round(IP/3),round(IP/3)))+1)));
     %imshow(flipud(SimimaFFT))
    set(hFFTi,'xtick',[],'ytick',[])

end


%%%%hardball model display%%%%%

Uni=unique(Out(avico(:),1));
axes(hmodel);
col='bgrcmyk';
for i= 1:length(Uni)
   clear typeco
   
   k=1;
   for j=1:length(avico)
       
       if Out(avico(j),1)==Uni(i)
        typeco(k,1:2)=pixpos(avico(j),1:2);
        k=k+1;
        end
   end
   
    plot((typeco(:,2)),(typeco(:,1).*(-1)+IP),'o','MarkerFaceColor',col(i))
     xlim([1,IP]);
    ylim([1,IP]);
    hold on
    
end
 
hold off
    
set(hmodel,'xtick',[],'ytick',[])
set(hsim,'xtick',[],'ytick',[])



end

