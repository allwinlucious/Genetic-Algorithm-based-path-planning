function state = plotfun_v3(~,state,~)
global n  start goal;
gen=state.Generation;
if gen==0 
    return
end
b=state.Best;
s = state.Score;
pop = state.Population;
[r,~]=size(s);
for i= 1:1:r  
    if s(i)==b(gen)
        for j=1:1:3*n
         wp(j) = pop(i,j);       
        end

        %draw all sub paths
%draw start to first via point
hold off;
drawLine3D(start,[wp(1) wp(2) wp(3)]);
grid on;

view(-26,12)
hold on;
if n>1
for i=1:3:3*n-5
drawLine3D([wp(i) wp(i+1) wp(i+2)],[wp(i+3) wp(i+4) wp(i+5)]);
plot3(wp(i),wp(i+1),wp(i+2),'r*');
end
end
plot3(wp(3*n-2),wp(3*n-1),wp(3*n),'r*');
plot3(start(1),start(2),start(3),'k*');
plot3(goal(1),goal(2),goal(3),'g*');
drawLine3D([wp(3*n-2) wp(3*n-1) wp(3*n)],goal);



% % % % % 
CallingAllArms;
collisionObject


xlim([-600 600]);
ylim([-600 600]);
zlim([-600 600]);
title(sprintf(' Generation = %d , waypoint = (%f,%f,%f) , (%f,%f,%f)',state.Generation,wp(1),wp(2),wp(3)));
%pause(0.12);
camlight('headlight');
lighting gouraud;
shading flat;
break
    end
%rotate3d on
end
