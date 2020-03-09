function varargout = coba2(varargin)
% COBA2 MATLAB code for coba2.fig
%      COBA2, by itself, creates a new COBA2 or raises the existing
%      singleton*.
%
%      H = COBA2 returns the handle to a new COBA2 or the handle to
%      the existing singleton*.
%
%      COBA2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COBA2.M with the given input arguments.
%
%      COBA2('Property','Value',...) creates a new COBA2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before coba2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to coba2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help coba2

% Last Modified by GUIDE v2.5 26-Feb-2020 13:04:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @coba2_OpeningFcn, ...
                   'gui_OutputFcn',  @coba2_OutputFcn, ...
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


% --- Executes just before coba2 is made visible.
function coba2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to coba2 (see VARARGIN)

% Choose default command line output for coba2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes coba2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = coba2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
gambar= handles.data1;
idMode = get (hObject, 'value');
if idMode == 1
    
elseif idMode == 2
    axes(handles.axes2);
    A= rgb2gray(gambar);
    imshow(A);
elseif idMode == 3
    axes(handles.axes2);
    imshow(gambar);
end

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

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
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
