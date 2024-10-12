function aOj = backdiff(alpha,j)
    % Recursive computation of generalized binomial coefficients
    if j == 0
        aOj = 1;  % Starting point (for j=0)
    else
        aOj = (alpha - (j-1)) / j * backdiff(alpha,j-1);  % Recursive formula
    end
end
