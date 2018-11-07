function[P, t, varargout] = twosampttest(alt, inputs, varargin)
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
    t = (x1bar - x2bar) / sqrt(se1 ^ 2 + se2 ^ 2);
    
    if alt == "~="
        P = 2 * tcdf(abs(t), inf, df);
    elseif alt == "<"
        P = tcdf(-inf, t, df);
    elseif alt == ">"
        P = tcdf(t, inf, df);
    end
    
end
