close all;
view(3); %3 = use default line of sight for the graph

daspect([1 1 1]); %scale of the axis, it's the sam ein this case

plot3([0, 1], [0, 0], [0, 0], 'Color', [1, 0, 0]);
%As if we were seeing points as vector, which starts in 0,0,0 and points
%to 1,0,0

hold on %what we plot after won't wipe away what's already present in the graph
plot3([0, 0], [0, 1], [0, 0], 'Color', [0, 1, 0]);
plot3([0, 0], [0, 0], [0, 1], 'Color', [0, 0, 1]);

v1 = zRot(pi/4) * [1;0;0];
v2 = zRot(pi/4) * [0;1;0];
v3 = zRot(pi/4) * [0;0;1];
%We rotate all the points by pi/4

plot3([0, v1(1)], [0, v1(2)], [0, v1(3)], 'Color', [1, 0, 0]);
plot3([0, v2(1)], [0, v2(2)], [0, v2(3)], 'Color', [0, 1, 0]);
plot3([0, v3(1)], [0, v3(2)], [0, v3(3)], 'Color', [0, 0, 1]);
%We print the rotated point