clc;
% N = 1 % no. of random numbers to generate...
% x = rand(N,1) % from a uniform distribution
% gamma = 2/3; % scale parameter for the distribution (as in the article)
% s = (1-x).^(-1/gamma); % s has a power-law distribution
% 
% %levy flight
% le = 1 + (1/gamma) .* s;
% s = 100;
% x=zeros(1,s);
% y=zeros(1,s);
% x(1) = 1;
% y(1) = 1;
% for i=2:s
%     x_rand = rand(1,1);
%     theta=rand*2*pi;
%     gamma = 1.75;
%     lepi = x_rand^(-1/gamma); 
%     xt = x(i-1) + cos(theta) * lepi;
%     x(i) = round(xt)
%     yt = y(i-1) + sin(theta) * lepi;
%     y(i) = round(yt)
% end
% 
% figure('color', 'white');
% axis equal off;
% line(x,y);
x = 1;
for i = 1:1000
    beta=3/2;
    sigma=((gamma(1+beta)*sin(pi*beta/2))/(gamma((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta);

    u=randn*(sigma^2);
    v=randn*(sigma^2);
    vm = v * v;
    lepi = 0.01*(u/(sqrt(vm)*(1/beta)))*(5-4);

    x_tmp = x + 1 * (lepi *100);
    x = round(x_tmp)
end