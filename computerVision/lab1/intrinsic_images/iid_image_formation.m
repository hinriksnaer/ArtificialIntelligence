R = imread('ball_albedo.png');
S = imread('ball_shading.png');
I = imread('ball.png');

R = im2double(R);
S = im2double(S);
I = im2double(I);

subplot(2,2,1),imshow(R);
subplot(2,2,2),imshow(S);
subplot(2,2,3),imshow(I);
subplot(2,2,4),imshow(R.*S);
