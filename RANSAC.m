function [ ans] = RANSAC( f1, f2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
arrayM = OpenFile(f1);
arrayN = OpenFile(f2);

lenM  = length(arrayM);
lenN  = length(arrayN);
Pprime = arrayM;
size = lenM * lenN;
Cor = zeros(size,10);
pos = 1;

for i = 1:lenM
    for j = 1:lenN
        Px = arrayM(i,1);
        Py = arrayM(i,2);
        Po = arrayM(i,3);
        
        Qx = arrayN(j,1);
        Qy = arrayN(j,2);
        Qo = arrayN(j,3);
        
        changeX = Qx - Px;
        changeY = Qy - Py;
        changeT = Qo - Po;
        changeT = deg2rad(changeT);
        
        for k = 1:lenM
            % X Prime values
            Pprime(k,1) = (arrayM(k,1)-Px)*cos(changeT) +...
                (arrayM(k,2)-Py)*sin(changeT)+Px+changeX;
            Pprime(k,2) = -(arrayM(k,1)-Px)*sin(changeT) +...
                (arrayM(k,2)-Py)*cos(changeT)+Py+changeY;
        end
        
        % total count 
        count = 0;
       
        % Tables values
        Cor(pos,1) = Px;
        Cor(pos,2) = Py;
        Cor(pos,3) = Qx;
        Cor(pos,4) = Qy;
        Cor(pos,5) = changeX;
        Cor(pos,6) = changeY;
        Cor(pos,7) = changeT;
        sizeP = length(Pprime);
        for m =  1:lenN
            
            % Radius values
            tolerance = 11;
            % Only one in the small box
            onevalue = -1;
            distance = 0;
            index = 0;

            for n = 1:sizeP

                x1 = arrayN(m,1);
                x2 = Pprime(n,1);
                
                y1 = arrayN(m,2);
                y2 = Pprime(n,2);
                distance = sqrt((x2 - x1)^2 + (y2 - y1)^2);
                
                if distance < tolerance && onevalue ~= -1 && ...
                   distance < onevalue
                    
                   onevalue = distance;
                   index = n;
                elseif distance < tolerance
                    
                       onevalue = distance;
                       index = n;
                end  
            end
            
            
            
            Cor(pos,8) = distance;
            
            if onevalue ~= -1
                Pprime(index,:) = [];
                sizeP = sizeP - 1;
                count = count + 1;
            end
            
            
            Cor(pos,9) = count;
            Cor(pos,10) = (count^2)/size * 100;
        end
        pos = pos + 1;
        
    end
end
CorSort = sortrows(Cor,9);

delX = CorSort(size,5);
delY = CorSort(size,6);
delT = CorSort(size,7);
num = CorSort(size,9);



ans = {f1, f2, delX, delY, delT, num};

end

