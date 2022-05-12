ShapesData;

Arms;
%Creating Base
Base = Arms;
Base.name = 'Base';
Base.vertices = rectangle1.vertices;
Base.parent = 0;
Base.initialAxis = (Base.vertices(2,:) + Base.vertices(4,:))/2;
%Origin of arms is average of 4 end vertices.

%Creating Arm1
Arm1 = Arms;
Arm1.name = 'Arm1';
Arm1.vertices = rectangle2.vertices;
Arm1.parent = Base;
Base.child = Arm1;
Arm1.initialAxis = Arm1.endPoint - Arm1.origin;

%Creating Arm2
Arm2 = Arms;
Arm2.name = 'Arm2';
Arm2.vertices = rectangle3.vertices;
Arm2.parent = Arm1;
Arm1.child = Arm2;
Arm2.child = 0;
Arm2.initialAxis = Arm2.endPoint - Arm2.origin;


theta=linspace(0,2*pi,20);
phi=linspace(0,pi,20);
[theta,phi]=meshgrid(theta,phi);
rho=3;
x=rho*sin(phi).*cos(theta)+2000;
y=rho*sin(phi).*sin(theta)+2000;
z=rho*cos(phi)+200  ;
x = x(:);
y = y(:);
z = z(:);
% 
% sphere1.Vertices = horzcat(x,y,z);
% sphere1.Faces = convhull(sphere1.Vertices);
% patch(sphere1)

sphereObject.XData = x;
sphereObject.YData = y;
sphereObject.ZData = z;

Body.XData = body.vertices(:,1);
Body.YData = body.vertices(:,2);
Body.ZData = body.vertices(:,3);


Cylinder.XData = cylinder.vertices(:,1);
Cylinder.YData = cylinder.vertices(:,2);
Cylinder.ZData = cylinder.vertices(:,3);

collisionObject = sphereObject;

