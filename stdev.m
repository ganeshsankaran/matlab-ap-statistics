function[ans] = stdev(x)
    ans = sqrt(variance(x));
end

function[ans] = variance(x)
    n = length(x);
    ans = sum((x - mean(x)) .^ 2) / (n - 1);
end
    