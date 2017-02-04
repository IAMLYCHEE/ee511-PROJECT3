%test
% lambda = 120;
% P = zeros(1,lambda*2);
% x = 1 : 2 * lambda;
% for k = 1 : lambda*2  
%     P(k) = 5000*lambda^k * exp(-lambda)/factorial(k);
% end
% plot(x,P,'r--o')
%-----------------------------------------------
%generate the constant p to make it normalized
% sum =0;
% for i = 1 : 60 
%     sum = sum +1/i;
% end
% p = 1/sum;
%------------------------------------------------
%generate the histogram, do 10000 trials
%basic idea is kind of similar to inverse sampling
% result = zeros(10000,1);
% for k = 1 : 10000
% result(k) = generateN_4(p);
% end
% histogram(result)
% title('histogram for {X_k}')
%-------------------------------------------------
% N_60 experiment

trial_budget
p = [0.06*ones(1,5),0.15,0.13,0.14,0.15,0.13];
q = ones(1,10)*0.1;
M = max(p./q);
i=1;
for k = 1 : 2000
    y = randi(10);
    u = rand(1);
    if u < p(y)/(M*q(y))
        accept(i) = y;
        i=i+1;
    end
end
histogram(accept');
% overlay the target distribution

