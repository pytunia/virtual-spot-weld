Include "99_parameter.geo" ;
Include "06_create_bezier_fin.geo";
//Include "ptn_functions.geo";
//Include "ptn_bezier_functions.geo";



// --- Center of fusion zone --- //
Point(1) = {0, 0, 0, clen};
Point(2) = {b1, 0, 0, clen};
Point(3) = {0, h1, 0, clen};
Point(4) = {b1, h1, 0, clen};

Line(301) = {1, 2};
Line(302) = {2, 4};
Line(303) = {3, 4};
Line(304) = {1, 3};

Point(12) = {b1, h1+h2, 0, clen};
Point(13) = {0, h1+h2, 0, clen};

Line(317) = {4, 12};
Line(318) = {12, 13};
Line(319) = {3, 13};

Point(17) = {b1, (h1+h2+h3), 0, clen};
Point(18) = {0, (h1+h2+h3), 0, clen};

Line(326) = {12, 17};
Line(327) = {17, 18};
Line(328) = {13, 18};


// --- Create fusion zone boundary outside --- //
Point(5) = {(b1+b2), 0, 0, clen};
Point(105) = {(b1+b2)-b9, 0, 0};

p105[] = Point{105};
Point(14) = {(b1+b2+b3+b4+b5), 0, 0, clen};
Point(116) = {p105[0], (h1+h2+h3), 0, clen};

Call create_bezier_outside;

Call create_bezier_vertical_split_outside;

// --- Create fusion zone boundary inside --- //
p105[] = Point{105};
Point(9) = {(b1+b2+b3+b4), 0, 0, clen};
Point(111) = {p105[0], (h1+h2), 0, clen};

Call create_bezier_inside;

Call create_bezier_vertical_split_inside;


// --- Y-Grid transition corner to arc --- //
Point(200) = {b200, h200, 0};

Point(7) = {(b1+b2)+b3-0.5*b9, 0, 0, clen};
Point(106) = {(b1+b2)-b9, h1, 0, clen};

// - Find Point 8 - //
ptn_p1[] = Point{200};
ptn_p2[] = Point{7};
Call calc_distance_btw_two_points;
ptn_circ_rad = ptn_dist;

ptn_p1 = Point{5};
ptn_p2 = Point{15};
ptn_p3 = Point{200};

Call calc_intersection_line_circle;
Point(8) = {ptn_inter1_x, ptn_inter1_y, 0};

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

// --- Lines --- //
Line(305) = {2, 5};
Line(308) = {5, 7};
Line(311) = {7, 9};
Line(320) = {9, 14};

Circle(309) = {7, 200, 8};
Line(313) = {8, 10};
Line(322) = {10, 15};

Line(306) = {5, 6};
Line(315) = {6, 11};
Line(324) = {11, 16};

// -- Surfaces -- //
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

p5[] = Point{5};
Point(35) = {0, 0, p5[0], clen};

// ------ BOTTOM ------
Circle(351) = {2, 203, 32};
Circle(352) = {32, 204, 34};
Line(353) = {1, 34};
Circle(354) = {5, 1, 33};
Line(355) = {32, 33};
Circle(356) = {33, 1, 35};
Line(357) = {34, 35};

// ------ BOTTOM ------
// Surfaces
Line Loop(521) = {301, 351, 352, -353};
Plane Surface(521) = 521;

Line Loop(522) = {305, 354, -355, -351};
Plane Surface(522) = 522;


Line Loop(523) = {355, 356, -357, -352};
Plane Surface(523) = 523;


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



p6[] = Point{6};
p_132[] = Translate {0, h1, 0} { Duplicata{ Point{32}; } };
p_133[] = Translate {0, p6[1], 0} { Duplicata{ Point{33}; } };
//Rotate {{0, 1, 0}, {0, 0, 0}, -Pi/4} { Duplicata { Point{1043, 1042, 106, 1045, 1046, 6}; } }
//Printf("p_xtra %g", p_xtra[0]);
//
Circle(1351) = {4, 203, p_132[0]};
Circle(1354) = {6, 3, p_133[0]};




//my_new_surfs[] = Rotate {{1, 0, 0}, {0, 0, 0}, Pi/4} { Duplicata { Point{1042, 1041}; }; };