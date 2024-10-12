% Program realizing study of Grunwald-Letnikov discrete fractional order
% autonomous system

%% Clear
clear;clc;close all;

%% Links
addpath("data\");   addpath("functions\"); 
addpath("models\"); addpath("scripts\");

%% Load parameters
load("data\A1.mat"); load("data\X0.mat");

alpha = 1;
alpha2 = 0.9;
A = [-0.1,-1;2,-0.1];
DIM = 2;
T = 15;
dt = 0.001; % simulink model at 0.0001
X0 = [1;1];
X01 = [0.7444;0.7513];
X02 = [-0.1266;0.2104];
%% GL simulation
[X,   t] = GL(T,dt,X0,alpha,A,DIM);
[X2, t2] = GL(T,dt,X0,alpha2,A,DIM);
[X3, t3] = GL(T,dt,X01,alpha2,A,DIM);
[X4, t4] = GL(T,dt,X02,alpha2,A,DIM);
% [X3, t3] = GLone(T,dt,X0,alpha3,A);
%% Caputo Simulation
frac = sim("models\frac_cap");
%% Riccati integer order
Q = [1,0;0,1];
P = lyap(A,Q);
%% Quadratic energy eq calculations for contour plot
[x1, x2] = meshgrid(-2:0.01:2, -2:0.01:2); 
E = energy_contour(x1,x2,P);
%% Energy value calculation
E_GL_X0_1 = E_val(flip(X),P);
E_GL_X0 = E_val(flip(X2),P);
E_GL_X1 = E_val(flip(X3),P);
E_GL_X2 = E_val(flip(X4),P);
%% Plot trajectories
figure(1);
plot(X(2,:),X(1,:),LineWidth=1.5);hold on;
plot(X2(2,:),X2(1,:),LineWidth=1.5);
plot(X3(2,:),X3(1,:),LineWidth=1.5);
plot(X4(2,:),X4(1,:),LineWidth=1.5);
% comparison with caputo integer order
plot(frac.frac.signals.values(:,2),frac.frac.signals.values(:,1),...
     LineWidth=1.5,LineStyle="--",Color="y");
% contour energy function
contour(x1, x2, E, 5,LineWidth=0.5,ShowText="on",LabelFormat="%0.1f");
axis equal;
grid on;
%% Energy plot
figure(2);
plot(t, E_GL_X0_1,LineWidth=1.5); hold on;
plot(t2,E_GL_X0,LineWidth=1.5);
plot(t3,E_GL_X1,LineWidth=1.5);
plot(t4,E_GL_X2,LineWidth=1.5);
grid on;



