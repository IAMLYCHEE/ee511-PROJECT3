function N = generateN(thre)
%usage N = generateN(thre)
%input : thre : the threshold for sum, in experiment 3 , it is 4
%output: the smallest number of sum (u. random samples) > 4
sum = 0;
N = 0;
while sum < thre
    sum = sum + rand(1);
    N = N+1;
end