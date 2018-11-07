function[P, X2, df, cntrb] = chisquaregoftest(observed, expected)
    df = length(observed) - 1;
    
    cntrb = (observed - expected) .^ 2 ./ expected;
    X2 = sum(cntrb);
    P = chisquarecdf(X2, inf, df);
end

function[area] = chisquarecdf(lower, upper, df)
     G = integral(@(x)(x .^ ((df / 2) - 1) .* exp(-x)), 0, inf);
     X2 = @(x)(x .^ ((df - 2) / 2) .* exp(-x / 2) ./ (2 .^ (df / 2) * G));
     
     area = integral(X2, lower, upper);
end

