function y=GenerateFakeData(Diag)
Debug=0;
if Debug
   Diag='FF'; 
end
if strcmp(Diag,'NF')
    Amp=100;WaistX=200;WaistY=60;XCenter=640.0/2.0;YCenter=480.0/2.0;
    WaistVar=10;CenterVar=50;
    WaistX=abs(WaistX+randi([-1.0*WaistVar WaistVar],1,1));
    WaistY=abs(WaistY+randi([-1.0*WaistVar WaistVar],1,1));
    XCenter=abs(XCenter+randi([-1.0*CenterVar CenterVar],1,1));
    YCenter=abs(YCenter+randi([-1.0*CenterVar CenterVar],1,1));
elseif strcmp(Diag, 'FF')
    Amp=100;WaistX=20;WaistY=30;XCenter=640.0/2.0;YCenter=480.0/2.0;
    WaistVar=10;CenterVar=50;
    WaistX=abs(WaistX+randi([-1.0*WaistVar WaistVar],1,1));
    WaistY=abs(WaistY+randi([-1.0*WaistVar WaistVar],1,1));
    XCenter=abs(XCenter+randi([-1.0*CenterVar CenterVar],1,1));
    YCenter=abs(YCenter+randi([-1.0*CenterVar CenterVar],1,1));
else
    y=[];
end
x_pixels=640;y_pixels=480;
Gauss2D=@(x,y) (Amp.*exp(-1.0*(x-XCenter).^2/WaistX^2)*exp(-1.0*(y-YCenter).^2./WaistY^2));
y=zeros(x_pixels,y_pixels);
for i=1:size(y,1)
    for j=1:size(y,2)
        y(i,j)=Gauss2D(i,j);
    end
end
if Debug
    figure;title(Diag);imagesc(y);
end
end