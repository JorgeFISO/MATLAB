tic
%%%%%%%%%%%%%%%%%%%%%%Codificador%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I=imread('escala_de_grises.tiff');


figure(1)
subplot(1,2,1)
imshow(I)
title('Imagen Original')


I=double(I);
z=6;
lim=(2^(z-1));
cst=(2^z);
NumIn=(2^z);
mNumIn=round(NumIn/2);
N=length(I);
Xd=zeros(N,N);
XdC=zeros(N,N);
XD=zeros(N,N);
XR=zeros(N,N);
tren1=zeros(N,N+1);
N2=N+1;


for i=1:N
    

    for j=1:N
        if j==1
            Xd(i,j)=I(i,1);
        else
            Xd(i,j)=I(i,j)-I(i,j-1);
        end
    end
   
        
      

   
     M=max(max(abs(Xd(i,2:N))));
     alfa=ceil(M/cst);
     beta=2*alfa;
       
     limiteInferior=-lim*beta;
     limiteSuperior=lim*beta;
    
     int=(limiteInferior:limiteSuperior);
     N5=length(int);
     
     
     
      for n=1:N  
           for k=1:NumIn
            
         
               if k==1
                   ini=int(1);
               end
               fini=int(((2*k)*alfa)+1);
               int1=(ini:fini);
               
               ini=int(((2*k)*alfa)+1);
       


               N1=length(int1);
               
               
               
               
               
               if n==1
                   XR(i,n)=Xd(i,1);
                   XdC(i,1)=Xd(i,1);
                   XD(i,n)=Xd(i,1);
               else
                   
                   XD(i,n)=I(i,n)-XR(i,n-1);
                   
                             
                              if XD(i,n)<limiteInferior
                                  
                                  
                                  XdC(i,n)=int(1);
                                  tren1(i,n+1)=NumIn-1;
                                  
                              elseif XD(i,n)>limiteSuperior
                                  
                                  XdC(i,n)=int(N5);
                                  tren1(i,n+1)=((NumIn/2)-1);
                                  
                              else
               
                                           for t=1:N1

                                                      if XD(i,n)==int1(t) 

                                                             XdC(i,n)=int1((ceil((N1)/2)));


                                                             if  XdC(i,n)<0
                                                                 
                                                                 tren1(i,n+1)=NumIn-k;
                                                                 
                                                             else 

                                                                 tren1(i,n+1)=k-((NumIn/2)+1);

                                                             end
                                                      end
                                           end
                               end
                   XR(i,n)=XR(i,n-1)+XdC(i,n);
               end
           end
      end
  
          for v=1:N2
              if v==1
                  tren1(i,v)=XdC(i,1);
              elseif v==2
                  tren1(i,v)=alfa;
             
              end
          end
     
      
                   
    
      
      
      
      
      
      
end
Xd;
XD;
XdC;
XR;

XR=uint8(XR);

subplot(1,2,2)
imshow(XR)
title('Imagen Comprimida-Descomprimida a 6 bit/diferencia')


tren1;
Tma=size(tren1);
N9=Tma(1);
N10=Tma(2);
% 
% trenprm1=tren1(1:N3,3:N5);
% trenp1=zeros(N,N);
% for y=1:N3
%     for x=1:N3
%         if x==1
%             trenp1(y,x)=tren1(y,1);
%         else
%             trenp1(y,x)=trenprm1(y,x-1);
%         end
%         
%     end
%     
% end
% 
% IREF=imread('Imagen11P1.tiff');
% PeakPSNRcod=psnr(XR,IREF);
 
Com=fopen('1bxd.bin','w');
fwrite(Com,tren1(1:N,1:2),'uint8');
fwrite(Com,tren1(1:N,3:N10),'ubit64');
fclose(Com);
toc


