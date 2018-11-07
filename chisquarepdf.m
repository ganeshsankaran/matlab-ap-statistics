function[prb] = chisquarepdf(x, df)
     G = integral(@(x)(x .^ ((df / 2) - 1) .* exp(-x)), 0, inf);
     X2 = @(x)(x .^ ((df - 2) / 2) .* exp(-x / 2) ./ (2 .^ (df / 2) * G));
     
     prb = X2(x);
end
