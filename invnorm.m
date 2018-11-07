function[z] = invnorm(area, mu, sigma)
    N = @(x)(1 / (sigma * sqrt(2 * pi)) * exp(-((x - mu) .^ 2) / (2 * sigma ^ 2)));
    z = fzero(@(x)(area - integral(N, -inf, x)), 0);
end
