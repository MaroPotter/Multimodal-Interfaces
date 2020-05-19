 % a
a = 23;
b = 5;
c = round(a/b);
d = mod(a,b);

% b
v_row = [0 5 0 4 0];
v = v_row';

% c
a1 = 5;
b1 = 3;
R2 = a1.*randn(5,3) + b1;
mean1 = mean(R2, 'all');
std1 = std(R2, 1 ,'all');

% d
V2 = [R2 v];

% e
x = 0:(pi/10):2*pi;
y = sin(x);
%wykres
plot(x,y)

% f
mean(y)
% g
A = [1 2 3;
-1 1 4;
-1 -2 -3];
b2 = [5; 1; -5];
rank(A)
rank([A b2])
x1 = A\b2;
disp("Otrzymujemy niepoprawne wartoœæ, poniewa¿ macierzy A nie da sie odwróciæ")
inv(A)
disp("Dzieje siê tak poniewa¿ wyznacznik macierzy jest równy 0")
det(A)

% h
load('exampledata.mat');
%wyciagam skaladowe RGB
R = RGB(:,:,1);
G = RGB(:,:,2);
B = RGB(:,:,3);
%tworze z nich wektory wierszowe
Rw = R(:)';
Gw = G(:)';
Bw = B(:)';
%macierz A: wiersz to wektor wierszowy
A = [Rw;Gw;Bw];
%Macierz z treœci konwersji
Mkonwersji = [0.299 0.587 0.114;
-0.169 -0.331 0.5;
0.5 -0.419 -0.081];
%ze wzoru na konwersje RGB -> YCrCb
B = [0;128;128] + Mkonwersji*A;
%wyci¹gam odpowiednie sk³adowe (s¹ to jeszcze wektory wierszowe)
Y = B(1,:);
Cr = B(2,:);
Cb = B(3,:);
%przekszta³cam wekt.wierszowe na macierze o wymiarach jak obrazek
YNormal = reshape(Y,[650 600]);
CrNormal = reshape(Cr,[650 600]);
CbNormal = reshape(Cb,[650 600]);
%Skladam 3warstwy (3 skladowe YCrCb) na obrazek
YCrCb = zeros(650,600,3);
YCrCb(:,:,1) = YNormal;
YCrCb(:,:,2) = CrNormal;

YCrCb(:,:,3) = CbNormal;
%moja konwersja
figure(1);
imshow(uint8(YCrCb))
%konwersja biblioteczna
figure(2);
imshow(rgb2ycbcr(uint8(RGB)))
%roznica obrazow zeby pokazac roznice
figure(3)
imshow(rgb2ycbcr(uint8(RGB)-uint8(YCrCb)))

% i
a = pi;
b = ones(1,1,'uint8');
c = a + double(b);

% j
%tablica liter
litery = 'a':'g';
% randi(length(litery),1,10) --> zwraca wektor 1x10 liczb z zakresu
% 1 od length(litery)
losowaTablica = litery(randi(length(litery),1,10));
