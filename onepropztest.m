function[P, z, p] = onepropztest(alt, p0, x, n)
    p = x / n;
    q0 = 1 - p0;
    z = (p - p0) / sqrt(p0 * q0 / n);
    if alt == "~="
        P = 2 * normalcdf(abs(z), inf, 0, 1);
    elseif alt == "<"
        P = normalcdf(-inf, z, 0, 1);
    elseif alt == ">"
        P = normalcdf(z, inf, 0, 1);
    end
end
    
function[area] = normalcdf(lower, upper, mu, sigma)
    N = @(x)(1 / (sigma * sqrt(2 * pi)) * exp(-((x - mu) .^ 2) / (2 * sigma ^ 2)));
    area = integral(N, lower, upper);
end

        