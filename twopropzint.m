function[interval, p1, p2] = twopropzint(C, x1, n1, x2, n2)
    p1 = x1 / n1;
    p2 = x2 / n2;
    q1 = 1 - p1;
    q2 = 1 - p2;
    Z = -invnorm((1 - C) / 2, 0, 1);
    lower = abs(p1 - p2) - Z * sqrt(p1 * q1 / n1 + p2 * q2 / n2);
    upper = abs(p1 - p2) + Z * sqrt(p1 * q1 / n1 + p2 * q2 / n2);
    interval = [lower, upper];
end

function[z] = invnorm(area, mu, sigma)
    N = @(x)(1 / (sigma * sqrt(2 * pi)) * exp(-((x - mu) .^ 2) / (2 * sigma ^ 2)));
    z = fzero(@(x)(area - integral(N, -inf, x)), 0);
end
