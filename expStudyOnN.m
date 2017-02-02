%further on 3 expectation study
e = zeros(400,1);
for i = 1 : 400
    e(i)=Nhistogram(5000,4);
end
histogram(e,20)
