function [mean_exp,mean_the,var_exp,var_the,efficiency] = solution5(trial_budget)
%------------------------------------------------------------------------
%usage:[mean_exp,mean_the,var_exp,var_the,efficiency] = solution5(trial_budget)
%trial_budget: the number of times you would like to query for generating
%the sample using accept-reject method
%generate the sample mean and variance using accept-reject method
%generate the theoretical mean and variance
%generate the efficiency of the accept-reject method
%Li Yicheng
%------------------------------------------------------------------------

%accept-reject method
p = [0.06*ones(1,5),0.15,0.13,0.14,0.15,0.13];
%the distribution of p_j
q = ones(1,10)*0.1;
%the distribution to sample from
M = max(p./q);
%derive the coeffience to let all Mq >= p
i=1;
for k = 1 : trial_budget
    y = randi(10);
    u = rand(1);
    if u < p(y)/(M*q(y))
        accept(i) = y;
        i=i+1;
    end
end
%plot part
histogram(accept');
xlabel('index 1 to 10')
ylabel('appear times')
%-------------------------------------------------------------------------
%the target distribution
amount = length(accept);
%to compare the two graph we need to set them have same total sample amount
index = 1;
for i = 1 : 10
    std_distri(index:index + round(amount*p(i))-1)= i*ones(round(amount*p(i)),1);
    %add the 'i's into the sequence, for example in the first loop add
    %(amount * 0.06 ) ones into the sequence from 1 to amount * 0.06;
    index = index + round(amount*p(i));
end
%overlay with the theoretical
hold on
histogram(std_distri);
title('accept-reject sampling')
legend('accept-reject','target')

%the sample mean,variance and the theoretical values
mean_exp = mean(accept);
mean_the = (1:10)*p';
var_exp = var(accept);
var_the = var(std_distri);
%the efficiency
efficiency = amount/trial_budget;


