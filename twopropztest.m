function[P, z, p1, p2, ppooled] = twopropztest(alt, x1, n1, x2, n2)
    p1 = x1 / n1;
    p2 = x2 / n2;
    ppooled = (x1 + x2) / (n1 + n2);
    qpooled = 1 - ppooled;
    z = (p1 - p2) / sqrt(ppooled * qpooled * (1 / n1 + 1 / n2));
    
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

