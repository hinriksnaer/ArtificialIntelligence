R = imread('ball_albedo.png');
S = imread('ball_shading.png');
I = imread('ball.png');

%r = max(max(R(:,:,1)));
%g = max(max(R(:,:,2)));
%b = max(max(R(:,:,3)));

R(R == 141) = 255;
R(R ~= 255) = 0;

R = im2double(R);
S = im2double(S);
I = im2double(I);
RS = R.*S;

subplot(1,2,1),imshow(I);
subplot(1,2,2),imshow(RS);

%Split into RGB Channels
r = RS(:,:,1);
g = RS(:,:,2);
b = RS(:,:,3);
%Get histValues for each channel
[yRed, x] = imhist(r);
[yGreen, x] = imhist(g);
[yBlue, x] = imhist(b);
%Plot them together in one plot
plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');