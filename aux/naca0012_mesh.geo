Include "naca0012.geo";
//+

yMax = 4;
xMin = -0.5;
xMax = 10;

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
Point(138) = {1, -yMax, 0, 1.0};
//+
Point(139) = {xMax, 0, 0, 1.0};
//+
Circle(133) = {134, 1, 133};
//+
Line(134) = {133, 7};
//+
Line(135) = {126, 134};
//+
Line(136) = {133, 137};
//+
Line(137) = {137, 66};
//+
Line(138) = {67, 138};
//+
Line(139) = {138, 134};
//+
Line(140) = {138, 136};
//+
Line(141) = {136, 139};
//+
Line(142) = {139, 135};
//+
Line(143) = {135, 137};
