% Jest to g��wny skrypt programu

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


%-------SEKCJA Z PODSUMOWANIEM wynik�w-------
%nadpisanie poprzedniego pliku nowym i pustym
fid=fopen('WYNIKI.txt','wt');
fclose(fid);

%wyliczenie niewiadomych
errors = errorCount(table_gen,tableDecode);
BER = (errors/numberOfBits)*100;

%zapis wynik�w do pliku WYNIKI.txt
fileID = fopen('WYNIKI.txt', 'at');
fprintf(fileID, '\n');
fprintf(fileID, '\nPrzesano bit�w: %d', numberOfBits);
fprintf(fileID, '\nIlo�� b��dnie przes�anych bit�w: %d', errors);
fprintf(fileID, '\nBER wynosi: %0.4f%%', BER); 



