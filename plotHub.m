function varargout = plotHub(varargin)

% Author: 巴山 (bashan)
% Email: moveon5@163.com
% QQ Group: 531421022 (MATLAB编程爱好者)

% Welcome to subscribe matlabaihaozhe (WeChat) and join our QQ group.
% 欢迎关注matlab爱好者微信公众号和加入QQ群.
% Please feel free to contact me if you have any questions.
% 程序使用过程中如遇问题请随时联系作者！
% PLOTHUB MATLAB code for plotHub.fig

%      PLOTHUB, by itself, creates a new PLOTHUB or raises the existing
%      singleton*.
%
%      H = PLOTHUB returns the handle to a new PLOTHUB or the handle to
%      the existing singleton*.
%
%      PLOTHUB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLOTHUB.M with the given input arguments.
%
%      PLOTHUB('Property','Value',...) creates a new PLOTHUB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before plotHub_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to plotHub_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help plotHub

% Last Modified by GUIDE v2.5 31-Oct-2019 22:16:20

% Begin initialization code - DO NOT EDIT
global ax fig txt plt
if ~isempty(ax) && ~isempty(fig) && ~isempty(txt) && ~isempty(plt)
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
        'gui_Singleton',  gui_Singleton, ...
        'gui_OpeningFcn', @plotHub_OpeningFcn, ...
        'gui_OutputFcn',  @plotHub_OutputFcn, ...
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
else
    
    msgbox({'There are no the handles of figure, axis, text and plot in the workspace,';...
        'please assign them to global variable fig, ax, txt and plt ,respectively.And then try again!'
        },'Warning!','error');
    return;
end

% End initialization code - DO NOT EDIT


% --- Executes just before plotHub is made visible.
function plotHub_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to plotHub (see VARARGIN)

% Choose default command line output for plotHub
handles.output = hObject;

handles.tabManager = TabManager(hObject);
% Update handles structure

guidata(hObject, handles);

% UIWAIT makes plotHub wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = plotHub_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

varargout{1} = handles.output;

% Get default command line output from handles structure



% --- Executes on selection change in titleFormatList.
function titleFormatList_Callback(hObject, eventdata, handles)
% hObject    handle to titleFormatList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns titleFormatList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from titleFormatList
global fig hAxis axname
hAxis = findobj(fig,'type','axes');
tpl = findobj(0,'Tag','titleFormatList');
atc = findobj(0,'Tag','AxisTitleCheck');
ale = findobj(0,'Tag','axisLabelEdit');
atr = findobj(0,'Tag','AxisTitleRadio');
scp = findobj(0,'Tag','setColorPush');
sfp = findobj(0,'Tag','setFontPush');
adp = findobj(0,'Tag','AxisDirPopu');
matdp = findobj(0,'Tag','majorTickDirPopu');
mitdp = findobj(0,'Tag','minorTickDirPopu');
atdp = findobj(0,'Tag','axisThicknessPopu');
mtlp = findobj(0,'Tag','majorTickLenPopu');
atlre = findobj(0,'Tag','axisTickLabelRotationEdit');
strtlc = findobj(0,'Tag','showTRTicksLabelCheck');
val = get(tpl,'Value');
switch val
    case 1
        set(strtlc,'Enable','off');
        if isAxisExist(hAxis,axname{1})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{1});
            bottomAxisMajor = hAxis(loc);
            if isequal(bottomAxisMajor.XAxis.Visible,'on')
                labma = 1;
                set(atc,'Value',1);
            else
                labma = get(atc,'Value');
            end
        end
        if isAxisExist(hAxis,axname{2})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{2});
            bottomAxisMinor = hAxis(loc);
            if isequal(bottomAxisMinor.XAxis.Visible,'on')
                labmi = 1;
                set(atc,'Value',1);
            else
                labmi = 0;
            end
        end
        if (labma + labmi) < 1
            set(atc,'Value',0);
            lab = 0;
        else
            lab = 1;
        end
        switch lab
            case 0
                set(ale,'Enable','off');
                set(atr,'Enable','off');
                set(scp,'Enable','off');
                set(sfp,'Enable','off');
                set(adp,'Enable','off');
                set(matdp,'Enable','off');
                set(mitdp,'Enable','off');
                set(atdp,'Enable','off');
                set(mtlp, 'Enable','off');
                set(atlre,'Enable','off');
                if isAxisExist(hAxis,axname{1})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
                    loc = findAxis(hAxis,axname{1});
                    bottomAxisMajor = hAxis(loc);
                    if isempty(bottomAxisMajor.XLabel.String)
                        set(ale,'String','Bottom Axis');
                    else
                        set(ale,'String',bottomAxisMajor.XLabel.String);
                    end
                    
                    % Initialize LineWidth
                    str = get(atdp,'String');
                    dd = cellfun(@str2double,str);
                    loc = find(ismember(dd,bottomAxisMajor.LineWidth)==1);
                    set(atdp,'Value',loc);
                    
                    % Initialize Major TickLength
                    if ~isempty(bottomAxisMajor.XTick)
                        vv = bottomAxisMajor.TickLength;
                        str = get(mtlp,'String');
                        dd = cellfun(@str2double,str);
                        loc = find(ismember(dd,vv(1))==1);
                        set(mtlp,'Value',loc);
                    end
                    
                    % Initialize Axis Direction
                    labd = bottomAxisMajor.XDir;
                    switch labd
                        case 'normal'
                            set(adp,'Value',1);
                        case 'reverse'
                            set(adp,'Value',2);
                    end
                    
                    % Initialize major ticks
                    if isequal(bottomAxisMajor.TickDir,'in')
                        set(matdp,'Value',1);
                    elseif isequal(bottomAxisMajor.TickDir,'out')
                        set(matdp,'Value',2);
                    else
                        set(matdp,'Value',3);
                    end
                    
                    % Initialize minor ticks
                    if isAxisExist(hAxis,axname{2})
                        loc = findAxis(hAxis,axname{2});
                        bottomAxisMinor = hAxis(loc);
                        if isequal(bottomAxisMinor.XMinorTick,'on')
                            if isequal(bottomAxisMinor.TickDir,'in')
                                set(mitdp,'Value',1);
                            elseif isequal(bottomAxisMinor.TickDir,'out') && isequal(bottomAxisMinor.XMinorTick,'on')
                                set(mitdp,'Value',2);
                            else
                                set(mitdp,'Value',3);
                            end
                        else
                            set(mitdp,'Value',4);
                        end
                    else
                        set(mitdp,'Value',4);
                    end
                    
                else
                    set(ale,'String','');
                end
            case 1
                set(ale,'Enable','on');
                set(atr,'Enable','on');
                set(scp,'Enable','on');
                set(sfp,'Enable','on');
                set(adp,'Enable','on');
                set(matdp,'Enable','on');
                set(mitdp,'Enable','on');
                set(atdp,'Enable','on');
                set(mtlp, 'Enable','on');
                set(atlre,'Enable','on');
                if isAxisExist(hAxis,axname{1})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
                    loc = findAxis(hAxis,axname{1});
                    bottomAxisMajor = hAxis(loc);
                    if isempty(bottomAxisMajor.XLabel.String)
                        set(ale,'String','Bottom Axis');
                    else
                        set(ale,'String',bottomAxisMajor.XLabel.String);
                    end
                    % Initialize LineWidth
                    str = get(atdp,'String');
                    dd = cellfun(@str2double,str);
                    loc = find(ismember(dd,bottomAxisMajor.LineWidth)==1);
                    set(atdp,'Value',loc);
                    
                    % Initialize Major TickLength
                    if ~isempty(bottomAxisMajor.XTick)
                        vv = bottomAxisMajor.TickLength;
                        str = get(mtlp,'String');
                        dd = cellfun(@str2double,str);
                        loc = find(ismember(dd,vv(1))==1);
                        set(mtlp,'Value',loc);
                    end
                    
                    % Initialize Axis Direction
                    labd = bottomAxisMajor.XDir;
                    switch labd
                        case 'normal'
                            set(adp,'Value',1);
                        case 'reverse'
                            set(adp,'Value',2);
                    end
                    
                    % Initialize major ticks
                    if isequal(bottomAxisMajor.TickDir,'in')
                        set(matdp,'Value',1);
                    elseif isequal(bottomAxisMajor.TickDir,'out')
                        set(matdp,'Value',2);
                    else
                        set(matdp,'Value',3);
                    end
                    
                    % Initialize minor ticks
                    if isAxisExist(hAxis,axname{2})
                        loc = findAxis(hAxis,axname{2});
                        bottomAxisMinor = hAxis(loc);
                        if isequal(bottomAxisMinor.XMinorTick,'on')
                            if isequal(bottomAxisMinor.TickDir,'in')
                                set(mitdp,'Value',1);
                            elseif isequal(bottomAxisMinor.TickDir,'out') && isequal(bottomAxisMinor.XMinorTick,'on')
                                set(mitdp,'Value',2);
                            else
                                set(mitdp,'Value',3);
                            end
                        else
                            set(mitdp,'Value',4);
                        end
                    else
                        set(mitdp,'Value',4);
                    end
                else
                    set(ale,'String','Bottom Axis');
                end
        end
    case 2
        set(strtlc,'Enable','off');
        if isAxisExist(hAxis,axname{5})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{5});
            leftAxisMajor = hAxis(loc);
            if isequal(leftAxisMajor.YAxis.Visible,'on')
                labma = 1;
                set(atc,'Value',1);
            else
                labma = get(atc,'Value');
            end
        end
        if isAxisExist(hAxis,axname{6})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{6});
            leftAxisMinor = hAxis(loc);
            if isequal(leftAxisMinor.YAxis.Visible,'on')
                labmi = 1;
                set(atc,'Value',1);
            else
                labmi = 0;
            end
        end
        if (labma + labmi) < 1
            set(atc,'Value',0);
            lab = 0;
        else
            lab = 1;
        end
        switch lab
            case 0
                set(ale,'Enable','off');
                set(atr,'Enable','off');
                set(scp,'Enable','off');
                set(sfp,'Enable','off');
                set(adp,'Enable','off');
                set(matdp,'Enable','off');
                set(mitdp,'Enable','off');
                set(atdp,'Enable','off');
                set(mtlp, 'Enable','off');
                set(atlre,'Enable','off');
                if isAxisExist(hAxis,axname{5})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
                    loc = findAxis(hAxis,axname{5});
                    leftAxisMajor = hAxis(loc);
                    if isempty(leftAxisMajor.YLabel.String)
                        set(ale,'String','Left Axis');
                    else
                        set(ale,'String',leftAxisMajor.YLabel.String);
                    end
                    
                    % Initialize LineWidth
                    str = get(atdp,'String');
                    dd = cellfun(@str2double,str);
                    loc = find(ismember(dd,leftAxisMajor.LineWidth)==1);
                    set(atdp,'Value',loc);
                    
                    % Initialize Major TickLength
                    if ~isempty(leftAxisMajor.YTick)
                        vv = leftAxisMajor.TickLength;
                        str = get(mtlp,'String');
                        dd = cellfun(@str2double,str);
                        loc = find(ismember(dd,vv(1))==1);
                        set(mtlp,'Value',loc);
                    end
                    
                    % Initialize Axis Direction
                    labd = leftAxisMajor.YDir;
                    switch labd
                        case 'normal'
                            set(adp,'Value',1);
                        case 'reverse'
                            set(adp,'Value',2);
                    end
                    
                    % Initialize major ticks
                    if isequal(leftAxisMajor.TickDir,'in')
                        set(matdp,'Value',1);
                    elseif isequal(leftAxisMajor.TickDir,'out')
                        set(matdp,'Value',2);
                    else
                        set(matdp,'Value',3);
                    end
                    
                    % Initialize minor ticks
                    if isAxisExist(hAxis,axname{6})
                        loc = findAxis(hAxis,axname{6});
                        leftAxisMinor = hAxis(loc);
                        if isequal(leftAxisMinor.YMinorTick,'on')
                            if isequal(leftAxisMinor.TickDir,'in')
                                set(mitdp,'Value',1);
                            elseif isequal(leftAxisMinor.TickDir,'out') && isequal(leftAxisMinor.YMinorTick,'on')
                                set(mitdp,'Value',2);
                            else
                                set(mitdp,'Value',3);
                            end
                        else
                            set(mitdp,'Value',4);
                        end
                    else
                        set(mitdp,'Value',4);
                    end
                else
                    set(ale,'String','Left Axis');
                end
            case 1
                set(ale,'Enable','on');
                set(atr,'Enable','on');
                set(scp,'Enable','on');
                set(sfp,'Enable','on');
                set(adp,'Enable','on');
                set(matdp,'Enable','on');
                set(mitdp,'Enable','on');
                set(atdp,'Enable','on');
                set(mtlp, 'Enable','on');
                set(atlre,'Enable','on');
                if isAxisExist(hAxis,axname{5})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
                    loc = findAxis(hAxis,axname{5});
                    leftAxisMajor = hAxis(loc);
                    if isempty(leftAxisMajor.YLabel.String)
                        set(ale,'String','Left Axis');
                    else
                        set(ale,'String',leftAxisMajor.YLabel.String);
                    end
                    
                    % Initialize LineWidth
                    str = get(atdp,'String');
                    dd = cellfun(@str2double,str);
                    loc = find(ismember(dd,leftAxisMajor.LineWidth)==1);
                    set(atdp,'Value',loc);
                    
                    % Initialize Major TickLength
                    if ~isempty(leftAxisMajor.YTick)
                        vv = leftAxisMajor.TickLength;
                        str = get(mtlp,'String');
                        dd = cellfun(@str2double,str);
                        loc = find(ismember(dd,vv(1))==1);
                        set(mtlp,'Value',loc);
                    end
                    
                    % Initialize Axis Direction
                    labd = leftAxisMajor.YDir;
                    switch labd
                        case 'normal'
                            set(adp,'Value',1);
                        case 'reverse'
                            set(adp,'Value',2);
                    end
                    
                    % Initialize major ticks
                    if isequal(leftAxisMajor.TickDir,'in')
                        set(matdp,'Value',1);
                    elseif isequal(leftAxisMajor.TickDir,'out')
                        set(matdp,'Value',2);
                    else
                        set(matdp,'Value',3);
                    end
                    
                    % Initialize minor ticks
                    if isAxisExist(hAxis,axname{6})
                        loc = findAxis(hAxis,axname{6});
                        leftAxisMinor = hAxis(loc);
                        if isequal(leftAxisMinor.YMinorTick,'on')
                            if isequal(leftAxisMinor.TickDir,'in')
                                set(mitdp,'Value',1);
                            elseif isequal(leftAxisMinor.TickDir,'out') && isequal(leftAxisMinor.YMinorTick,'on')
                                set(mitdp,'Value',2);
                            else
                                set(mitdp,'Value',3);
                            end
                        else
                            set(mitdp,'Value',4);
                        end
                    else
                        set(mitdp,'Value',4);
                    end
                    
                else
                    set(ale,'String','Left Axis');
                end
        end
    case 3
        if isAxisExist(hAxis,axname{3})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{3});
            topAxisMajor = hAxis(loc);
            if isequal(topAxisMajor.XAxis.Visible,'on')
                labma = 1;
                set(atc,'Value',1);
            else
                labma = 0;
            end
        end
        if isAxisExist(hAxis,axname{4})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{4});
            topAxisMinor = hAxis(loc);
            if isequal(topAxisMinor.XAxis.Visible,'on')
                labmi = 1;
                set(atc,'Value',1);
            else
                labmi = 0;
            end
        end
        if (labma + labmi) < 1
            set(atc,'Value',0);
            lab = 0;
        else
            lab = 1;
        end
        switch lab
            case 0
                set(strtlc,'Enable','off');
                set(ale,'Enable','off');
                set(atr,'Enable','off');
                set(scp,'Enable','off');
                set(sfp,'Enable','off');
                set(adp,'Enable','off');
                set(matdp,'Enable','off');
                set(mitdp,'Enable','off');
                set(atdp,'Enable','off');
                set(mtlp, 'Enable','off');
                set(atlre,'Enable','off');
                if isAxisExist(hAxis,axname{3})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
                    loc = findAxis(hAxis,axname{3});
                    topAxisMajor = hAxis(loc);
                    if isempty(topAxisMajor.XLabel.String)
                        set(ale,'String','');
                    else
                        set(ale,'String',topAxisMajor.XLabel.String);
                    end
                    
                    % Initialize LineWidth
                    str = get(atdp,'String');
                    dd = cellfun(@str2double,str);
                    loc = find(ismember(dd,topAxisMajor.LineWidth)==1);
                    set(atdp,'Value',loc);
                    
                    % Initialize Major TickLength
                    if ~isempty(topAxisMajor.XTick)
                        vv = topAxisMajor.TickLength;
                        str = get(mtlp,'String');
                        dd = cellfun(@str2double,str);
                        loc = find(ismember(dd,vv(1))==1);
                        set(mtlp,'Value',loc);
                    end
                    
                    % Initialize Axis Direction
                    labd = topAxisMajor.XDir;
                    switch labd
                        case 'normal'
                            set(adp,'Value',1);
                        case 'reverse'
                            set(adp,'Value',2);
                    end
                    
                    % Initialize major ticks
                    if isequal(topAxisMajor.TickDir,'in')
                        set(matdp,'Value',1);
                    elseif isequal(topAxisMajor.TickDir,'out')
                        set(matdp,'Value',2);
                    else
                        set(matdp,'Value',3);
                    end
                    
                    % Initialize minor ticks
                    if isAxisExist(hAxis,axname{4})
                        loc = findAxis(hAxis,axname{4});
                        topAxisMinor = hAxis(loc);
                        if isequal(topAxisMinor.XMinorTick,'on')
                            if isequal(topAxisMinor.TickDir,'in')
                                set(mitdp,'Value',1);
                            elseif isequal(topAxisMinor.TickDir,'out') && isequal(topAxisMinor.XMinorTick,'on')
                                set(mitdp,'Value',2);
                            else
                                set(mitdp,'Value',3);
                            end
                        else
                            set(mitdp,'Value',4);
                        end
                    else
                        set(mitdp,'Value',4);
                    end
                    
                else
                    set(ale,'String','');
                end
            case 1
                set(strtlc,'Enable','on');
                set(ale,'Enable','on');
                set(atr,'Enable','on');
                set(scp,'Enable','on');
                set(sfp,'Enable','on');
                set(adp,'Enable','on');
                set(matdp,'Enable','on');
                set(mitdp,'Enable','on');
                set(atdp,'Enable','on');
                set(mtlp, 'Enable','on');
                set(atlre,'Enable','on');
                if isAxisExist(hAxis,axname{3})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
                    loc = findAxis(hAxis,axname{3});
                    topAxisMajor = hAxis(loc);
                    if isempty(topAxisMajor.XLabel.String)
                        set(ale,'String','');
                    else
                        set(ale,'String',topAxisMajor.XLabel.String);
                    end
                    
                    % Initialize LineWidth
                    str = get(atdp,'String');
                    dd = cellfun(@str2double,str);
                    loc = find(ismember(dd,topAxisMajor.LineWidth)==1);
                    set(atdp,'Value',loc);
                    
                    % Initialize Major TickLength
                    if ~isempty(topAxisMajor.XTick)
                        vv = topAxisMajor.TickLength;
                        str = get(mtlp,'String');
                        dd = cellfun(@str2double,str);
                        loc = find(ismember(dd,vv(1))==1);
                        set(mtlp,'Value',loc);
                    end
                    
                    % Initialize Axis Direction
                    labd = topAxisMajor.XDir;
                    switch labd
                        case 'normal'
                            set(adp,'Value',1);
                        case 'reverse'
                            set(adp,'Value',2);
                    end
                    
                    % Initialize major ticks
                    if isequal(topAxisMajor.TickDir,'in')
                        set(matdp,'Value',1);
                    elseif isequal(topAxisMajor.TickDir,'out')
                        set(matdp,'Value',2);
                    else
                        set(matdp,'Value',3);
                    end
                    
                    % Initialize minor ticks
                    if isAxisExist(hAxis,axname{4})
                        loc = findAxis(hAxis,axname{4});
                        topAxisMinor = hAxis(loc);
                        if isequal(topAxisMinor.XMinorTick,'on')
                            if isequal(topAxisMinor.TickDir,'in')
                                set(mitdp,'Value',1);
                            elseif isequal(topAxisMinor.TickDir,'out') && isequal(topAxisMinor.XMinorTick,'on')
                                set(mitdp,'Value',2);
                            else
                                set(mitdp,'Value',3);
                            end
                        else
                            set(mitdp,'Value',4);
                        end
                    else
                        set(mitdp,'Value',4);
                    end
                    
                else
                    set(ale,'String','');
                end
        end
    case 4
        if isAxisExist(hAxis,axname{7})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{7});
            rightAxisMajor = hAxis(loc);
            if isequal(rightAxisMajor.YAxis.Visible,'on')
                labma = 1;
                set(atc,'Value',1);
            else
                labma = get(atc,'Value');
            end
        end
        if isAxisExist(hAxis,axname{8})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{8});
            rightAxisMinor = hAxis(loc);
            if isequal(rightAxisMinor.YAxis.Visible,'on')
                labmi = 1;
                set(atc,'Value',1);
            else
                labmi = 0;
            end
        end
        if (labma + labmi) < 1
            set(atc,'Value',0);
            lab = 0;
        else
            lab = 1;
        end
        switch lab
            case 0
                set(strtlc,'Enable','off');
                set(ale,'Enable','off');
                set(atr,'Enable','off');
                set(scp,'Enable','off');
                set(sfp,'Enable','off');
                set(adp,'Enable','off');
                set(matdp,'Enable','off');
                set(mitdp,'Enable','off');
                set(atdp,'Enable','off');
                set(mtlp, 'Enable','off');
                set(atlre,'Enable','off');
                if isAxisExist(hAxis,axname{7})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
                    loc = findAxis(hAxis,axname{7});
                    rightAxisMajor = hAxis(loc);
                    if isempty(rightAxisMajor.YLabel.String)
                        set(ale,'String','');
                    else
                        set(ale,'String',rightAxisMajor.YLabel.String);
                    end
                else
                    set(ale,'String','');
                end
            case 1
                set(strtlc,'Enable','on');
                set(ale,'Enable','on');
                set(atr,'Enable','on');
                set(scp,'Enable','on');
                set(sfp,'Enable','on');
                set(adp,'Enable','on');
                set(matdp,'Enable','on');
                set(mitdp,'Enable','on');
                set(atdp,'Enable','on');
                set(mtlp, 'Enable','on');
                set(atlre,'Enable','on');
                if isAxisExist(hAxis,axname{7})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
                    loc = findAxis(hAxis,axname{7});
                    rightAxisMajor = hAxis(loc);
                    if isempty(rightAxisMajor.YLabel.String)
                        set(ale,'String','');
                    else
                        set(ale,'String',rightAxisMajor.YLabel.String);
                    end
                    
                    % Initialize LineWidth
                    str = get(atdp,'String');
                    dd = cellfun(@str2double,str);
                    loc = find(ismember(dd,rightAxisMajor.LineWidth)==1);
                    set(atdp,'Value',loc);
                    
                    % Initialize Major TickLength
                    if ~isempty(rightAxisMajor.YTick)
                        vv = rightAxisMajor.TickLength;
                        str = get(mtlp,'String');
                        dd = cellfun(@str2double,str);
                        loc = find(ismember(dd,vv(1))==1);
                        set(mtlp,'Value',loc);
                    end
                    
                    % Initialize Axis Direction
                    labd = rightAxisMajor.YDir;
                    switch labd
                        case 'normal'
                            set(adp,'Value',1);
                        case 'reverse'
                            set(adp,'Value',2);
                    end
                    
                    % Initialize major ticks
                    if isequal(rightAxisMajor.TickDir,'in')
                        set(matdp,'Value',1);
                    elseif isequal(rightAxisMajor.TickDir,'out')
                        set(matdp,'Value',2);
                    else
                        set(matdp,'Value',3);
                    end
                    
                    % Initialize minor ticks
                    if isAxisExist(hAxis,axname{8})
                        loc = findAxis(hAxis,axname{8});
                        rightAxisMinor = hAxis(loc);
                        if isequal(rightAxisMinor.YMinorTick,'on')
                            if isequal(rightAxisMinor.TickDir,'in')
                                set(mitdp,'Value',1);
                            elseif isequal(rightAxisMinor.TickDir,'out') && isequal(rightAxisMinor.YMinorTick,'on')
                                set(mitdp,'Value',2);
                            else
                                set(mitdp,'Value',3);
                            end
                        else
                            set(mitdp,'Value',4);
                        end
                    else
                        set(mitdp,'Value',4);
                    end
                    
                else
                    set(ale,'String','');
                end
        end
end

% --- Executes during object creation, after setting all properties.
function titleFormatList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to titleFormatList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in AxisTitleCheck.
function AxisTitleCheck_Callback(hObject, eventdata, handles)
% hObject    handle to AxisTitleCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of AxisTitleCheck
global fig hAxis axname xtmpTickLabel ytmpTickLabel

hAxis = findobj(fig,'type','axes');

tfl = findobj(0,'Tag','titleFormatList');
atc = findobj(0,'Tag','AxisTitleCheck');
ale = findobj(0,'Tag','axisLabelEdit');
atr = findobj(0,'Tag','AxisTitleRadio');
scp = findobj(0,'Tag','setColorPush');
sfp = findobj(0,'Tag','setFontPush');
adp = findobj(0,'Tag','AxisDirPopu');
matdp = findobj(0,'Tag','majorTickDirPopu');
mitdp = findobj(0,'Tag','minorTickDirPopu');
atdp = findobj(0,'Tag','axisThicknessPopu');
mtlp = findobj(0,'Tag','majorTickLenPopu');
atlre = findobj(0,'Tag','axisTickLabelRotationEdit');
strtlc = findobj(0,'Tag','showTRTicksLabelCheck');
val =get(tfl,'Value');
lab = get(atc,'Value');
switch val
    case 1
        set(strtlc,'Enable','off');
        switch lab
            case 0
                set(ale,'Enable','off');
                set(atr,'Enable','off');
                set(scp,'Enable','off');
                set(sfp,'Enable','off');
                set(adp,'Enable','off');
                set(matdp,'Enable','off');
                set(mitdp,'Enable','off');
                set(atdp,'Enable','off');
                set(mtlp, 'Enable','off');
                set(atlre,'Enable','off');
                if isAxisExist(hAxis,axname{1})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{1});
                    bottomAxisMajor = hAxis(loc);
                    bottomAxisMajor.XAxis.Visible = 'off';
                end
                if isAxisExist(hAxis,axname{2})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{2});
                    bottomAxisMinor = hAxis(loc);
                    bottomAxisMinor.XAxis.Visible = 'off';
                end
            case 1
                set(ale,'Enable','on');
                set(atr,'Enable','on');
                set(scp,'Enable','on');
                set(sfp,'Enable','on');
                set(adp,'Enable','on');
                set(matdp,'Enable','on');
                set(mitdp,'Enable','on');
                set(atdp,'Enable','on');
                set(mtlp, 'Enable','on');
                set(atlre,'Enable','on');
                if isAxisExist(hAxis,axname{1})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{1});
                    bottomAxisMajor = hAxis(loc);
                    bottomAxisMajor.XAxis.Visible = 'on';
                end
                if isAxisExist(hAxis,axname{2})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{2});
                    bottomAxisMinor = hAxis(loc);
                    bottomAxisMinor.XAxis.Visible = 'on';
                end
        end
    case 2
        set(strtlc,'Enable','off');
        switch lab
            case 0
                set(ale,'Enable','off');
                set(atr,'Enable','off');
                set(scp,'Enable','off');
                set(sfp,'Enable','off');
                set(adp,'Enable','off');
                set(matdp,'Enable','off');
                set(mitdp,'Enable','off');
                set(atdp,'Enable','off');
                set(mtlp, 'Enable','off');
                set(atlre,'Enable','off');
                if isAxisExist(hAxis,axname{5})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{5});
                    leftAxisMajor = hAxis(loc);
                    leftAxisMajor.YAxis.Visible = 'off';
                end
                if isAxisExist(hAxis,axname{6})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{6});
                    leftAxisMinor = hAxis(loc);
                    leftAxisMinor.YAxis.Visible = 'off';
                end
            case 1
                set(ale,'Enable','on');
                set(atr,'Enable','on');
                set(scp,'Enable','on');
                set(sfp,'Enable','on');
                set(adp,'Enable','on');
                set(matdp,'Enable','on');
                set(mitdp,'Enable','on');
                set(atdp,'Enable','on');
                set(mtlp, 'Enable','on');
                set(atlre,'Enable','on');
                if isAxisExist(hAxis,axname{5})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{5});
                    leftAxisMajor = hAxis(loc);
                    leftAxisMajor.YAxis.Visible = 'on';
                end
                if isAxisExist(hAxis,axname{6})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{6});
                    leftAxisMinor = hAxis(loc);
                    leftAxisMinor.YAxis.Visible = 'on';
                end
        end
    case 3
        switch lab
            case 0
                set(strtlc,'Enable','off');
                set(ale,'Enable','off');
                set(atr,'Enable','off');
                set(scp,'Enable','off');
                set(sfp,'Enable','off');
                set(adp,'Enable','off');
                set(matdp,'Enable','off');
                set(mitdp,'Enable','off');
                set(atdp,'Enable','off');
                set(mtlp, 'Enable','off');
                set(atlre,'Enable','off');
                if isAxisExist(hAxis,axname{3})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{3});
                    topAxisMajor = hAxis(loc);
                    topAxisMajor.XAxis.Visible = 'off';
                end
                if isAxisExist(hAxis,axname{4})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{4});
                    topAxisMinor = hAxis(loc);
                    topAxisMinor.XAxis.Visible = 'off';
                end
            case 1
                set(strtlc,'Enable','on');
                set(ale,'Enable','on');
                set(atr,'Enable','on');
                set(scp,'Enable','on');
                set(sfp,'Enable','on');
                set(adp,'Enable','on');
                set(matdp,'Enable','on');
                set(mitdp,'Enable','on');
                set(atdp,'Enable','on');
                set(mtlp, 'Enable','on');
                set(atlre,'Enable','on');
                if isAxisExist(hAxis,axname{3})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{3});
                    topAxisMajor = hAxis(loc);
                    topAxisMajor.XAxis.Visible = 'on';
                    str = get(strtlc,'Value');
                    switch str
                        case 0
                            topAxisMajor.XTickLabel = '';
                        case 1
                            topAxisMajor.XTickLabel = xtmpTickLabel;
                    end
                end
                if isAxisExist(hAxis,axname{4})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{4});
                    topAxisMinor = hAxis(loc);
                    topAxisMinor.XAxis.Visible = 'on';
                end
        end
    case 4
        switch lab
            case 0
                set(strtlc,'Enable','off');
                set(ale,'Enable','off');
                set(atr,'Enable','off');
                set(scp,'Enable','off');
                set(sfp,'Enable','off');
                set(adp,'Enable','off');
                set(matdp,'Enable','off');
                set(mitdp,'Enable','off');
                set(atdp,'Enable','off');
                set(mtlp, 'Enable','off');
                set(atlre,'Enable','off');
                if isAxisExist(hAxis,axname{7})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{7});
                    rightAxisMajor = hAxis(loc);
                    rightAxisMajor.YAxis.Visible = 'off';
                end
                if isAxisExist(hAxis,axname{8})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{8});
                    rightAxisMinor = hAxis(loc);
                    rightAxisMinor.YAxis.Visible = 'off';
                end
            case 1
                set(strtlc,'Enable','on');
                set(ale,'Enable','on');
                set(atr,'Enable','on');
                set(scp,'Enable','on');
                set(sfp,'Enable','on');
                set(adp,'Enable','on');
                set(matdp,'Enable','on');
                set(mitdp,'Enable','on');
                set(atdp,'Enable','on');
                set(mtlp, 'Enable','on');
                set(atlre,'Enable','on');
                if isAxisExist(hAxis,axname{7})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{7});
                    rightAxisMajor = hAxis(loc);
                    rightAxisMajor.YAxis.Visible = 'on';
                    str = get(strtlc,'Value');
                    switch str
                        case 0
                            rightAxisMajor.YTickLabel = '';
                        case 1
                            rightAxisMajor.YTickLabel = ytmpTickLabel;
                    end
                end
                if isAxisExist(hAxis,axname{8})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{8});
                    rightAxisMinor = hAxis(loc);
                    rightAxisMinor.YAxis.Visible = 'on';
                end
        end
end


function axisLabelEdit_Callback(hObject, eventdata, handles)
% hObject    handle to axisLabelEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of axisLabelEdit as text
%        str2double(get(hObject,'String')) returns contents of axisLabelEdit as a double
global hAxis fig axname
slist = findobj(0,'Tag','titleFormatList');
val = get(slist,'Value');
aLE = findobj(0,'Tag','axisLabelEdit');
hAxis = findobj(fig,'type','axes');
switch val
    case 1
        % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
        if isAxisExist(hAxis,axname{1})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{1});
            bottomAxisMajor = hAxis(loc);
            bottomAxisMajor.XLabel.String = get(aLE,'String');
        end
    case 2
        if isAxisExist(hAxis,axname{5})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{5});
            leftAxisMajor = hAxis(loc);
            leftAxisMajor.YLabel.String = get(aLE,'String');
        end
    case 3
        if isAxisExist(hAxis,axname{3})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{3});
            topAxisMajor = hAxis(loc);
            topAxisMajor.XLabel.String = get(aLE,'String');
        end
    case 4
        if isAxisExist(hAxis,axname{7})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{7});
            rightAxisMajor = hAxis(loc);
            rightAxisMajor.YLabel.String = get(aLE,'String');
        end
end

% --- Executes during object creation, after setting all properties.
function axisLabelEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axisLabelEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in setColorPush.
function setColorPush_Callback(hObject, eventdata, handles)
% hObject    handle to setColorPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global hAxis fig axname
c = uisetcolor;
slist = findobj(0,'Tag','titleFormatList');
val = get(slist,'Value');
aTR = findobj(0,'Tag','AxisTitleRadio');
lab = get(aTR,'Value');
hAxis = findobj(fig,'type','axes');
switch val
    case 1
        % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
        if isAxisExist(hAxis,axname{1})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{1});
            bottomAxisMajor = hAxis(loc);
            switch lab
                case 1
                    bottomAxisMajor.XAxis.Label.Color = c;
                case 0
                    bottomAxisMajor.XAxis.Label.Color = c;
                    bottomAxisMajor.XColor = c;
                    if isAxisExist(hAxis,axname{2})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{2});
                        bottomAxisMinor = hAxis(loc);
                        bottomAxisMinor.XColor = c;
                    end
            end
        end
    case 2
        if isAxisExist(hAxis,axname{5})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{5});
            leftAxisMajor = hAxis(loc);
            switch lab
                case 1
                    leftAxisMajor.YAxis.Label.Color = c;
                case 0
                    leftAxisMajor.YAxis.Label.Color = c;
                    leftAxisMajor.YColor = c;
                    if isAxisExist(hAxis,axname{6})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{6});
                        leftAxisMinor = hAxis(loc);
                        leftAxisMinor.YColor = c;
                    end
            end
        end
    case 3
        if isAxisExist(hAxis,axname{3})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{3});
            topAxisMajor = hAxis(loc);
            switch lab
                case 1
                    topAxisMajor.XAxis.Label.Color = c;
                case 0
                    topAxisMajor.XAxis.Label.Color = c;
                    topAxisMajor.XColor = c;
                    if isAxisExist(hAxis,axname{4})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{4});
                        topAxisMinor = hAxis(loc);
                        topAxisMinor.XColor = c;
                    end
            end
        end
    case 4
        if isAxisExist(hAxis,axname{7})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{7});
            rightAxisMajor = hAxis(loc);
            switch lab
                case 1
                    rightAxisMajor.YAxis.Label.Color = c;
                case 0
                    rightAxisMajor.YAxis.Label.Color = c;
                    rightAxisMajor.YColor = c;
                    if isAxisExist(hAxis,axname{8})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{8});
                        rightAxisMinor = hAxis(loc);
                        rightAxisMinor.YColor = c;
                    end
            end
        end
end

% --- Executes on selection change in majorTickDirPopu.
function majorTickDirPopu_Callback(hObject, eventdata, handles)
% hObject    handle to majorTickDirPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns majorTickDirPopu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from majorTickDirPopu
global hAxis fig axname xtmpTick xtmpTickLabel ytmpTick ytmpTickLabel
slist = findobj(0,'Tag','titleFormatList');
val = get(slist,'Value');
mTDP = findobj(0,'Tag','majorTickDirPopu');
lab = get(mTDP,'Value');
strtlc = findobj(0,'Tag','showTRTicksLabelCheck');
str = get(mTDP,'String');
hAxis = findobj(fig,'type','axes');
% in out none both
switch val
    case 1
        % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
        if isAxisExist(hAxis,axname{1})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{1});
            bottomAxisMajor = hAxis(loc);
            switch lab
                case {1,2,3}
                    bottomAxisMajor.XTick = xtmpTick;
                    bottomAxisMajor.XTickLabel = xtmpTickLabel;
                    bottomAxisMajor.TickDir = str{lab};
                case 4
                    bottomAxisMajor.XTick = [];
            end
        end
    case 2
        % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
        if isAxisExist(hAxis,axname{5})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{5});
            leftAxisMajor = hAxis(loc);
            switch lab
                case {1,2,3}
                    leftAxisMajor.YTick = ytmpTick;
                    leftAxisMajor.YTickLabel = ytmpTickLabel;
                    leftAxisMajor.TickDir = str{lab};
                case 4
                    leftAxisMajor.YTick = [];
            end
        end
    case 3
        % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
        if isAxisExist(hAxis,axname{3})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{3});
            topAxisMajor = hAxis(loc);
            switch lab
                case {1,2,3}
                    topAxisMajor.XTick = xtmpTick;
                    strv = get(strtlc,'Value');
                    if isequal(strv,1)
                        topAxisMajor.XTickLabel = xtmpTickLabel;
                    else
                        topAxisMajor.XTickLabel = '';
                    end
                    topAxisMajor.TickDir = str{lab};
                case 4
                    topAxisMajor.XTick = [];
            end
        end
    case 4
        % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
        if isAxisExist(hAxis,axname{7})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{7});
            rightAxisMajor = hAxis(loc);
            switch lab
                case {1,2,3}
                    rightAxisMajor.YTick = ytmpTick;
                    strv = get(strtlc,'Value');
                    if isequal(strv,1)
                        rightAxisMajor.YTickLabel = ytmpTickLabel;
                    else
                        rightAxisMajor.YTickLabel = '';
                    end
                    rightAxisMajor.TickDir = str{lab};
                case 4
                    rightAxisMajor.YTick = [];
            end
        end
end

% --- Executes during object creation, after setting all properties.
function majorTickDirPopu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to majorTickDirPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in minorTickDirPopu.
function minorTickDirPopu_Callback(hObject, eventdata, handles)
% hObject    handle to minorTickDirPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global hAxis fig axname
slist = findobj(0,'Tag','titleFormatList');
val = get(slist,'Value');
mTDP = findobj(0,'Tag','minorTickDirPopu');
lab = get(mTDP,'Value');
str = get(mTDP,'String');
hAxis = findobj(fig,'type','axes');
% in out none both
switch val
    case 1
        % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
        if isAxisExist(hAxis,axname{2})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{2});
            bottomAxisMinor = hAxis(loc);
            switch lab
                case {1,2,3}
                    bottomAxisMinor.XAxis.MinorTick = 'on';
                    bottomAxisMinor.TickDir = str{lab};
                case 4
                    bottomAxisMinor.XAxis.MinorTick = 'off';
            end
        end
    case 2
        % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
        if isAxisExist(hAxis,axname{6})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{6});
            leftAxisMinor = hAxis(loc);
            switch lab
                case {1,2,3}
                    leftAxisMinor.YAxis.MinorTick = 'on';
                    leftAxisMinor.TickDir = str{lab};
                case 4
                    leftAxisMinor.YAxis.MinorTick = 'off';
            end
        end
    case 3
        % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
        if isAxisExist(hAxis,axname{4})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{4});
            topAxisMinor = hAxis(loc);
            switch lab
                case {1,2,3}
                    topAxisMinor.XAxis.MinorTick = 'on';
                    topAxisMinor.TickDir = str{lab};
                case 4
                    topAxisMinor.XAxis.MinorTick = 'off';
            end
        end
    case 4
        % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
        if isAxisExist(hAxis,axname{8})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{8});
            rightAxisMinor = hAxis(loc);
            switch lab
                case {1,2,3}
                    rightAxisMinor.YAxis.MinorTick = 'on';
                    rightAxisMinor.TickDir = str{lab};
                case 4
                    rightAxisMinor.YAxis.MinorTick = 'off';
            end
        end
end
% Hints: contents = cellstr(get(hObject,'String')) returns minorTickDirPopu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from minorTickDirPopu


% --- Executes during object creation, after setting all properties.
function minorTickDirPopu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minorTickDirPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in axisThicknessPopu.
function axisThicknessPopu_Callback(hObject, eventdata, handles)
% hObject    handle to axisThicknessPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns axisThicknessPopu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from axisThicknessPopu
global hAxis fig axname
slist = findobj(0,'Tag','titleFormatList');
val = get(slist,'Value');
aTSP = findobj(0,'Tag','axisThicknessPopu');
atsoV = str2double(get(aTSP,'String'));
hAxis = findobj(fig,'type','axes');
switch val
    case 1
        if isAxisExist(hAxis,axname{1})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{1});
            bottomAxisMajor = hAxis(loc);
            bottomAxisMajor.XAxis.LineWidth = atsoV(get(aTSP,'Value'));
        end
        if isAxisExist(hAxis,axname{2})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{2});
            bottomAxisMinor = hAxis(loc);
            bottomAxisMinor.XAxis.LineWidth = atsoV(get(aTSP,'Value'));
        end
    case 2
        if isAxisExist(hAxis,axname{5})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{5});
            leftAxisMajor = hAxis(loc);
            leftAxisMajor.YAxis.LineWidth = atsoV(get(aTSP,'Value'));
        end
        if isAxisExist(hAxis,axname{6})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{6});
            leftAxisMinor = hAxis(loc);
            leftAxisMinor.YAxis.LineWidth = atsoV(get(aTSP,'Value'));
        end
    case 3
        if isAxisExist(hAxis,axname{3})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{3});
            topAxisMajor = hAxis(loc);
            topAxisMajor.XAxis.LineWidth = atsoV(get(aTSP,'Value'));
        end
        if isAxisExist(hAxis,axname{4})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{4});
            topAxisMinor = hAxis(loc);
            topAxisMinor.XAxis.LineWidth = atsoV(get(aTSP,'Value'));
        end
    case 4
        if isAxisExist(hAxis,axname{7})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{7});
            rightAxisMajor = hAxis(loc);
            rightAxisMajor.YAxis.LineWidth = atsoV(get(aTSP,'Value'));
        end
        if isAxisExist(hAxis,axname{8})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{8});
            rightAxisMinor = hAxis(loc);
            rightAxisMinor.YAxis.LineWidth = atsoV(get(aTSP,'Value'));
        end
end

% --- Executes during object creation, after setting all properties.
function axisThicknessPopu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axisThicknessPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in majorTickLenPopu.
function majorTickLenPopu_Callback(hObject, eventdata, handles)
% hObject    handle to majorTickLenPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns majorTickLenPopu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from majorTickLenPopu
global hAxis fig axname
slist = findobj(0,'Tag','titleFormatList');
val = get(slist,'Value');
mTLP = findobj(0,'Tag','majorTickLenPopu');
mtlpV = str2double(get(mTLP,'String'));
hAxis = findobj(fig,'type','axes');
switch val
    case 1
        if isAxisExist(hAxis,axname{1})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{1});
            bottomAxisMajor = hAxis(loc);
            tlen = bottomAxisMajor.TickLength;
            tlen(1) = mtlpV(get(mTLP,'Value'));
            bottomAxisMajor.TickLength = tlen;
        end
        if isAxisExist(hAxis,axname{2})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{2});
            bottomAxisMinor = hAxis(loc);
            tlen = bottomAxisMinor.TickLength;
            tlen(1) = mtlpV(get(mTLP,'Value'));
            bottomAxisMinor.TickLength = tlen;
        end
    case 2
        if isAxisExist(hAxis,axname{5})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{5});
            leftAxisMajor = hAxis(loc);
            tlen = leftAxisMajor.TickLength;
            tlen(1) = mtlpV(get(mTLP,'Value'));
            leftAxisMajor.TickLength = tlen;
        end
        if isAxisExist(hAxis,axname{6})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{6});
            leftAxisMinor = hAxis(loc);
            tlen = leftAxisMinor.TickLength;
            tlen(1) = mtlpV(get(mTLP,'Value'));
            leftAxisMinor.TickLength = tlen;
        end
        
    case 3
        if isAxisExist(hAxis,axname{3})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{3});
            topAxisMajor = hAxis(loc);
            tlen = topAxisMajor.TickLength;
            tlen(1) = mtlpV(get(mTLP,'Value'));
            topAxisMajor.TickLength = tlen;
        end
        if isAxisExist(hAxis,axname{4})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{4});
            topAxisMinor = hAxis(loc);
            tlen = topAxisMinor.TickLength;
            tlen(1) = mtlpV(get(mTLP,'Value'));
            topAxisMinor.TickLength = tlen;
        end
    case 4
        if isAxisExist(hAxis,axname{7})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{7});
            rightAxisMajor = hAxis(loc);
            tlen = rightAxisMajor.TickLength;
            tlen(1) = mtlpV(get(mTLP,'Value'));
            rightAxisMajor.TickLength = tlen;
        end
        if isAxisExist(hAxis,axname{8})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{8});
            rightAxisMinor = hAxis(loc);
            tlen = rightAxisMinor.TickLength;
            tlen(1) = mtlpV(get(mTLP,'Value'));
            rightAxisMinor.TickLength = tlen;
        end
end
% --- Executes during object creation, after setting all properties.
function majorTickLenPopu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to majorTickLenPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear global;
close();

% --- Executes on button press in titleFormatCancelPush.
function titleFormatCancelPush_Callback(hObject, eventdata, handles)
% hObject    handle to titleFormatCancelPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();

% --- Executes on button press in titleFormatApplyPush.
function titleFormatApplyPush_Callback(hObject, eventdata, handles)
% hObject    handle to titleFormatApplyPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ax;
slist = findobj(0,'Tag','titleFormatList');
val = get(slist,'Value');
aTSP = findobj(0,'Tag','axisThicknessPopu');
atsoV = str2double(get(aTSP,'String'));
mTLP = findobj(0,'Tag','majorTickLenPopu');
mtlpV = str2double(get(mTLP,'String'));
switch val
    case 1
        ax.XAxis.LineWidth = atsoV(get(aTSP,'Value'));
        tlen = ax.TickLength;
        tlen(1) = mtlpV(get(mTLP,'Value'));
        ax.TickLength = tlen;
    case 2
        
    case 3
        
    case 4
        
end

% --- Executes on button press in setFontPush.
function setFontPush_Callback(hObject, eventdata, handles)
% hObject    handle to setFontPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global hAxis fig axname
fonts = uisetfont;
slist = findobj(0,'Tag','titleFormatList');
val = get(slist,'Value');
aTR = findobj(0,'Tag','AxisTitleRadio');
lab = get(aTR,'Value');
hAxis = findobj(fig,'type','axes');
switch val
    case 1
        % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
        if isAxisExist(hAxis,axname{1})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{1});
            bottomAxisMajor = hAxis(loc);
            switch lab
                case 1
                    bottomAxisMajor.XAxis.Label.FontName = fonts.FontName;
                    bottomAxisMajor.XAxis.Label.FontWeight = fonts.FontWeight;
                    bottomAxisMajor.XAxis.Label.FontAngle = fonts.FontAngle;
                    bottomAxisMajor.XAxis.Label.FontSize = fonts.FontSize;
                case 0
                    bottomAxisMajor.XAxis.Label.FontName = fonts.FontName;
                    bottomAxisMajor.XAxis.Label.FontWeight = fonts.FontWeight;
                    bottomAxisMajor.XAxis.Label.FontAngle = fonts.FontAngle;
                    bottomAxisMajor.XAxis.Label.FontSize = fonts.FontSize;
                    bottomAxisMajor.FontName = fonts.FontName;
                    bottomAxisMajor.FontWeight = fonts.FontWeight;
                    bottomAxisMajor.FontAngle = fonts.FontAngle;
                    bottomAxisMajor.FontSize = fonts.FontSize;
            end
        end
    case 2
        if isAxisExist(hAxis,axname{5})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{5});
            leftAxisMajor = hAxis(loc);
            switch lab
                case 1
                    leftAxisMajor.YAxis.Label.FontName = fonts.FontName;
                    leftAxisMajor.YAxis.Label.FontWeight = fonts.FontWeight;
                    leftAxisMajor.YAxis.Label.FontAngle = fonts.FontAngle;
                    leftAxisMajor.YAxis.Label.FontSize = fonts.FontSize;
                case 0
                    leftAxisMajor.YAxis.Label.FontName = fonts.FontName;
                    leftAxisMajor.YAxis.Label.FontWeight = fonts.FontWeight;
                    leftAxisMajor.YAxis.Label.FontAngle = fonts.FontAngle;
                    leftAxisMajor.YAxis.Label.FontSize = fonts.FontSize;
                    leftAxisMajor.FontName = fonts.FontName;
                    leftAxisMajor.FontWeight = fonts.FontWeight;
                    leftAxisMajor.FontAngle = fonts.FontAngle;
                    leftAxisMajor.FontSize = fonts.FontSize;
            end
        end
    case 3
        if isAxisExist(hAxis,axname{3})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{3});
            topAxisMajor = hAxis(loc);
            switch lab
                case 1
                    topAxisMajor.XAxis.Label.FontName = fonts.FontName;
                    topAxisMajor.XAxis.Label.FontWeight = fonts.FontWeight;
                    topAxisMajor.XAxis.Label.FontAngle = fonts.FontAngle;
                    topAxisMajor.XAxis.Label.FontSize = fonts.FontSize;
                case 0
                    topAxisMajor.XAxis.Label.FontName = fonts.FontName;
                    topAxisMajor.XAxis.Label.FontWeight = fonts.FontWeight;
                    topAxisMajor.XAxis.Label.FontAngle = fonts.FontAngle;
                    topAxisMajor.XAxis.Label.FontSize = fonts.FontSize;
                    topAxisMajor.FontName = fonts.FontName;
                    topAxisMajor.FontWeight = fonts.FontWeight;
                    topAxisMajor.FontAngle = fonts.FontAngle;
                    topAxisMajor.FontSize = fonts.FontSize;
            end
        end
    case 4
        if isAxisExist(hAxis,axname{7})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{7});
            rightAxisMajor = hAxis(loc);
            switch lab
                case 1
                    rightAxisMajor.YAxis.Label.FontName = fonts.FontName;
                    rightAxisMajor.YAxis.Label.FontWeight = fonts.FontWeight;
                    rightAxisMajor.YAxis.Label.FontAngle = fonts.FontAngle;
                    rightAxisMajor.YAxis.Label.FontSize = fonts.FontSize;
                case 0
                    rightAxisMajor.YAxis.Label.FontName = fonts.FontName;
                    rightAxisMajor.YAxis.Label.FontWeight = fonts.FontWeight;
                    rightAxisMajor.YAxis.Label.FontAngle = fonts.FontAngle;
                    rightAxisMajor.YAxis.Label.FontSize = fonts.FontSize;
                    rightAxisMajor.FontName = fonts.FontName;
                    rightAxisMajor.FontWeight = fonts.FontWeight;
                    rightAxisMajor.FontAngle = fonts.FontAngle;
                    rightAxisMajor.FontSize = fonts.FontSize;
            end
        end
        
end

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in girdLinesCancelPush.
function girdLinesCancelPush_Callback(hObject, eventdata, handles)
% hObject    handle to girdLinesCancelPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear global;
close();

% --- Executes on selection change in gridLineList.
function gridLineList_Callback(hObject, eventdata, handles)
% hObject    handle to gridLineList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns gridLineList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from gridLineList


% --- Executes during object creation, after setting all properties.
function gridLineList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gridLineList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in gridMajorLineTypePopu.
function gridMajorLineTypePopu_Callback(hObject, eventdata, handles)
% hObject    handle to gridMajorLineTypePopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns gridMajorLineTypePopu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from gridMajorLineTypePopu
global ax;
glist = findobj(0,'Tag','gridLineList');
gval = get(glist,'Value');
gMaLTP = findobj(0,'Tag','gridMajorLineTypePopu');
val = get(gMaLTP,'Value');
switch val
    case 1
        ax.GridLineStyle = '-';
    case 2
        ax.GridLineStyle = '--';
    case 3
        ax.GridLineStyle = ':';
    case 4
        ax.GridLineStyle = '-.';
end

% --- Executes during object creation, after setting all properties.
function gridMajorLineTypePopu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gridMajorLineTypePopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in gridLineMajorCheck.
function gridLineMajorCheck_Callback(hObject, eventdata, handles)
% hObject    handle to gridLineMajorCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of gridLineMajorCheck
global ax;
glist = findobj(0,'Tag','gridLineList');
gval = get(glist,'Value');
gMaLSCP = findobj(0,'Tag','gridMajorLineSetColorPush');
gMaLTP = findobj(0,'Tag','gridMajorLineTypePopu');
gLTkP = findobj(0,'Tag','gridLineThicknessPopu');
gMaLTsP = findobj(0,'Tag','gridMajorLineTtransPopu');
gLMC = findobj(0,'Tag','gridLineMajorCheck');
val = get(gLMC,'Value');
switch val
    case 0
        set(gMaLSCP,'Enable','off');
        set(gMaLTP,'Enable','off');
        set(gMaLTsP,'Enable','off');
        switch gval
            case 1
                ax.XGrid = 'off';
            case 2
                ax.YGrid = 'off';
        end
        if isequal(ax.XGrid,'on')||isequal(ax.XMinorGrid,'on')
            set(gLTkP,'Enable','on');
        else
            set(gLTkP,'Enable','off');
        end
    case 1
        set(gMaLSCP,'Enable','on');
        set(gMaLTP,'Enable','on');
        set(gMaLTsP,'Enable','on');
        switch gval
            case 1
                ax.XGrid = 'on';
            case 2
                ax.YGrid = 'on';
        end
        if isequal(ax.YGrid,'off')||isequal(ax.YMinorGrid,'off')
            set(gLTkP,'Enable','on');
        else
            set(gLTkP,'Enable','off');
        end
end


% --- Executes on button press in gridMajorLineSetColorPush.
function gridMajorLineSetColorPush_Callback(hObject, eventdata, handles)
% hObject    handle to gridMajorLineSetColorPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ax;
c = uisetcolor;
ax.GridColor = c;


% --- Executes on button press in gridMinorLineSetColorPush.
function gridMinorLineSetColorPush_Callback(hObject, eventdata, handles)
% hObject    handle to gridMinorLineSetColorPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ax;
c = uisetcolor;
ax.MinorGridColor = c;

% --- Executes on button press in gridLineMinorCheck.
function gridLineMinorCheck_Callback(hObject, eventdata, handles)
% hObject    handle to gridLineMinorCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of gridLineMinorCheck
global ax;
glist = findobj(0,'Tag','gridLineList');
gval = get(glist,'Value');
gMiLSCP = findobj(0,'Tag','gridMinorLineSetColorPush');
gMiLTP = findobj(0,'Tag','gridMinorLineTypePopu');
gLTkP = findobj(0,'Tag','gridLineThicknessPopu');
gMiLTsP = findobj(0,'Tag','gridMinorLineTtransPopu');
gLMC = findobj(0,'Tag','gridLineMinorCheck');
val = get(gLMC,'Value');
switch val
    case 0
        set(gMiLSCP,'Enable','off');
        set(gMiLTP,'Enable','off');
        set(gMiLTsP,'Enable','off');
        switch gval
            case 1
                ax.XMinorGrid = 'off';
            case 2
                ax.YMinorGrid = 'off';
        end
        if isequal(ax.XGrid,'on')||isequal(ax.XMinorGrid,'on')
            set(gLTkP,'Enable','on');
        else
            set(gLTkP,'Enable','off');
        end
    case 1
        set(gMiLSCP,'Enable','on');
        set(gMiLTP,'Enable','on');
        set(gMiLTsP,'Enable','on');
        switch gval
            case 1
                ax.XMinorGrid = 'on';
            case 2
                ax.YMinorGrid = 'on';
        end
        if isequal(ax.XGrid,'on')||isequal(ax.XMinorGrid,'on')
            set(gLTkP,'Enable','on');
        else
            set(gLTkP,'Enable','off');
        end
end

% --- Executes on selection change in gridMinorLineTypePopu.
function gridMinorLineTypePopu_Callback(hObject, eventdata, handles)
% hObject    handle to gridMinorLineTypePopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns gridMinorLineTypePopu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from gridMinorLineTypePopu
global ax;
glist = findobj(0,'Tag','gridLineList');
gval = get(glist,'Value');
gMaLTP = findobj(0,'Tag','gridMinorLineTypePopu');
val = get(gMaLTP,'Value');
switch val
    case 1
        ax.MinorGridLineStyle = '--';
    case 2
        ax.MinorGridLineStyle = ':';
    case 3
        ax.MinorGridLineStyle = '-.';
    case 4
        ax.MinorGridLineStyle = '-';
end

% --- Executes during object creation, after setting all properties.
function gridMinorLineTypePopu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gridMinorLineTypePopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in gridLineThicknessPopu.
function gridLineThicknessPopu_Callback(hObject, eventdata, handles)
% hObject    handle to gridLineThicknessPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns gridLineThicknessPopu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from gridLineThicknessPopu
global ax;
gMLTP = findobj(0,'Tag','gridLineThicknessPopu');
val = get(gMLTP,'Value');
str = get(gMLTP,'String');
ax.LineWidth = str2double(str(val));

slist = findobj(0,'Tag','titleFormatList');
val = get(slist,'Value');
aTSP = findobj(0,'Tag','axisThicknessPopu');
atsoV = str2double(get(aTSP,'String'));
switch val
    case 1
        ax.XAxis.LineWidth = atsoV(get(aTSP,'Value'));
    case 2
        
    case 3
        
    case 4
        
end

% --- Executes during object creation, after setting all properties.
function gridLineThicknessPopu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gridLineThicknessPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in gridMajorLineTtransPopu.
function gridMajorLineTtransPopu_Callback(hObject, eventdata, handles)
% hObject    handle to gridMajorLineTtransPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns gridMajorLineTtransPopu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from gridMajorLineTtransPopu
global ax;
gMLTP = findobj(0,'Tag','gridMajorLineTtransPopu');
val = get(gMLTP,'Value');
str = get(gMLTP,'String');
ax.GridAlpha = str2double(str(val));

% --- Executes during object creation, after setting all properties.
function gridMajorLineTtransPopu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gridMajorLineTtransPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in axisTypePopu.
function axisTypePopu_Callback(hObject, eventdata, handles)
% hObject    handle to axisTypePopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns axisTypePopu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from axisTypePopu


% --- Executes during object creation, after setting all properties.
function axisTypePopu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axisTypePopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function minLim_Callback(hObject, eventdata, handles)
% hObject    handle to minLim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of minLim as text
%        str2double(get(hObject,'String')) returns contents of minLim as a double


% --- Executes during object creation, after setting all properties.
function minLim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minLim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in scaleList.
function scaleList_Callback(hObject, eventdata, handles)
% hObject    handle to scaleList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns scaleList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from scaleList
global ax
miLim = findobj(0,'Tag','minLim');
mxLim = findobj(0,'Tag','maxLim');
slist = findobj(0,'Tag','scaleList');
aTP = findobj(0,'Tag','axisTypePopu');
incM = findobj(0,'Tag','incrementEdit');
val = get(slist,'Value');
switch val
    case 1
        set(miLim,'String',min(ax.XLim));
        set(mxLim,'String',max(ax.XLim));
        dd = diff(ax.XTick);
        set(incM,'String',dd(end));
        lab = ax.XScale;
        switch lab
            case 'linear'
                set(aTP,'Value',1);
            case 'log'
                set(aTP,'Value',2);
        end
    case 2
        set(miLim,'String',min(ax.YLim));
        set(mxLim,'String',max(ax.YLim));
        dd = diff(ax.YTick);
        set(incM,'String',dd(end));
        lab = ax.YScale;
        switch lab
            case 'linear'
                set(aTP,'Value',1);
            case 'log'
                set(aTP,'Value',2);
        end
end

% --- Executes during object creation, after setting all properties.
function scaleList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scaleList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxLim_Callback(hObject, eventdata, handles)
% hObject    handle to maxLim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxLim as text
%        str2double(get(hObject,'String')) returns contents of maxLim as a double


% --- Executes during object creation, after setting all properties.
function maxLim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxLim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in incrementRadio.
function incrementRadio_Callback(hObject, eventdata, handles)
% hObject    handle to incrementRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of incrementRadio
incR = findobj(0,'Tag','incrementRadio');
nMTR = findobj(0,'Tag','numMajorTickRadio');
incE = findobj(0,'Tag','incrementEdit');
nMTE = findobj(0,'Tag','numMajorTickEdit');
set(incR,'Value',1);
set(incE,'Enable','on')
set(nMTR,'Value',0);
set(nMTE,'Enable','off');

function incrementEdit_Callback(hObject, eventdata, handles)
% hObject    handle to incrementEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of incrementEdit as text
%        str2double(get(hObject,'String')) returns contents of incrementEdit as a double


% --- Executes during object creation, after setting all properties.
function incrementEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to incrementEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in numMajorTickRadio.
function numMajorTickRadio_Callback(hObject, eventdata, handles)
% hObject    handle to numMajorTickRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of numMajorTickRadio
incR = findobj(0,'Tag','incrementRadio');
nMTR = findobj(0,'Tag','numMajorTickRadio');
incE = findobj(0,'Tag','incrementEdit');
nMTE = findobj(0,'Tag','numMajorTickEdit');
set(incR,'Value',0);
set(incE,'Enable','off')
set(nMTR,'Value',1);
set(nMTE,'Enable','on');


function numMajorTickEdit_Callback(hObject, eventdata, handles)
% hObject    handle to numMajorTickEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numMajorTickEdit as text
%        str2double(get(hObject,'String')) returns contents of numMajorTickEdit as a double


% --- Executes during object creation, after setting all properties.
function numMajorTickEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numMajorTickEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in numMinorTickRadio.
function numMinorTickRadio_Callback(hObject, eventdata, handles)
% hObject    handle to numMinorTickRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of numMinorTickRadio



function numMinorTickEdit_Callback(hObject, eventdata, handles)
% hObject    handle to numMinorTickEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numMinorTickEdit as text
%        str2double(get(hObject,'String')) returns contents of numMinorTickEdit as a double


% --- Executes during object creation, after setting all properties.
function numMinorTickEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numMinorTickEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear global;
close();

% --- Executes on button press in scaleCancel.
function scaleCancel_Callback(hObject, eventdata, handles)
% hObject    handle to scaleCancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();

% --- Executes on button press in scaleApplyPush.
function scaleApplyPush_Callback(hObject, eventdata, handles)
% hObject    handle to scaleApplyPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ax fig hAxis axname xtmpTick xtmpTickLabel ytmpTick ytmpTickLabel
miLim = findobj(0,'Tag','minLim');
mxLim = findobj(0,'Tag','maxLim');
slist = findobj(0,'Tag','scaleList');
aTP = findobj(0,'Tag','axisTypePopu');
nMTR = findobj(0,'Tag','numMinorTickRadio');
strtlc = findobj(0,'Tag','showTRTicksLabelCheck');
val = get(slist,'Value');
lab = get(aTP,'Value');
nmlab = get(nMTR,'Value');
hAxis = findobj(fig,'type','axes');
%
% dd = diff(ax.XTick);
% set(incM,'String',dd(end));
%
switch val
    % 水平方向
    case 1
        xmin = str2double(get(miLim,'String'));
        xmax = str2double(get(mxLim,'String'));
        xlimit = [xmin xmax];
        % 先判断坐标轴类型，再判断刻度增量选择
        switch lab
            case 1
                incR = findobj(0,'Tag','incrementRadio');
                icrVal = get(incR,'Value');
                ax.XLim = xlimit;
                ax.XScale = 'linear';
                if isAxisExist(hAxis,axname{1})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{1});
                    bottomAxisMajor = hAxis(loc);
                    bottomAxisMajor.XLim = xlimit;
                    bottomAxisMajor.XScale = 'linear';
                end
                if isAxisExist(hAxis,axname{2})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{2});
                    bottomAxisMinor = hAxis(loc);
                    bottomAxisMinor.XLim = xlimit;
                    bottomAxisMinor.XScale = 'linear';
                end
                if isAxisExist(hAxis,axname{3})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{3});
                    topAxisMajor = hAxis(loc);
                    topAxisMajor.XLim = xlimit;
                    topAxisMajor.XScale = 'linear';
                end
                if isAxisExist(hAxis,axname{4})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{4});
                    topAxisMinor = hAxis(loc);
                    topAxisMinor.XLim = xlimit;
                    topAxisMinor.XScale = 'linear';
                end
                if icrVal == 1
                    incE = findobj(0,'Tag','incrementEdit');
                    interval = str2double(get(incE,'String'));
                    [xTicks,xTickLabels] = calcticks(xlimit,'x',ax,'linear',true,true,[],[1 interval]);
                    ax.XTick = xTicks;
                    ax.XTickLabel = xTickLabels;
                    if isAxisExist(hAxis,axname{1})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{1});
                        bottomAxisMajor = hAxis(loc);
                        bottomAxisMajor.XTick = xTicks;
                        bottomAxisMajor.XTickLabel = xTickLabels;
                    end
                    if isAxisExist(hAxis,axname{3})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{3});
                        topAxisMajor = hAxis(loc);
                        topAxisMajor.XTick = xTicks;
                        val = get(strtlc,'Value');
                        if isequal(val,1)
                            topAxisMajor.XTickLabel = xTickLabels;
                        else
                            topAxisMajor.XTickLabel = '';
                        end
                    end
                else
                    nMTE = findobj(0,'Tag','numMajorTickEdit');
                    interval = str2double(get(nMTE,'String'));
                    [xTicks,xTickLabels] = calcticks(xlimit,'x',ax,'linear',true,true,[],[2 interval]);
                    ax.XTick = xTicks;
                    ax.XTickLabel = xTickLabels;
                    ax.XScale = 'linear';
                    if isAxisExist(hAxis,axname{1})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{1});
                        bottomAxisMajor = hAxis(loc);
                        bottomAxisMajor.XTick = xTicks;
                        bottomAxisMajor.XTickLabel = xTickLabels;
                        bottomAxisMajor.XScale = 'linear';
                    end
                    if isAxisExist(hAxis,axname{3})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{3});
                        topAxisMajor = hAxis(loc);
                        topAxisMajor.XTick = xTicks;
                        val = get(strtlc,'Value');
                        if isequal(val,1)
                            topAxisMajor.XTickLabel = xTickLabels;
                        else
                            topAxisMajor.XTickLabel = '';
                        end
                        topAxisMajor.XScale = 'linear';
                    end
                end
                xtmpTick = xTicks;
                xtmpTickLabel = xTickLabels;
            case 2
                if xmax > 0
                    if xmin <= 0
                        msgbox('值域下限不能小于0，已自动调至1e-8','温馨提示：');
                        xmin = 1e-8;
                    end
                    xlimit = [xmin xmax];
                    ax.XLim = xlimit;
                    ax.XAxis.Scale = 'log';
                    if isAxisExist(hAxis,axname{1})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{1});
                        bottomAxisMajor = hAxis(loc);
                        bottomAxisMajor.XLim = xlimit;
                        bottomAxisMajor.XScale = 'log';
                    end
                    if isAxisExist(hAxis,axname{2})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{2});
                        bottomAxisMinor = hAxis(loc);
                        bottomAxisMinor.XLim = xlimit;
                        bottomAxisMinor.XScale = 'log';
                    end
                    if isAxisExist(hAxis,axname{3})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{3});
                        topAxisMajor = hAxis(loc);
                        topAxisMajor.XLim = xlimit;
                        topAxisMajor.XScale = 'log';
                    end
                    if isAxisExist(hAxis,axname{4})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{4});
                        topAxisMinor = hAxis(loc);
                        topAxisMinor.XLim = xlimit;
                        topAxisMinor.XScale = 'log';
                    end
                    incR = findobj(0,'Tag','incrementRadio');
                    icrVal = get(incR,'Value');
                    if icrVal == 1
                        incE = findobj(0,'Tag','incrementEdit');
                        interval = str2double(get(incE,'String'));
                        [xTicks,xTickLabels] = calcticks(xlimit,'x',ax,'log',true,true,[],[1 interval]);
                        ax.XTick = xTicks;
                        ax.XTickLabel = xTickLabels;
                        if isAxisExist(hAxis,axname{1})
                            hAxis = findobj(fig,'type','axes');
                            uniqueAxis(hAxis);
                            hAxis = findobj(fig,'type','axes');
                            loc = findAxis(hAxis,axname{1});
                            bottomAxisMajor = hAxis(loc);
                            bottomAxisMajor.XTick = xTicks;
                            bottomAxisMajor.XTickLabel = xTickLabels;
                        end
                        if isAxisExist(hAxis,axname{3})
                            hAxis = findobj(fig,'type','axes');
                            uniqueAxis(hAxis);
                            hAxis = findobj(fig,'type','axes');
                            loc = findAxis(hAxis,axname{3});
                            topAxisMajor = hAxis(loc);
                            topAxisMajor.XTick = xTicks;
                            val = get(strtlc,'Value');
                            if isequal(val,1)
                                topAxisMajor.XTickLabel = xTickLabels;
                            else
                                topAxisMajor.XTickLabel = '';
                            end
                        end
                    else
                        nMTE = findobj(0,'Tag','numMajorTickEdit');
                        interval = str2double(get(nMTE,'String'));
                        [xTicks,xTickLabels] = calcticks(xlimit,'x',ax,'log',[],[],[],[2 interval]);
                        ax.XTick = xTicks;
                        ax.XTickLabel = xTickLabels;
                        ax.XScale = 'log';
                        if isAxisExist(hAxis,axname{1})
                            hAxis = findobj(fig,'type','axes');
                            uniqueAxis(hAxis);
                            hAxis = findobj(fig,'type','axes');
                            loc = findAxis(hAxis,axname{1});
                            bottomAxisMajor = hAxis(loc);
                            bottomAxisMajor.XTick = xTicks;
                            bottomAxisMajor.XTickLabel = xTickLabels;
                            bottomAxisMajor.XScale = 'log';
                        end
                        if isAxisExist(hAxis,axname{2})
                            hAxis = findobj(fig,'type','axes');
                            uniqueAxis(hAxis);
                            hAxis = findobj(fig,'type','axes');
                            loc = findAxis(hAxis,axname{2});
                            bottomAxisMinor = hAxis(loc);
                            bottomAxisMinor.XScale = 'log';
                        end
                        if isAxisExist(hAxis,axname{3})
                            hAxis = findobj(fig,'type','axes');
                            uniqueAxis(hAxis);
                            hAxis = findobj(fig,'type','axes');
                            loc = findAxis(hAxis,axname{3});
                            topAxisMajor = hAxis(loc);
                            topAxisMajor.XScale = 'log';
                        end
                        if isAxisExist(hAxis,axname{4})
                            hAxis = findobj(fig,'type','axes');
                            uniqueAxis(hAxis);
                            hAxis = findobj(fig,'type','axes');
                            loc = findAxis(hAxis,axname{4});
                            topAxisMinor = hAxis(loc);
                            topAxisMinor.XLim = xlimit;
                            topAxisMinor.XScale = 'log';
                        end
                    end
                    xtmpTick = xTicks;
                    xtmpTickLabel = xTickLabels;
                else
                    msgbox('log函数值域不能小于0，请重新设至合理范围','温馨提示：');
                end
        end
        if nmlab == 1
            nMTE = findobj(0,'Tag','numMinorTickEdit');
            N = str2double(get(nMTE,'String'));
            %X limit value
            xlim = ax.XLim;
            %X tick value
            xtick = ax.XTick;
            %X dtick
            dxtick = (xtick(2) - xtick(1));
            %X minortick interval
            dmx = dxtick/N;
            %X minortick value
            ax.XAxis.MinorTick = 'on';
            ax.XAxis.MinorTickValues = [(xtick(1)-dmx):-dmx:(xlim(1)-dmx),xtick(1):dmx:xtick(end),(xtick(end)+dmx):dmx:(xlim(2)+dmx)];
            if isAxisExist(hAxis,axname{2})
                hAxis = findobj(fig,'type','axes');
                uniqueAxis(hAxis);
                hAxis = findobj(fig,'type','axes');
                loc = findAxis(hAxis,axname{2});
                bottomAxisMinor = hAxis(loc);
                bottomAxisMinor.XAxis.MinorTick = 'on';
                bottomAxisMinor.XAxis.MinorTickValues = [(xtick(1)-dmx):-dmx:(xlim(1)-dmx),xtick(1):dmx:xtick(end),(xtick(end)+dmx):dmx:(xlim(2)+dmx)];
            end
            if isAxisExist(hAxis,axname{4})
                hAxis = findobj(fig,'type','axes');
                uniqueAxis(hAxis);
                hAxis = findobj(fig,'type','axes');
                loc = findAxis(hAxis,axname{4});
                topAxisMinor = hAxis(loc);
                topAxisMinor.XAxis.MinorTick = 'on';
                topAxisMinor.XAxis.MinorTickValues = [(xtick(1)-dmx):-dmx:(xlim(1)-dmx),xtick(1):dmx:xtick(end),(xtick(end)+dmx):dmx:(xlim(2)+dmx)];
            end
        else
            ax.XAxis.MinorTick = 'off';
            if isAxisExist(hAxis,axname{2})
                hAxis = findobj(fig,'type','axes');
                uniqueAxis(hAxis);
                hAxis = findobj(fig,'type','axes');
                loc = findAxis(hAxis,axname{2});
                bottomAxisMinor = hAxis(loc);
                bottomAxisMinor.XAxis.MinorTick = 'off';
            end
            if isAxisExist(hAxis,axname{4})
                hAxis = findobj(fig,'type','axes');
                uniqueAxis(hAxis);
                hAxis = findobj(fig,'type','axes');
                loc = findAxis(hAxis,axname{4});
                topAxisMinor = hAxis(loc);
                topAxisMinor.XAxis.MinorTick = 'off';
            end
        end
        % 竖直方向
    case 2
        ymin = str2double(get(miLim,'String'));
        ymax = str2double(get(mxLim,'String'));
        ylimit = [ymin ymax];
        % 先判断坐标轴类型，再判断刻度增量选择
        switch lab
            case 1
                incR = findobj(0,'Tag','incrementRadio');
                icrVal = get(incR,'Value');
                ax.YLim = ylimit;
                ax.YScale = 'linear';
                if isAxisExist(hAxis,axname{5})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{5});
                    leftAxisMajor = hAxis(loc);
                    leftAxisMajor.YLim = ylimit;
                    leftAxisMajor.YScale = 'linear';
                end
                if isAxisExist(hAxis,axname{6})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{6});
                    leftAxisMinor = hAxis(loc);
                    leftAxisMinor.YLim = ylimit;
                    leftAxisMinor.YScale = 'linear';
                end
                if isAxisExist(hAxis,axname{7})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{7});
                    rightAxisMajor = hAxis(loc);
                    rightAxisMajor.YLim = ylimit;
                    rightAxisMajor.YScale = 'linear';
                end
                if isAxisExist(hAxis,axname{8})
                    hAxis = findobj(fig,'type','axes');
                    uniqueAxis(hAxis);
                    hAxis = findobj(fig,'type','axes');
                    loc = findAxis(hAxis,axname{8});
                    rightAxisMinor = hAxis(loc);
                    rightAxisMinor.YLim = ylimit;
                    rightAxisMinor.YScale = 'linear';
                end
                if icrVal == 1
                    incE = findobj(0,'Tag','incrementEdit');
                    interval = str2double(get(incE,'String'));
                    [yTicks,yTickLabels] = calcticks(ylimit,'y',ax,'linear',true,true,[],[1 interval]);
                    ax.YTick = yTicks;
                    ax.YTickLabel = yTickLabels;
                    ax.YScale = 'linear';
                    if isAxisExist(hAxis,axname{5})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{5});
                        leftAxisMajor = hAxis(loc);
                        leftAxisMajor.YTick = yTicks;
                        leftAxisMajor.YTickLabel = yTickLabels;
                        leftAxisMajor.YScale = 'linear';
                    end
                    if isAxisExist(hAxis,axname{7})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{7});
                        rightAxisMajor = hAxis(loc);
                        rightAxisMajor.YTick = yTicks;
                        val = get(strtlc,'Value');
                        if isequal(val,1)
                            rightAxisMajor.YTickLabel = yTickLabels;
                        else
                            rightAxisMajor.YTickLabel = '';
                        end
                        rightAxisMajor.YScale = 'linear';
                    end
                else
                    nMTE = findobj(0,'Tag','numMajorTickEdit');
                    interval = str2double(get(nMTE,'String'));
                    [yTicks,yTickLabels] = calcticks(ylimit,'y',ax,'linear',true,true,[],[2 interval]);
                    ax.YTick = yTicks;
                    ax.YTickLabel = yTickLabels;
                    ax.YScale = 'linear';
                    if isAxisExist(hAxis,axname{5})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{5});
                        leftAxisMajor = hAxis(loc);
                        leftAxisMajor.YTick = yTicks;
                        leftAxisMajor.YTickLabel = yTickLabels;
                        leftAxisMajor.YScale = 'linear';
                    end
                    if isAxisExist(hAxis,axname{7})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{7});
                        rightAxisMajor = hAxis(loc);
                        rightAxisMajor.YTick = yTicks;
                        val = get(strtlc,'Value');
                        if isequal(val,1)
                            rightAxisMajor.YTickLabel = yTickLabels;
                        else
                            rightAxisMajor.YTickLabel = '';
                        end
                        rightAxisMajor.YScale = 'linear';
                    end
                end
                ytmpTick = yTicks;
                ytmpTickLabel = yTickLabels;
            case 2
                if ymax > 0
                    if ymin <= 0
                        msgbox('值域下限不能小于0，已自动调至1e-8','温馨提示：');
                        ymin = 1e-8;
                    end
                    ylimit = [ymin ymax];
                    ax.YLim = ylimit;
                    ax.YScale = 'log';
                    if isAxisExist(hAxis,axname{5})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{5});
                        leftAxisMajor = hAxis(loc);
                        leftAxisMajor.YLim = ylimit;
                        leftAxisMajor.YScale = 'log';
                    end
                    if isAxisExist(hAxis,axname{6})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{6});
                        leftAxisMinor = hAxis(loc);
                        leftAxisMinor.YLim = ylimit;
                        leftAxisMinor.YScale = 'log';
                    end
                    if isAxisExist(hAxis,axname{7})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{7});
                        rightAxisMajor = hAxis(loc);
                        rightAxisMajor.YLim = ylimit;
                        rightAxisMajor.YScale = 'log';
                    end
                    if isAxisExist(hAxis,axname{8})
                        hAxis = findobj(fig,'type','axes');
                        uniqueAxis(hAxis);
                        hAxis = findobj(fig,'type','axes');
                        loc = findAxis(hAxis,axname{8});
                        rightAxisMinor = hAxis(loc);
                        rightAxisMinor.YLim = ylimit;
                        rightAxisMinor.YScale = 'log';
                    end
                    incR = findobj(0,'Tag','incrementRadio');
                    icrVal = get(incR,'Value');
                    if icrVal == 1
                        incE = findobj(0,'Tag','incrementEdit');
                        interval = str2double(get(incE,'String'));
                        [yTicks,yTickLabels] = calcticks(ylimit,'y',ax,'log',true,true,[],[1 interval]);
                        ax.YTick = yTicks;
                        ax.YTickLabel = yTickLabels;
                        ax.YScale = 'log';
                        if isAxisExist(hAxis,axname{5})
                            hAxis = findobj(fig,'type','axes');
                            uniqueAxis(hAxis);
                            hAxis = findobj(fig,'type','axes');
                            loc = findAxis(hAxis,axname{5});
                            leftAxisMajor = hAxis(loc);
                            leftAxisMajor.YTick = yTicks;
                            leftAxisMajor.YTickLabel = yTickLabels;
                            leftAxisMajor.YScale =  'log';
                        end
                        if isAxisExist(hAxis,axname{7})
                            hAxis = findobj(fig,'type','axes');
                            uniqueAxis(hAxis);
                            hAxis = findobj(fig,'type','axes');
                            loc = findAxis(hAxis,axname{7});
                            rightAxisMajor = hAxis(loc);
                            rightAxisMajor.YTick = yTicks;
                            val = get(strtlc,'Value');
                            if isequal(val,1)
                                rightAxisMajor.YTickLabel = yTickLabels;
                            else
                                rightAxisMajor.YTickLabel = '';
                            end
                            rightAxisMajor.YScale =  'log';
                        end
                        if isAxisExist(hAxis,axname{6})
                            hAxis = findobj(fig,'type','axes');
                            uniqueAxis(hAxis);
                            hAxis = findobj(fig,'type','axes');
                            loc = findAxis(hAxis,axname{6});
                            leftAxisMinor = hAxis(loc);
                            leftAxisMinor.YScale =  'log';
                        end
                        if isAxisExist(hAxis,axname{8})
                            hAxis = findobj(fig,'type','axes');
                            uniqueAxis(hAxis);
                            hAxis = findobj(fig,'type','axes');
                            loc = findAxis(hAxis,axname{8});
                            rightAxisMinor = hAxis(loc);
                            rightAxisMinor.YScale =  'log';
                        end
                    else
                        nMTE = findobj(0,'Tag','numMajorTickEdit');
                        interval = str2double(get(nMTE,'String'));
                        [yTicks,yTickLabels] = calcticks(ylimit,'y',ax,'log',true,true,[],[2 interval]);
                        ax.YTick = yTicks;
                        ax.YTickLabel = yTickLabels;
                        ax.YScale = 'log';
                        if isAxisExist(hAxis,axname{5})
                            hAxis = findobj(fig,'type','axes');
                            uniqueAxis(hAxis);
                            hAxis = findobj(fig,'type','axes');
                            loc = findAxis(hAxis,axname{5});
                            leftAxisMajor = hAxis(loc);
                            leftAxisMajor.YTick = yTicks;
                            leftAxisMajor.YTickLabel = yTickLabels;
                            leftAxisMajor.YScale =  'log';
                        end
                        if isAxisExist(hAxis,axname{7})
                            hAxis = findobj(fig,'type','axes');
                            uniqueAxis(hAxis);
                            hAxis = findobj(fig,'type','axes');
                            loc = findAxis(hAxis,axname{7});
                            rightAxisMajor = hAxis(loc);
                            rightAxisMajor.YTick = yTicks;
                            val = get(strtlc,'Value');
                            if isequal(val,1)
                                rightAxisMajor.YTickLabel = yTickLabels;
                            else
                                rightAxisMajor.YTickLabel = '';
                            end
                            rightAxisMajor.YScale =  'log';
                        end
                        if isAxisExist(hAxis,axname{6})
                            hAxis = findobj(fig,'type','axes');
                            uniqueAxis(hAxis);
                            hAxis = findobj(fig,'type','axes');
                            loc = findAxis(hAxis,axname{6});
                            leftAxisMinor = hAxis(loc);
                            leftAxisMinor.YScale =  'log';
                        end
                        if isAxisExist(hAxis,axname{8})
                            hAxis = findobj(fig,'type','axes');
                            uniqueAxis(hAxis);
                            hAxis = findobj(fig,'type','axes');
                            loc = findAxis(hAxis,axname{8});
                            rightAxisMinor = hAxis(loc);
                            rightAxisMinor.YScale =  'log';
                        end
                    end
                    ytmpTick = yTicks;
                    ytmpTickLabel = yTickLabels;
                else
                    msgbox('log函数值域不能小于0，请重新设至合理范围','温馨提示：');
                end
        end
        if nmlab == 1
            nMTE = findobj(0,'Tag','numMinorTickEdit');
            N = str2double(get(nMTE,'String'));
            %Y limit value
            ylim = ax.YLim;
            %Y tick value
            ytick = ax.YTick;
            %Y dtick
            dytick = (ytick(2) - ytick(1));
            %Y minortick interval
            dmy = dytick/N;
            %Y minortick value
            ax.YAxis.MinorTick = 'on';
            ax.YAxis.MinorTickValues = [(ytick(1)-dmy):-dmy:(ylim(1)-dmy),ytick(1):dmy:ytick(end),(ytick(end)+dmy):dmy:(ylim(2)+dmy)];
            if isAxisExist(hAxis,axname{6})
                hAxis = findobj(fig,'type','axes');
                uniqueAxis(hAxis);
                hAxis = findobj(fig,'type','axes');
                loc = findAxis(hAxis,axname{6});
                leftAxisMinor = hAxis(loc);
                leftAxisMinor.YAxis.MinorTick = 'on';
                leftAxisMinor.YAxis.MinorTickValues = [(ytick(1)-dmy):-dmy:(ylim(1)-dmy),ytick(1):dmy:ytick(end),(ytick(end)+dmy):dmy:(ylim(2)+dmy)];
            end
            if isAxisExist(hAxis,axname{8})
                hAxis = findobj(fig,'type','axes');
                uniqueAxis(hAxis);
                hAxis = findobj(fig,'type','axes');
                loc = findAxis(hAxis,axname{8});
                rightAxisMinor = hAxis(loc);
                rightAxisMinor.YAxis.MinorTick = 'on';
                rightAxisMinor.YAxis.MinorTickValues = [(ytick(1)-dmy):-dmy:(ylim(1)-dmy),ytick(1):dmy:ytick(end),(ytick(end)+dmy):dmy:(ylim(2)+dmy)];
            end
        else
            ax.YAxis.MinorTick = 'off';
            if isAxisExist(hAxis,axname{6})
                hAxis = findobj(fig,'type','axes');
                uniqueAxis(hAxis);
                hAxis = findobj(fig,'type','axes');
                loc = findAxis(hAxis,axname{6});
                leftAxisMinor = hAxis(loc);
                leftAxisMinor.YAxis.MinorTick = 'off';
            end
            if isAxisExist(hAxis,axname{8})
                hAxis = findobj(fig,'type','axes');
                uniqueAxis(hAxis);
                hAxis = findobj(fig,'type','axes');
                loc = findAxis(hAxis,axname{8});
                rightAxisMinor = hAxis(loc);
                rightAxisMinor.YAxis.MinorTick = 'off';
            end
        end
end

% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on selection change in popupmenu10.
function popupmenu10_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu10 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu10


% --- Executes during object creation, after setting all properties.
function popupmenu10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on selection change in popupmenu11.
function popupmenu11_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu11 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu11


% --- Executes during object creation, after setting all properties.
function popupmenu11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in yRefLineCheck.
function yRefLineCheck_Callback(hObject, eventdata, handles)
% hObject    handle to yRefLineCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of yRefLineCheck
global ax orilen
yRLC = findobj(0,'Tag','yRefLineCheck');
yval = get(yRLC,'Value');
hLine = findobj(ax,'type','line');
len = length(hLine);
xlim = ax.XLim;
ylim = ax.YLim;
if min(ylim) < 0
    ny = zeros(1,2);
    switch yval
        case 0
            if len > orilen
                for k = 1:len-orilen
                    tmp = hLine(k);
                    lenX = length(tmp.XData);
                    lenY = length(tmp.YData);
                    conXY = (lenX == 2 && lenY == 2);
                    conY = (isequal(tmp.YData(1),0) && isequal(tmp.YData(1),tmp.YData(2)));
                    conX = (~isequal(tmp.XData(1),tmp.XData(2)));
                    if  conXY && conX && conY
                        delete(hLine(k));
                    end
                end
            end
            drawnow;
        case 1
            line(ax,xlim,ny,'Color','blue','LineStyle','--','LineWidth',0.9);
            drawnow;
    end
else
    msgbox('Y坐标轴不在小于0的范围，请调整X轴范围再试！')
end


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11


% --- Executes on selection change in popupmenu16.
function popupmenu16_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu16 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu16


% --- Executes during object creation, after setting all properties.
function popupmenu16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on selection change in popupmenu8.
function popupmenu8_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu8


% --- Executes during object creation, after setting all properties.
function popupmenu8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function TabM02_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TabM02 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global ax
miLim = findobj(0,'Tag','minLim');
mxLim = findobj(0,'Tag','maxLim');
incM = findobj(0,'Tag','incrementEdit');
set(miLim,'String',min(ax.XLim));
set(mxLim,'String',max(ax.XLim));
dd = diff(ax.XTick);
set(incM,'String',dd(end));

function [ticks,tickLabels,scaleStr,minorTicks,overhang] = calcticks(limits,orientation,varargin)
% Calculate ticks and ticklabels for specified limits and text size

% $Filename: calcticks.m
% $Path: $toolboxroot/
% $Product Name: calcticks
% $Product Release: 1.1
% $Revision: 1.1.5
% $Toolbox Name: Custom Plots Toolbox
% Copyright (c) 2010-2011 John Barber.

%% Constants
% Default limit on label length (in characters)
defMaxChars = 9;
% Minimum value of the (upper) limit on label length (characters). Setting
% this value too small will cause problems.
% Note: This value does not affect the minimum length of the ticklabels.
minChars = 6;
% Default font size for exponents (assumes that font units are 'points')
defExpFontSize = 7;
% Upper limit on number of ticks returned by CALCTICKS
initMaxTicks = 11;
% Multiplier for textSize for vertical orientation when scale is 'log', to
% account for labels using exponential notation.
vertExpScale = 1.3;

%% Parse inputs
nargs = nargin;

% Validate orientation first so we can get the right axes limits if needed
% Orientation: {'v'} or 'h', also 'x' or 'y'
if nargs < 2 || isempty(orientation) || ~any(strcmpi(orientation(1),{'h','x'}))
    orientation = 'v';
else
    orientation = 'h';
end

% Text size
hAx = varargin{1};
textSize = getTextSize(limits,orientation,hAx);

% Scale
scale = varargin{2};

% Exponent string style
if nargs < 5 || isempty(varargin{3})
    separateExp = true;
else
    separateExp = varargin{3};
    if ischar(separateExp)
        % Accept 'y(es)', 't(rue)', 'o(n)', 's(eparate)' as true
        separateExp = any(strcmpi(separateExp(1),{'y','t','o','s'}));
    else
        separateExp = logical(separateExp(1));
    end
end

% Handle expFontSize, set a flag to use or not use this value
if nargs < 6 || isempty(varargin{4})
    smallExp = true;
    expFontSize = defExpFontSize;
else
    expFontSize = varargin{4};
    if islogical(expFontSize)
        smallExp = expFontSize;
        expFontSize = defExpFontSize;
    else
        smallExp = ~isnan(expFontSize) && expFontSize > 0;
    end
end

% Maximum number of characters in label string.  Determines numerical
% precision displayed by the labels, and also affects the tick spacing for
% horizontal orientation.
if nargs < 7 || isempty(varargin{5}) || ~(isnumeric(varargin{5}) && ...
        isscalar(varargin{5}))
    maxChars = defMaxChars;
else
    maxChars = varargin{5};
    if maxChars < minChars
        maxChars = minChars;
    end
end

%% Initial calculations

% Bypass to logticks calculation if scale is 'log'
if ~isempty(scale) && strcmpi(scale(1:2),'lo')
    [ticks,tickLabels,overhang,minorTicks] = logticks(limits,...
        textSize,orientation,smallExp,expFontSize,maxChars,vertExpScale);
    scaleStr = '';
    return
else
    % No minor ticks for linear scale
    minorTicks = [];
end

% Data range
range = diff(limits);

% Get eps values for rounding
lEps = eps(limits(1));
uEps = eps(limits(2));
minEps = min(lEps,uEps);

% Vector of allowed tick counts
testTickCounts = 2:initMaxTicks;

% Make a list of rough intervals as a starting point
roughInts = (range./(testTickCounts-1))';

% Vector of 'nice' intervals
niceVec = [1 2 5 10];

%% Find nice intervals

% Normalize rough intervals by their scale
decRoughInts = floor(log10(roughInts));
normRoughInts = roughInts./10.^decRoughInts;

% Get the distances to nice intervals, pick the shortest
deltas = abs(repmat(normRoughInts,1,length(niceVec)) - ...
    repmat(niceVec,length(normRoughInts),1));
[trash,idx] = min(deltas,[],2); %#ok<ASGLU>

% Get the nice intervals and scores
niceInts = niceVec(idx)'.*10.^decRoughInts;

% Remove duplicates
niceInts = unique(niceInts);

% Get upper and lower limits, fixed by the list of nice intervals.  Round
% out to make sure we get ticks at the original limits.
lLims = floor(limits(1)./niceInts).*niceInts;
uLims = ceil(limits(2)./niceInts).*niceInts;

% Get tick counts using the list of nice intervals and limits
nTicks = floor(1 + (uLims - lLims + 10*minEps)./niceInts);

% Shrink nice limits that are outside of original limits
idx = lLims < limits(1) - 10*eps(limits(1));
nTicks(idx) = nTicks(idx)-1;
lLims(idx) = lLims(idx) + niceInts(idx);
idx = uLims > limits(2) + 10*eps(limits(1));
nTicks(idx) = nTicks(idx)-1;
uLims(idx) = uLims(idx) - niceInts(idx);

% Set values that are almost exactly the original limits to be the original
% limit value.
idx = abs(lLims - limits(1)) < 10*eps(limits(1));
lLims(idx) = limits(1);
idx = abs(uLims - limits(2)) < 10*eps(limits(2));
uLims(idx) = limits(2);

% Discard values where the limits are reversed or equal
idx = (lLims >= uLims);
lLims(idx)=[];
uLims(idx)=[];
nTicks(idx)=[];
niceInts(idx)=[];

%% Determine label size for each interval

% Get the decade span of the limits and the decade of the intervals
maxAbs = max(abs([lLims uLims]),[],2);
decMax = floor(log10(maxAbs));% - nDec;
decInts = floor(log10(niceInts));% - nDec;

% Get the number of characters needed for tick labels for normal notation
labelChars = max(decMax+1,1) + (decInts<0).*(1-decInts);
labelChars(labelChars > maxChars - 1) = maxChars - 1;

% Handle exponential notation

% Determine whether or not to use exponential notation
if separateExp
    % Large numbers:
    isExp = (decMax > 6) | (decMax == 6 & decInts > 0);
    % Small numbers:
    isExp = isExp | (decMax < -3) | (decMax == -3 & decInts < -5);
else
    % Large numbers:
    isExp = decMax > 6 | (decMax == 6 & decInts > 3);
    % Small numbers:
    isExp = isExp | (decMax < -3) | (decMax == -3 & decInts < -5);
end

% Get length of exponential labels depending on style
if separateExp
    expChars = 2 + max(0,min(maxChars-3,decMax-decInts));
    %     scaleSignChar = decMax < 0;
    %     scaleChars = 5 + scaleSignChar + max(0,floor(log10(abs(decMax))));
else
    expChars = 2 + max(0,min(max(0,maxChars-7),decMax-decInts)) + 4;
end

% Select between normal and exponential label lengths
labelChars(isExp) = expChars(isExp);

% For consistency, always include space for a negative sign, regardless of
% the sign of the actual limits
labelChars = labelChars + 1;
% % Uncomment to not include the negative sign space if it isn't needed
% labelChars = labelChars + (lLims < 0);

% Get label size based on textSize, orientation and length of label string
if strcmp(orientation,'h')
    labelSize = textSize * labelChars;
else
    labelSize = textSize * ones(size(labelChars));
end

%% Choose the best interval

% Maximum number of ticks without overlapping labels
nMax = floor((uLims-lLims+10*minEps)./labelSize) + 1;

% Modify this value based on initMaxTicks
nMaxScore = min(nMax,initMaxTicks + 0.25*(nMax-initMaxTicks));

% Calculate a score based on the number of ticks relative to the maximum.
nTickScore = 1-(nTicks./nMaxScore - 0.7).^2;

% Severe penalty for more than nMax ticks
penalty = 4*nTicks./nMax;
idx = nTicks./nMax <= 1;
penalty(idx) = 0;

% Penalty for more than 0.75*nMax but less than nMax
penaltyScale = nTicks./nMax;
idx = penaltyScale > 0.75 & idx;
penalty(idx) = 1*nTickScore(idx).*penaltyScale(idx);

% Test for intervals that divide the limits exactly
rangeTest = range./niceInts;
isInt = abs(rangeTest-round(rangeTest)) < 1e-6;

% Test for intervals that land exactly on the endpoints
hitsEnds = (abs(lLims-limits(1))<100*lEps) & ...
    (abs(uLims-limits(2))<100*uEps);

% Compute a score using the above tests and the tick score and penalty
scores = isInt + 0.75*hitsEnds + nTickScore - penalty;

% Penalize for too few ticks
idx = (nMax > 5) & (nTicks < 4);
scores(idx) = scores(idx) - 0.5*scores(idx);

idx = (nMax > 4) & (nTicks == 2);
scores(idx) = scores(idx) - 0.5*scores(idx);

% Find the highest score
[maxScore,bestIdx] = max(scores);

if maxScore > -1
    % Use the limits and interval with the best score
    lLims = lLims(bestIdx);
    uLims = uLims(bestIdx);
    interval = niceInts(bestIdx);
else
    % If the best score is too low, just return two ticks at the limits
    lLims = limits(1);
    uLims = limits(2);
    interval = range;
end

% Create the vector of ticks, making sure to hit lLims and uLims exactly
if nargs == 8 || isempty(varargin{6})
    tmp = varargin{6};
    mtag = tmp(1);
    switch mtag
        case 1
            interval = tmp(2);
            ticks = [lLims:interval:(uLims-interval/2) uLims];
        case 2
            if tmp(2) <= 15
                N = round(tmp(2));
            else
                N = 15;
            end
            dd = mean(diff(linspace(lLims,uLims,N)));
            interval = round(mean(dd),2);
            ticks = [lLims:interval:(uLims-interval/2) uLims];
    end
end

% Handle 0 as a special case
zeroIdx = abs(ticks)<10*minEps;
ticks(zeroIdx) = 0;

% Calculate how far the label overhangs (in data units) from both ends
% (0 <= overhang <= labelSize/2)
labelSize = labelSize(bestIdx);
overhang = max(0,limits(1)+labelSize/2-lLims);
overhang(2) = max(0,uLims-limits(2)+labelSize/2);

%% Create tick labels

% Get the decade span of the limits and the decade of the intervals
maxAbs = max(abs([ticks(1) ticks(end)]));
decMax = floor(log10(maxAbs));
decInt = floor(log10(interval));

if isExp(bestIdx) && separateExp
    % Exponential using 'nice' notation w/ separate exponent string:
    % Label: '1.23'  scaleStr: 'x 10^34'
    
    % Determine maximum number of decimals and set formatting string
    n = max(1,min(max(0,maxChars-3),decMax-decInt));
    fStr = ['%.' num2str(n) 'f'];
    
    % Normalize the ticks to the correct scale and create the labels
    normTicks = ticks/10^(decMax);
    tickLabels = strtrim(cellstr(num2str(normTicks',fStr)))';
    
    % Create the scale string
    % Use smaller font for exponent if requested
    if smallExp
        fs = ['\fontsize{' num2str(expFontSize) '}'];
    else
        fs = '';
    end
    
    scaleStr = ['x 10^{' fs num2str(decMax) '}'];
    
elseif isExp(bestIdx)
    % Exponential using 'ugly' notation: '-2.34e+301'
    
    % Determine maximum number of decimals and set formatting string
    n = max(0,min(max(0,maxChars-7),decMax-decInt));
    fStr = ['%.' num2str(n) 'e'];
    
    % Create tick labels
    tickLabels = strtrim(cellstr(num2str(ticks',fStr)))';
    
    % Output 'e' for the scale string as a flag that we are using
    % exponential notation.
    scaleStr = 'e';
    
else
    % Normal (fixed point) notation
    
    % Determine maximum number of decimals and set formatting string
    n = max(0,min(-decInt,max(0,maxChars-3)-decMax));
    fStr = ['%.' num2str(n) 'f'];
    
    % Create tick labels
    tickLabels = strtrim(cellstr(num2str(ticks',fStr)))';
    scaleStr = '';
    
    tickLabels(zeroIdx) = {'0'};
    
end
% End of calcticks

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ticks,tickLabels,overhang,minorTicks] = logticks(limits,...
    textSize,orientation,smallExp,expFontSize,maxChars,vertExpScale)
% Calculate ticks, etc. using a log scale.  Also returns minor ticks at
% [2:9] points in each decade.  Limits must be non-zero and positive.

%%  Input check
% Error if limits are <= 0.  We already ensured that they are increasing
% before calling this subfunction.
if any(limits <= 0)
    eID = [mfilename ':InvalidLimits'];
    eStr = '''limits'' must be non-zero and positive for log scale.';
    error(eID,eStr)
end

%% Calculate ticks

% Range in linear space
range = limits(2) - limits(1);

% Range in log space
limits10 = log10(limits);
normRange = limits10(2) - limits10(1);

% Number of decades spanned by the limits
decMax = floor(limits10(2));
decMin = ceil(limits10(1));
decRange = max(0,decMax - decMin);

% Force decRange to be decRange+1 if either of the limits is on a decade
% boundary.
if any(floor(limits10)==ceil(limits10))
    decRange = decRange + 1;
end

% Normalize textSize to the linearized data range.
normTextSize = textSize*normRange/range;

% Get number of characters needed for label
if normRange > 0.5
    nDigits = 0;
    expChars = max(1,max(floor(log10(abs(decMin))),...
        floor(log10(abs(decMax)))));
    labelChars = 2 + expChars + (decMax < 0 | decMin < 0);
else
    nDigits = max(1,min(maxChars-4,-floor(log10(normRange))+1));
    expChars = 1 + max(1,floor(log10(abs(decMax)))) + nDigits;
    labelChars = 2 + expChars + (decMax < 0 | decMin < 0);
end

% Determine label size
if strcmp(orientation,'h')
    labelSize = normTextSize*labelChars;
else
    % Scale text size by vertExpScale to make room for exponents
    labelSize = vertExpScale*normTextSize;
end

% Get maximum number of ticks assuming decade intervals.  (Will recalculate
% this value using the actual limits for case (4)).
maxTicks = round(decRange/(2*labelSize));

% Initial values
decadeTicks = true;
lLim = decMin;
uLim = decMax;

% Cases:
% (1) decRange > 2 and maxTicks >= 2
% (2) decRange > 2 and maxTicks < 2
% (3) decRange > 1 or floor(log10(limits(1))) ~= decMax
% (4) decRange < 1 and no decade in the interval

if decRange >= 2 && maxTicks >= 2
    % Case (1): Span is multiple decades.  Get ticks at each decade, or at
    % multiple-decade intervals.
    if decRange <= maxTicks
        % If they all fit, just return a vector of ticks at each decade in
        % the interval
        logTicks = decMin:decMax;
    else
        % Select a nice interval and return a vector of ticks spaced by
        % that interval (in decades)
        niceVec = [1 2 5 10 20 50 100 200 500];
        roughInt = decRange/(maxTicks-1);
        deltas = abs(niceVec - roughInt);
        interval = niceVec(deltas == min(deltas));
        interval = interval(1);
        lLim = ceil(decMin/(interval))*interval;
        uLim = floor(decMax/(interval))*interval;
        logTicks = lLim:interval:uLim;
    end
elseif decRange >= 2 && maxTicks < 2
    % Case (2): Span is multiple decades but there is only room for 1 tick.
    % Return 1 tick at the center
    logTicks = round(mean([decMin decMax]));
    
elseif floor(limits10(1)) ~= decMax
    % Case (3): Span is < 2 decades, but crosses at least 1 decade
    % boundary.  Return tick(s) at the decade boundary(s).
    if decMin > floor(limits10(1))
        logTicks = unique([decMin decMax]);
    else
        logTicks = decMax;
    end
else
    % Case (4): Span is < 1 decade and does not cross a decade boundary.
    % Return ticks at non-decade intervals, based on maxTicks and the data
    % range.
    decadeTicks = false;
    
    nDigits = max(1,min(maxChars-4,-floor(log10(normRange))));
    expChars = 1 + max(1,floor(log10(abs(decMax)))) + nDigits;
    labelChars = 2 + expChars + (decMax < 0 | decMin < 0);
    
    if strcmp(orientation,'h')
        labelSize = normTextSize*labelChars;
    end
    
    maxTicks = round(normRange/(1.5*labelSize));
    if maxTicks < 3
        % Return 2 ticks at the limits
        logTicks = limits10;
    else
        % Get 'nice' intervals for the exponent
        roughInt = normRange/(maxTicks-1);
        scale = floor(log10(roughInt));
        niceVec = [1 2 4 5 10];
        niceInts = niceVec*10^scale;
        nTicks = floor(limits10(2)./niceInts + 1e6*eps(limits10(2))) - ...
            ceil(limits10(1)./niceInts - 1e6*eps(limits10(1))) + 1;
        tooMany = nTicks > maxTicks;
        [trash,idx] = sort(nTicks,'descend');  %#ok<ASGLU>
        niceInts = niceInts(idx);
        tooMany = tooMany(idx);
        bestInt = niceInts(find(~tooMany,1,'first'));
        if isempty(bestInt)
            logTicks = limits10;
        else
            lLim = ceil(limits10(1)/bestInt - 1e6*eps(limits10(1)))*bestInt;
            uLim = floor(limits10(2)/bestInt + 1e6*eps(limits10(2)))*bestInt;
            logTicks = lLim:bestInt:uLim;
        end
    end
end

% Convert to linear space
ticks = 10.^logTicks;

% Calculate how far the label overhangs (in data units) from both ends
% (0 <= overhang <= labelSize/2)
overhang = max(0,limits10(1)+labelSize/2-logTicks(1));
overhang(2) = max(0,logTicks(end)-limits10(2)+labelSize/2);

%% Tick labels

% Formatting string
if decadeTicks
    fStr = '%.0f';
else
    fStr = ['%.' num2str(nDigits) 'f'];
end

% Use smaller font for exponents if requested
if smallExp
    fs = ['\fontsize{' num2str(expFontSize) '}'];
else
    fs = '';
end

baseStr = '10^{';
endStr = '}';

tickLabels = strtrim(cellstr(num2str(logTicks',fStr)));
tickLabels = strcat(baseStr,fs,tickLabels,endStr);

%% Minor ticks
% Get minor ticks at the [2:9] values in each decade.  If major ticks skip
% decades, get minor ticks at the decades that were skipped.  If the major
% ticks are not at decade boundaries, do not return any minor ticks.

if ~decadeTicks
    minorTicks = [];
else
    if length(logTicks) > 1
        skip = logTicks(2) - logTicks(1);
    else
        skip = 0;
    end
    
    if skip < 3
        % Do minor ticks at [2:9] in each decade
        mVec = floor(log10(limits(1))):ceil(log10(limits(2)));
        minorTicks = 10.^(sort(repmat(mVec,1,8)) + repmat(log10(2:9),1,length(mVec)));
        minorTicks(minorTicks < limits(1)) = [];
        minorTicks(minorTicks > limits(2)) = [];
        
        if skip == 2
            minorTicks = [minorTicks 10.^((lLim+1):2:uLim)];
            minorTicks = sort(minorTicks);
        elseif skip == 3
            minorTicks = [minorTicks 10.^((lLim+1):3:uLim)];
            minorTicks = [minorTicks 10.^((lLim+2):3:uLim)];
            minorTicks = sort(minorTicks);
        end
    else
        % Do minor ticks at the decades not included in logTicks
        minorLogTicks = decMin:decMax;
        for k = 1:length(logTicks)
            minorLogTicks(minorLogTicks == logTicks(k)) = [];
        end
        minorTicks = 10.^minorLogTicks;
    end
end
% End of calcticks/logticks

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function textSize = getTextSize(limits,orientation,hAx)
% Determine the size of text in data units.  This value is dependent on
% font size, axes data limits and the size of the axes on screen.
% Get axes properties
s = get(hAx);

% Get text size in data units
hTest = text(1,1,'2','Units','data','FontUnits',s.FontUnits,...
    'FontAngle',s.FontAngle,'FontName',s.FontName,'FontSize',s.FontSize,...
    'FontWeight',s.FontWeight,'Parent',hAx);
textExt = get(hTest,'Extent');
delete(hTest)
textHeight = textExt(4);
textWidth = textExt(3);

% If using a proportional font, shrink text width by a fudge factor to
% account for kerning.
if ~strcmpi(s.FontName,'FixedWidth')
    textWidth = textWidth*0.8;
end

% Restore axes limits and set output
if strcmp(orientation,'h')
    textSize = textWidth*(limits(2)-limits(1))/(s.XLim(2)-s.XLim(1));
else
    textSize = textHeight*(limits(2)-limits(1))/(s.YLim(2)-s.YLim(1));
end
% End of calcticks/getTextSize


% --- Executes on button press in AxisTitleRadio.
function AxisTitleRadio_Callback(hObject, eventdata, handles)
% hObject    handle to AxisTitleRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of AxisTitleRadio


% --- Executes during object creation, after setting all properties.
function TabM01_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TabM01 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global ax fig txt plt xtmpTick xtmpTickLabel ytmpTick ytmpTickLabel orilen axname

%% reset fig, ax, txt position
% set figure
figpos = [50  150  841.8  595.2];
set(fig,'Color','w','Position',figpos);
% set axis
postion = [0.1300    0.1100    0.7750    0.8150];
set(ax,'Position',postion);
ax.XAxis.Visible = 'off';
ax.YAxis.Visible = 'off';

% % set txt
txt.Position = [10 5.2000 0];

len = length(plt);
for k = 1:len
   plt(k).LineWidth = 1.8; 
end

% Define All Axises' name
axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'};

% Add Bottom X Axis and Left Y Axis with MajorTicks and MinorTicks
axbma = addAxis(fig,ax,axname{1});
axbmi = addAxis(fig,ax,axname{2});
aylma = addAxis(fig,ax,axname{5});
aylmi = addAxis(fig,ax,axname{6});
% hide top and right axis
axtma = addAxis(fig,ax,axname{3});
axtmi = addAxis(fig,ax,axname{4});
% axtmi.XAxis.Visible = 'off';
% axtma.XAxis.Visible = 'off';
axrma = addAxis(fig,ax,axname{7});
axrmi = addAxis(fig,ax,axname{8});
% axrmi.YAxis.Visible = 'off';
% axrma.YAxis.Visible = 'off';

axtma.XTickLabel = '';
axrma.YTickLabel = '';
axbma.XLabel.String = ax.XLabel.String;
aylma.YLabel.String = ax.YLabel.String;
xtmpTick = ax.XTick;
xtmpTickLabel = ax.XTickLabel;
ytmpTick = ax.YTick;
ytmpTickLabel = ax.YTickLabel;

%% Data initialization
% Axis LineWidth
aTSP = findobj(0,'Tag','axisThicknessPopu');
atsoV = str2double(get(aTSP,'String'));
ax.XAxis.LineWidth = atsoV(get(aTSP,'Value'));
axbma.XAxis.LineWidth = atsoV(get(aTSP,'Value'));
axbmi.XAxis.LineWidth = atsoV(get(aTSP,'Value'));
aylma.YAxis.LineWidth = atsoV(get(aTSP,'Value'));
aylmi.YAxis.LineWidth =atsoV(get(aTSP,'Value'));
% hide top and right axis
axtma.XAxis.LineWidth = atsoV(get(aTSP,'Value'));
axtmi.XAxis.LineWidth = atsoV(get(aTSP,'Value'));
axrma.YAxis.LineWidth = atsoV(get(aTSP,'Value'));
axrmi.YAxis.LineWidth = atsoV(get(aTSP,'Value'));
% Tick Length
mTLP = findobj(0,'Tag','majorTickLenPopu');
mtlpV = str2double(get(mTLP,'String'));
tlen = ax.TickLength;
tlen(1) = mtlpV(get(mTLP,'Value'));
ax.TickLength = tlen;
axbma.TickLength = tlen;
axbmi.TickLength = tlen;
aylma.TickLength = tlen;
aylmi.TickLength = tlen;
% hide top and right axis
axtma.TickLength = tlen;
axtmi.TickLength = tlen;
axrma.TickLength = tlen;
axrmi.TickLength = tlen;
hLine = findobj(ax,'type','line');
orilen = length(hLine);

%%
atc = findobj(0,'Tag','AxisTitleCheck');
ale = findobj(0,'Tag','axisLabelEdit');
atr = findobj(0,'Tag','AxisTitleRadio');
scp = findobj(0,'Tag','setColorPush');
sfp = findobj(0,'Tag','setFontPush');
adp = findobj(0,'Tag','AxisDirPopu');
matdp = findobj(0,'Tag','majorTickDirPopu');
mitdp = findobj(0,'Tag','minorTickDirPopu');
atdp = findobj(0,'Tag','axisThicknessPopu');
mtlp = findobj(0,'Tag','majorTickLenPopu');
atlre = findobj(0,'Tag','axisTickLabelRotationEdit');
set(atc,'Value',1);
set(ale,'Enable','on');
set(atr,'Enable','on');
set(scp,'Enable','on');
set(sfp,'Enable','on');
set(adp,'Enable','on');
set(matdp,'Enable','on');
set(mitdp,'Enable','on');
set(atdp,'Enable','on');
set(mtlp, 'Enable','on');
set(atlre,'Enable','on');
hAxis = findobj(fig,'type','axes');
uniqueAxis(hAxis);
hAxis = findobj(fig,'type','axes');
% axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
loc = findAxis(hAxis,axname{1});
bottomAxisMajor = hAxis(loc);
if isempty(bottomAxisMajor.XLabel.String)
    set(ale,'String','Bottom Axis');
else
    set(ale,'String',bottomAxisMajor.XLabel.String);
end


% --- Executes on button press in showMinorTickRadio.

% --- Executes on selection change in popupmenu17.
function popupmenu17_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu17 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu17


% --- Executes during object creation, after setting all properties.
function popupmenu17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in AxisDirPopu.
function AxisDirPopu_Callback(hObject, eventdata, handles)
% hObject    handle to AxisDirPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns AxisDirPopu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from AxisDirPopu
global hAxis fig axname
slist = findobj(0,'Tag','titleFormatList');
val = get(slist,'Value');
aDP = findobj(0,'Tag','AxisDirPopu');
lab = get(aDP,'Value');
str = get(aDP,'String');
hAxis = findobj(fig,'type','axes');
switch val
    case 1
        % axname = {'bottomMajor','bottomMinor','topMajor','topMinor','leftMajor','leftMinor','rightMajor','rightMinor'}
        if isAxisExist(hAxis,axname{1})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{1});
            bottomAxisMajor = hAxis(loc);
            bottomAxisMajor.XDir = str{lab};
            if isAxisExist(hAxis,axname{2})
                hAxis = findobj(fig,'type','axes');
                uniqueAxis(hAxis);
                hAxis = findobj(fig,'type','axes');
                loc = findAxis(hAxis,axname{2});
                bottomAxisMinor = hAxis(loc);
                bottomAxisMinor.XDir = str{lab};
            end
        end
    case 2
        if isAxisExist(hAxis,axname{5})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{5});
            leftAxisMajor = hAxis(loc);
            leftAxisMajor.YDir = str{lab};
            if isAxisExist(hAxis,axname{6})
                hAxis = findobj(fig,'type','axes');
                uniqueAxis(hAxis);
                hAxis = findobj(fig,'type','axes');
                loc = findAxis(hAxis,axname{6});
                leftAxisMinor = hAxis(loc);
                leftAxisMinor.YDir = str{lab};
            end
        end
    case 3
        if isAxisExist(hAxis,axname{3})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{3});
            topAxisMajor = hAxis(loc);
            topAxisMajor.XDir = str{lab};
            if isAxisExist(hAxis,axname{4})
                hAxis = findobj(fig,'type','axes');
                uniqueAxis(hAxis);
                hAxis = findobj(fig,'type','axes');
                loc = findAxis(hAxis,axname{4});
                topAxisMinor = hAxis(loc);
                topAxisMinor.XDir = str{lab};
            end
        end
    case 4
        if isAxisExist(hAxis,axname{7})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{7});
            rightAxisMajor = hAxis(loc);
            rightAxisMajor.YDir = str{lab};
            if isAxisExist(hAxis,axname{8})
                hAxis = findobj(fig,'type','axes');
                uniqueAxis(hAxis);
                hAxis = findobj(fig,'type','axes');
                loc = findAxis(hAxis,axname{8});
                rightAxisMinor = hAxis(loc);
                rightAxisMinor.YDir = str{lab};
            end
        end
        
end
% --- Executes during object creation, after setting all properties.
function AxisDirPopu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AxisDirPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function axisTickLabelRotationEdit_Callback(hObject, eventdata, handles)
% hObject    handle to axisTickLabelRotationEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of axisTickLabelRotationEdit as text
%        str2double(get(hObject,'String')) returns contents of axisTickLabelRotationEdit as a double
global hAxis fig axname
slist = findobj(0,'Tag','titleFormatList');
aTLR = findobj(0,'Tag','axisTickLabelRotationEdit');
val  = get(slist,'Value');
hAxis = findobj(fig,'type','axes');
switch val
    case 1
        if isAxisExist(hAxis,axname{1})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{1});
            bottomAxisMajor = hAxis(loc);
            bottomAxisMajor.XTickLabelRotation = str2double(get(aTLR,'String'));
        end
    case 2
        if isAxisExist(hAxis,axname{5})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{5});
            leftAxisMajor = hAxis(loc);
            leftAxisMajor.YTickLabelRotation = str2double(get(aTLR,'String'));
        end
    case 3
        if isAxisExist(hAxis,axname{3})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{3});
            topAxisMajor = hAxis(loc);
            topAxisMajor.XTickLabelRotation = str2double(get(aTLR,'String'));
        end
    case 4
        if isAxisExist(hAxis,axname{7})
            hAxis = findobj(fig,'type','axes');
            uniqueAxis(hAxis);
            hAxis = findobj(fig,'type','axes');
            loc = findAxis(hAxis,axname{7});
            rightAxisMajor = hAxis(loc);
            rightAxisMajor.YTickLabelRotation = str2double(get(aTLR,'String'));
        end
end

% --- Executes during object creation, after setting all properties.
function axisTickLabelRotationEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axisTickLabelRotationEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function TabM03_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TabM03 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
gMaLSCP = findobj(0,'Tag','gridMajorLineSetColorPush');
gMiLSCP = findobj(0,'Tag','gridMinorLineSetColorPush');
gMaLTP = findobj(0,'Tag','gridMajorLineTypePopu');
gMiLTP = findobj(0,'Tag','gridMinorLineTypePopu');
gLTkP = findobj(0,'Tag','gridLineThicknessPopu');
gMaLTsP = findobj(0,'Tag','gridMajorLineTtransPopu');
gMiLTsP = findobj(0,'Tag','gridMinorLineTtransPopu');

set(gMaLSCP,'Enable','off');
set(gMiLSCP,'Enable','off');
set(gMaLTP,'Enable','off');
set(gMiLTP,'Enable','off');
set(gLTkP,'Enable','off');
set(gMaLTsP,'Enable','off');
set(gMiLTsP,'Enable','off');

% --- Executes on button press in xRefLineCheck.
function xRefLineCheck_Callback(hObject, eventdata, handles)
% hObject    handle to xRefLineCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of xRefLineCheck
global ax orilen
xRLC = findobj(0,'Tag','xRefLineCheck');
xval = get(xRLC,'Value');
hLine = findobj(ax,'type','line');
len = length(hLine);
xlim = ax.XLim;
ylim = ax.YLim;
if min(xlim) < 0
    nx = zeros(1,2);
    switch xval
        case 0
            if len > orilen
                for k = 1:len-orilen
                    tmp = hLine(k);
                    lenX = length(tmp.XData);
                    lenY = length(tmp.YData);
                    conXY = (lenX == 2 && lenY == 2);
                    conX = (isequal(tmp.XData(1),0) && isequal(tmp.XData(1),tmp.XData(2)));
                    conY = (~isequal(tmp.YData(1),tmp.YData(2)));
                    if  conXY && conX && conY
                        delete(hLine(k));
                    end
                end
            end
            drawnow;
        case 1
            line(ax,nx,ylim,'Color','blue','LineStyle','--','LineWidth',0.9);
            drawnow;
    end
else
    msgbox('X坐标轴不在小于0的范围，请调整X轴范围再试！')
end


% --- Executes on selection change in gridMajorLineTtransPopu.
function popupmenu19_Callback(hObject, eventdata, handles)
% hObject    handle to gridMajorLineTtransPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns gridMajorLineTtransPopu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from gridMajorLineTtransPopu


% --- Executes during object creation, after setting all properties.
function popupmenu19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gridMajorLineTtransPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in gridMinorLineTtransPopu.
function gridMinorLineTtransPopu_Callback(hObject, eventdata, handles)
% hObject    handle to gridMinorLineTtransPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns gridMinorLineTtransPopu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from gridMinorLineTtransPopu
global ax;
gMLTP = findobj(0,'Tag','gridMinorLineTtransPopu');
val = get(gMLTP,'Value');
str = get(gMLTP,'String');
ax.MinorGridAlpha = str2double(str(val));

% --- Executes during object creation, after setting all properties.
function gridMinorLineTtransPopu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gridMinorLineTtransPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in minorTickDirPopu.
function popupmenu21_Callback(hObject, eventdata, handles)
% hObject    handle to minorTickDirPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns minorTickDirPopu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from minorTickDirPopu


% --- Executes during object creation, after setting all properties.
function popupmenu21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minorTickDirPopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on selection change in popupmenu26.
function popupmenu26_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu26 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu26


% --- Executes during object creation, after setting all properties.
function popupmenu26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu25.
function popupmenu25_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu25 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu25


% --- Executes during object creation, after setting all properties.
function popupmenu25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in setFigFont.
function setFigFont_Callback(hObject, eventdata, handles)
% hObject    handle to setFigFont (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global txt
fonts = uisetfont;
txt.FontName = fonts.FontName;
txt.FontWeight = fonts.FontWeight;
txt.FontAngle = fonts.FontAngle;
txt.FontSize = fonts.FontSize;

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear global;
close();

% --- Executes on selection change in popupmenu24.
function popupmenu24_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu24 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu24


% --- Executes during object creation, after setting all properties.
function popupmenu24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu23.
function popupmenu23_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu23 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu23


% --- Executes during object creation, after setting all properties.
function popupmenu23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu22.
function popupmenu22_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu22 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu22


% --- Executes during object creation, after setting all properties.
function popupmenu22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in setFigColor.
function setFigColor_Callback(hObject, eventdata, handles)
% hObject    handle to setFigColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global txt
c = uisetcolor;
txt.Color = c;


function figTitle_Callback(hObject, eventdata, handles)
% hObject    handle to figTitle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of figTitle as text
%        str2double(get(hObject,'String')) returns contents of figTitle as a double
global txt
ft = findobj(0,'tag','figTitle');
ntit = get(ft,'String');
txt.String = ntit;

% --- Executes during object creation, after setting all properties.
function figTitle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figTitle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox15.
function checkbox15_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox15


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4


% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function topTobottom_Callback(hObject, eventdata, handles)
% hObject    handle to topTobottom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% --- Executes during object creation, after setting all properties.
global txt
tbh = findobj(0,'tag','topTobottom');
tb = get(tbh,'Value');
loc = txt.Position;
txt.Position = [loc(1) tb loc(3)];


function topTobottom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to topTobottom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function leftToRight_Callback(hObject, eventdata, handles)
% hObject    handle to leftToRight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global txt
lrh = findobj(0,'tag','leftToRight');
lr = get(lrh,'Value');
loc = txt.Position;
txt.Position = [lr loc(2) loc(3)];

% --- Executes during object creation, after setting all properties.
function leftToRight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to leftToRight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function titBoxRotation_Callback(hObject, eventdata, handles)
% hObject    handle to titBoxRotation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of titBoxRotation as text
%        str2double(get(hObject,'String')) returns contents of titBoxRotation as a double
global txt
tbr = findobj(0,'tag','titBoxRotation');
ntbr = str2double(get(tbr,'String'));
txt.Rotation = ntbr;


% --- Executes during object creation, after setting all properties.
function titBoxRotation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to titBoxRotation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in titLineStyle.
function titLineStyle_Callback(hObject, eventdata, handles)
% hObject    handle to titLineStyle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns titLineStyle contents as cell array
%        contents{get(hObject,'Value')} returns selected item from titLineStyle
global txt
tls = findobj(0,'tag','titLineStyle');
tlw = findobj(0,'tag','titLineWidth');
tlsec = findobj(0,'tag','titSetEdgeColor');
tlsebc = findobj(0,'tag','titSetEdgeBackColor');
val = get(tls,'Value');
switch val
    case 1
        set(tlw,'Enable','off');
        set(tlsec,'Enable','off');
        set(tlsebc,'Enable','off');
        txt.LineStyle = 'none';
    case 2
        set(tlw,'Enable','on');
        set(tlsec,'Enable','on');
        set(tlsebc,'Enable','on');
        txt.LineStyle = '-';
    case 3
        set(tlw,'Enable','on');
        set(tlsec,'Enable','on');
        set(tlsebc,'Enable','on');
        txt.LineStyle = '--';
    case 4
        set(tlw,'Enable','on');
        set(tlsec,'Enable','on');
        set(tlsebc,'Enable','on');
        txt.LineStyle = ':';
    case 5
        set(tlw,'Enable','on');
        set(tlsec,'Enable','on');
        set(tlsebc,'Enable','on');
        txt.LineStyle = '-.';
end

% --- Executes during object creation, after setting all properties.
function titLineStyle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to titLineStyle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function titBoxMargin_Callback(hObject, eventdata, handles)
% hObject    handle to titBoxMargin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of titBoxMargin as text
%        str2double(get(hObject,'String')) returns contents of titBoxMargin as a double
global txt
tbm = findobj(0,'tag','titBoxMargin');
ntbm = str2double(get(tbm,'String'));
txt.Margin = ntbm;


% --- Executes during object creation, after setting all properties.
function titBoxMargin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to titBoxMargin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in titSetEdgeColor.
function titSetEdgeColor_Callback(hObject, eventdata, handles)
% hObject    handle to titSetEdgeColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global txt
c = uisetcolor;
txt.EdgeColor = c;

% --- Executes on button press in titSetEdgeBackColor.
function titSetEdgeBackColor_Callback(hObject, eventdata, handles)
% hObject    handle to titSetEdgeBackColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global txt
c = uisetcolor;
txt.BackgroundColor = c;

% --- Executes on selection change in titLineWidth.
function titLineWidth_Callback(hObject, eventdata, handles)
% hObject    handle to titLineWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns titLineWidth contents as cell array
%        contents{get(hObject,'Value')} returns selected item from titLineWidth
global txt
tlw = findobj(0,'tag','titLineWidth');
val = get(tlw,'Value');
str = get(tlw,'String');
txt.LineWidth = str2double(str(val));

% --- Executes during object creation, after setting all properties.
function titLineWidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to titLineWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in helpPush.
function helpPush_Callback(hObject, eventdata, handles)
% hObject    handle to helpPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~';....
    'Hello,thanks for using this app!';...
    'You should read the following tips before using:';...
    '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~';....
    'No.1, global variables named fig, ax, plt, and txt should be defined in your m script;';...
    '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~';....
    'No.2, Click on the tabbed panel to select the property which need to be modifeid;';...
    '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~';....
    'No.3, Enjoy!';...
    '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~';....
    'Please feel free to contact me if you have any questions';...
    '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~';....
    },'Help Information');
% --- Executes on button press in aboutMe.
function aboutMe_Callback(hObject, eventdata, handles)
% hObject    handle to aboutMe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~';....
    'Author: Ba Shan (巴山)';...
    'Address: Nangang District, Harbin, Heilongjiang, P.R.China';...
    'E-mail: moveon5@163.com';...
    '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~';....
    'WeChat Subscription ID: matlabaihaozhe (matlab爱好者)';...
    'QQ Group(one): 531421022 (MATLAB编程爱好者) (Need to Pay)';...
    '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~';....
    'Welcome to subscribe matlabaihaozhe (WeChat) and join our QQ group.';...
    'Please feel free to contact me if you have any questions';...
    '欢迎关注matlab爱好者微信公众号和加入QQ群.';...
    '程序使用过程中如遇问题请随时联系作者！';...
    '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~';....
    },'Author Information');
% --- Executes on selection change in titHorizontalAli.
function titHorizontalAli_Callback(hObject, eventdata, handles)
% hObject    handle to titHorizontalAli (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns titHorizontalAli contents as cell array
%        contents{get(hObject,'Value')} returns selected item from titHorizontalAli
global txt
tha = findobj(0,'tag','titHorizontalAli');
lab = get(tha,'Value');
str = get(tha,'String');
txt.HorizontalAlignment = str{lab};

% --- Executes during object creation, after setting all properties.
function titHorizontalAli_CreateFcn(hObject, eventdata, handles)
% hObject    handle to titHorizontalAli (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in titVerticalAli.
function titVerticalAli_Callback(hObject, eventdata, handles)
% hObject    handle to titVerticalAli (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns titVerticalAli contents as cell array
%        contents{get(hObject,'Value')} returns selected item from titVerticalAli
global txt
tva = findobj(0,'tag','titVerticalAli');
lab = get(tva,'Value');
str = get(tva,'String');
txt.VerticalAlignment = str{lab};

% --- Executes during object creation, after setting all properties.
function titVerticalAli_CreateFcn(hObject, eventdata, handles)
% hObject    handle to titVerticalAli (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in showTRTicksLabelCheck.
function showTRTicksLabelCheck_Callback(hObject, eventdata, handles)
% hObject    handle to showTRTicksLabelCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of showTRTicksLabelCheck


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox5.
function listbox5_Callback(hObject, eventdata, handles)
% hObject    handle to listbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox5


% --- Executes during object creation, after setting all properties.
function listbox5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu31.
function popupmenu31_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu31 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu31


% --- Executes during object creation, after setting all properties.
function popupmenu31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function TabM05_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TabM05 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global plt
if ~isempty(plt)
    len = length(plt);
    lnum = num2cell(num2str((1:len)'));
    lname = repmat({'line'},len,1);
    str = strcat(lname,lnum);
    lLt = findobj(0,'tag','plotLineList');
    set(lLt,'String',str);
else
    pll = findobj(0,'tag',plotLineList);
    pltt = findobj(0,'tag',plotLineType);
    plc = findobj(0,'tag',plotLineColor);
    plwe = findobj(0,'tag',plotLineWidthEdit);
    pmze = findobj(0,'tag',plotMarkerSizeEdit);
    pmtp = findobj(0,'tag',plotMarkerTypePopu);
    pmfcp = findobj(0,'tag',plotMarkerFaceColorPush);
    pmecp = findobj(0,'tag',plotMarkerEdgeColorPush);
    set(pll,'Enable','off');
    set(pltt,'Enable','off');
    set(plc,'Enable','off');
    set(plwe,'Enable','off');
    set(pmze,'Enable','off');
    set(pmtp,'Enable','off');
    set(pmfcp,'Enable','off');
    set(pmecp,'Enable','off');
end

% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear global;
close();

% --- Executes on selection change in plotLineList.
function plotLineList_Callback(hObject, eventdata, handles)
% hObject    handle to plotLineList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns plotLineList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from plotLineList

% --- Executes on selection change in plotLineType.
function plotLineType_Callback(hObject, eventdata, handles)
% hObject    handle to plotLineType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global plt
pll = findobj(0,'tag','plotLineList');
pltt = findobj(0,'tag','plotLineType');
val = get(pll,'Value');
vat = get(pltt,'Value');
switch vat
    case 1
        plt(val).LineStyle = '-';
    case 2
        plt(val).LineStyle = '--';
    case 3
        plt(val).LineStyle = ':';
    case 4
        plt(val).LineStyle = '-.';
end
% Hints: contents = cellstr(get(hObject,'String')) returns plotLineType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from plotLineType


% --- Executes during object creation, after setting all properties.
function plotLineType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plotLineType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in plotLineColor.
function plotLineColor_Callback(hObject, eventdata, handles)
% hObject    handle to plotLineColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global plt
c = uisetcolor;
pll = findobj(0,'tag','plotLineList');
val = get(pll,'Value');
plt(val).Color = c;


% --- Executes on button press in plotMarkerEdgeColorPush.
function plotMarkerEdgeColorPush_Callback(hObject, eventdata, handles)
% hObject    handle to plotMarkerEdgeColorPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global plt
c = uisetcolor;
pll = findobj(0,'tag','plotLineList');
val = get(pll,'Value');
plt(val).MarkerEdgeColor = c;

% --- Executes on selection change in plotMarkerTypePopu.
function plotMarkerTypePopu_Callback(hObject, eventdata, handles)
% hObject    handle to plotMarkerTypePopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global plt
pll = findobj(0,'tag','plotLineList');
pmtp = findobj(0,'tag','plotMarkerTypePopu');
val = get(pll,'Value');
vat = get(pmtp,'Value');
switch vat
    case 1
        plt(val).Marker = 'o';
    case 2
        plt(val).Marker  = '+';
    case 3
        plt(val).Marker  = '*';
    case 4
        plt(val).Marker  = '.';
    case 5
        plt(val).Marker  = 'x';
    case 6
        plt(val).Marker  = 's';
    case 7
        plt(val).Marker  = 'd';
    case 8
        plt(val).Marker  = '^';
    case 9
        plt(val).LineStyle = 'v';
    case 10
        plt(val).Marker  = '>';
    case 11
        plt(val).Marker = '<';
    case 12
        plt(val).Marker  = 'p';
    case 13
        plt(val).Marker  = 'h';
end
% Hints: contents = cellstr(get(hObject,'String')) returns plotMarkerTypePopu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from plotMarkerTypePopu


% --- Executes during object creation, after setting all properties.
function plotMarkerTypePopu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plotMarkerTypePopu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox17.
function checkbox17_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox17


% --- Executes on button press in checkbox18.
function checkbox18_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox18


% --- Executes on selection change in popupmenu34.
function popupmenu34_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu34 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu34


% --- Executes during object creation, after setting all properties.
function popupmenu34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu35.
function popupmenu35_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu35 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu35


% --- Executes during object creation, after setting all properties.
function popupmenu35_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu36.
function popupmenu36_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu36 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu36


% --- Executes during object creation, after setting all properties.
function popupmenu36_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox19.
function checkbox19_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox19


% --- Executes on button press in checkbox20.
function checkbox20_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox20



function plotLineWidthEdit_Callback(hObject, eventdata, handles)
% hObject    handle to plotLineWidthEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global plt
pll = findobj(0,'tag','plotLineList');
plwe = findobj(0,'tag','plotLineWidthEdit');
val = get(pll,'Value');
plt(val).LineWidth = str2double(get(plwe,'String'));
% Hints: get(hObject,'String') returns contents of plotLineWidthEdit as text
%        str2double(get(hObject,'String')) returns contents of plotLineWidthEdit as a double


% --- Executes during object creation, after setting all properties.
function plotLineWidthEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plotLineWidthEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function plotMarkerSizeEdit_Callback(hObject, eventdata, handles)
% hObject    handle to plotMarkerSizeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global plt
pll = findobj(0,'tag','plotLineList');
pmse = findobj(0,'tag','plotMarkerSizeEdit');
val = get(pll,'Value');
plt(val).MarkerSize = str2double(get(pmse,'String'));
% Hints: get(hObject,'String') returns contents of plotMarkerSizeEdit as text
%        str2double(get(hObject,'String')) returns contents of plotMarkerSizeEdit as a double


% --- Executes during object creation, after setting all properties.
function plotMarkerSizeEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plotMarkerSizeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in plotMarkerFaceColorPush.
function plotMarkerFaceColorPush_Callback(hObject, eventdata, handles)
% hObject    handle to plotMarkerFaceColorPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global plt
c = uisetcolor;
pll = findobj(0,'tag','plotLineList');
val = get(pll,'Value');
plt(val).MarkerFaceColor = c;


% --- Executes on button press in plotNoneMarkerFaceColorPush.
function plotNoneMarkerFaceColorPush_Callback(hObject, eventdata, handles)
% hObject    handle to plotNoneMarkerFaceColorPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global plt
pll = findobj(0,'tag','plotLineList');
val = get(pll,'Value');
plt(val).MarkerFaceColor = 'none';

% --- Executes on button press in plotNoneMarkerEdgeColorPush.
function plotNoneMarkerEdgeColorPush_Callback(hObject, eventdata, handles)
% hObject    handle to plotNoneMarkerEdgeColorPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global plt
pll = findobj(0,'tag','plotLineList');
val = get(pll,'Value');
plt(val).MarkerEdgeColor = 'none';


% --- Executes during object creation, after setting all properties.
function plotLineList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plotLineList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function TabM04_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TabM04 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
