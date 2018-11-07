function[t] = invt(area, df)
    B = integral(@(x)(x .^ (1 / 2 - 1) .* (1 - x) .^ (df / 2 - 1)), 0, 1);
    T = @(x)((1 + x .^ 2 / df) .^ (-(df + 1) / 2) / (sqrt(df) * B));
    t = fzero(@(x)(area - integral(T, -inf, x)), 0);
end
