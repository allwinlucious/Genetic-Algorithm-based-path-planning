%%config
clc
global n start goal base l1 l2 l3 d tolerance
base = [0,0,0];
l1 = 96;
l2 = 174;
l3 = 166;
d = 12;
n=2;
start = [166 -100 -92];
goal = [166 100 -92];
tolerance = 0;
CallingAllArms;
lb=-ones(1,3*n)*300;
ub = ones(1,3*n)*300;
rotate3d off;
options = gaoptimset('PopulationSize',100,'PlotFcn',@plotfun_v5,'SelectionFcn',@selectionremainder,'MutationFcn',@mutationadaptfeasible,'CrossoverFcn',@crossoversinglepoint);
[wp,fval]=ga(@fitfun_v5,3*n,[],[],[],[],lb,ub,[],[],options);
rotate3d on;
%final solution check
fitfun_v5(wp)
%plot the final solution with links

points = [start,wp(:,1:3),wp(:,4:6),goal]
plotMotion(Base,Arm1,Arm2,points)

axisLength = 500;
axis equal;
axis([-axisLength axisLength,-axisLength axisLength,-axisLength axisLength]);
axis on;
grid on;
% 
xlabel('X');
ylabel('Y');
zlabel('Z');
