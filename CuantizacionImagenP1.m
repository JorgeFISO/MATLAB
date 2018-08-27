clc
clear all 
Im=imread('Imagen11P1.tiff');
imshow(Im)
%%
clc
clear all 
Im=imread('Imagen11P1.tiff');
% imshow(Im)
N=length(Im);
 for i=0:N-1
   for j=0:N-1
       if Im(i+1,j+1) < 127
         Im(i+1,j+1)=0;
     
       end
   end
 
 end
  for i=0:N-1
   for j=0:N-1
       if Im(i+1,j+1) >= 127
         Im(i+1,j+1)=255;
     
       end
   end
 
 end

% Im
imshow(Im)
title('Imagen Cuantizada a 1 bits')

%%
clc
clear all 
Im=imread('Imagen11P1.tiff');
N=length(Im);
 for i=0:N-1
   for j=0:N-1
        if Im(i+1,j+1) < 64
         Im(i+1,j+1)=0;
        end
   end
 end
 for i=0:N-1
     for j=0:N-1
         if  64<=Im(i+1,j+1) && Im(i+1,j+1)<128
         Im(i+1,j+1)=85;
         end
     end 
 end
 for i=0:N-1
   for j=0:N-1
         if 128<=Im(i+1,j+1) && Im(i+1,j+1)<192
         Im(i+1,j+1)=170;
         end
   end
 end
 for i=0:N-1
     for j=0:N-1
         if 192<=Im(i+1,j+1) && Im(i+1,j+1)<=255
         Im(i+1,j+1)=255;
         end
     end 
 end
%Im
imshow(Im)
title('Imagen Cuantizada a 2 bits')
%%
clc
clear all 
Im=imread('Imagen11P1.tiff');
N=length(Im);
 for i=0:N-1
   for j=0:N-1
        if Im(i+1,j+1) < 16
         Im(i+1,j+1)=0;
        end
   end
 end
 for i=0:N-1
     for j=0:N-1
         if  16<=Im(i+1,j+1) && Im(i+1,j+1)<32
         Im(i+1,j+1)=17;
         end
     end 
 end
 for i=0:N-1
   for j=0:N-1
         if 33<=Im(i+1,j+1) && Im(i+1,j+1)<48
         Im(i+1,j+1)=34;
         end
   end
 end
 for i=0:N-1
     for j=0:N-1
         if 49<=Im(i+1,j+1) && Im(i+1,j+1)<64
         Im(i+1,j+1)=51;
         end
     end 
 end
% % %
 for i=0:N-1
   for j=0:N-1
        if 65<=Im(i+1,j+1) && Im(i+1,j+1)<=80
         Im(i+1,j+1)=68;
        end
   end
 end
 for i=0:N-1
     for j=0:N-1
         if  81<=Im(i+1,j+1) && Im(i+1,j+1)<96
         Im(i+1,j+1)=85;
         end
     end 
 end
 for i=0:N-1
   for j=0:N-1
         if 97<=Im(i+1,j+1) && Im(i+1,j+1)<112
         Im(i+1,j+1)=102;
         end
   end
 end
 for i=0:N-1
     for j=0:N-1
         if 113<=Im(i+1,j+1) && Im(i+1,j+1)<128
         Im(i+1,j+1)=119;
         end
     end 
 end
% % %
 for i=0:N-1
   for j=0:N-1
        if 129<=Im(i+1,j+1) && Im(i+1,j+1)<=144
         Im(i+1,j+1)=136;
        end
   end
 end
 for i=0:N-1
     for j=0:N-1
         if  145<=Im(i+1,j+1) && Im(i+1,j+1)<160
         Im(i+1,j+1)=153;
         end
     end 
 end
 for i=0:N-1
   for j=0:N-1
         if 161<=Im(i+1,j+1) && Im(i+1,j+1)<176
         Im(i+1,j+1)=170;
         end
   end
 end
 for i=0:N-1
     for j=0:N-1
         if 177<=Im(i+1,j+1) && Im(i+1,j+1)<192
         Im(i+1,j+1)=187;
         end
     end 
 end
% % %
 for i=0:N-1
   for j=0:N-1
        if 193<=Im(i+1,j+1) && Im(i+1,j+1)<208
         Im(i+1,j+1)=204;
        end
   end
 end
 for i=0:N-1
     for j=0:N-1
         if  209<=Im(i+1,j+1) && Im(i+1,j+1)<224
         Im(i+1,j+1)=221;
         end
     end 
 end
 for i=0:N-1
   for j=0:N-1
         if 225<=Im(i+1,j+1) && Im(i+1,j+1)<240
         Im(i+1,j+1)=238;
         end
   end
 end
 for i=0:N-1
     for j=0:N-1
         if 241<=Im(i+1,j+1) && Im(i+1,j+1)<=255
         Im(i+1,j+1)=255;
         end
     end 
 end
%Im
imshow(Im)
title('Imagen Cuantizada a 4 bits')

%%
clc
clear all 
Im=imread('Imagen11P1.tiff');
N=length(Im);
Alt=[0,linspace(1,255,255)];
AltL=length(Alt);
hist=zeros(1,256);
histL=length(hist);
%%%%%%%%%%%%%%%%%%%%%%HistogramaImagenOriginal%%%%%%%%%%%%%%%%%%%%%
for k=1:histL
    for i=1:N
        for j=1:N
            if Im(i,j)==Alt(k)
                hist(k)=hist(k)+1;
            end
        end
    end
end
hist;
%%%%%%%%%%%%%%%%%%%%%%%%%HistogramaImagenAcumulativa%%%%%%%%%%%%%%
histNorm=hist/262144;
AltNorm=Alt/255;

His=0;
for i=1:histL
    histNorm(i)=histNorm(i)+His;
    His=histNorm(i);
end
histNorm;
%%%%%%%%%%%%%%%%%%%%%%%%%%%ImagenEcualizada%%%%%%%%%%%%%%%%%%%%%%%%
YNorm=zeros(512,512);

for k=1:AltL
    for i=1:N
        for j=1:N
            if Im(i,j)== Alt(k)
            YNorm(i,j)= histNorm(k);
            end
        end
    end
end

YNorm;
YNormEc=YNorm*255;
Yec=round(YNormEc);
Yect=uint8(Yec);
figure(15)
imshow(Yect)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%HistogramaImagenEcualizada%%%%%%%%%%%%%%
N1=length(Yect);
Alt=[0,linspace(1,255,255)];
hist1=zeros(1,256);
hist1L=length(hist1);

for k=1:hist1L
    for i=1:N1
        for j=1:N1
            if Yect(i,j)==Alt(k)
                hist1(k)=hist1(k)+1;
            end
        end
    end
end
hist1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%ImagenOscuresida%%%%%%%%%%%%%%%%%%%%%%%%%
ImNormO=(1-(sqrt(1-YNorm)));
ImNormO=ImNormO*255;
ImNormO=round(ImNormO);
ImO=uint8(ImNormO);
figure(16)
imshow(ImO)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%HistogramaImagenOscuresida%%%%%%%%
Alt=[0,linspace(1,255,255)];
NO=length(ImO);
histO=zeros(1,256);
histOL=length(histO);

for k=1:histOL
    for i=1:NO
        for j=1:NO
            if ImO(i,j)==Alt(k)
                histO(k)=histO(k)+1;
            end
        end
    end
end
histO;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ImagenAclarada%%%%%%%%%%%%%%%%%%%%%%
ImNormB=sqrt(YNorm);
ImNormB=ImNormB*255;
ImNormB=round(ImNormB);
ImB=uint8(ImNormB);
figure(17)
imshow(ImB)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%HistogramaImagenAclarada%%%%%%%%%
NB=length(ImB);
Alt=[0,linspace(1,255,255)];
AltL=length(Alt);
histB=zeros(1,256);
histBL=length(histB);

for k=1:histBL
    for i=1:NB
        for j=1:NB
            if ImB(i,j)==Alt(k)
                histB(k)=histB(k)+1;
            end
        end
    end
end
histB;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ImagenesResultados%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
subplot(2,2,1)
imshow(Im)
title('Imagen Original')
subplot(2,2,2)
imshow(Yect)
title('Imagen Ecualizada')
subplot(2,2,3)
imshow(ImO)
title('Imagen Oscuresida')
subplot(2,2,4)
imshow(ImB)
title('Imagen Aclarada')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ImagenesResultados%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
subplot(2,2,1)
stem(Alt,hist)
title('Histograma Imagen Original')
subplot(2,2,2)
stem(Alt,hist1)
title('Histograma Imagen Ecualizada')
subplot(2,2,3)
stem(Alt,histO)
title('Histograma Imagen Oscuresida')
subplot(2,2,4)
stem(Alt,histB)
title('Histograma Imagen Aclarada')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ImagenesResultados%%%%%%%%%%%%%%%%%%%%%%%
figure(3)
subplot(1,2,1)
imshow(Im)
title('Imagen Original')
subplot(1,2,2)
stem(Alt,hist)
title('Histograma Imagen Original')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ImagenesResultados%%%%%%%%%%%%%%%%%%%%%%%
figure(4)
subplot(1,2,1)
imshow(Yect)
title('Imagen Ecualizada')
subplot(1,2,2)
stem(Alt,hist1)
title('Histograma Imagen Ecualizada')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ImagenesResultados%%%%%%%%%%%%%%%%%%%%%%%
figure(5)
subplot(1,2,1)
imshow(ImO)
title('Imagen Oscuresida')
subplot(1,2,2)
stem(Alt,histO)
title('Histograma Imagen Oscuresida')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ImagenesResultados%%%%%%%%%%%%%%%%%%%%%%%
figure(6)
subplot(1,2,1)
imshow(ImB)
title('Imagen Aclarada')
subplot(1,2,2)
stem(Alt,histB)
title('Histograma Imagen Aclarada')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ImagenesResultados%%%%%%%%%%%%%%%%%%%%%%%
figure(7)
subplot(1,2,1)
imshow(Yect)
title('Imagen Ecualizada')
subplot(1,2,2)
imshow(ImO)
title('Imagen Oscuresida')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ImagenesResultados%%%%%%%%%%%%%%%%%%%%%%%
figure(8)
subplot(1,2,1)
imshow(Yect)
title('Imagen Ecualizada')
subplot(1,2,2)
imshow(ImB)
title('Imagen Aclarada')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ImagenesResultados%%%%%%%%%%%%%%%%%%%%%%%
figure(10)
subplot(1,2,1)
imhist(Im)
title('Histograma Imagen Original con imhist')
subplot(1,2,2)
stem(Alt,hist)
title('Histograma Imagen Original')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ImagenesResultados%%%%%%%%%%%%%%%%%%%%%%%
figure(11)
subplot(1,2,1)
imhist(Yect)
title('Histograma Imagen Ecualizada con imhist')
subplot(1,2,2)
stem(Alt,hist1)
title('Histograma Imagen Ecualizada')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ImagenesResultados%%%%%%%%%%%%%%%%%%%%%%%
figure(12)
subplot(1,2,1)
imhist(ImO)
title('Histograma Imagen Oscuresida con imhist')
subplot(1,2,2)
stem(Alt,histO)
title('Histograma Imagen Oscuresida')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ImagenesResultados%%%%%%%%%%%%%%%%%%%%%%%
figure(13)
subplot(1,2,1)
imhist(ImB)
title('Histograma Imagen Aclarada con imhist')
subplot(1,2,2)
stem(Alt,histB)
title('Histograma Imagen Aclarada')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ImagenesResultados%%%%%%%%%%%%%%%%%%%%%%%
figure(14)
stem(AltNorm,histNorm)
title('Funcion Acomulada')
