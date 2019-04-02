function y=GetImCenteroid(Im)
%Returns the center of mass of an image

X=1:size(Im,1);
Y=1:size(Im,2);

TCounts=trapz(Y,trapz(X,Im,1),2);
x_bar=trapz(Y,trapz(X,Im.*X',1),2)/TCounts;
y_bar=trapz(Y,trapz(X,Im.*Y,1),2)/TCounts;

if(x_bar>size(Im,1)| y_bar>size(Im,2))
 %   error('Something wrong with this function!');
end
y.x_bar=x_bar;
y.y_bar=y_bar;
    
end