Include "../aux/naca0012.geo";
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
Line(136) = {138, 137};
//+
Line(137) = {138, 139};
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
