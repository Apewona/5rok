function [X, t] = GLone(T,dt,X0,alpha,A)


k = T/dt;
X = zeros(1,k);
X(1) = X0;
t = linspace(0, T, k);
    for i=2:k

        a_v= back_v(alpha,i);
        mem_coeff = a_v(2:end);

        last_x = flip(X(1:i-1));

        X(i) = A*X(i-1)*dt - sum(mem_coeff.*last_x);
    end

end

