Point(1) = {0, 0, 0, clen};
Point(2) = {b1-b9, 0, 0, clen};
Point(3) = {0, h1, 0, clen};
Point(4) = {b1-b9, h1, 0, clen};
Point(5) = {(b1+b2)-b9, 0, 0, clen};
Point(6) = {(b1+b2)-b9, h1, 0, clen};
Point(7) = {(b1+b2)-b9+h1+0.4*hL*Cos(angle_wn), 0, 0, clen};



// ------ Point 10 -----
p5[] = Point{5};
p2[] = Point{2};
circ_rad = b3+b4; 
//Point(10) = {p5[0]+circ_rad/Sqrt(2), p5[1]+circ_rad/Sqrt(2), 0, clen};

Point(9) = {(b1+b2+b3+b4), 0, 0, clen};
Point(11) = {p5[0], (h1+h2), 0, clen};
Point(12) = {p2[0], (h1+h2), 0, clen};
Point(13) = {0, (h1+h2), 0, clen};

Call create_bezier_inside;

// ------ Point 8 ------
//Point(200) = {b200, h200, 0};
//Point(201) = {b201, h201, 0};
//
//p1[] = Point{5};
//				
//								  
//			  
//
//				 
//p2[] = Point{10};
//p3[] = Point{201};
//p7[] = Point{7};
//circ_rad = p7[0]-b200;
//
//
//Call calc_intersection_line_circle;
//Point(8) = {inter1_x, inter1_y, 0};

Point(201) = {b201, h201, 0};

p1[] = Point{201};
p2[] = Point{6};
Call calc_distance_btw_two_points;
circ_rad=dist;

p1[] = Point{5};
p2[] = Point{10};
p3[] = Point{201};
				
					  


Call calc_intersection_line_circle;
Point(8) = {inter1_x, inter1_y, 0};

p7[] = Point{7};				
p2[] = Point{8};
p1[] = Point{7};
circ_rad = p7[0]-b200;

Call calc_intersection_of_two_arcs;
Point(200) = {xinter, yinter, 0};

// ------- Point 20 ------
p10[] = Point{10};
p2[] = Point{2};

Point(20) = {p5[0], (h1+h2+h3+h4), 0, clen};
Point(21) = {p2[0], (h1+h2+h3+h4), 0, clen};
Point(22) = {0, (h1+h2+h3+h4), 0, clen};

Point(23) = {(b1+b2+b3+b4+b5+b6), 0, 0, clen};

// ------- Point 25 ------

p23 = Point{23};
p25x = p23[0]-t0/Tan(angle_wez);
p25y = t0;
Point(25) = {p25x, p25y, 0, clen};
p20[] = Point{20};
p25[] = Point{25};

Point(19) = {(p20[0]+p25[0])/2, p20[1], 0, clen};

// ----- Point 24 ------
p10[] = Point{10};
p1[] = Point{10}; // start line 1
p2[] = {p10[0]+10., p10[1], 0}; // end line 1
p3[] = Point{23}; // start line 2
p4[] = Point{25}; // end line 2
Call calc_intersection_btw_two_lines;
Point(24) = {inter_x, inter_y, 0, clen};


p23[] = Point{23};
Point(26) = {p23[0]+b7, 0, 0, clen};
p25[] = Point{25};
Point(28) = {p25[0]+b7, p25[1], 0, clen};

// ----- Point 27 ------
p10[] = Point{10};
p1[] = Point{10}; // start line 1
p2[] = {p10[0]+10., p10[1], 0}; // end line 1
p3[] = Point{26}; // start line 2
p4[] = Point{28}; // end line 2
Call calc_intersection_btw_two_lines;
Point(27) = {inter_x, inter_y, 0, clen};



//
//
//
// --------------- BOTTOM
p2[] = Point{2};
p5[] = Point{5};
Point(203) = {-2*(p5[0]-p2[0]), 0, 0, clen};
Point(204) = {0, 0, -2*(p5[0]-p2[0]), clen};

// ------- Point 32 -----
p2[] = Point{2};
p203[] = Point{203};
circ_rad = (p2[0] - p203[0]);
p1[] = {0., 0., 0}; // start line
p2[] = {20., 20., 0}; // end line // winkelhalbierend
p3[] = Point{203}; // center of circle
Call calc_intersection_line_circle;
Point(32) = {inter1_x, 0, inter1_y, clen}; // now y corresponds to z coordinate

// ------- Point 33 -----
p5[] = Point{5};
circ_rad = p5[0];
p1[] = {0., 0., 0}; // start line
p2[] = {20., 20., 0}; // end line // winkelhalbierend
p3[] = Point{1}; // center of circle
Call calc_intersection_line_circle;
Point(33) = {inter1_x, 0, inter1_y, clen}; // now y corresponds to z coordinate

p2[] = Point{2};
Point(34) = {0, 0, p2[0], clen};

p5[] = Point{5};
Point(35) = {0, 0, p5[0], clen};



// ------- btm
p26[] = Point{26};
Point(36) = {p26[0], 0, 0, clen};
Point(37) = {(b1+b2+b3+b4+b5+b6+b7+b8), 0, 0, clen};


//// ------- Point 38 -----
p36[] = Point{36};
circ_rad = p36[0];
p1[] = {0., 0., 0}; // start line
p2[] = {20., 20., 0}; // end line // winkelhalbierend
p3[] = Point{1}; // center of circle
Call calc_intersection_line_circle;
Point(38) = {inter1_x, 0, inter1_y, clen}; // now y corresponds to z coordinate

//// ------- Point 39 -----
p37[] = Point{37};
circ_rad = p37[0];
p1[] = {0., 0., 0}; // start line
p2[] = {20., 20., 0}; // end line // winkelhalbierend
p3[] = Point{1}; // center of circle
Call calc_intersection_line_circle;
Point(39) = {inter1_x, 0, inter1_y, clen}; // now y corresponds to z coordinate


// ------- middle
p10[] = Point{10};
p27[] = Point{27};
Point(40) = {p27[0], p10[1], 0, clen};
Point(41) = {(b1+b2+b3+b4+b5+b6+b7+b8), p10[1], 0, clen};

//// ------- Point 42 -----
p40[] = Point{40};
circ_rad = p40[0];
p1[] = {0., 0., 0}; // start line
p2[] = {20., 20., 0}; // end line // winkelhalbierend
p3[] = Point{1}; // center of circle
Call calc_intersection_line_circle;
Point(42) = {inter1_x, p10[1], inter1_y, clen}; // now y corresponds to z coordinate
//
//// ------- Point 43 -----
p41[] = Point{41};
circ_rad = p41[0];
p1[] = {0., 0., 0}; // start line
p2[] = {20., 20., 0}; // end line // winkelhalbierend
p3[] = Point{1}; // center of circle
Call calc_intersection_line_circle;
Point(43) = {inter1_x, p10[1], inter1_y, clen}; // now y corresponds to z coordinate

Point(205) = {0, p10[1], 0, clen}; // additional for rotation of curve

// ------- top
p10[] = Point{10};
p28[] = Point{28};
Point(44) = {p28[0], t0, 0, clen};
Point(45) = {(b1+b2+b3+b4+b5+b6+b7+b8), t0, 0, clen};

//// ------- Point 46 -----
p44[] = Point{44};
circ_rad = p44[0];
p1[] = {0., 0., 0}; // start line
p2[] = {20., 20., 0}; // end line // winkelhalbierend
p3[] = Point{1}; // center of circle
Call calc_intersection_line_circle;
Point(46) = {inter1_x, t0, inter1_y, clen}; // now y corresponds to z coordinate
//
//// ------- Point 47 -----
p45[] = Point{45};
circ_rad = p45[0];
p1[] = {0., 0., 0}; // start line
p2[] = {20., 20., 0}; // end line // winkelhalbierend
p3[] = Point{1}; // center of circle
Call calc_intersection_line_circle;
Point(47) = {inter1_x, t0, inter1_y, clen}; // now y corresponds to z coordinate

Point(206) = {0, t0, 0, clen}; // additional for rotation of curve

//// ------- Point 207 -----
//p202[] = Point{202};
//circ_rad = p202[0];
//p1[] = {0., 0., 0}; // start line
//p2[] = {20., 20., 0}; // end line // winkelhalbierend
//p3[] = Point{1}; // center of circle
//Call calc_intersection_line_circle;
//Point(207) = {inter1_x, 0, inter1_y, clen};// for computation of circle 371 and 363

