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
Point(138) = {1, -yMax, 0, 1.0};
//+
Point(139) = {xMax, 0, 0, 1.0};
//+
Circle(133) = {134, 1, 133};
//+
