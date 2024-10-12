function E = energy_contour(x1,x2,P)
% calculation of quadratic energy eq x^T P x
E = zeros(size(x1));  

for i = 1:size(x1, 1)
    for j = 1:size(x1, 2)
        x_vec = [x1(i, j); x2(i, j)];  
        E(i, j) = x_vec' * P * x_vec;  
    end
end
end

