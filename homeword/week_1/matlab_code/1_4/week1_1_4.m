clear;clc;

% line1
p1 = [10,20];
p2 = [-20,50];
% line2
p3 = [5,40];
p4 = [20,23];

area1 = triArea(p1,p2,p3);
area2 = triArea(p1,p2,p4);

hold on;
plot([p1(1),p2(1)],[p1(2),p2(2)],'r');
plot([p3(1),p4(1)],[p3(2),p4(2)],'y');


if ((area1>0 && area2>0) || (area1<0 && area2<0))
    
    text(p1(1),p1(2), 'No cross point!');
else
    
    %solve two lines' equation a*x + b = y
    A_eq1 = [p1(1),1;p2(1),1];
    B_eq1 = [p1(2);p2(2)];
    eq1 = A_eq1\B_eq1;

    A_eq2 = [p3(1),1;p4(1),1];
    B_eq2 = [p3(2);p4(2)];
    eq2 = A_eq2\B_eq2;
    
    A = [eq1(1),-1;eq2(1),-1];
    B = [-eq1(2);-eq2(2)];
    
    cross_point = A\B;
    
    % check whether the cross_point both on two lines
    len_in_p12 = sqrt(((cross_point(1)-p1(1))^2) + ((cross_point(2)-p1(2))^2))...
        + sqrt(((cross_point(1)-p2(1))^2) + ((cross_point(2)-p2(2))^2));
    
    len_in_p34 = sqrt(((cross_point(1)-p3(1))^2) + ((cross_point(2)-p3(2))^2))...
        + sqrt(((cross_point(1)-p4(1))^2) + ((cross_point(2)-p4(2))^2));
    
    len_p12 = sqrt(((p2(1)-p1(1))^2) + ((p2(2)-p1(2))^2));
    len_p34 = sqrt(((p4(1)-p3(1))^2) + ((p4(2)-p3(2))^2));
    
    % for double can't compare directly
    eps = 1e-10;
    
    if (abs(len_p12-len_in_p12)<eps && abs(len_p34-len_in_p34)<eps)
        plot(cross_point(1), cross_point(2), 'r>');
    
        text(cross_point(1)+0.5, cross_point(2)+0.5, [string(cross_point(1)),string(cross_point(2))]);
    else
        text(p1(1),p1(2), 'No cross point!');
    end
end