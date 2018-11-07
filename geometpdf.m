function[prb] = geometpdf(p, x)
    q = 1 - p;
    G = @(x)(q .^ (x - 1) * p);
    prb = G(x);
end