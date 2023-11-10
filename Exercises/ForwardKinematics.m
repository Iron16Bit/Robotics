%Returns the position of the end effector of an antropomorphic arm
%and draws it
function [pe] = ForwardKinematics(Th, A)

    th1=Th(1); th2=Th(2); th3=Th(3);
    a1=A(1);    a2=A(2);    a3=A(3);

    A0b = [eye(3,3), transpose([0, 0, a1]);
           0, 0, 0, 1];
    A10 = [[cos(th1) 0 sin(th1); sin(th1) 0 -cos(th1); 0 1 0], transpose([0,0,0]);
           0, 0, 0, 1];
    A21 = [RotZ(th2), transpose([a2*cos(th2), a2*sin(th2), 0]);
           0, 0, 0, 1];
    A32 = [RotZ(th3), transpose([a3*cos(th3), a3*sin(th3), 0]);
           0, 0, 0, 1];

    A3b = A0b*A10*A21*A32;
    
    ob = [0, 0, 0, 1] * transpose(A0b);
    o1 = [0, 0, 0, 1] * transpose(A0b*A10);
    o2 = [0, 0, 0, 1] * transpose(A0b*A10*A21);
    o3 = [0, 0, 0, 1] * transpose(A3b);

    pe = [o3(1:3)];

    close all;
    lim = 10;
    axs = axes('XLim', [-lim lim], 'YLim', [-lim lim] , 'ZLim', [0 lim] ); view(3); grid on;
    xlabel('X'); ylabel('Y'); zlabel('Z');
    hb = triad('Parent', axs, 'linewidth', 3);
    hold on;
    h0 = triad('Parent', hb, 'linewidth', 3, 'Matrix', A0b);
    h1 = triad('Parent', h0, 'linewidth', 3, 'Matrix', A10);
    h2 = triad('Parent', h1, 'linewidth', 3, 'Matrix', A21);
    h3 = triad('Parent', h2, 'linewidth', 3, 'Matrix', A32);

    plot3([0, ob(1)], [0, ob(2)], [0, ob(3)], 'Color', [0,0,0], 'linestyle','--');
    plot3([ob(1), o1(1)], [ob(2), o1(2)], [ob(3), o1(3)], 'Color', [0,0,0], 'linestyle','--');
    plot3([o1(1), o2(1)], [o1(2), o2(2)], [o1(3), o2(3)], 'Color', [0,0,0], 'linestyle','--');
    plot3([o2(1), o3(1)], [o2(2), o3(2)], [o2(3), o3(3)], 'Color', [0,0,0], 'linestyle','--');
end