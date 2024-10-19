% Otwórz plik do odczytu
fileID = fopen('tele.txt', 'r');
if fileID == -1
    error('Nie można otworzyć pliku');
end

% Inicjalizacja zmiennych do przechowywania danych
data = {};

% Odczyt każdej linii pliku
tline = fgetl(fileID);
while ischar(tline)
    data{end+1} = tline;  % Zapisuje linie do komórki
    tline = fgetl(fileID);
end

% Zamknięcie pliku
fclose(fileID);


telemet = {};


for i = 1:2:length(data)  
    telemet{end+1} = data{i};  
end




% Inicjalizacja zmiennych do przechowywania wartości
mid = [];
x = [];
y = [];
z = [];
pitch = [];
roll = [];
yaw = [];
vgx = [];
vgy = [];
vgz = [];
templ = [];
temph = [];
tof = [];
h = [];
bat = [];
baro = [];
time = [];
agx = [];
agy = [];
agz = [];


for i = 1:length(telemet)
    % Podziel linię na poszczególne pary klucz-wartość
    params = strsplit(telemet{i}, ';');
    
    % Przetwarzaj parę klucz-wartość
    for j = 1:length(params)
        % parę klucz-wartość
        kv = strsplit(params{j}, ':');
        if length(kv) == 2
            key = kv{1};   % klucz
            value = kv{2}; % wartość
            
            % Przypisywanie wartości do odpowiednich zmiennych
            switch key
                case 'mid'
                    mid(end+1) = str2double(value);
                case 'x'
                    x(end+1) = str2double(value);
                case 'y'
                    y(end+1) = str2double(value);
                case 'z'
                    z(end+1) = str2double(value);
                case 'pitch'
                    pitch(end+1) = str2double(value);
                case 'roll'
                    roll(end+1) = str2double(value);
                case 'yaw'
                    yaw(end+1) = str2double(value);
                case 'vgx'
                    vgx(end+1) = str2double(value);
                case 'vgy'
                    vgy(end+1) = str2double(value);
                case 'vgz'
                    vgz(end+1) = str2double(value);
                case 'templ'
                    templ(end+1) = str2double(value);
                case 'temph'
                    temph(end+1) = str2double(value);
                case 'tof'
                    tof(end+1) = str2double(value);
                case 'h'
                    h(end+1) = str2double(value);
                case 'bat'
                    bat(end+1) = str2double(value);
                case 'baro'
                    baro(end+1) = str2double(value);
                case 'time'
                    time(end+1) = str2double(value);
                case 'agx'
                    agx(end+1) = str2double(value);
                case 'agy'
                    agy(end+1) = str2double(value);
                case 'agz'
                    agz(end+1) = str2double(value);
            end
        end
    end
end
%%
% Tworzenie pierwszej osi Y
figure;
yyaxis left  % Użycie lewej osi Y
plot(templ, 'b-');  % Wykres dla 'templ' (lewa oś Y)
ylabel('Temperatura');  % Etykieta dla lewej osi Y
xlabel('Czas (sample)');  % Etykieta osi X

% Tworzenie drugiej osi Y
yyaxis right  % Użycie prawej osi Y
plot(baro, 'r-');  % Wykres dla 'baro' (prawa oś Y)
ylabel('ciśnienie barometryczne');  % Etykieta dla prawej osi Y

% Dodanie kolejnego wykresu na lewej osi Y
yyaxis left
hold on;
plot(temph, 'g-');  % Dodanie wykresu 'temph' (lewa oś Y)

legend('templ',  'temph', 'baro');  % Legenda dla wszystkich wykresów

grid on;