function sw = randSwap(maxLength)
%generate array
x = randi(maxLength,1);

sw = zeros(x,2);

for i = 1:x
    sw(i,:) = randi(maxLength,1:2);
end

end