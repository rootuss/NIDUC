function table = coderTriple(table_gen)

% Obliczenie rozmiaru zakodowanej tablicy
sizeOfTable = 3*length(table_gen);
% Utworzenie tablicy o podanym rozmiarze w celu unikniecia
% kazdorazowej relokacji pamieci
table = zeros(1,sizeOfTable);
helpIndex = 1;

% petla potraja kazdy bit
for i = 1:length(table_gen)
   for j =1:3
       table(helpIndex) = table_gen(i);
       helpIndex = helpIndex + 1;
   end
end
end

