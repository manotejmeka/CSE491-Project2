clear;
close all;
clc;

% Question 1 Orientation Filed

% imageArray = {'user001_1.gif';'user002_1.gif';'user003_1.gif';'user004_1.gif';... 
%    'user005_1.gif';'user006_1.gif';'user007_1.gif';'user008_1.gif';...
%    'user009_1.gif';'user010_1.gif'};
% sizeArray = size(imageArray);
% sizeArray = sizeArray(1,1);
% 
% for i= 1:sizeArray
%     Image = imread(char(imageArray(i)));
%     ImageOrientationPicture(Image);
% end

% RANSAC Algorithm

% minutiaArray = {'user001_1.minpoints','user001_2.minpoints','user002_1.minpoints',...
%     'user002_2.minpoints','user003_1.minpoints','user003_2.minpoints','user004_1.minpoints',...
%     'user004_2.minpoints','user005_1.minpoints','user005_2.minpoints'};
% 
% lenMin = size(minutiaArray);
% lenMin = lenMin(1,2);
% 
% valueTable = {'File 1', 'File 2', 'Delta X', 'Delta Y', 'Theta', 'Total'};
% 
% for i = 1:lenMin
%     for j = i+1: lenMin
%         file1 = char(minutiaArray(1,i));
%         file2 = char(minutiaArray(1,j));
%         values = RANSAC(file1,file2);
%         valueTable = [valueTable;values];
%         %fprintf('i: %d, j: %d\n',i,j);
%     end
%     j = j + 1;
% end
% disp('The Results are: \n');
% disp(valueTable);

% Ridge pattern
angles = [0, 45, 90, 135];
lenAng = length(angles);
for z = 1:lenAng
    Ridge = zeros(300,300);
    for x = 1:300
        for y = 1:300
           Ridge(x,y) = RidgePattern(x,y,angles(z)); 
        end
    end
    figure;
    imshow(Ridge,[]);
    figure;
    fft_imgh = fft2(Ridge);
    imshow(fftshift(log(abs(fft_imgh) + 1)), []);
end

