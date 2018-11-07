function[P, X2, df, expected, cntrb] = chisquaretest(observed)
    r = sum(observed);
    c = sum(observed')'; %#ok<UDIM>
    total = sum(r);
    
    df = prod(size(observed) - 1);
    expected = c * r / total;
    cntrb = (observed - expected) .^ 2 ./ expected;
    
    X2 = sum(sum(cntrb));
    P = chisquarecdf(X2, inf, df);
end

function[area] = chisquarecdf(lower, upper, df)
     G = integral(@(x)(x .^ ((df / 2) - 1) .* exp(-x)), 0, inf);
     X2 = @(x)(x .^ ((df - 2) / 2) .* exp(-x / 2) ./ (2 .^ (df / 2) * G));
     
     area = integral(X2, lower, upper);
end


