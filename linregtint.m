function[interval, df, b1, se] = linregtint(C, x, y)
    X = [x; ones(1, length(x))]';
    Y = y';
    b = X \ Y;
    b1 = b(1);
    b0 = b(2);
    
    n = length(x);
    df = n - 2;
    e = y - b0 - b1 .* x;
    se = sqrt((sum(e .^ 2) / df) ./ sum((x - mean(x)) .^ 2));
    
    T = -invt((1 - C) / 2, df);
    lower = b1 - T * se;
    upper = b1 + T * se;
    interval = [lower, upper];
end

function[t] = invt(area, df)
    B = integral(@(x)(x .^ (1 / 2 - 1) .* (1 - x) .^ (df / 2 - 1)), 0, 1);
    T = @(x)((1 + x .^ 2 / df) .^ (-(df + 1) / 2) / (sqrt(df) * B));
    t = fzero(@(x)(area - integral(T, -inf, x)), 0);
end

