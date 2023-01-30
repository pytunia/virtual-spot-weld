Include "Z_create_bezier.geo";

// --- Center of fusion zone --- //
Point(1) = {0, 0, 0, clen};
Point(2) = {b1, 0, 0, clen};
Point(3) = {0, h1, 0, clen};
Point(4) = {b1, h1, 0, clen};

Line(301) = {1, 2};
Line(302) = {2, 4};
Line(303) = {3, 4};
Line(304) = {1, 3};


Point(17) = {b1, (h1+h2+h3), 0, clen};
Point(18) = {0, (h1+h2+h3), 0, clen};

Line(327) = {17, 18};

If (b5 != 0) // with halo
	Point(12) = {b1, h1+h2, 0, clen};
	Point(13) = {0, h1+h2, 0, clen};
	Line(317) = {4, 12};
	Line(319) = {3, 13};
	Line(326) = {12, 17};
	Line(318) = {12, 13};
	Line(328) = {13, 18};
Else
	Line(317) = {4, 17};
	Line(319) = {3, 18};
EndIf


// --- Create fusion zone boundary outside --- //
Point(5) = {(b1+b2), 0, 0, clen};
Point(105) = {(b1+b2)-b9, 0, 0};

p105[] = Point{105};
Point(14) = {(b1+b2+b3+b4+b5), 0, 0, clen};
Point(116) = {p105[0], (h1+h2+h3), 0, clen};

Call create_bezier_outside;

Call create_bezier_vertical_split_outside;

If (b5 != 0) // with halo
// --- Create fusion zone boundary inside --- //
	p105[] = Point{105};
	Point(9) = {(b1+b2+b3+b4), 0, 0, clen};
	Point(111) = {p105[0], (h1+h2), 0, clen};
	Call create_bezier_inside;
	Call create_bezier_vertical_split_inside;
EndIf


// --- Y-Grid transition corner to arc --- //
Point(7) = {(b1+b2)+b3, 0, 0, clen};
Point(106) = {(b1+b2)-b9, h1, 0, clen};

Call calculate_Point200;

//Point(200) = {b200, h200, 0};
//// - Find Point 8 - //
//ptn_p1[] = Point{200};
//ptn_p2[] = Point{7};
//Call calc_distance_btw_two_points;
//ptn_circ_rad = ptn_dist;
//
//ptn_p1 = Point{5};
//ptn_p2 = Point{15};
//ptn_p3 = Point{200};
//
//Call calc_intersection_line_circle;
//Point(8) = {ptn_inter1_x, ptn_inter1_y, 0};

// - Find Point 201 - //
p106 = Point{106};
p8 = Point{8};

// Equal distance from P106 to P201 and P8 to P201
// (x106 - x201)^2 + (y106 - y201)^2 = (x8 - x201)^2 + (y8 - y201)^2
h201 = 1/(2*(p106[1] - p8[1]));
h201 = h201*( (p106[0]-b201)^2 - (p8[0]-b201)^2 - p8[1]^2 + p106[1]^2 );

Point(201) = {b201, h201, 0};


// --- Create Bezier 310 and 307 --- //
k=0.5522847498;
p201[] = Point{201};
p106[] = Point{106};
ptn_circ_rad = Abs(p201[1]-p106[1]);

ptn_p1[] = Point{106};
ptn_p2[] = {ptn_p1[0]+k*ptn_circ_rad, ptn_p1[1], 0};
ptn_p4[] = {p201[0]+ptn_circ_rad, p201[1], 0};
ptn_p3[] = {ptn_p4[0], ptn_p4[1]+k*ptn_circ_rad, 0};

ptn_pline1[] = {p5[0],  0., 0.};
ptn_pline2[] = {p5[0], 10., 0.};

Call calc_intersection_Bezier_line;
Call slice_bezier_param;

ptn_p1[] = Point{4};
ptn_p2[] = Point{106};
p4[] = Point{4};

Call calc_distance_btw_two_points;

Point(1042) = {ptn_p2[0]-0.4*ptn_dist, ptn_p2[1], 0};
Point(1043) = {p4[0]+0.4*ptn_dist, p4[1], 0};

Point(1045) = {ptn_x12, ptn_y12, 0}; // Control point
Point(1046) = {ptn_x123, ptn_y123, 0}; // Control point
Point(6) = {ptn_x1234, ptn_y1234, 0}; // Intersecting
Bezier(307)  = {4, 1042, 1043, 106, 1045, 1046, 6};
Circle(310) = {6, 201, 8};

Line(305) = {2, 5};
Line(306) = {5, 6};
Line(308) = {5, 7};
Circle(309) = {7, 200, 8};

// --- Lines --- //
If (b5 != 0) // with halo
	Line(311) = {7, 9};
	Line(320) = {9, 14};
	Line(313) = {8, 10};
	Line(322) = {10, 15};
	Line(315) = {6, 11};
	Line(324) = {11, 16};
Else
	Line(311) = {7, 14};
	Line(313) = {8, 15};
	Line(315) = {6, 16};
EndIf



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



//Circle(2354) = {bezier_cp_tag[0], p_1[0], p_233[0]};


// --- Volume from surface loop 2 --- //
If (b5 != 0)
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
EndIf




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
If (b5 != 0)
	Line(1326) = {p_232[0], p_332[0]};
	Line(1324) = {p_233[0], p_333[0]};
Else
	Line(1317) = {p_132[0], p_332[0]};
	Line(1315) = {p_133[0], p_333[0]};
EndIf





