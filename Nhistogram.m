function E = Nhistogram(eval_budget,thre)
%use: E = Nhistogram(eval_budget,thre)
% plot the histogram using eval_budget for N, threshold thre
result = zeros(eval_budget,1);
for i = 1 : eval_budget
    result(i)= generateN(thre);
end
histogram(result);
E = mean(result);
