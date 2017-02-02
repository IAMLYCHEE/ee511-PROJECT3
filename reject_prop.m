function reject_p = reject_prop(test_amount)
%usage: reject_p = reject_prop(test_amount)
%given the test amount, output the reject probability
% input : test_amount : the test amount
% output: reject_p: reject probability
reject = 0;
for i = 1 : 20000 %to be accurate enough, do 20000 trial
    samples = randi(125,[test_amount,1]);%select test amount microchips 
    if ( sum(samples < 7) > 0) %let defective chips be No.1 to No.6 
        reject = reject +1; %reject,detected such defective chip
    end
end
reject_p = reject / 20000;
