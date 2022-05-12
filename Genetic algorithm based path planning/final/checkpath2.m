function y = checkpath2(x1,x2)
global  l1 l2 l3 d;
%change IK and add workspace in IK
c = x2 - x1;
CallingAllArms;
for t = 0:0.1:0.9
p = x1+c*t;
p2 = x1+c*(t+0.1);
t=IK3R_v5(p,l1,l2,l3,d);
if t(4)==0
    y=true;
    break;
else
iAngles =t;
end
fAngles = IK3R_v5(p2,l1,l2,l3,d);
y = Robot(Base,Arm1,Arm2,collisionObject,Body,Cylinder,iAngles,fAngles);
if y == true
    break;
end
end
return
end