function varargout = DataMining_123190056(varargin)
% DATAMINING_123190056 MATLAB code for DataMining_123190056.fig
%      DATAMINING_123190056, by itself, creates a new DATAMINING_123190056 or raises the existing
%      singleton*.
%
%      H = DATAMINING_123190056 returns the handle to a new DATAMINING_123190056 or the handle to
%      the existing singleton*.
%
%      DATAMINING_123190056('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATAMINING_123190056.M with the given input arguments.
%
%      DATAMINING_123190056('Property','Value',...) creates a new DATAMINING_123190056 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DataMining_123190056_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DataMining_123190056_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DataMining_123190056

% Last Modified by GUIDE v2.5 21-Apr-2021 13:51:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DataMining_123190056_OpeningFcn, ...
                   'gui_OutputFcn',  @DataMining_123190056_OutputFcn, ...
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


% --- Executes just before DataMining_123190056 is made visible.
function DataMining_123190056_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DataMining_123190056 (see VARARGIN)

% Choose default command line output for DataMining_123190056
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DataMining_123190056 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DataMining_123190056_OutputFcn(hObject, eventdata, handles) 
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
ipk = str2double(get(handles.ipk,'String'));
lamastudi = str2double(get(handles.lamastudi,'String'));
jumlahorganisasi = str2double(get(handles.jumlahorganisasi,'String'));

sampel = [ipk lamastudi jumlahorganisasi];

opts = detectImportOptions('DataMining_123190056.scv');
opts.SelectedVariableNames = (1:3);
training = readmatrix('DataMining_123190056.scv',opts);

opts = detectImportOptions('DataMining_123190056.csv');
opts.SelectedVariableNames = (4);
group = readmatrix('DataMining_123190056.scv',opts);

class = fitcknn(training,group, 'NumNeighbor',1);

kelulusan = predict(class, sampel);

set(handles.Hasil, 'String', kelulusan);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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



function ipk_Callback(hObject, eventdata, handles)
% hObject    handle to ipk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ipk as text
%        str2double(get(hObject,'String')) returns contents of ipk as a double


% --- Executes during object creation, after setting all properties.
function ipk_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ipk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lamastudi_Callback(hObject, eventdata, handles)
% hObject    handle to lamastudi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lamastudi as text
%        str2double(get(hObject,'String')) returns contents of lamastudi as a double


% --- Executes during object creation, after setting all properties.
function lamastudi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lamastudi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jumlahorganisasi_Callback(hObject, eventdata, handles)
% hObject    handle to jumlahorganisasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jumlahorganisasi as text
%        str2double(get(hObject,'String')) returns contents of jumlahorganisasi as a double


% --- Executes during object creation, after setting all properties.
function jumlahorganisasi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jumlahorganisasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts = detectImportOptions('DataMining_123190056.csv');
opts.SelectedVariableNames = (1:4);
data = readmatrix('DataMining_123190056.csv',opts);
set(handles.uitable2,'data',data);


% --- Executes when entered data in editable cell(s) in uitable2.
function uitable2_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
