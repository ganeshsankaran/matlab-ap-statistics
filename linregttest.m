function[P, t, df, b1, se] = linregttest(alt, x, y)
    X = [x; ones(1, length(x))]';
    Y = y';
    b = X \ Y;
    b1 = b(1);
    b0 = b(2);
    
    n = length(x);
    df = n - 2;
    
    e = y - b0 - b1 .* x;
    se = sqrt((sum(e .^ 2) / df) ./ sum((x - mean(x)) .^ 2));
    
    t = b1 / se;
    if alt == "~="
        P = 2 * tcdf(abs(t), inf, df);
    elseif alt == "<"
        P = tcdf(-inf, t, df);
    elseif alt == ">"
        P = tcdf(t, inf, df);
    end
end

function[area] = tcdf(lower, upper, df)
    B = integral(@(x)(x .^ (-1 / 2) .* (1 - x) .^ (df / 2 - 1)), 0, 1);
    T = @(x)((1 + x .^ 2 / df) .^ (-(df + 1) / 2) / (sqrt(df) * B));
    
    area = integral(T, lower, upper);
end
