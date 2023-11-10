function [px, py, phi]  = dirKin(q1,q2, param)
    l1 = param.l1;
    l2 = param.l2;

    px = l1*cos(q1) +l2*cos(q1+q2);
    py = l1*sin(q1) + l2*sin (q1+q2);
    phi = q1 + q2;
end
