A = [3, 3, 3];
Theta = [pi/3, pi/2, pi/4];

pe1 = ForwardKinematics(Theta, A);

waitforbuttonpress;

[th1, th2, th3] = anthropomorphicInverse(pe, A);
pe2 = ForwardKinematics([th1(1), th2(1), th3(1)], A);

disp(pe1);
disp(pe2);