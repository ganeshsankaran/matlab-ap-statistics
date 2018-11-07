function[area] = geometcdf(p, lower, upper)
   q = 1 - p;
   G = @(x)(q .^ (x - 1) * p);
   area = sum(G(lower:upper));
end