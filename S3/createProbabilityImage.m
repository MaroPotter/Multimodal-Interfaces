%%
ramka_do_wczytania = 0.2;
vidObj = VideoReader('video_material.avi'); % nie dawaj œrednika i odczytaj z command
 % window FPS pliku
vidObj.CurrentTime = ramka_do_wczytania;    % <odczytane_fps>;
RGB = readFrame(vidObj);
%%
figure;
imshow(RGB);
title('Selected frame');

BW = roipoly;
model_skory = createSkinModel2(RGB,BW);
save dane_modelu model_skory BW RGB % zapis do plik MAT utworzonego modelu
figure;
imagesc(model_skory) % wizualizacja modelu (do sprawozdania)
