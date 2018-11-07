function[area] = normalcdf(lower, upper, mu, sigma)
    N = @(x)(1 / (sigma * sqrt(2 * pi)) * exp(-((x - mu) .^ 2) / (2 * sigma ^ 2)));
    area = integral(N, lower, upper);
end

