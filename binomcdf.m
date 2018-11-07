function[area] = binomcdf(trials, p, lower, upper)
    q = 1 - p;
    B = @(x)(ncr(trials, x) .* p .^ x .* q .^ (trials - x));
    area = sum(B(lower:upper));
end

function[ans] = ncr(n, k)
    ans = factorial(n) ./ (factorial(k) .* factorial(n - k));
end