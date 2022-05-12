function y = fitfun_v5(x)
global n start goal;
%calculate path length
%from start to first via point
y = calc_path_len(start,[x(1) x(2) x(3)]);
%between

y =y+ calc_path_len([x(1) x(2) x(3)],[x(4) x(5) x(6)]);
%from via point to goal
y = y + calc_path_len([x(4) x(5) x(6)],goal);   
%check for collisions and impose penalities
if checkpath2(start,[x(1) x(2) x(3)]) == true
    
    y = y+2000;
end
if checkpath2([x(1) x(2) x(3)],[x(4) x(5) x(6)]) == true
    y = y+2000;
end
if checkpath2([x(4) x(5) x(6)],goal) ==true
    y = y+2000;
end
end