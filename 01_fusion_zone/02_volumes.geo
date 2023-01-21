//// -- Surfaces -- //
Line Loop(501) = {308, 309, -310, -306};
Plane Surface(501) = 501;
Line Loop(502) = {311, 312, -313, -309};
Plane Surface(502) = 502;
Line Loop(503) = {313, 314, -315, 310};
Plane Surface(503) = 503;
Line Loop(504) = {320, 321, -322, -312};
Plane Surface(504) = 504;
Line Loop(505) = {322, 323, -324, -314};
Plane Surface(505) = 505;



// --------------- BOTTOM
p2[] = Point{2};
p5[] = Point{5};
Point(203) = {-2*(p5[0]-p2[0]), 0, 0, clen};
Point(204) = {0, 0, -2*(p5[0]-p2[0]), clen};

// ------- Point 32 -----
p2[] = Point{2};
p203[] = Point{203};
ptn_circ_rad = (p2[0] - p203[0]);
ptn_p1[] = {0., 0., 0}; // start line
ptn_p2[] = {20., 20., 0}; // end line // winkelhalbierend
ptn_p3[] = Point{203}; // center of circle
Call calc_intersection_line_circle;
Point(32) = {ptn_inter1_x, 0, ptn_inter1_y, clen}; // now y corresponds to z coordinate

// ------- Point 33 -----
p5[] = Point{5};
ptn_circ_rad = p5[0];
ptn_p1[] = {0., 0., 0}; // start line
ptn_p2[] = {20., 20., 0}; // end line // winkelhalbierend
ptn_p3[] = Point{1}; // center of circle
Call calc_intersection_line_circle;
Point(33) = {ptn_inter1_x, 0, ptn_inter1_y, clen}; // now y corresponds to z coordinate

p2[] = Point{2};
Point(34) = {0, 0, p2[0], clen};


// ------ BOTTOM ------
Circle(351) = {2, 203, 32};
Circle(352) = {32, 204, 34};
Line(353) = {1, 34};
Circle(354) = {5, 1, 33};
Line(355) = {32, 33};


// ------ BOTTOM ------
// Surfaces
Line Loop(521) = {301, 351, 352, -353};
Plane Surface(521) = 521;

Line Loop(522) = {305, 354, -355, -351};
Plane Surface(522) = 522;




ptn_p1[] = Point{1};
ptn_p2[] = Point{32};
Call calc_distance_btw_two_points;
ptn_dist_1 = ptn_dist;
Printf("dist p32 %g", ptn_dist);

ptn_p1[] = Point{1};
ptn_p2[] = Point{106};
Call calc_distance_btw_two_points;
ptn_dist_2 = ptn_dist;
Printf("dist p106 %g", ptn_dist);


// --- Volume from surface loop 1 --- //
p6[] = Point{6};
p_132[] = Translate {0, h1, 0} { Duplicata{ Point{32}; } };
p_133[] = Translate {0, p6[1], 0} { Duplicata{ Point{33}; } };
p_bezier1[] = Rotate {{0, 1, 0}, {0, 0, 0}, -Pi/4} { Duplicata { Point{106, 1045, 1046}; } };

// center points
p_203[] = Translate {0, h1, 0} { Duplicata{ Point{203}; } };
p_1[] = Translate {0, p6[1], 0} { Duplicata{ Point{1}; } };
Circle(1351) = {4, p_203[0], p_132[0]};
Circle(1354) = {6, p_1[0], p_133[0]};

ptn_p1 = Point{p_132[0]};
ptn_p2 = Point{p_bezier1[0]};
Call calc_distance_btw_two_points;
Point(1143) = {ptn_p1[0]+0.4*ptn_dist, ptn_p1[1], ptn_p1[2]+0.4*ptn_dist};
Point(1142) = {ptn_p2[0]-0.4*ptn_dist, ptn_p2[1], ptn_p2[2]-0.4*ptn_dist};

Bezier(1307) = {p_132[0], 1143, 1142, p_bezier1[0], p_bezier1[1], p_bezier1[2], p_133[0] };
Line(1302) = {32, p_132[0]};
Line(1306) = {33, p_133[0]};

Line Loop(701) = {305, 306, -307, -302};
Plane Surface(701) = 701;

Line Loop(702) = {355, 1306, -1307, -1302};
Plane Surface(702) = 702;

Line Loop(703) = {-354, 306, 1354, -1306};
Surface(703) = 703;

Line Loop(704) = {-351, 302, 1351, -1302};
Surface(704) = 704;

Line Loop(705) = {307, 1354, -1307, -1351};
Surface(705) = 705;

Surface Loop(701) = {701, 702, 703, 704, 705, 522};
Volume(701) = {701};



// --- Volume from surface loop 2 --- //
p11[] = Point{11};
p_232[] = Translate {0, h1+h2, 0} { Duplicata{ Point{32}; } };
p_233[] = Translate {0, p11[1], 0} { Duplicata{ Point{33}; } };
p_bezier2[] = Rotate {{0, 1, 0}, {0, 0, 0}, -Pi/4} { Duplicata { Point{111, 1032, 1031}; } };

// center points
p_203[] = Translate {0, h1+h2, 0} { Duplicata{ Point{203}; } };
p_1[] = Translate {0, p11[1], 0} { Duplicata{ Point{1}; } };
Circle(2351) = {12, p_203[0], p_232[0]};
Circle(2354) = {11, p_1[0], p_233[0]};

ptn_p1 = Point{p_232[0]};
ptn_p2 = Point{p_bezier2[0]};
Call calc_distance_btw_two_points;
Point(1134) = {ptn_p1[0]+0.4*ptn_dist, ptn_p1[1], ptn_p1[2]+0.4*ptn_dist};
Point(1133) = {ptn_p2[0]-0.4*ptn_dist, ptn_p2[1], ptn_p2[2]-0.4*ptn_dist};

Bezier(1316) = {p_232[0], 1134, 1133, p_bezier2[0], p_bezier2[1], p_bezier2[2], p_233[0] };
Line(1317) = {p_132[0], p_232[0]};
Line(1315) = {p_133[0], p_233[0]};

Line Loop(707) = {307, 315, 316, -317};
Plane Surface(707) = 707;

Line Loop(708) = {1307, 1315, -1316, -1317};
Plane Surface(708) = 708;

Line Loop(709) = {-1354, 315, 2354, -1315};
Surface(709) = 709;

Line Loop(710) = {-1351, 317, 2351, -1317};
Surface(710) = 710;

Line Loop(711) = {-316, 2354, -1316, -2351};
Surface(711) = 711;

Surface Loop(702) = {707, 708, 709, 710, 711, 705};
Volume(702) = {702};


// --- Volume from surface loop 3 --- //
p16[] = Point{16};
p_332[] = Translate {0, h1+h2+h3, 0} { Duplicata{ Point{32}; } };
p_333[] = Translate {0, p16[1], 0} { Duplicata{ Point{33}; } };
p_bezier3[] = Rotate {{0, 1, 0}, {0, 0, 0}, -Pi/4} { Duplicata { Point{116, 1012, 1011}; } };

// center points
p_203[] = Translate {0, h1+h2+h3, 0} { Duplicata{ Point{203}; } };
p_1[] = Translate {0, p16[1], 0} { Duplicata{ Point{1}; } };
Circle(3351) = {17, p_203[], p_332[0]};
Circle(3354) = {16, p_1[], p_333[0]};

ptn_p1 = Point{p_332[0]};
ptn_p2 = Point{p_bezier3[0]};
Call calc_distance_btw_two_points;
Point(1234) = {ptn_p1[0]+0.4*ptn_dist, ptn_p1[1], ptn_p1[2]+0.4*ptn_dist};
Point(1233) = {ptn_p2[0]-0.4*ptn_dist, ptn_p2[1], ptn_p2[2]-0.4*ptn_dist};

Bezier(1325) = {p_332[0], 1234, 1233, p_bezier3[0], p_bezier3[1], p_bezier3[2], p_333[0] };
Line(1326) = {p_232[0], p_332[0]};
Line(1324) = {p_233[0], p_333[0]};

Line Loop(713) = {-316, 324, 325, -326};
Plane Surface(713) = 713;

Line Loop(714) = {1316, 1324, -1325, -1326};
Plane Surface(714) = 714;

Line Loop(715) = {-2354, 324, 3354, -1324};
Surface(715) = 715;

Line Loop(716) = {-2351, 326, 3351, -1326};
Surface(716) = 716;

Line Loop(717) = {-325, 3354, -1325, -3351};
Surface(717) = 717;

Surface Loop(703) = {713, 714, 715, 716, 717, 711};
Volume(703) = {703};

// --- Reflect surfaces --- //
exttmp[] = Symmetry { 1, 0, -1, 0} { Duplicata{ Volume{701}; }   };
exttmp[] = Symmetry { 1, 0, -1, 0} { Duplicata{ Volume{702}; }   };
exttmp[] = Symmetry { 1, 0, -1, 0} { Duplicata{ Volume{703}; }   };

// --- Extrude center --- //
ext521[] = Extrude{0, h1, 0} {
Surface{521}; Layers{nodes321-1}; Recombine;
};

Printf("Tag for surface on top of extrusion %g", ext521[0]);
exttmp[] = Extrude{0, h2, 0}{
			Surface{ext521[0]}; Layers{nodes311-1}; Recombine;
};
surf_top_center[] = Extrude{0, h3, 0}{
			Surface{exttmp[0]}; Layers{1}; Recombine;
};
Printf("Tag for surf_top_center %g", surf_top_center[0]);


// --- Extrude all surfaces of the side --- //
p= 1;
For(0:4)
	  vol_tag = newv;
	  exttmp[] = Extrude{{0, -1, 0}, {0, 0, 0}, Pi/4}{
		   Surface{500+p}; Layers{nodes_8thcircum}; Recombine;
	   };
	   Printf("Volume tag %g", exttmp[1]);
	   exttmp2[] = Symmetry { 1, 0, -1, 0} { Duplicata{ Volume{exttmp[1]}; }   };
  p++ ;
EndFor
//
//
//
//
//
//Transfinite Line{354, 351, 1354, 1351} = 6;
//Transfinite Line{305, 307, 355, 1307} = 6;
//Transfinite Line{302, 306, 1302, 1306} = 6;
//
//Transfinite Line{306, 308, 309, 310} = 6;
//
//allSurfaces[] = Surface "*" ;
//Transfinite Surface{allSurfaces[]};
//
//allVolumes[] = Volume "*" ;
//Transfinite Volume{allVolumes[]};


