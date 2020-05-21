% Jest to g��wny skrypt programu
 
% Wczytanie danych od uzytkownika:
%numberOfBits = input("Podaj ilosc przesylanych bitow (26): ");
numberOfBits=65519;
fprintf('\nPrzeslano %d bitow!\n\n', numberOfBits); 

% Wygenerowanie wektora z podana liczba bitow
table_gen = generator(numberOfBits);
    %disp(table_gen)
   
%----------cz�� Triple----------
% Zakodowanie przez koder, ktory potraja kazdy bit
tableTriple = coderTriple(table_gen);
 
% Przeslanie bitow przez kanal, ktory losowo generuje zaklocenia
tableDisturbance = kanal(tableTriple);
 
% Dekoder odszyfrowuje nadany ciag bitow
tableDecode = decoderTriple(tableDisturbance);
 
 
%----------cz�� BCH----------
m = 16; %z prezentacji
n = 2^m - 1;
k = numberOfBits;
%odczytane z tableki z prezentacji z NIDUC 1 (dla 26 element�w m to 5)
% link do tabelki: https://zapodaj.net/images/5baeb08e71014.png
 
%przeslanie przez koder BCH
tableBCH =  bchenc(gf(table_gen), n, k);
 
% Przeslanie bitow przez kanal, ktory losowo generuje zaklocenia
tableDisturbanceBCH = kanal(tableBCH.x);
 
% Dekoder odszyfrowuje ciag bitow
[tableDecodeBCH] = bchdec(gf(tableDisturbanceBCH), n, k);
 
 
 
%-------SEKCJA Z PODSUMOWANIEM WYNIK�W-------
%nadpisanie poprzedniego pliku nowym i pustym
fid=fopen('WYNIKI.txt','wt');
fclose(fid);
 
%wyliczenie niewiadomych
errors = errorCount(table_gen,tableDecode);
BER_Triple = (errors/numberOfBits)*100;
overflow_Triple = abs(length(tableTriple)-length(table_gen))/length(table_gen);
 
%zapis wynik�w do pliku WYNIKI.txt
fileID = fopen('WYNIKI.txt', 'at');
fprintf(fileID, '\n');
fprintf(fileID, '----ZBIORCZE WYNIKI----');
fprintf(fileID, '\n\n');
fprintf(fileID, '\n--Potrajanie--');
fprintf(fileID, '\nPrzesano bit�w: %d', numberOfBits);
fprintf(fileID, '\nIlo�� b��dnie przes�anych bit�w: %d', errors);
fprintf(fileID, '\nBER wynosi: %0.4f%%', BER_Triple);
fprintf(fileID, '\nNadmiar kodowy wynosi: %.2f', overflow_Triple);

 
errorsBCH = errorCount(table_gen,tableDecodeBCH.x);
BER_BCH = (errorsBCH/numberOfBits)*100;
overflow_BCH = abs(length(tableBCH.x)-length(table_gen))/length(table_gen);
fprintf(fileID, '\n\n--BCH--');
fprintf(fileID, '\nPrzesano bit�w: %d', numberOfBits);
fprintf(fileID, '\nIlo�� b��dnie przes�anych bit�w: %d', errorsBCH);
fprintf(fileID, '\nBER wynosi: %0.4f%%', BER_BCH);
fprintf(fileID, '\nNadmiar kodowy wynosi: %0.10f', overflow_BCH);
%fprintf('Nadmiar kodowy: %0.10f\n', overflow_BCH);
