clear;clc;

point1 = [10,20];
point2 = [30,50];

center = point1/2 + point2/2;
r = sqrt((center(1)-point1(1))^2 + (center(2)-point1(2))^2);

theta = abs(atan((point2(2)-point1(2))/(point2(1)-point1(1))));

% 左半圆
theta_add = linspace(0,pi) + theta; 

x = r*cos(theta_add) + center(1);
y = r*sin(theta_add) + center(2);

hold on;
plot(x, y, 'r');

% 右半圆
theta_add = linspace(pi,2*pi) + theta; 

x = r*cos(theta_add) + center(1);
y = r*sin(theta_add) + center(2);

hold on;
plot(x, y, 'y');

plot([point1(1), point2(1)], [point1(2), point2(2)], 'black');
