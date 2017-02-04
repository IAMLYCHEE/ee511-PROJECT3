test_amount = 5;
while(1)
    p = reject_prop(test_amount);
    if p < 0.95
        test_amount = test_amount + 1;
    else
        break
    end
end
test_amount
