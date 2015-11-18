function [ theta ] = Orientation( SobelX, SobelY )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
numerator = 0;
denominator = 0;
square_x = SobelX.^2;
square_y = SobelY.^2;

for i=1:9
    for j=1:9
        numerator = numerator + ( 2*SobelX(i,j)*SobelY(i,j));
        denominator = denominator + (square_x(i,j)-square_y(i,j));
    end
end
theta = (1/2)*atan2(numerator,denominator);

end

