Include "naca0012.geo";
//+

yMax = 1;
xMin = -0.5;
xMax = 4;

//+
Point(133) = {xMin, yMax, 0, 1.0};
//+
Point(134) = {xMin, -yMax, 0, 1.0};
//+
Point(135) = {xMax, yMax, 0, 1.0};
//+
Point(136) = {xMax, -yMax, 0, 1.0};
