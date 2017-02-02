function x = gen_one_possion(lambda)
%usage function x = gen_one_possion(lambda)
u = rand(1);
i = 0;
p = exp(-lambda);
F = p;
while u > F
    p = lambda * p / (i+1);
    F = F + p; %accumulate
    i = i+1;
end
x = i;
