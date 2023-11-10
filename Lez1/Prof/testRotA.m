alpha = 0.3;

p1 = [0.1; 0.4];
R = RotA(alpha);
p2 = R*p1;

p11 = inv(R)*p2;

if(norm(p1-p11)> 1e-8)
    error('test failed');
end
