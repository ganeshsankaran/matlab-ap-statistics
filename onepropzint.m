function[interval, p] = onepropzint(C, x, n)
    p = x / n;
    q = 1 - p;
    Z = -invnorm((1 - C) / 2, 0, 1);
    lower = p - Z * sqrt(p * q / n);
    upper = p + Z * sqrt(p * q / n);
    interval = [lower, upper];
end

function[z] = invnorm(area, mu, sigma)
    N = @(x)(1 / (sigma * sqrt(2 * pi)) * exp(-((x - mu) .^ 2) / (2 * sigma ^ 2)));
    z = fzero(@(x)(area - integral(N, -inf, x)), 0);
end

