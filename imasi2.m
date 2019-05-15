function varargout = imasi2(varargin)
% IMASI2 MATLAB code for imasi2.fig
%      IMASI2, by itself, creates a new IMASI2 or raises the existing
%      singleton*.
%
%      H = IMASI2 returns the handle to a new IMASI2 or the handle to
%      the existing singleton*.
%
%      IMASI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMASI2.M with the given input arguments.
%
%      IMASI2('Property','Value',...) creates a new IMASI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imasi2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imasi2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imasi2

% Last Modified by GUIDE v2.5 24-Jun-2015 21:53:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imasi2_OpeningFcn, ...
                   'gui_OutputFcn',  @imasi2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before imasi2 is made visible.
function imasi2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imasi2 (see VARARGIN)

% Choose default command line output for imasi2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes imasi2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = imasi2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global coordname
Out=readcoor(coordname);
[newc] = Imasi(handles.slider9,handles.slider10,handles.slider11,handles.edit3,handles.edit1,handles.edit2,handles.edit4,handles.slider1,handles.slider6,Out,handles.radiobutton1,handles.axes2,handles.axes1,handles.axes4);



% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global coordname
Out=readcoor(coordname);
[newc] = Imasi(handles.slider9,handles.slider10,handles.slider11,handles.edit3,handles.edit1,handles.edit2,handles.edit4,handles.slider1,handles.slider6,Out,handles.radiobutton1,handles.axes2,handles.axes1,handles.axes4);



% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global coordname
Out=readcoor(coordname);
[newcc] = Imasi(handles.slider9,handles.slider10,handles.slider11,handles.edit3,handles.edit1,handles.edit2,handles.edit4,handles.slider1,handles.slider6,Out,handles.radiobutton1,handles.axes2,handles.axes1,handles.axes4);

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Filename=uigetfile('*.txt;*.dm3');
Exp=double(readDM3(Filename));  
Exp=mat2gray(Exp);
imshow(Exp,'Parent',handles.axes3);
set(handles.axes3,'xtick',[],'ytick',[]);
FFTExp=log(abs(fftshift(fft2(Exp)))+1);
FFTEXP=mat2gray(FFTExp/max(max(FFTExp))*255);
imshow(FFTEXP,'Parent',handles.axes5);
set(handles.axes5,'xtick',[],'ytick',[]);



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global coordname
Out=readcoor(coordname);
[newcc] = Imasi(handles.slider9,handles.slider10,handles.slider11,handles.edit3,handles.edit1,handles.edit2,handles.edit4,handles.slider1,handles.slider6,Out,handles.radiobutton1,handles.axes2,handles.axes1,handles.axes4);

 Savesimuandcoord( handles.axes1,handles.axes2,handles.radiobutton1,handles.axes4,newcc,handles.edit8)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global coordname
Svalue1=get(handles.slider9,'value');
A1=num2str(Svalue1);
set(handles.edit5,'string',A1);
Out=readcoor(coordname);
[newcc] = Imasi(handles.slider9,handles.slider10,handles.slider11,handles.edit3,handles.edit1,handles.edit2,handles.edit4,handles.slider1,handles.slider6,Out,handles.radiobutton1,handles.axes2,handles.axes1,handles.axes4);

% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider10_Callback(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

Svalue2=get(handles.slider10,'value');
A2=num2str(Svalue2);
set(handles.edit6,'string',A2);
global coordname
Out=readcoor(coordname);
[newcc] = Imasi(handles.slider9,handles.slider10,handles.slider11,handles.edit3,handles.edit1,handles.edit2,handles.edit4,handles.slider1,handles.slider6,Out,handles.radiobutton1,handles.axes2,handles.axes1,handles.axes4);



% --- Executes during object creation, after setting all properties.
function slider10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider11_Callback(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global coordname
Svalue3=get(handles.slider11,'value');
A3=num2str(Svalue3);
set(handles.edit7,'string',A3);
Out=readcoor(coordname);
[newcc] = Imasi(handles.slider9,handles.slider10,handles.slider11,handles.edit3,handles.edit1,handles.edit2,handles.edit4,handles.slider1,handles.slider6,Out,handles.radiobutton1,handles.axes2,handles.axes1,handles.axes4);



% --- Executes during object creation, after setting all properties.
function slider11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global coordname
coordname=uigetfile('*.txt;*.xyz');
da=readcoor(coordname);
set(handles.uitable1,'data',da);

Out=readcoor(coordname);
global newcc
[newcc] = Imasi(handles.slider9,handles.slider10,handles.slider11,handles.edit3,handles.edit1,handles.edit2,handles.edit4,handles.slider1,handles.slider6,Out,handles.radiobutton1,handles.axes2,handles.axes1,handles.axes4);


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
global coordname
Out=readcoor(coordname);
[newcc] = Imasi(handles.slider9,handles.slider10,handles.slider11,handles.edit3,handles.edit1,handles.edit2,handles.edit4,handles.slider1,handles.slider6,Out,handles.radiobutton1,handles.axes2,handles.axes1,handles.axes4);


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global coordname
Out=readcoor(coordname);
[newcc] = Imasi(handles.slider9,handles.slider10,handles.slider11,handles.edit3,handles.edit1,handles.edit2,handles.edit4,handles.slider1,handles.slider6,Out,handles.radiobutton1,handles.axes2,handles.axes1,handles.axes4);


% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double



% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global coordname
Out=readcoor(coordname);
[newcc] = Imasi(handles.slider9,handles.slider10,handles.slider11,handles.edit3,handles.edit1,handles.edit2,handles.edit4,handles.slider1,handles.slider6,Out,handles.radiobutton1,handles.axes2,handles.axes1,handles.axes4);

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global coordname
Out=readcoor(coordname);
[newcc] = Imasi(handles.slider9,handles.slider10,handles.slider11,handles.edit3,handles.edit1,handles.edit2,handles.edit4,handles.slider1,handles.slider6,Out,handles.radiobutton1,handles.axes2,handles.axes1,handles.axes4);


% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Svalue1=get(handles.edit5,'string');
A1=str2num(Svalue1);
set(handles.slider9,'value',A1);
global coordname
Out=readcoor(coordname);
[newcc] = Imasi(handles.slider9,handles.slider10,handles.slider11,handles.edit3,handles.edit1,handles.edit2,handles.edit4,handles.slider1,handles.slider6,Out,handles.radiobutton1,handles.axes2,handles.axes1,handles.axes4);



% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Svalue2=get(handles.edit6,'string');
A2=str2num(Svalue2);
set(handles.slider10,'value',A2);
global coordname
Out=readcoor(coordname);
[newcc] = Imasi(handles.slider9,handles.slider10,handles.slider11,handles.edit3,handles.edit1,handles.edit2,handles.edit4,handles.slider1,handles.slider6,Out,handles.radiobutton1,handles.axes2,handles.axes1,handles.axes4);


% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Svalue3=get(handles.edit7,'string');
A3=str2num(Svalue3);
set(handles.slider11,'value',A3);
global coordname
Out=readcoor(coordname);
[newcc] = Imasi(handles.slider9,handles.slider10,handles.slider11,handles.edit3,handles.edit1,handles.edit2,handles.edit4,handles.slider1,handles.slider6,Out,handles.radiobutton1,handles.axes2,handles.axes1,handles.axes4);


% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes7
axes(hObject)
imshow('XYZ.jpg')
