clc; 
run startup_rvc.m;
sim("simulink\sl_quadrotor.slx");
%%
t = X.time;

x = X.signals.values(:,1);
sx = X.signals.values(:,2);

y = Y.signals.values(:,1);
sy = Y.signals.values(:,2);

z = Z.signals.values(:,1);
sz = Z.signals.values(:,2);

pitch = Pitch.signals.values(:,1);
spitch = Pitch.signals.values(:,2);

roll = Roll.signals.values(:,1);
sroll = Roll.signals.values(:,2);

yaw = Yaw.signals.values(:,1);
syaw = Yaw.signals.values(:,2);

%% Figures
figure(1)
subplot(3,1,1);
plot(t,x);hold on;
plot(t,sx);hold off;
grid on;
subplot(3,1,2)
plot(t,y); hold on;
plot(t,sy);hold off;
grid on;
subplot(3,1,3)
plot(t,z); hold on;
plot(t,sz);hold off;

grid on;