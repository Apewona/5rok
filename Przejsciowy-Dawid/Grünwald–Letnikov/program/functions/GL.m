%% HELP
% Function numerically calculates  discrete fractional state space vector
% for Grünwald-Letnikov definition.
%-------------------------------------------------------------------------
% INPUTS:
% T  - simulation time;                     example, T = 10         [s]
% dt - simulation sampling period;          example, dt = 0.01      [s]
% X0 - initial vector;                      example, X0 = [1; 1]    [uSI]
% alpha - fractional system's order;        example, alpha = 0.8    [-]
% DIM - integer number, system dimension    exaple, DIM = 2         [-]
%-------------------------------------------------------------------------
% OUTPUT:
% X - calculated state space vector for k samples
%            ------> k
%   |   2     0     0     0     0     0     0     0     0     0
%   |   2     0     0     0     0     0     0     0     0     0
%  DIM
%
% t - output time calculation base time vector
%           -------> dt*k
%   0    1.1111    2.2222    3.3333    4.4444    5.5556    6.6667  

function [X, t] = GL(T, dt, X0, alpha, A, DIM)
%% Input args error handle

if T <= 0
    error("Input error. T must be greater than 0");
end

if dt <= 0
    error("Input dt error. dt must be greater than 0");
end

[rowX0, colsX0] = size(X0);
if rowX0 ~= DIM || colsX0 ~= 1
    error("Error in X0 dimensions. X0 must be a column vector [DIM,1]");
end

[rowA, colsA] = size(A);
if rowA ~= DIM || colsA ~= DIM
    error("Error in A dimensions. A must be a square matrix size DIM");
end

if alpha <= 0 
    error("Error in alpha. Order must be greater than 0 to be a diff");
end

if DIM <= 0
    error("Error in DIM. Dimensions must be greater than 0");
end

if any(isnan(A), 'all') || any(isinf(A), 'all')
    error('The matrix A contains NaN or Inf values.');
end

if any(isnan(X0), 'all') || any(isinf(X0), 'all')
    error('The vector X0 contains NaN or Inf values.');
end
%% Initialization
k = T/dt;               % Samples in specified time frame
X = zeros(DIM,k);       % State space vector
X(:,1) = X0;            % Initial conditions
t = linspace(0, T, k);  % Time vector

%% Main loop / simulation
for i=2:k
    % a_v; memory coefficients vector for specified sample
    a_v = back_v(alpha, i);
    
    % extract required memory coefficients (excluding first element)
    mem_coeff = a_v(2:end);
    
    % last X samples acquisition (flip in column dimension)
    last_x = flip(X(:,1:i-1), 2);
    
    % memory sum (element-wise multiplication and sum along columns)
    mem_sum = sum(mem_coeff .* last_x, 2);
    
    % calculate n dimensional trajectory (check sign here)
    X(:,i) = A*X(:,i-1)*dt - mem_sum;
end

%% Result error handle
if any(isnan(X), 'all') || any(isinf(X), 'all')
    error('The matrix X contains NaN or Inf values.');
end
end

%% References
% [1]
% Paper:
% The Grünwald-Letnikov Formula and Its Equivalent Horner’s Form Accuracy 
% Comparison and Evaluation for Application to Fractional Order PID 
% Controllers

% Authors:
% Dariusz W. Brzeziński PHD Student
% prof. Piotr Ostalczyk

% Lodz, Poland
% year 2012

% [2]
% Book:
% Selected Problems of Fractional Systems Theory
% Authors:
% prof Tadeusz Kaczorek

% Berlin, Heidelberg
% year: 2011