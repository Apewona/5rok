clc; close all;
% wartości zadane
sx = dataop.signals.values(:,1);
sy = dataop.signals.values(:,2);
sz = dataop.signals.values(:,3);

syaw = dataop.signals.values(:,4);
spitch = dataop.signals.values(:,5);
soll = dataop.signals.values(:,6);

time = dataop.time;

% wartości mirzone

% Wykresy dla porównania wieljkości xyz

plot()