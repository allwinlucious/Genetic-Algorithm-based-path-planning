receiveData = zeros (1, 3);
   if ~isempty(instrfind)
     fclose(instrfind);
      delete(instrfind);
   end
x=serial('COM3','BAUD', 9600);

fopen(x);
pause(3);
go = true;

while go
                  
a(1)= input('input motor1 angles ')
a(2)= input('input motor2 angles ')
pause(0.5)

fprintf(x, '%f', a(1));
fprintf(x, '%f', a(2));
fprintf(x, '\n');

if (a ==1000)
  go=false;
end
for i = 1:4
  output = fscanf(x);
  receiveData =output;
end
end