%-----------------------------------------------
%generate the constant p to make it normalized
sum =0;
for i = 1 : 60 
    sum = sum +1/i;
end
p = 1/sum;
%------------------------------------------------
%generate the histogram, do 10000 trials
%basic idea is kind of similar to inverse sampling
result = zeros(20000,1);
for k = 1 : 20000
    result(k) = generateX(p);
end
histogram(result,60,'BinLimits',[1,60]);
title('histogram for {X_k}')
xlabel('index j')
ylabel('appear times in the trial')
%-------------------------------------------------
% N_60 experiment
result_N60 = zeros(1000,1);
for i = 1 : 1000
    N = 0;
    while generateX(p) ~= 60
        N = N +1;
    end
    result_N60(i) = N;
end
figure
histogram(result_N60)
title('histogram for {N_{60}}')
xlabel('the least amount of trials to reach N_{60}')
ylabel('the number of such amount of trials')
Expectation = mean(result_N60);
variance = var(result_N60);
