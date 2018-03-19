clc;
clear;
tic;

%%INITIALIZATION
%baca data
data = xlsread('data.xls');
t_data = size(data);

%%%inisialisasi jumlah kluster
k = 3;
pa = 0.9;
nest_pop = 200;
itter = 500;

%%%init centroid di setiap nest
centr_array = zeros(nest_pop,k+2);

for i = 1:nest_pop
    centr_array(i,1:k) = randi(t_data(1),1,k);
    
    %hitung nilai fitness
    sse_tmp = 0;
    for j = 1:k
        n = centr_array(i,j);
        for n = 1:t_data(1)
            sse_tmp = sse_tmp + eucDist(centr_array(i,1:k),data(n));
        end
    end

    %proses nilai fitness
    fitness = 1/sse_tmp;
    centr_array(i,k+1) = i;
    centr_array(i,k+2) = fitness;
end

%Get best nest
x_best = centr_array(nest_pop,k+1)

toc;
%% EXPLORATION
%cucko search algorithm
%init x awal dimana di set di 0
x = 1;

%init nilai fitness awal
F = centr_array(nest_pop,k+2);
i = 1;

while i < itter
    %generate random by levy flight
%     x_rand = rand(1,1);
%     gamma = 1;
%     lepi = x_rand^(-1/gamma); 
%     x_tmp = x + (1/gamma) * lepi;
    
    beta=2;
    sigma=((gamma(1+beta)*sin(pi*beta/2))/(gamma((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta);

    u=randn*(sigma^2);
    v=randn*(sigma^2);
    vm = v * v;
    lepi = 0.01*(u/(sqrt(vm)*(1/beta)))*(x - x_best);

    x_tmp = x + 1 * (lepi *100);
    
    %cek dia overlap atau tidak
    if(round(x_tmp)<nest_pop) && (round(x_tmp)>0)
        x = round(x_tmp)
        i = i+1;
        
        %get nest
        nest = centr_array(x,:);

        %Hitung Fitness
        %hitung SSE
        sse_tmp = 0;
        for j = 1:k
            n = nest(j);
            for na = 1:t_data(1)
                sse_tmp = sse_tmp + eucDist(nest,data(na));
            end
        end

        %proses nilai fitness
        fitness = 1/sse_tmp;

        if (F < fitness)
            sse_final = sse_tmp
            F = fitness
            x_best = x;
        end
        
        if(rand()<pa)
            centr_array(x,1:k) = randi(t_data(1),1,k);
            
            sse_tmp = 0;
            for j = 1:k
                n = centr_array(x,j);
                for n = 1:t_data(1)
                    sse_tmp = sse_tmp + eucDist(centr_array(x,1:k),data(n));
                end
            end

            %proses nilai fitness
            fitness = 1/sse_tmp;
            centr_array(x,k+1) = x;
            centr_array(x,k+2) = fitness;
        end
        
        %biar tidak terjebak diruang nostalgia
        if(x_best == x)
            x = x + (lepi*100);
            x = round(x);
        end
    end
end

%% Tampilkan Hasil
clc
nilai_fitness = sprintf(' Nilai Fitness = %.13f ', F);
nilai_sse = sprintf('Nilai SSE = %.13f ', sse_final);
disp(nilai_fitness)
disp(nilai_sse)
disp('Lokasi Centroid')

for i = 1:size(x_best,2)
    disp(['posisi centroid ke-' num2str(i) ' adalah ada pada index data ke-' num2str(x_best(i))])
end
