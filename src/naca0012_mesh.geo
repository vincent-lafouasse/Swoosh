Include "../aux/naca0012_ufsc.geo";
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
