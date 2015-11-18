function [ w ] = RidgePattern( x, y, theta )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

w = 128*cos(2*pi*0.1*(x*cos(theta) + y*sin(theta)));

end

