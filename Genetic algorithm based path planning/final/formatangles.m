function y = formatangles(t)
y = [0 0 0 1];
    %check if angles lies in -90 to +90
    %add 90
    if t(1)<=pi/2 && t(1)>=-pi/2
            t(1) = t(1)+pi/2;   
           
    else
        y(1) =0;
    y(4) = 0;
    return;
    end
    
    
    if t(2)<=pi/2 && t(2)>=-pi/2
            t(2) = t(2)+pi/2;
    else
        '2 failed' 
        y(2)=0;
    y(4) = 0;
    return;
    end
    

    t(3)= -t(3);
    if t(3)>pi || t(3)<0
        y(3)=0;
        y(4) = 0;
        return;
    end
    y = [t,1];
    return;
end