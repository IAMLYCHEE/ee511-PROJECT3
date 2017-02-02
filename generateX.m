function X = generateX(p)
%usage: result = generateN_4(p)
%input : the constant p
X = 60;
randNumber = rand(1);
acc = p/X;
while (randNumber > acc && X >=1)
    X = X-1;
    acc=acc+p/X;
end
