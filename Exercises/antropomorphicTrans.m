%Returns the position of the end effector of an antropomorphic arm
%and draws it
function [pe] = antropomorphicTrans(Th, A)

    a1=A(1);    a2=A(2);    a3=A(3);

    close all;
    lim = 10;
    axs = axes('XLim', [-lim lim], 'YLim', [-lim lim] , 'ZLim', [0 lim] ); view(3); grid on;
    xlabel('X'); ylabel('Y'); zlabel('Z');
    h0 = triad('Parent', axs, 'linewidth', 3);

    Ab0 = [eye(3,3), transpose([0, 0, a1]);
           0, 0, 0, 1];
    hb = triad('Parent', h0, 'linewidth', 3, 'Matrix', Ab0);

    A1b = [[cos(Th(1)) 0 sin(Th(1)); sin(Th(1)) 0 -cos(Th(1)); 0 1 0], transpose([0,0,0]);
           0, 0, 0, 1];
    t1b = hgtransform('Parent', hb, 'Matrix', A1b);
    h1 = triad('Parent', t1b, 'linewidth', 3);

    A21 = [RotZ(Th(1)), transpose([a2*cos(Th(1)), a2*sin(Th(1)), 0]);
           0, 0, 0, 1];
    t21 = hgtransform('Parent', h1, 'Matrix', A21);
    h2 = triad('Parent', t21, 'linewidth', 3);

    A32 = [RotZ(Th(1)), transpose([a3*cos(Th(1)), a3*sin(Th(1)), 0]);
           0, 0, 0, 1];
    t32 = hgtransform('Parent', h2, 'Matrix', A32);
    h3 = triad('Parent', t32, 'linewidth', 3);

    A3b = Ab0*A1b*A21*A32;
    
    ob = [0, 0, 0, 1] * transpose(Ab0);
    o1 = [0, 0, 0, 1] * transpose(Ab0*A1b);
    o2 = [0, 0, 0, 1] * transpose(Ab0*A1b*A21);
    o3 = [0, 0, 0, 1] * transpose(A3b);

    pe = [o3(1:3)];

    plot3([0, ob(1)], [0, ob(2)], [0, ob(3)], 'Color', [0,0,0], 'linestyle','--');
    hold on;
    plot3([0, -a2], [0, 0], [0, 0], 'Color', [0,0,0], 'linestyle','--', 'Parent', t21);
    plot3([0, -a3], [0, 0], [0, 0], 'Color', [0,0,0], 'linestyle','--', 'Parent', t32);

    k = max(size(Th));

    for i = 1:k,
        A10 = [[cos(Th(i)) 0 sin(Th(i)); sin(Th(i)) 0 -cos(Th(i)); 0 1 0], [0;0;0];
            [0, 0, 0], 1];
        A21 = [[cos(Th(i)) -sin(Th(i)) 0; sin(Th(i)) cos(Th(i)) 0; 0 0 1], [a2*cos(Th(i));a2*sin(Th(i));0]; 
            [0 0 0] 1]; 
        A32 =  [[cos(Th(i)) -sin(Th(i)) 0; sin(Th(i)) cos(Th(i)) 0; 0 0 1], [a3*cos(Th(i));a3*sin(Th(i));0]; 
            [0 0 0] 1];
        set(t1b, 'Matrix', A10);
        set(t21, 'Matrix', A21);
        set(t32, 'Matrix', A32);
        A30 = A10*A21*A32;
        Oe = A30*[0;0;0;1]; pe = [Oe(1:3)];
        drawnow;
        pause;
    end
end