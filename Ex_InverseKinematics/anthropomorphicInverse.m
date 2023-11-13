%Computes the inverse kinematics of an anthropomorphic arm
function [th1, th2, th3] = anthropomorphicInverse(pW, A)

    a0 = A(1); a2 = A(2); a3 = A(3);
    pWx = pW(1); pWy = pW(2); pWz = pW(3);
    pWz = pWz - a0;

    %First we compute cos and sin of th3 and then th3 (we'll get 2 of them)
    c3 = (pWx^2+pWy^2+pWz^2 -a2^2-a3^2)/(2*a2*a3);
    s3p = sqrt(1-c3^2); s3m = -s3p;
    th31 = atan2(s3p, c3);  th32 = -th31;

    %Now we compute cos and sin of th2 and then th2 (we'll get 4 of them)
    th21 = atan2(((a2+a3*c3)*pWz-a3*s3p*sqrt(pWx^2+pWy^2)), (a2+a3*c3)*sqrt(pWx^2+pWy^2)+a3*s3p*pWz);
    th22 = atan2((a2+a3*c3)*pWz+a3*s3p*sqrt(pWx^2+pWy^2), -(a2+a3*c3)*sqrt(pWx^2+pWy^2)+a3*s3p*pWz);
    th23 = atan2((a2+a3*c3)*pWz-a3*s3m*sqrt(pWx^2+pWy^2), (a2+a3*c3)*sqrt(pWx^2+pWy^2)+a3*s3m*pWz);
    th24 = atan2((a2+a3*c3)*pWz+a3*s3m*sqrt(pWx^2+pWy^2), -(a2+a3*c3)*sqrt(pWx^2+pWy^2)+a3*s3p*pWz);
	             
    %Finally, we can easily calclate th1 from pWy and pWx
    th11 = atan2(pWy, pWx);
    th12 = atan2(-pWy, -pWx);

    th1 = [th11, th12, th11, th12];
    th2 = [th21, th22, th23, th24];
    th3 = [th31, th32, th31, th32];
end

