
    


function p = P_n(N)
p = nchoosek(N,floor(N/2))*(4/N)^(N/2)*(1-4/N)^(N-(N/2));
end
