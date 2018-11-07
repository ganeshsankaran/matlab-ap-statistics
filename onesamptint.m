function[interval, varargout] = onesamptint(C, inputs, varargin)
    if inputs == "data"
        x = varargin{1};
        xbar = mean(x);
        s = stdev(x); 
        n = length(x);
        varargout{1} = xbar;
        varargout{2} = s;
        varargout{3} = n;
    elseif inputs == "stats"
        xbar = varargin{1};
        s = varargin{2};
        n = varargin{3}; 
    end
    
    se = s / sqrt(n);
    df = n - 1;
    T = -invt((1 - C) / 2, df);
    lower = xbar - T * se;
    upper = xbar + T * se;
    interval = [lower, upper];
end

function[t] = invt(area, df)
    B = integral(@(x)(x .^ (1 / 2 - 1) .* (1 - x) .^ (df / 2 - 1)), 0, 1);
    T = @(x)((1 + x .^ 2 / df) .^ (-(df + 1) / 2) / (sqrt(df) * B));
    t = fzero(@(x)(area - integral(T, -inf, x)), 0);
end

function[ans] = stdev(x)
    ans = sqrt(variance(x));
end

function[ans] = variance(x)
    n = length(x);
    ans = sum((x - mean(x)) .^ 2) / (n - 1);
end
    