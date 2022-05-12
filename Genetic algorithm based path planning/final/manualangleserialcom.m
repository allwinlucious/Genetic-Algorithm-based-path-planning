
   if ~isempty(instrfind)
     fclose(instrfind);
      delete(instrfind);
   end
 
   th = [59 82 70 60];
x=serial('COM3','BAUD', 9600);
fopen(x);
pause(3);
       fprintf(x,'%d\n',th(1));
       a=fscanf(x,'%d');
       fprintf(x,'%d\n',th(2));
       b=fscanf(x,'%d');
       fprintf(x,'%d\n',th(3));
       c=fscanf(x,'%d');
pause(2);
