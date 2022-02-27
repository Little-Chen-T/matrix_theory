% give 2 points as known line, and input another point to judge the position relative the known line.

point1 = [10,20];
point2 = [30,50];

point3_x = input('input the x of new point:');
point3_y = input('input the y of new point:');

point3 = [point3_x, point3_y];

area = triArea(point1, point2, point3);

hold on;
plot([point1(1), point2(1)], [point1(2), point2(2)]);
plot([point1(1), point3(1)], [point1(2), point3(2)]);
plot(point3_x, point3_y,'r>');


if (area == 0)
    text(point3_x, point3_y, '共线');
elseif (area > 0)
    text(point3_x, point3_y, '左方');
else
    text(point3_x, point3_y, '右方');
end