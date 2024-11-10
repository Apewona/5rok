% Badanie jąder sieci neuronowych

cost = [1,10,20,30,40,50,60,70,80,90,100];

% jądro liniowe
lin = [6.9067, 6.7597, 6.752, 6.7397, 6.8087, 6.8087, 6.7842, 6.8087, ...
       6.7842, 6.7597, 6.7597];

% jądro wielomianowe stopnia 2
pol2 = [6.14, 5.93, 5.90, 5.86, 5.83, 5.90, 5.85, 5.89, 5.93, 5.93, 5.97];

% jądro wielomianowe stopnia 3
pol3 = [5.19, 4.80, 4.80, 4.75, 4.58, 4.56, 4.43, 4.41, 4.43, 4.39, 4.26];

%radialne jądro bazowe
rad = [4.70, 2.80, 2.40, 2.11, 1.98, 1.83, 1.76, 1.68, 1.47, 1.45, 1.37];
figure(1)
scatter(cost,lin,Marker="x"); hold on;
scatter(cost,pol2,Marker="x");
scatter(cost,pol3,Marker="x");
scatter(cost,rad,Marker="x");
grid on;
xlabel("cost");
ylabel("E")
legend("linear","poly deg 2", "poly deg3", "radial");
%% badanie stopnia jądra wielomianowego

deg = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
kerdeg = [6.91, 6.15, 5.20, 4.10, 2.93, 2.11, 2.67, 2.77, 3.19, 1.74];

figure(2)
scatter(deg,kerdeg,Marker="x");
xlabel("degree");
ylabel("E");
grid on;
%% Badanie normalizacji

Tr = [6.83, 6.54, 6.49, 6.26, 6.26 6.26 6.17, 6.17, 6.14, 6.14, 6.14];
Fl = [4.70, 2.80, 2.40, 2.11, 1.98, 1.83, 1.76, 1.68, 1.47, 1.45, 1.37];

figure(3);
scatter(cost,Tr, Marker="x"); hold on;
scatter(cost,Fl, Marker="x");
xlabel("cost")
ylabel("E")
grid on;
legend("True","False")
