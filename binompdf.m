function[prb] = binompdf(trials, p, x)
    q = 1 - p;
    B = @(x)(ncr(trials, x) .* p .^ x .* q .^ (trials - x));
    prb = B(x);
end

function[ans] = ncr(n, k)
    ans = factorial(n) ./ (factorial(k) .* factorial(n - k));
end