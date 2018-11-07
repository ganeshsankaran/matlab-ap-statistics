function[interval, varargout] = twosamptint(C, inputs, varargin)
    if inputs == "data"
        x1 = varargin{1};
        x1bar = mean(x1);
        s1 = stdev(x1); 
        n1 = length(x1);
        varargout{1} = x1bar;
        varargout{2} = s1;
        varargout{3} = n1;
        
        x2 = varargin{2};
        x2bar = mean(x2);
        s2 = stdev(x2);
        n2 = length(x2);
        varargout{4} = x2bar;
        varargout{5} = s2;
        varargout{6} = n2;
        
    elseif inputs == "stats"
        x1bar = varargin{1};
        s1 = varargin{2};
        n1 = varargin{3}; 
        x2bar = varargin{4};
        s2 = varargin{5};
        n2 = varargin{6};
    end
    
    se1 = s1 / sqrt(n1);
    se2 = s2 / sqrt(n2);
    df = (se1 ^ 2 + se2 ^ 2) ^ 2 / (((se1 ^ 2) ^ 2 / (n1 - 1)) + ((se2 ^ 2) ^ 2 / (n2 - 1)));
    T = -invt((1 - C) / 2, df);
    lower = (x1bar - x2bar) - T * sqrt(se1 ^ 2 + se2 ^ 2);
    upper = (x1bar - x2bar) + T * sqrt(se1 ^ 2 + se2 ^ 2);
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
