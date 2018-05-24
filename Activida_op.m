function varargout = Activida_op(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Activida_op_OpeningFcn, ...
                   'gui_OutputFcn',  @Activida_op_OutputFcn, ...
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

% --- Executes just before Activida_op is made visible.

function Activida_op_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
global volume vol
addpath('func/');
V = load_nii('image00CompleteMASK.nii');
volume=V.img;
vol=V.img;

global band
global band2
global id
global xi
global yi
global xf
global yf
global zi
global zf
band=0;
band2=0;
id=0;


guidata(hObject, handles);


function varargout = Activida_op_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


function slider1_Callback(hObject, eventdata, handles)
handles.slider1 = get(hObject,'Value');
indSlide = round(handles.slider1)

function slider1_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function l1_Callback(hObject, eventdata, handles)
%VISTA 1 CORONAL
global  band id xi xf yi yf zi zf
if get(hObject,'Value')==1 && band==0
    [x1,y1]=ginput(1);
    a=round(get(handles.slider7,'Value'))+1;
    tex1=strcat('(',num2str(round(y1(1))),',',num2str(round(x1(1))),',',num2str(a),')');
    set(handles.text3,'String',tex1);
   
    id =1;
    band=1;
    xi=y1;
    yi=x1;
    zi=a;
else
    if id==1
        set(handles.l1f,'Value',0)
        id=0;
        band=0;
        xi=0;
        xf=0;
        yi=0;
        yf=0;
        zi=0;
        zf=0;
    end
    set(handles.text3,'String','');
    set(handles.text19,'String','');
end


function l2_Callback(hObject, eventdata, handles)
%VISTA 2 TRANSVERSAL
global  band id xi xf yi yf zi 
if get(hObject,'Value')==1 && band==0
    [x2,y2]=ginput(1);
    b=round(get(handles.slider6,'Value'))+1;
    xi=b;
    tex2=strcat('(',num2str(b),',',num2str(round(y2(1))),',',num2str(round(x2(1))),')');
    set(handles.text5,'String',tex2);
    id =2;
    band=1;
    zi=x2;
    yi=y2;

else
    if id==2
        set(handles.l2f,'Value',0)
        id=0;
        band=0;
        xi=0;
        xf=0;
        yi=0;
        yf=0;
        zi=0;
        zf=0;
    end
    set(handles.text5,'String','');
    set(handles.text21,'String','');
end


function l3_Callback(hObject, eventdata, handles)

global  band band2 id xi xf yi yf zi zf
%VISTA 3 SAGITAL
if get(hObject,'Value')==1 && band==0
    [x3,y3]=ginput(1);
    c=round(get(handles.slider8,'Value'))+1;
    yi=c;
    tex3=strcat('(',num2str(round(y3)),',',num2str(c),',',num2str(round(x3)),')');
    set(handles.text13,'String',tex3);
    id=3;
    band=1;
    xi=y3;
    zi=x3;
else
    if id==3
        set(handles.l3f,'Value',0)
       band=0;
       band2=0;
       id=0;
       xi=0;
       xf=0;
       yi=0;
       yf=0;
       zf=0;
    end
    set(handles.text13,'String','');
    set(handles.text20,'String','');
end




function slider6_Callback(hObject, eventdata, handles)
%slider 2
b = round(get(handles.slider6,'Value'))+1;
com=get(handles.mv2,'String');
com=str2num(com);
if com~=b
    global volume
    set(handles.mv2,'String',num2str(b));
    axes(handles.axes9);
    im2(:,:)=volume(b,:,:);
    imshow(im2);
    title('CORTE TRANSVERSAL')
    
end


function slider6_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider7_Callback(hObject, eventdata, handles)
%slider 1
a = round(get(handles.slider7,'Value'))+1;
com=get(handles.mv1,'String');
com=str2num(com);
if com~=a
    global volume
    set(handles.mv1,'String',num2str(a));
    axes(handles.axes1);
    im(:,:)=volume(:,:,a);
    imshow(im);
    title('CORTE CORONAL')
    
end





function slider7_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function slider8_Callback(hObject, eventdata, handles)
%slider 3
c = round(get(handles.slider8,'Value'))+1;
com=get(handles.mv3,'String');
com=str2num(com);
if com~=c
    global volume
    set(handles.mv3,'String',num2str(c));
    axes(handles.axes10);
    im3(:,:)=volume(:,c,:);
    imshow(im3);
    title('CORTE SAGITAL')
    
end


function slider8_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function axes1_CreateFcn(hObject, eventdata, handles)

function axes10_CreateFcn(hObject, eventdata, handles)

function axes9_CreateFcn(hObject, eventdata, handles)



function pushbutton8_Callback(hObject, eventdata, handles)

global volume band band2 id xi yi xf yf zi zf

if band==1 && band2==1
    xi=round(xi);
    yi=round(yi);
    zi=round(zi);
    xf=round(xf);
    yf=round(yf);
    zf=round(zf);
   if volume(round(xi),round(yi),round(zi))~=0 && volume(round(xf),round(yf),round(zf))~=0
     set(handles.text24,'String','')
       set(handles.text24,'String','la selecciones  son correctas')
       
       di=sqrt((xf-xi)^2+(yf-yi)^2+(zf-zi)^2);
       tex1=strcat("(",num2str(round(xi)),",",num2str(round(yi)),",",num2str(round(zi)),")");
       set(handles.condicion,'String',tex1)
       tex2=strcat("(",num2str(round(xf)),",",num2str(round(yf)),",",num2str(round(zf)),")");
       set(handles.posicion,'String',tex2)
       set(handles.text24,'String',num2str(di))
       cont=0;
       while di>0.1
           di=sqrt((xf-xi)^2+(yf-yi)^2+(zf-zi)^2);
           cont=cont+1;
           %Busqueda de la ubicacion mas proxima
           poi(cont,:)=[xi;yi;zi];
           dt(cont,:)=[di 0 0];
           pos=[ xi yi+1 zi;xi yi-1 zi;xi+1 yi zi;xi-1 yi zi;xi yi zi+1;xi yi zi-1 ;xi+1 yi-1 zi;xi-1 yi-1 zi;xi+1 yi+1 zi;xi-1 yi+1 zi;xi+1 yi-1 zi+1;xi+1 yi+1 zi+1;xi-1 yi-1 zi+1;xi-1 yi+1 zi+1;xi+1 yi-1 zi-1;xi+1 yi+1 zi-1;xi-1 yi-1 zi-1;xi-1 yi+1 zi-1;xi-1 yi zi-1;xi+1 yi zi-1;xi-1 yi zi+1;xi+1 yi zi+1;xi yi-1 zi-1;xi yi+1 zi-1;xi yi-1 zi+1;xi yi+1 zi+1];
           for i=1:26
               aux(:)=pos(i,:);
               dist(i)=sqrt((xf-aux(1))^2+(yf-aux(2))^2+(zf-aux(3))^2);
           end
           [posm,di]=bmin(dist,pos,di,[xi yi zi]);
           aux(:)=pos(posm,:);
           volume(aux(1),aux(2),aux(3))=180;
           xi=aux(1);
           yi=aux(2);
           zi=aux(3);
            

       end
       dato(:,1)=poi(:,1);
       dato(:,2)=poi(:,2);
       dato(:,3)=poi(:,3);
      
       dato(:,4)=dt(:,1);
       set(handles.tabla,'Data',dato)
   else
       set(handles.text24,'String','')
       set(handles.text24,'String','la selecciones no son correctas')
   end
else
    set(handles.text24,'String','')
    set(handles.text24,'String','Selecciones por favor  las ubicaciones')
end

function l1f_Callback(hObject, eventdata, handles)
global  band band2  xf yf zf id volume vol
if band==1 && id==1 && get(hObject,'Value')==1
    [x1,y1]=ginput(1);
    a=round(get(handles.slider7,'Value'))+1;
    zf=a;
    tex1=strcat('(',num2str(round(y1)),',',num2str(round(x1)),',',num2str(a),')');
    set(handles.text19,'String',tex1);
    band2=1;
    xf=y1;
    yf=x1;
else
    if id==1
        
        volume=vol;
        band2=0;
        xf=0;
        yf=0;
        zf=0;
    end
    set(handles.text19,'String','');
    
end

% --- Executes on button press in l2f.
function l2f_Callback(hObject, eventdata, handles)
global  band band2  xf yf zf id volume vol
if band==1 && id==2 && get(hObject,'Value')==1
    [x2,y2]=ginput(1);
    b=round(get(handles.slider6,'Value'))+1;
    xf=b;
    tex2=strcat('(',num2str(b),',',num2str(round(y2)),',',num2str(round(x2)),')');
    set(handles.text21,'String',tex2);

    band2=1;
    zf=x2;
    yf=y2;
else
    if id==2
        volume=vol;
        band2=0;
        xf=0;
        yf=0;
        zf=0;
    end
    set(handles.text21,'String','');
end

% --- Executes on button press in l3f.
function l3f_Callback(hObject, eventdata, handles)
global  band band2 id xi xf yi yf zi zf volume vol
if band==1 && id==3 && get(hObject,'Value')==1
    c=round(get(handles.slider8,'Value'))+1;
    yf=c;
    [x3,y3]=ginput(1);
    tex1=strcat('(',num2str(round(y3)),',',num2str(c),',',num2str(round(x3)),')');
    set(handles.text20,'String',tex1);
    id=3;
    band2=1;
    xf=y3;
    zf=x3;
else
    if id==3
        volume=vol;
        band2=0;
        xf=0;
        yf=0;
        zf=0;
    end
    set(handles.text20,'String','');
end
