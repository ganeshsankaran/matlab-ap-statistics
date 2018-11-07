function[prb] = tpdf(x, df)
    B = integral(@(x)(x .^ (1 / 2 - 1) .* (1 - x) .^ (df / 2 - 1)), 0, 1);
    T = @(x)((1 + x .^ 2 / df) .^ (-(df + 1) / 2) / (sqrt(df) * B));
    
    prb = T(x); 
end
