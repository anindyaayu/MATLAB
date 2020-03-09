function varargout = pengolahan_gambar(varargin)
% PENGOLAHAN_GAMBAR MATLAB code for pengolahan_gambar.fig
%      PENGOLAHAN_GAMBAR, by itself, creates a new PENGOLAHAN_GAMBAR or raises the existing
%      singleton*.
%
%      H = PENGOLAHAN_GAMBAR returns the handle to a new PENGOLAHAN_GAMBAR or the handle to
%      the existing singleton*.
%
%      PENGOLAHAN_GAMBAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PENGOLAHAN_GAMBAR.M with the given input arguments.
%
%      PENGOLAHAN_GAMBAR('Property','Value',...) creates a new PENGOLAHAN_GAMBAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pengolahan_gambar_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pengolahan_gambar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pengolahan_gambar

% Last Modified by GUIDE v2.5 26-Feb-2020 09:22:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pengolahan_gambar_OpeningFcn, ...
                   'gui_OutputFcn',  @pengolahan_gambar_OutputFcn, ...
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


% --- Executes just before pengolahan_gambar is made visible.
function pengolahan_gambar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pengolahan_gambar (see VARARGIN)

% Choose default command line output for pengolahan_gambar
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pengolahan_gambar wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pengolahan_gambar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nama_file,nama_path] = uigetfile({'*.jpg';'*.bmp';'*.png';'*.tif';},...
   'Buka_Gambar');
if ~isequal (nama_file,0)
    handles.data1=imread(fullfile(nama_path,nama_file));
    guidata(hObject,handles);
    axes(handles.axes1);
    imshow(handles.data1);
    title('Gambar Asli');
else
    return
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = handles.data1;
x1 = 186;
x2 = 911;
y1 = 105;
y2 = 810;
xmin = x1;
ymin = y1;
width = x2-x1;
height = y2-y1;
I3 = imcrop(gambar, [xmin ymin width height]);
imshow(I3, 'parent', handles.axes2);
title('Croping Image');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = handles.data1
x1 = 186;
x2 = 911;
y1 = 105;
y2 = 810;
xmin = x1;
ymin = y1;
width = x2-x1;
height = y2-y1;
I3 = imcrop(gambar, [xmin-ymin width hegiht]);
imshow(I3, 'parent', handles.axes2);
title('Cropping Image')


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
