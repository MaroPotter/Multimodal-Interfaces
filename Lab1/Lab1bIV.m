%% Preparation 
close all;
clc;
clear;

%% a)
R = randn(3);
whos R;
A = uint32(100);
whos A;
B = uint32(uint32(R)*A);
whos B;

% rezultaty mno¿enia nie s¹ poprawne
% double - 8b, uint32 - 4b

%% b)
str0 = 'æwiczenie 2';
str2 = 'laboratorium 1';
str3 = strvcat(str0,str2);

%% c)
str1 = 'Krasnoludy przesz³y przez rzekê w bród, nie zamoczywszy swych bród i do tego zmywszy ze swych nóg brud';
expr = 'b[^u]*?d';
% I used a ? to make *lazy
startIndex = regexp(str1, expr);

%% d)
cell = {123 'abcd'; randn(3) 0.1};
table3x3 = cell{2,1} + 100;
cell{2,1} = table3x3;

%% e)
f1 = @(x) x.^2 - 2*x + 4;
definiteIntegral = quad(f1, -2, 2);
fplot(f1, [-2 2]);

%% f)
Matematyka = randi([1 100], [5 1]);
Fizyka = randi([1 100], [5 1]);
Chemia = randi([1 100], [5 1]);
tab = table(Matematyka, Fizyka, Chemia);
tab.Properties.RowNames = {'Rafa³', 'Monika', 'Pawe³', 'El¿bieta', 'Mirek'};
writetable(tab,'tabela.csv', 'WriteRowNames', true);







