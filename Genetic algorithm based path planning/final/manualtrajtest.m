%trajectory planning 
%get endpoints
%divide line into equal parts
%find IK at each part
%send move command at equal intervals
%a,b both 1*3 matrix
   if ~isempty(instrfind)
     fclose(instrfind);
      delete(instrfind);
   end
x=serial('COM3','BAUD', 9600);
fopen(x);
pause(3);
l1 =96;
l2 = 174;
l3 = 166;
d = 12;
a = [200,0,96];
b = [210,0,96];
c =b-a;
r = ones(1,4);
for t = 0:0.1:1 %dividing into 10 points
    p = a+c*t;
    th = round(rad2deg(formatangles(IK3R_v5(p,l1,l2,l3,d))));
    if th(4)==0
     break;
    end
       fprintf(x,'%d\n',th(1));
       pause(15/1000);
       r(1)=fscanf(x,'%d');
         pause(15/1000);
       fprintf(x,'%d\n',th(2));
         pause(15/1000);
       r(2)=fscanf(x,'%d');
       fprintf(x,'%d\n',th(3));
         pause(15/1000);
       r(3)=fscanf(x,'%d');
       fprintf(x,'%d\n',60);
         pause(15/1000);
       r(4)=fscanf(x,'%d');
       r
    %wait for trajectory to execute ...either delay or completion message
pause(5);
end