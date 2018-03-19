function dist = eucDist(data1,data2)
%asumsi dimensi setiap data sama
[x y] = size(data1);
dist = 0;

for i = 1:x
    dist = dist + (data1(i)-data2(i))^2;
end

end