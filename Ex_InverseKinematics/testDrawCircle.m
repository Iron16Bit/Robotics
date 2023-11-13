clear all;

A = [3,3,3];
Samples=100;

%Generates #Samples values evenly spaces from 0 to 2*pi
T = linspace(0,2*pi,Samples);

Th.th1 = [];
Th.th2 = [];
Th.th3 = [];

for t = T
    x = [2*cos(t), 2*sin(t), 0];
    [th1, th2, th3] = anthropomorphicInverse(x, A);
    Th.th1 = [Th.th1, th1(3)];
    Th.th2 = [Th.th2, th2(3)];
    Th.th3 = [Th.th3, th3(3)];
end

lim = 10;
pe = anthropomorphicTrans(Th, A);
pe(3,:) = pe(3,:)+A(1);
view(3);
grid on;

for i = 1:Samples-1
    plot3([pe(1,i), pe(1, i+1)], [pe(2,i), pe(2, i+1)], ...
          [pe(3,i), pe(3,i+1)]);
end