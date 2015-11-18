function [ Ori_Image ] = ImageOrientationPicture( Image )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Image = double(Image);
sobel_x_filter = [-1 0 1;-2 0 2;-1 0 1];
sobel_y_filter = fspecial('sobel');

sobel_x_img = imfilter(Image,sobel_x_filter);
sobel_y_img = imfilter(Image,sobel_y_filter);

size_img = size(Image);
row = size_img(1,1);
column = size_img(1,2);

row = row - 9;
column = column - 9;
orientation_array = zeros(size_img);

for i = 1:(row)
    for j = 1:(column)
        sobel_x_t = sobel_x_img(i:(i+8),j:(j+8));
        sobel_y_t = sobel_y_img(i:(i+8),j:(j+8));
        theta = Orientation(sobel_x_t,sobel_y_t);
        orientation_array(i+4,j+4) = theta;
    end
end

drawOrientation(Image,orientation_array);

end

