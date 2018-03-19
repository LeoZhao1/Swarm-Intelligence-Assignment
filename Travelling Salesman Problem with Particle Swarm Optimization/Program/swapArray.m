function s = swapArray(swapper, arr)
[x y] = size(swapper);

for i = 1:x
    tmp = arr(swapper(i,1));
    arr(swapper(i,1)) = arr(swapper(i,2));
    arr(swapper(i,2)) = tmp;
end

s = arr;

end