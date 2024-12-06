clc;clear;close all;

t2 = load("traj_2.mat");

X2 = t2.data{1}.Values.Data;
Y2 = t2.data{2}.Values.Data;
Z2 = t2.data{3}.Values.Data*(-1);

t3 = load("traj_3.mat");

X3 = t3.data{1}.Values.Data;
Y3 = t3.data{2}.Values.Data;
Z3 = t3.data{3}.Values.Data*(-1);

t4 = load("traj_4.mat");

X4 = t4.data{1}.Values.Data;
Y4 = t4.data{2}.Values.Data;
Z4 = t4.data{3}.Values.Data*(-1);

t5 = load("traj_5.mat");

X5 = t5.data{1}.Values.Data;
Y5 = t5.data{2}.Values.Data;
Z5 = t5.data{3}.Values.Data*(-1);
figure(1);
plot3(X2,Y2,Z2); hold on;
plot3(X3,Y3,Z3);
plot3(X4,Y4,Z4);
plot3(X5,Y5,Z5);
grid on;

%% Paraboloid function
x = [1.65, 2.94, 4.07, 5.36];
y = [1.73, 3.04, 4.09, 5.32];

t = [2, 3, 4, 5];

for i=1:length(x)
    s(i) = sqrt(x(i)^2+y(i)^2);
end
figure(2)
plot(t,s);
grid on;
