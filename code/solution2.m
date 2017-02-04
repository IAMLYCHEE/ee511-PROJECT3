function solution2(trial_budget,lambda)
%usage: compute the B-trial result, inverse sampling method, and theoretical value,fora possion distribution event
%input: trial times, the expected average of occurence of event (lambda)

%----------------------------------------------------------------
%theoretical p.m.f of Possion distribution
P_the = zeros(1,lambda*1.5); %record the P theoretical value
x = 1 : lambda*1.5;
for k = 1 : lambda*1.5  
    P_the(k) = trial_budget*lambda^k * exp(-lambda)/factorial(k);
end
%--------------------------------------------------
%Bernoulli trial method
success_amount = zeros(trial_budget,1);
N = 5000;
P = lambda / N;
for i = 1: trial_budget
    success_amount(i) = sum(rand(N,1) < P);
end
subplot(1,2,1)
histogram(success_amount,lambda*1.5,'BinLimits',[1,lambda*1.5]);
title('Bernoulli trial')
xlabel('number of cars')
ylabel('appear times')
%set the same x-axis [1,lambda*1.5] for comparing
hold on
plot(x,P_the,'r--o');
hold off
legend('B-trial','theoretical');
%---------------------------------------------------
%inverse tranform method
amount_gened = zeros(trial_budget,1); %generated amount
for i = 1: trial_budget
    amount_gened(i) = gen_one_possion(lambda);
end
subplot(1,2,2)
histogram(amount_gened,lambda*1.5,'BinLimits',[1,lambda*1.5]);
title('inverse-transform method');
xlabel('number of cars')
ylabel('appear times')
hold on 
plot(x,P_the,'r--o');
hold off
legend('inverse-sample','theretical');