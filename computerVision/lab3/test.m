img = imread('pingpong/0000.jpeg');

for i = 1:1:104
    if i<10
        harris_corner_detector(imread(append('pingpong/000',int2str(i),'.jpeg')), 0.15, true);
    else
        harris_corner_detector(imread(append('pingpong/00',int2str(i),'.jpeg')), 0.15, true);
    end
end