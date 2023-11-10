function [q1, q2] = inverseKinematics(px, py, phi, param)
    l1 = param.l1;
    l2 = param.l2;

    q1=atan2( (py -l2*sin(phi))/l1, (px -l2*cos(phi))/l1);
    q2 = phi - q1;
end