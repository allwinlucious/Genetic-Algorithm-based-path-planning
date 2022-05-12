function []= drawLine3D(p1,p2) 

pts = [p1; p2];

% Because that's what line() wants to see    
    plot3(pts(:,1), pts(:,2), pts(:,3))

end