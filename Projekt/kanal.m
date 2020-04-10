% Funkcja kana³ wprowadza zak³ócenia do transmisji
function tableDisturbance = kanal(table)

% Prawdopodobienstwo wystapienia bledu
BSCprobability = 0.4;

% Tablica zawiera zaklocona transmisje
tableDisturbance = zeros(1, length(table));

% Petla generuje losowe zaklocenia
for i = 1:length(table)
    if rand() < BSCprobability
        tableDisturbance(i) = ~table(i);
    else
        tableDisturbance(i) = table(i);
    end
end
end

