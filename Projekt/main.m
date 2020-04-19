% Jest to g³ówny skrypt programu
 
% Wczytanie danych od uzytkownika:
%numberOfBits = input("Podaj ilosc przesylanych bitow (26): ");
numberOfBits=26;
fprintf('\nPrzeslano %d bitow!\n\n', numberOfBits); 

% Wygenerowanie wektora z podana liczba bitow
table_gen = generator(numberOfBits);
    %disp(table_gen)
   
%----------czêœæ Triple----------
% Zakodowanie przez koder, ktory potraja kazdy bit
tableTriple = coderTriple(table_gen);
 
% Przeslanie bitow przez kanal, ktory losowo generuje zaklocenia
tableDisturbance = kanal(tableTriple);
 
% Dekoder odszyfrowuje nadany ciag bitow
tableDecode = decoderTriple(tableDisturbance);
 
 
%----------czêœæ BCH----------
m = 5; %z prezentacji
n = 2^m - 1;
k = numberOfBits;
%odczytane z tableki z prezentacji z NIDUC 1 (dla 26 elementów m to 5)
% link do tabelki: https://zapodaj.net/images/5baeb08e71014.png
 
%przeslanie przez koder BCH
tableBCH =  bchenc(gf(table_gen), n, k);
 
% Przeslanie bitow przez kanal, ktory losowo generuje zaklocenia
tableDisturbanceBCH = kanal(tableBCH.x);
 
% Dekoder odszyfrowuje ciag bitow
[tableDecodeBCH] = bchdec(gf(tableDisturbanceBCH), n, k);
 
 
 
%-------SEKCJA Z PODSUMOWANIEM WYNIKÓW-------
%nadpisanie poprzedniego pliku nowym i pustym
fid=fopen('WYNIKI.txt','wt');
fclose(fid);
 
%wyliczenie niewiadomych
errors = errorCount(table_gen,tableDecode);
BER_Triple = (errors/numberOfBits)*100;
 
%zapis wyników do pliku WYNIKI.txt
fileID = fopen('WYNIKI.txt', 'at');
fprintf(fileID, '\n');
fprintf(fileID, '----ZBIORCZE WYNIKI----');
fprintf(fileID, '\n\n');
fprintf(fileID, '\n--Potrajanie--');
fprintf(fileID, '\nPrzesano bitów: %d', numberOfBits);
fprintf(fileID, '\nIloœæ b³êdnie przes³anych bitów: %d', errors);
fprintf(fileID, '\nBER wynosi: %0.4f%%', BER_Triple);
 
errorsBCH = errorCount(table_gen,tableDecodeBCH.x);
BER_BCH = (errorsBCH/numberOfBits)*100;
fprintf(fileID, '\n\n--BCH--');
fprintf(fileID, '\nPrzesano bitów: %d', numberOfBits);
fprintf(fileID, '\nIloœæ b³êdnie przes³anych bitów: %d', errorsBCH);
fprintf(fileID, '\nBER wynosi: %0.4f%%', BER_BCH);