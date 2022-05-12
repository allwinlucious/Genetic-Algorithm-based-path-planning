%Inverse Kinematics
% function q = IK3R_v5(pos,l1,l2,l3,d)
%   %add boundry condition
%       x = pos(1);
%     y = pos(2);
%     z = pos(3);
%   t1 = atan2(y,x);
%    
%   originshift = [d*cos(t1) d*sin(t1) 0];
%       pos = pos+originshift;
%   if(pos(1)^2 + pos(2)^2 + (pos(3)-l1)^2-((l2+l3)^2)<0 && (pos(1)^2+pos(2)^2+(pos(3)-l1)^2-(l2-l3)^2>0))
% 
% 
%       c3 = (x^2 + y^2 + (z-l1)^2 - l2^2 - l3^2)/(2*l2*l3);
%     s3 = -sqrt(1 - c3^2); 
%     t3 = atan2(s3,c3);
%     t2 = atan2(z-l1,sqrt(x^2 + y^2)) - atan2(l3*s3,l2+l3*c3);  
%     q = wrapTo2Pi([t1,t2,t3,1]);
%     q(3)= q(3)-2*pi;
%   
%   else 
%       q = [0 0 0 0];
%   end
%     return
% end
%Inverse Kinematics
function q = IK3R_v5(pos,l1,l2,l3,d)
  %add boundry condition
    x = pos(1);
    y = pos(2);
    z = pos(3);

    t1 = atan2(y,x);
    originshift = [d*cos(t1) d*sin(t1) 0];
    pos = pos+originshift;
  
  
    x = pos(1);
    y = pos(2);
    z = pos(3);
   c3 = (x^2 + y^2 + (z-l1)^2 - l2^2 - l3^2)/(2*l2*l3);
    s3 = -sqrt(1 - c3^2);
    
    if ~isreal(s3)
        q = [0 0 0 0 ];
        return
    end
    t3 = atan2(s3,c3);
    t2 = atan2(z-l1,sqrt(x^2 + y^2)) - atan2(l3*s3,l2+l3*c3);  
    q = ([t1,t2,t3,1]);
    
  

    return
end