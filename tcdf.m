function[area] = tcdf(lower, upper, df)
    B = integral(@(x)(x .^ (-1 / 2) .* (1 - x) .^ (df / 2 - 1)), 0, 1);
    T = @(x)((1 + x .^ 2 / df) .^ (-(df + 1) / 2) / (sqrt(df) * B));
    
    area = integral(T, lower, upper);
end
