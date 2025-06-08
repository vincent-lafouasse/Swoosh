Include "../aux/naca0012.geo";
//+

yMax = 4;
xMin = -0.5;
xMax = 10;

frontLobeResolution = 150;
frontLobeProgression = 1;
verticalResolution = 125;
verticalProgression = 1.05;
wingFlankResolution = 200;
wingFlankProgression = 1;
trailResolution = 250;
trailProgression = 1.015;

//+
Point(133) = {xMin, yMax, 0, 1.0}; // corners
//+
Point(134) = {xMin, -yMax, 0, 1.0};
//+
Point(135) = {xMax, yMax, 0, 1.0};
//+
Point(136) = {xMax, -yMax, 0, 1.0}; // corners
//+
Point(137) = {1, yMax, 0, 1.0}; // aligned with tail
Point(138) = {1, 0, 0, 1.0};
Point(139) = {1, -yMax, 0, 1.0};
//+
Point(140) = {xMax, 0, 0, 1.0};
//+
Circle(133) = {134, 1, 133};
//+
//+
Line(134) = {11, 133};
//+
Line(135) = {122, 134};
//+
//+
//+
Line(148) = {66, 137};
//+
Line(149) = {67, 139};
//+
Line(138) = {134, 139};
//+
Line(139) = {139, 136};
//+
Line(140) = {136, 140};
//+
Line(141) = {140, 135};
//+
Line(142) = {135, 137};
//+
Line(143) = {137, 133};
//+
Line(144) = {138, 140};
//+
Spline(145) = {11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 131, 130, 129, 128, 127, 126, 125, 124, 123, 122};
//+
Spline(146) = {11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66};
//+
Spline(147) = {67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122};
//+
Transfinite Curve {133, 145} = frontLobeResolution Using Progression frontLobeProgression;
//+
Transfinite Curve {134, 148, 141, 135, 149, 140} = verticalResolution Using Progression verticalProgression;
//+
Transfinite Curve {143, 146, 147, 138} = wingFlankResolution Using Progression wingFlankProgression;
//+
Transfinite Curve {142, 144, 139} = trailResolution Using Progression trailProgression;
//+
Line(150) = {66, 138};
//+
Line(151) = {138, 67};
//+
Curve Loop(1) = {148, -142, -141, -144, -150};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {144, -140, -139, -149, -151};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {146, 148, 143, -134};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {135, 138, -149, 147};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {133, -134, 145, 135};
//+
Plane Surface(5) = {5};
//+
Transfinite Surface {5};
//+
Transfinite Surface {3};
//+
Transfinite Surface {4};
//+
Transfinite Surface {1};
//+
Transfinite Surface {2};
//+
Recombine Surface {5, 3, 4, 1, 2};
