%fungsi ini dibuat untuk membentuk sequence swap dari kedua buah array
function swap = swapConstruct (arr1, arr2)
%ukuran kedua array sama
[x y] = size(arr2);

s = zeros(1,2);
inc = 1;

for i = 1:y
    index = find(arr2 == arr1(i));   
    
    %cek apakah ada perbedaan index
    if(index ~= i)
        %daftarkan ke array swap
        s(inc,:) = [i index];
        
        %tukar posisi
        tmp = arr2(index);
        arr2(index) = arr2(i);
        arr2(i) = tmp;
        
        %lakukan incremental
        inc = inc + 1;
    end
end

%cek apakah array identik atau tidak
if(s(1,1) == 0)
    %identik
    swap = [];
else
    %beda
    swap = s;
end

end