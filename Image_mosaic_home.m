function varargout = Image_mosaic_home(varargin)
% IMAGE_MOSAIC_HOME MATLAB code for Image_mosaic_home.fig
%      IMAGE_MOSAIC_HOME, by itself, creates a new IMAGE_MOSAIC_HOME or raises the existing
%      singleton*.
%
%      H = IMAGE_MOSAIC_HOME returns the handle to a new IMAGE_MOSAIC_HOME or the handle to
%      the existing singleton*.
%
%      IMAGE_MOSAIC_HOME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGE_MOSAIC_HOME.M with the given input arguments.
%
%      IMAGE_MOSAIC_HOME('Property','Value',...) creates a new IMAGE_MOSAIC_HOME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Image_mosaic_home_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Image_mosaic_home_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Image_mosaic_home

% Last Modified by GUIDE v2.5 17-Apr-2016 11:22:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Image_mosaic_home_OpeningFcn, ...
    'gui_OutputFcn',  @Image_mosaic_home_OutputFcn, ...
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


% --- Executes just before Image_mosaic_home is made visible.
function Image_mosaic_home_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Image_mosaic_home (see VARARGIN)
global Count
Count= 0;

set(handles.pushbutton5,'visible','off');

% Choose default command line output for Image_mosaic_home
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Image_mosaic_home wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Image_mosaic_home_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FileName1  FileName2  FileName3  FileName4; %#ok<NUSED>
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FileName1;
global Count
[FileName1,PathName1,FilterIndex] = uigetfile('*.jpg;*.png;*.bmp');
I1 = imread(FileName1);

axes(handles.axes1);
imshow(I1, []);
set(handles.axes2,'visible','on');
set(handles.pushbutton2,'visible','on');
Count = 1;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FileName2;
global Count
[FileName2,PathName2,FilterIndex] = uigetfile('*.jpg;*.png;*.bmp');
I2 = imread(FileName2);
axes(handles.axes2);
imshow(I2, []);
set(handles.axes3,'visible','on');
set(handles.pushbutton3,'visible','on');
Count = 2;

set(handles.pushbutton5,'visible','on');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FileName3;
global Count
[FileName3,PathName3,FilterIndex] = uigetfile('*.jpg;*.png;*.bmp');
I3 = imread(FileName3);
axes(handles.axes3);
imshow(I3, []);
set(handles.axes4,'visible','on');
set(handles.pushbutton4,'visible','on');
Count = 3;

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FileName4;
global Count
[FileName4,PathName4,FilterIndex] = uigetfile('*.jpg;*.png;*.bmp');
I4 = imread(FileName4);
axes(handles.axes4);
imshow(I4, []);
Count = 4;
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FileName1 FileName2 FileName3 FileName4;
global Count
if Count == 2
    Image_mosaic(FileName1,FileName2);
elseif Count == 3
    Image_mosaic3(FileName1,FileName2,FileName3);
elseif Count == 4
    Image_mosaic4(FileName1,FileName2,FileName3,FileName4);
end
% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

