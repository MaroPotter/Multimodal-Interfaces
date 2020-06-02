% loading a frame from the recording and detecting faces 
frame_to_load = 30;
vidObj = VideoReader('record4.avi');
vidObj.CurrentTime = frame_to_load /1000;
RGB = readFrame(vidObj);
detector = vision.CascadeObjectDetector();
bboxes = detector(RGB);
number_of_detected_faces = size(bboxes,1)

% detecting corners using minimum eigenvalue algorithm
doc detectMinEigenFeatures
GRAY=rgb2gray(RGB);
corners = detectMinEigenFeatures(GRAY);
corners;
figure;
imshow(RGB);
title('RGB');
hold on;
plot(corners.selectStrongest(50));

% visualisation of face and features detection
corners2 = detectMinEigenFeatures(GRAY, 'ROI', bboxes(1, :));
xyPoints = corners2.Location;
bboxPoints = bbox2points(bboxes(1, :));
bboxPolygon = reshape(bboxPoints', 1, []);
RGB2 = insertShape(RGB, 'Polygon', bboxPolygon, 'LineWidth', 3);
RGB2 = insertMarker(RGB2, xyPoints, '+', 'Color', 'white');
figure;
imshow(RGB2);
title('RGB2');


