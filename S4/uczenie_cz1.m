%% Uczenie maszynowe, rozwiazanie
% - utworzony: 27.09.2018, R2017b-R2018b, J.Przyby³o, AGH
%
clear all;close all;clc

%% (1) Dostêp do danych i przetwarzanie wstêpne
%      - import danych
%      - przetwarzanie wstêpne : okno czasowe Hamminga, filtr preemfazy
%  (2) Ekstrakcja cech
%      - estymacja formantów LPC
%
folderName = 'audioFiles/';  % UZUPELNIJ KOD - podkatalog z plikami audio 

fds = fileDatastore(folderName,'ReadFcn',@load_audio,'FileExtensions','.wav');
N = 5; % liczba formantów brana pod uwagê
formants=zeros(length(fds.Files),N);
vowelClass=cell(length(fds.Files),1);
sampleName=cell(length(fds.Files),1);
i = 1;
warning off
while hasdata(fds)
    audioD = read(fds);
    tmp = estimate_formants(audioD.s, audioD.Fs);
    formants(i,:) = tmp(1:N);
    vowelClass{i}=audioD.vowelName;
    [~,sampleName{i},~]=fileparts(fds.Files{i});
    i = i + 1;
end
warning on
% Przygotowanie tablicy danych
formantsTable = table(vowelClass, formants,'RowNames',sampleName);
disp(formantsTable)

%% Liczebnoœæ elementów dla danej klasy
uWovels = unique(vowelClass);           % unikalne nazwy samog³osek
nrOfVowels = length(uWovels);           % liczba samog³osek
nrOfexamples = zeros(nrOfVowels,1);     % rezultat: liczba elementów danej klasy
for i=1:nrOfVowels
    select1 = strcmp(vowelClass,uWovels(i));       % wybór elementów (okreœlona samog³oska), wektor logiczny
    % UZUPELNIJ KOD PONIZEJ
    nrOfexamples(i) = sum(select1);
end
table_nrOfexamples = table(uWovels, nrOfexamples);
disp(table_nrOfexamples)

%% Podzia³ na zbiór ucz¹cy (70%) i testowy (30%)
zbiorUczacyP = 0.7;% UZUPELNIJ KOD tak aby podzieliæ zbiór 70/30%
trainingDataId=[];testDataId=[];
for i=1:nrOfVowels
    idx1 = find(strcmp(vowelClass,uWovels(i)));         % indeksy elementów (okreœlona samog³oska), wektor
    idx2 = floor(zbiorUczacyP*length(idx1));                     % podzia³
    trainingDataId = [trainingDataId idx1(1:idx2)];     % indeksy zb. ucz¹cego okreœlonej samog³oski
    testDataId = [testDataId idx1(idx2+1:end)];         % indeksy zb. testowego okreœlonej samog³oski
end
% zbiór ucz¹cy i zbiór testowy
formantsTableTraining = formantsTable(trainingDataId,:);
formantsTableTest = formantsTable(testDataId,:);
% zapis do pliku MAT
save trainingData formantsTableTraining formantsTableTest
