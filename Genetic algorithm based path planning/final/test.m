clc
% iAngles = [-pi/2 0 0];
iAngles = IK3R_v5([251.5050   64.5592   -7.8499],96,174,166,12);
fAngles = IK3R_v5([252.5050   64.5592   -7.8499],96,174,166,12);
ShapesData;

CallingAllArms;
% iAngles = [pi/2 -pi/2 -pi/2]
% fAngles = [0 0 0];

Base.vertices = rectangle1.vertices;
Arm1.vertices = rectangle2.vertices;
Arm2.vertices = rectangle3.vertices;


Base.newRotator(iAngles(1));
Arm1.newRotator(iAngles(2));
Arm2.newRotator(iAngles(3));



patch(createShape(Base,'g'));
patch(createShape(Arm1,'g'));
patch(createShape(Arm2,'g'));

% createSwept(Base,Arm1,Arm2,fAngles)
y = Robot(Base,Arm1,Arm2,collisionObject,Body,Cylinder,iAngles,fAngles)

b.Vertices = cylinder.vertices;
b.Faces = convhull(b.Vertices);
patch(b);
patch(createShape(Base,'b'))
patch(createShape(Arm1,'b'))
patch(createShape(Arm2,'b'))



% y = collisionTester(Base,Arm1,Arm2,sphere,fAngles);

% new.Vertices = horzcat(x,y,z);
% size(new.Vertices)
% new.Faces = convhull(new.Vertices);
% patch(new)


% [a,b,c] = sphere;
% a = a(:);
% b=b(:);
% c = c(:);
% 
% sphere1.Vertices = horzcat(a,b,c);
% sphere1.Faces = convhull(sphere1.Vertices);
% patch(sphere1)
% drawnow
% f = @() collisionTester(Base,Arm1,Arm2,test,[pi pi pi]); % handle to function
% timeit(f)
% collisionTester(Base,Arm1,Arm2,test,[pi pi pi]);
theta=linspace(0,2*pi,5);
phi=linspace(0,pi,5);
[theta,phi]=meshgrid(theta,phi);
rho=3;
x=rho*sin(phi).*cos(theta)+6;
y=rho*sin(phi).*sin(theta)+6;
z=rho*cos(phi)+4;
x = x(:);
y = y(:);
z = z(:);
% 
sphere1.Vertices = horzcat(x,y,z);
sphere1.Faces = convhull(sphere1.Vertices);
patch(sphere1)

axisLength = 500;
axis equal;
axis([-axisLength axisLength,-axisLength axisLength,-axisLength axisLength]);
axis on;
grid on;
% 
xlabel('X');
ylabel('Y');
zlabel('Z');

