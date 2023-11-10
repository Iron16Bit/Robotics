function [q1, q2] = invKin(px, py, phi, params)
    l1 = params.l1;
    l2 = params.l2;
    q1=atan2( (py -l2*sin(phi))/l1, (px -l2*cos(phi))/l1);
    q2 = phi-q1;
end
