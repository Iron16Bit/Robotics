close all;
clear all;

view(3);
daspect([1 1 1]);

p = [1, 1, 0];
plot3([0,p(1)], [0, p(2)], [0, p(3)], 'Color', [100/255, 80/255, 200/255]);
hold on;

pprime = RotZ(pi/6)*RotY(pi/3)*transpose(p);
plot3([0, pprime(1)], [0, pprime(2)], [0, pprime(3)], 'Color', [0, 200/255, 50/255]);