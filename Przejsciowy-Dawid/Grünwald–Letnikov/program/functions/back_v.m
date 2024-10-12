%% Description
% Recursive formula implementation to calculate backward difference. Memory
% impact coefficients.



function a_v = back_v(alpha,i)
%% Input Error Handle
if i < 1
    error("error in back_v(alpha,i): Input argument 'i' is less than 1. " + ...
        "There is no vector index less than 1");
end

if alpha <= 0 
    error("Error in alpha. Order must be greater than 0 to be a diff");
end
%% Function
% Initialization
a_v = zeros(1,i);

% Here is 1 cause first vector index in Matlab is 1. 
    a_v(1) = 1;
% Recursive function with 'for' loop cause effect of this function 
% must be a vector. 
for j=1:i-1
    a_v(j+1) = a_v(j)*(1-(1+alpha)/(j));
end

end

%% Example results on memory
% >>back_v(1,4)

%ans =

%     1    -1     0     0     0
%-------------------------------------------------------------------------
% >>back_v(0.1,4)

%ans =

%    1.0000   -0.1000   -0.0450   -0.0285   -0.0207

%% References
% Paper:
% The Grünwald-Letnikov Formula and Its Equivalent Horner’s Form Accuracy 
% Comparison and Evaluation for Application to Fractional Order PID 
% Controllers

% Authors:
% Dariusz W. Brzeziński PHD Student
% prof. Piotr Ostalczyk

% Lodz, Poland
% year 2012