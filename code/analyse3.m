p = zeros(1,20);
for n = 5: 17
    p(n) = P_n(n);
end
stem(p)
title('analysis')
xlabel('N')
ylabel('probability')