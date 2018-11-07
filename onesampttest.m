function[P, t, varargout] = onesampttest(alt, mu0, inputs, varargin)
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
    t = (xbar - mu0) / se;
    if alt == "~="
        P = 2 * tcdf(abs(t), inf, df);
    elseif alt == "<"
        P = tcdf(-inf, t, df);
    elseif alt == ">"
        P = tcdf(t, inf, df);
    end
end

function[area] = tcdf(lower, upper, df)
    B = integral(@(x)(x .^ (-1 / 2) .* (1 - x) .^ (df / 2 - 1)), 0, 1);
    T = @(x)((1 + x .^ 2 / df) .^ (-(df + 1) / 2) / (sqrt(df) * B));
    
    area = integral(T, lower, upper);
end
