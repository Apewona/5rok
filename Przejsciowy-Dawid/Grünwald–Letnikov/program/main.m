% Program realizing study of Grunwald-Letnikov discrete fractional order
% autonomous system

%% Clear
clear;clc;close all;

%% Links
addpath("data\");   addpath("functions\"); 
addpath("models\"); addpath("scripts\");

%% Load parameters
load("data\A1.mat"); load("data\alpha.mat"); load("data\X0.mat");
DIM = 1;
%% Define time parameters
T_max = 10;  % Max time (in seconds)
h = 1;    % Time step
t = 0:h:T_max;  % Time vector
k = length(t);  % Number of time steps

%% System parameter and initial condition
A = -1.2;       % Constant system parameter
X = zeros(1,k);  % State vector for the one-dimensional system
X(1) = 1;     % Initial condition

%% Main loop with time
for i = 2:k  % Start from second time step
    sigma = 0;  % Reset sigma for each time step
    
    for j = 1:i-1
        % Compute backdiff with respect to time steps
        sigma = sigma + (-1)^(j+1) * backdiff(alpha,j) * X(i-j);
    end
    
    % Update state using time step h and the constant A 
    X(i) = X(i-1) * h^(alpha) + h^(alpha) * (A * X(i-1) + sigma);
    disp(i)
end
%% Caputo Simulation
frac = sim("models\frac_cap");
%% Plotting
plot(t, X);
hold on;
plot(frac.tout,frac.frac.signals.values);
xlabel('Time (s)');
ylabel('State X');


