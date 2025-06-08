Include "../aux/naca0012_ufsc.geo";
//+

yMax = 4;
xMin = -0.5;
xMax = 10;

frontLobeResolution = 50;
frontLobeProgression = 1;
verticalResolution = 50;
verticalProgression = 1.15;
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
Circle(208) = {134, 1, 133};
//+
Line(209) = {11, 200};
//+
Line(210) = {189, 201};
//+
Circle(211) = {201, 1, 200};
//+
Line(212) = {200, 204};
//+
Line(213) = {204, 202};
//+
Line(214) = {202, 207};
//+
Line(215) = {207, 203};
//+
Line(216) = {203, 206};
//+
Line(217) = {206, 201};
//+
Line(218) = {206, 100};
//+
Line(219) = {100, 204};
//+
Line(220) = {100, 207};
//+
Spline(221) = {11, 10, 9, 8, 6, 4, 2, 1, 198, 196, 194, 192, 191, 190, 189};
//+
Spline(222) = {11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100};
//+
Spline(223) = {100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189};
//+
//+
Curve Loop(1) = {222, 219, -212, -209};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {223, 210, -217, 218};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {218, 220, 215, 216};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {219, 213, 214, -220};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {211, -209, 221, 210};
//+
Plane Surface(5) = {5};
//+
//+
Transfinite Surface {5};
//+
Transfinite Surface {1};
//+
Transfinite Surface {4};
//+
Transfinite Surface {3};
//+
Transfinite Surface {2};
//+
Recombine Surface {5, 1, 2, 3, 4};
//+
Transfinite Curve {211, 221} = n1 Using Progression p1;
//+
Transfinite Curve {209, 219, -214} = n2 Using Progression  p2;
//+
Transfinite Curve {210, -218, 215} = n2 Using Progression p2;
//+
Transfinite Curve {212, 222, 223, 217} = n3 Using Progression p3;
//+
Transfinite Curve {213, 220, -216} = n4 Using Progression p4;
