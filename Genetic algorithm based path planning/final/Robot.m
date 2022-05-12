function y = Robot(Base,Arm1,Arm2,collisionObject,Body,Cylinder,iAngles,fAngles)

% ShapesData;
% Base.vertices = rectangle1.vertices;
% Arm1.vertices = rectangle2.vertices;
% Arm2.vertices = rectangle3.vertices;

Base.newRotator(iAngles(1))
Arm1.newRotator(iAngles(2))
Arm2.newRotator(iAngles(3))

y = newTester(Base,Arm1,Arm2,collisionObject,Body,Cylinder,fAngles);
% y = collisionTester(Base,Arm1,Arm2,collisionObject,Body,Cylinder,fAngles);
return
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
% axisLength = 30;
% axis equal;
% axis([-axisLength axisLength,-axisLength axisLength,-axisLength axisLength]);
% axis on;
% grid on;
% % 
% xlabel('X');
% ylabel('Y');
% zlabel('Z');

