function dist = eucDist(route,data)
[x,y] = size(route);
dist = 0;

for i = 1:(y-1)
    x1 = route(i);
    x2 = route(i+1);
    
    dist = dist + sqrt(((data(x1,2)-data(x2,2))^2) + ((data(x1,3)-data(x2,3))^2));
end
x1 = route(1);
x2 = route(y);
dist = dist + sqrt(((data(x1,2)-data(x2,2))^2) + ((data(x1,3)-data(x2,3))^2));
    
end