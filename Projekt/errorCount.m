% funkcja zwraca ilosc bledow porownujac tabele z danymi wylosowanymi do
% tabeli z bitami zdekodowanymi
function errorQuantity = errorCount(table_gen,tableDecode)

errorQuantity=0;

% Petla sprawdza ile bitow zostalo blednie przeslanych
for i = 1:length(table_gen)
    if table_gen(i) ~= tableDecode(i)
        errorQuantity = errorQuantity + 1;
    end
end
end