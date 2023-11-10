clear all;
q1 = 0.1
q2 = 0.4
par.l1 = 0.5;
par.l2 = 0.8;
[px, py, phi] = dirKin(q1, q2, par)

[q1p, q2p] = invKin(px, py, phi, par)

if (norm ([q1; q2]-[q1p; q2p]) < 1e-8)
    display('test passed');
else
    display('test failed');
end

if (norm ([q1; q2]-[q1p; q2p]) > 1e-8)
    error('test failed');
end