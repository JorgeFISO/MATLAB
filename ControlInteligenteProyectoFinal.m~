tic
%%%%%%%Entrenamieto de Un Percepton%%%%%%


%Numero de Muestras.
NM=20;
%Cacateristicas por Muestra.
NC=6;
%Caracteristicas Persona con Buen estado Fisico
% 1 %%%%%%%%%%%%%%%%%%%%%%
CPP=5;     %Capacidad Pulmonar Ideal
CP=5.5;      %Capacidad Pulmonar
if CP>CPP
    CP=2.3;
elseif CP<CPP
    CP=1.9;
elseif P==PI
    CP=0;
end
CP;
% 2 %%%%%%%%%%%%%%%%%%%%%%
TP=3000;   %Calorias Quemas Promedio Por Dia
T=4000;    %Calorias QUEMADAS

if T>TP
    T=-0.3;
elseif T<TP
    T=-0.15;
elseif T==TP
    T=0;
end
T;
% 3 %%%%%%%%%%%%%%%%%%%%%%
HdEP=2;    %Horas de Ejercicio Diario
% 4 %%%%%%%%%%%%%%%%%%%%%%
EP=76;     %Porcentaje Muscular Corporal
E=78;      %Edad
if E>EP
    E=1.5;
elseif E<EP
    E=1.1;
elseif E==EP
    E=0;
end
E;
% 5 %%%%%%%%%%%%%%%%%%%%%%
PP=12;     %Porcenaje Promedio Para Deportista
PG=15;     %Porcentaje de Grasa
if PG>PP
    PG=0.8;
elseif PG<PP
    PG=-0.1;
elseif PG==PP
    PG=0;
end
PG;
% 6 %%%%%%%%%%%%%%%%%%%%%%
MCM=1.5;  %Masa Corporal Magra
%%%%%%%%%%%%%%%%%%%%%

%Caracteristicas De Una Persona Con Mal Estado Fisico

% 1 %%%%%%%%%%%%%%%%%%%%%%
GC=-1.5;     %Glucosa
% 2 %%%%%%%%%%%%%%%%%%%%%%
EC=1;         %Enfermedades del corazon
% 3 %%%%%%%%%%%%%%%%%%%%%%
PR=1.1;       %Problemas de Respiracion
% 4 %%%%%%%%%%%%%%%%%%%%%%
TR=-2;        %Trigliciridos
% 5 %%%%%%%%%%%%%%%%%%%%%%
PA=3;         %Precion Arterial
% 6 %%%%%%%%%%%%%%%%%%%%%%
G=-2.1;       %Colesterol


% Definiremos El Estado Fisico de una Persona.

%Muestras 
M1=[GC;EC];
M2=[TR;PR];
M3=[G;TR];
M4=[TR;EC];
M5=[GC;PR];
M6=[G;PR];
M7=[TR;PA];
M8=[GC;PA];
M9=[G;EC];
M10=[PR;G];
M11=[HdEP;CP];
M12=[HdEP;E];
M13=[PG;MCM];
M14=[HdEP;T];
M15=[MCM;PG];
M16=[CP;E];
M17=[MCM;E];
M18=[CP;HdEP];
M19=[CP;T];
M20=[HdEP;CP];
%Matriz de Caracteristicas
M=[M1 M11 M12 M13 M2 M14 M3];% M4 M5 M15 M6 M17 M16 M7 M18 M8 M9 M19 M10 M20];
% Vector de Targets

t=[0,1,1,1,0,1,0]%,0,0,1,0,1,1,0,1,0,0,1,0,1]

ct=sum(t);
N1=length(t);
a=zeros(1,N1);
ca=sum(a);

% Constantes
T=size(M);
N=T(2);
cont=0;


% Vector de Pesos.
w=[1;-0.8];
b=1;


% Algoritmo Delta Rule.
comparador=ct-ca;
while comparador~=0
% comparador=ct-ca;
for i=1:N
   
 
        p=M(:,i);
        cal=w'*p+b;
        a(i)=hardlim(cal);
        e=t(i)-a(i);
        
        if e==1
            w1=w+p;
            w=w1;
            b1=b+e;
            b=b1;
        elseif e==-1
            w2=w-p;
            w=w2;
            b2=b+e;
            b=b2;
             
        end
        cont=cont+1; 
end
  a;
  ca=sum(a);
  comparador=ct-ca;
  
  
end
a
w;
cont
x=M(1,:);
y=M(2,:);
scatter(x,y)
hold on
x1=[0,w(1)];
y1=[0,w(2)];
plot(x1,y1)
toc

