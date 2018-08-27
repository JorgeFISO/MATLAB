% PeronaMalik
iteracion=100;
Im=imread('Imagen11P1.tiff'); 
N=length(Im);
ImC=zeros(N,N,1);

ImC(:,:,1)=Im;



sigma=30;
dt= 0.3;
Ruido=randn(N);
Ruido=Ruido.*40;
ImR=ImC+Ruido;




ImRu=uint8(ImR);
ImC=double(ImRu);

P=zeros(512,512);
S=zeros(512,512);
E=zeros(512,512);
W=zeros(512,512);

for i=2:iteracion;
k=canny_estimator(ImC); 

for m = 1:1:512
    for n = 1:1:512
        if m==1
            P(m,n)=0;
        elseif m==512
            S(m,n)=0;
        elseif n==1
            W(m,n)=0;
        elseif n==512
            E(m,n)=0;
        else
        P(m,n)= ImC(m-1,n)-ImC(m,n);
        S(m,n)= ImC(m+1,n)-ImC(m,n);
        E(m,n)= ImC(m,n+1)-ImC(m,n);
        W(m,n)= ImC(m,n-1)-ImC(m,n);
        end       
    end  
end

Cn= 1./(1+((abs(P))/(k)).^2);
Cs= 1./(1+((abs(S))/(k)).^2);
Ce= 1./(1+((abs(E))/(k)).^2);
Cw= 1./(1+((abs(W))/(k)).^2);
 
It = (Cn.*P)+(Cs.*S)+(Ce.*E)+(Cw.*W);

ImPM =ImC+dt*It; 
ImC=ImPM;
 if mod(i,10)==0
     figure
     imshow(uint8(ImPM));
        
 end
end

