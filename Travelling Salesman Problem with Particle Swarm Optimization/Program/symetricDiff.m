function s = symetricDiff (arr1, arr2, prob)
[x1 y1] = size(arr1);
[x2 y2] = size(arr2);

inc = 1;

%cek nilai terbesar
if(x1<x2)
    xb = x2;
    xc = x1;
    arrb = arr2;
    arrc = arr1;
else
    xb = x1;
    xc = x2;
    arrb = arr1;
    arrc = arr2;
end

s = arrb;
[x3 y3] = size(s);

%loop sebanyak array yang paling kecil
for i = 1:xc
    wheel = rand(1);
    %ambil index array kecil pertama
    x = arrc(i,1:2);
    
    %kalau wheel lebih besar dari prob ya dimasukin nilainya
    if(wheel<prob)
        x3 = x3+1;
        s(x3,1:2) = x;
    end
end

end