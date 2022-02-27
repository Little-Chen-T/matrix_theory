function area = triArea(point1, point2, point3)
%triArea - Description
% input three points, to calculate the triangle surrounded by those points

% Syntax: area = triArea(point1, point2, point3)

A = [1,point1; 
1,point2;
1,point3 ];

area = det(A);
    
end