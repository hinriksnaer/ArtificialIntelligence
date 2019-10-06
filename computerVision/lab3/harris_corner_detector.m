function [H, c, r] = harris_corner_detector(image, threshold, plt)

windowsize = 5;
r = [];
c = [];
im = image;
image = rgb2gray(image);
image = im2double(image);

[Ix, Iy] = imgradientxy(image);

Ix_n = (Ix - min(Ix(:))) / (max(Ix(:)) - min(Ix(:)));
Iy_n = (Iy - min(Iy(:))) / (max(Iy(:)) - min(Iy(:)));

A = imgaussfilt(Ix.^2, 0.5);
B = imgaussfilt(Ix.*Iy, 0.5);
C = imgaussfilt(Iy.^2, 0.5);

H = (A.*C - B.^2) - 0.04*(A + C).^2;

[height, width] = size(H);

for i = 1+windowsize:1:height-windowsize
    for j = 1+windowsize:1: width - windowsize
        if H(i, j) > threshold
            window = H(i-windowsize:i+windowsize, j-windowsize:j+windowsize);
            if H(i, j) == max(window(:))
                r = [r, i];
                c = [c, j];
            end  
        end
    end
end
if plt
    %{
    figure;
    imshow(Ix_n);

    figure;
    imshow(Iy_n);

    pause(0.3)
    %}
    figure;
    imshow(im);
    axis on
    hold on;
    % Plot cross at row 100, column 50
    plot(c,r, 'r+', 'MarkerSize', 10, 'LineWidth', 2);

    disp(size(c));
end


end

