function tableDecode = decoderTriple(table)

% Obliczenie ilosci bitow zdekodowanych
sizeDecode = length(table)/3;
% Pomocniczny index
index = 1;

% Utworzenie tablicy o podanym rozmiarze w celu unikniecia
% kazdorazowej relokacji pamieci
tableDecode = zeros(1, sizeDecode);

% Petla zlicza ilosc wystapienia zer i jedynek w trojce odebranych
% bitow i na tej podstawie wyznacza wartoœæ odebranego bitu
for i = 1:3:length(table)
    numberOfZeros = 0;
    numberOfOnes = 0;
    
    for j = [0 1 2]
        if table(i+j) == 0
            numberOfZeros = numberOfZeros + 1;
        else
            numberOfOnes = numberOfOnes + 1;
        end
    end
    
    if numberOfZeros > numberOfOnes
      tableDecode(index) = 0;
    else
       tableDecode(index) = 1;
    end
    
    index = index + 1;
end

end

