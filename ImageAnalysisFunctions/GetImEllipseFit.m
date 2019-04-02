function y=GetImEllipseFit(Im)
if(sum(Im(:))==0)%If image is empty
    y=[];
else
    %Get image contours
    y.ImContour=contourc(Im./max(Im(:)),[0.5 0.5]);
    Idx=y.ImContour(1,:)<abs(mean(y.ImContour(1,:))+2*std(y.ImContour(1,:))) ...
        &y.ImContour(1,:)>abs(mean(y.ImContour(1,:))-2*std(y.ImContour(1,:))) ...
        &y.ImContour(2,:)<abs(mean(y.ImContour(2,:))+2*std(y.ImContour(2,:))) ...
        &y.ImContour(2,:)>abs(mean(y.ImContour(2,:))-2*std(y.ImContour(2,:)));
    %Get ellipse fits
    y.ellipse_t=fit_ellipse(y.ImContour(1,Idx),y.ImContour(2,Idx)); 
    % If ellipse fit is successful
    if(isempty(y.ellipse_t))
        y.LongAxis=nan;y.ShortAxis=nan;
        y.XCenter=nan;y.YCenter=nan;
    else
        y.LongAxis=y.ellipse_t.long_axis;        y.ShortAxis=y.ellipse_t.short_axis;
        y.XCenter=y.ellipse_t.X0_in;        y.YCenter=y.ellipse_t.Y0_in;
    end
    
    Temp=zeros(size(Im));
    for i=1:size(Temp,1)
        for j=1:size(Temp,2)
           if(((j-y.XCenter)^2/y.ellipse_t.a^2)+((i-y.YCenter)^2/y.ellipse_t.b^2)<1) 
           Temp(i,j)=Im(i,j);
           end
        end
    end
    y.Energy.CountsInFWHM=sum(Temp(:));
    y.Energy.TotalCounts=sum(Im(:));
    y.Energy.PeakCounts=max(Temp(:));
end
end