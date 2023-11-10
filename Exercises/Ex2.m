close all;
lim = 10;
axs = axes('XLim', [0 lim], 'YLim', [0 lim] , 'ZLim', [0 lim] ); view(3); grid on;
xlabel('X'); ylabel('Y'); zlabel('Z');

translation = [0, 0, 5];
A0W = [eye(3,3), transpose(translation);
        0, 0, 0, 1;];

A10 = [RotX(pi/6)*RotY(pi/4), transpose([0,0,0]);
       0, 0, 0, 1];

A1W = A0W*A10;

hw = triad('Parent', axs, 'linewidth', 3);
hold on;
h1 = triad('Parent', hw, 'linewidth', 3);
set(h1, 'Matrix', A1W);

p = A1W*transpose([1, 0, 1, 1]);
plot3([0, p(1)], [0, p(2)], [0, p(3)])

O1 = [0, 0, 0, 1] * transpose(A1W);
plot3([O1(1), p(1)], [O1(2), p(2)], [O1(3), p(3)])