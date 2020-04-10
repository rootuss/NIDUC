% Jest to g³ówny skrypt programu

% Wczytanie danych od uzytkownika:
numberOfBits = input("Podaj ilosc przesylanych bitow: ");
% Wygenerowanie wektora z podana liczba bitow
table_gen = generator(numberOfBits);

% Zakodowanie przez koder, ktory potraja kazdy bit
tableTriple = coderTriple(table_gen);

% Przeslanie bitow przez kanal, ktory losowo generuje zaklocenia
tableDisturbance = kanal(tableTriple);

% Dekoder odszyfrowuje nadany ciag bitow
tableDecode = decoderTriple(tableDisturbance);
