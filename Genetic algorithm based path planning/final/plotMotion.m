function plotMotion(Base,Arm1,Arm2,points)
ShapesData;

BodyBase.Vertices = body.vertices;
BodyBase.Faces = convhull(BodyBase.Vertices);
patch(BodyBase);

CylinderBase.Vertices = cylinder.vertices;
CylinderBase.Faces = convhull(CylinderBase.Vertices);
patch(CylinderBase);

axisLength = 500;
axis equal;
axis([-axisLength axisLength,-axisLength axisLength,-axisLength axisLength]);
axis on;
grid on;
% 
xlabel('X');
ylabel('Y');
zlabel('Z');

iAngles = IK3R_v5(points(:,1:3),96,174,166,12);
Base.newRotator(iAngles(1));
Arm1.newRotator(iAngles(2));
Arm2.newRotator(iAngles(3));

patch(createShape(Base,'g'));
patch(createShape(Arm1,'g'));
patch(createShape(Arm2,'g'));

a = points(:,1:3);
b = points(:,4:6);
c = b - a;

h = jet(35);
count = 1;
for t = 0:0.1:1
    
    p  = a + c*t;
    fAngles = IK3R_v5(p,96,174,166,12);
    createSwept(Base,Arm1,Arm2,fAngles(:,1:3),h(count,:));
    count = count+1;
    hold off

    pause(0.1)
end

a = points(:,4:6);
b = points(:,7:9);
c = b - a;

for t = 0:0.1:1
    
    p  = a + c*t;
    fAngles = IK3R_v5(p,96,174,166,12);
    createSwept(Base,Arm1,Arm2,fAngles(:,1:3),h(count,:));
    count = count+1;
    pause(0.1)
end

a = points(:,7:9);
b = points(:,10:12);
c = b - a;
for t = 0:0.1:1
    
    p  = a + c*t;
    fAngles = IK3R_v5(p,96,174,166,12);
    createSwept(Base,Arm1,Arm2,fAngles(:,1:3),h(count,:));
    count = count+1;
    pause(0.1)
end


% fAngles = IK3R_v5(points(:,4:6),96,174,166,12);
% createSwept(Base,Arm1,Arm2,fAngles(:,1:3),'b');

% fAngles = IK3R_v5(points(:,7:9),96,174,166,12);
% createSwept(Base,Arm1,Arm2,fAngles(:,1:3));
% 
% fAngles = IK3R_v5(points(:,10:12),96,174,166,12);
% createSwept(Base,Arm1,Arm2,fAngles(:,1:3));


patch(createShape(Base,'b'))
patch(createShape(Arm1,'b'))
patch(createShape(Arm2,'b'))

end

