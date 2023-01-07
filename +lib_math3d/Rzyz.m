function R = Rzyz(phi)

rz1 = phi(1);
ry = phi(2);
rz2 = phi(3);

R = [
    cos(ry)*cos(rz1)*cos(rz2) - sin(rz1)*sin(rz2), - cos(rz2)*sin(rz1) - cos(ry)*cos(rz1)*sin(rz2), cos(rz1)*sin(ry);
    cos(rz1)*sin(rz2) + cos(ry)*cos(rz2)*sin(rz1),   cos(rz1)*cos(rz2) - cos(ry)*sin(rz1)*sin(rz2), sin(ry)*sin(rz1);
                                -cos(rz2)*sin(ry),                                sin(ry)*sin(rz2),          cos(ry);
];