Include "../aux/naca0012.geo";
//+

yMax = 4;
xMin = -0.5;
xMax = 10;

frontLobeResolution = 50;
frontLobeProgression = 1;
verticalResolution = 50;
verticalProgression = 1.10;
wingFlankResolution = 50;
wingFlankProgression = 1;
trailResolution = 75;
trailProgression = 1.05;

n1 = frontLobeResolution;
p1 = frontLobeProgression;
n2 = verticalResolution;
p2 = verticalProgression;
n3 = wingFlankResolution;
p3 = wingFlankProgression;
n4 = trailResolution;
p4 = trailProgression;

//+
Point(200) = {xMin, yMax, 0, 1.0}; // corners
//+
Point(201) = {xMin, -yMax, 0, 1.0};
//+
Point(202) = {xMax, yMax, 0, 1.0};
//+
Point(203) = {xMax, -yMax, 0, 1.0}; // corners
//+
Point(204) = {1, yMax, 0, 1.0}; // aligned with tail
Point(205) = {1, 0, 0, 1.0};
Point(206) = {1, -yMax, 0, 1.0};
//+
Point(207) = {xMax, 0, 0, 1.0};
//+
Line(1) = {56, 200};
//+
Line(2) = {96, 201};
//+
Line(3) = {1, 207};
//+
Spline(4) = {96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 1};
//+
Spline(5) = {56, 55, 54, 53, 52, 51, 50, 49, 48, 47, 46, 45, 44, 43, 42, 41, 40, 39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
//+
Spline(6) = {56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96};
//+
Circle(7) = {201, 76, 200};
//+
Line(8) = {200, 204};
//+
Line(9) = {204, 202};
//+
Line(10) = {202, 207};
//+
Line(11) = {207, 203};
//+
Line(12) = {203, 206};
//+
Line(13) = {206, 201};
//+
Line(14) = {206, 1};
//+
Line(15) = {204, 1};
//+
Curve Loop(1) = {7, -1, 6, 2};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {1, 8, 15, -5};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {4, -14, 13, -2};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {3, 11, 12, 14};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {15, 3, -10, -9};
//+
Plane Surface(5) = {5};
//+
//+
Transfinite Curve {7, 6} = n1 Using Progression p1;
//+
Transfinite Curve {1, -15, 2, -14, -10, 11} = n2 Using Progression p2;
//+
Transfinite Curve {8, 5, 4, 13} = n3 Using Progression p3;
//+
Transfinite Curve {9, 3, -12} = n4 Using Progression p4;
//+
Transfinite Surface {1};
//+
Transfinite Surface {2};
//+
Transfinite Surface {3};
//+
Transfinite Surface {4};
//+
Transfinite Surface {5};
//+
Recombine Surface {1, 2, 3, 5, 4};
