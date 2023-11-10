close all;
lim = 5;
axs = axes('XLim', [-lim lim], 'YLim', [-lim lim] , 'ZLim', [-lim lim] ); view(3); grid on;
xlabel('X'); ylabel('Y'); zlabel('Z');
hw = triad('Parent', axs, 'linewidth', 3);
hold on;

plot3([1, 1], [1, -1], [0, 0], 'Parent', hw, 'Color', [0,0,0]);
plot3([1, -1], [-1, -1], [0, 0], 'Parent', hw, 'Color', [0,0,0]);
plot3([-1, -1], [-1, 1], [0, 0], 'Parent', hw, 'Color', [0,0,0]);
plot3([-1, 1], [1, 1], [0, 0], 'Parent', hw, 'Color', [0,0,0]);