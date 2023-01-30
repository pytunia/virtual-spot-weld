If (roundness == 1)
	ptn_round = 2.;
ElseIf (roundness == 2)
	ptn_round = 1.;
EndIf

Macro calculate_Point200
	ptn_p1[] = Point{15};
	ptn_p2[] = {dL/2 - hL - b5, 0, 0};
	ptn_p3[] = {-10., 0.8*h1, 0};
	ptn_p4[] = { 10., 0.8*h1, 0};
	//ptn_anglex = (angle_wn + Pi/2)/2;
	//ptn_p4[] = {ptn_p3[0] - 10*Cos(ptn_anglex), ptn_p3[1] + 10*Sin(ptn_anglex), 0 };
	
	Call calc_intersection_btw_two_lines;
	
	Point(8) = { ptn_inter_x, ptn_inter_y, 0 };
	
	Printf("ptn_x8: %g", ptn_inter_x);
	Printf("ptn_y8: %g", ptn_inter_y);
	ptn_p8[] = Point{8};
	ptn_p7[] = Point{7};
	ptn_term1 = -2*b200*ptn_p8[0] + 2*b200*ptn_p7[0] + ptn_p8[0]^2 - ptn_p7[0]^2 + ptn_p8[1]^2 - ptn_p7[1]^2;
	ptn_y200 = ptn_term1/( 2*(ptn_p8[1] - ptn_p7[1]));

	Printf("ptn_y200: %g", ptn_y200);
	Point(200) = {b200, ptn_y200, 0};
	
Return

Macro create_bezier_outside
	p105[] = Point{105};
	Printf("hL+b5: %g", hL+b5);
	k=0.5522847498; // kappa for Bezier circle

	ptn_p1[] = Point{14};
	ptn_p2[] = {ptn_p1[0]-ptn_round*k*(hL+b5)*Cos(angle_wn), ptn_p1[1]+ptn_round*k*(hL+b5)*Sin(angle_wn), 0}; //Point{998};
	ptn_p4[] = Point{116};
	ptn_p3[] = {k*(hL+b5)+p105[0], ptn_p4[1], 0}; //Point{999};
	
	

	ptn_pline1[] = {0., Round(10*0.8*hL)/10, 0.};
	ptn_pline2[] = {10., Round(10*0.8*hL)/10, 0.};

	
	Call calc_intersection_Bezier_line;
	Call slice_bezier_param;

	Point(1002) = {ptn_x12, ptn_y12, 0}; // Control point
	Point(1003) = {ptn_x123, ptn_y123, 0}; // Control point
	Point(15) = {ptn_x1234, ptn_y1234, 0}; // Intersecting
	Point(1005) = {ptn_x234, ptn_y234, 0}; // Control point
	Point(1006) = {ptn_x34, ptn_y34, 0}; // Control point
	Bezier(321)  = {14, 1002, 1003, 15};
Return

Macro create_bezier_vertical_split_outside
	ptn_p1[] = Point{15};
	ptn_p2[] = Point{1005};
	ptn_p3[] = Point{1006};
	ptn_p4[] = Point{116};
	
	p5[] = Point{5};
	ptn_pline1[] = {p5[0],  0., 0.};
	ptn_pline2[] = {p5[0], 10., 0.};
	
	Call calc_intersection_Bezier_line;
	Call slice_bezier_param;
	
	Point(1008) = {ptn_x12, ptn_y12, 0}; // Control point
	Point(1009) = {ptn_x123, ptn_y123, 0}; // Control point
	Point(16) = {ptn_x1234, ptn_y1234, 0}; // Intersecting
	Point(1011) = {ptn_x234, ptn_y234, 0}; // Control point
	Point(1012) = {ptn_x34, ptn_y34, 0}; // Control point
	Bezier(323)  = {15, 1008, 1009, 16};

	//
	ptn_p1[] = Point{17};
	ptn_p2[] = Point{116};
	p17[] = Point{17};
	
	Call calc_distance_btw_two_points;
	
	Point(1013) = {ptn_p2[0]-0.4*ptn_dist, ptn_p2[1], 0};
	Point(1014) = {p17[0]+0.4*ptn_dist, p17[1], 0};
	Bezier(325) = {16, 1011, 1012, 116, 1013, 1014, 17};
Return

Macro create_bezier_inside
	p105[] = Point{105};
	Printf("hL: %g", hL);
	k=0.5522847498; // kappa for Bezier circle

	ptn_p1[] = Point{9};
	ptn_p2[] = {ptn_p1[0]-ptn_round*k*(hL)*Cos(angle_wn), ptn_p1[1]+ptn_round*k*(hL)*Sin(angle_wn), 0}; 
	ptn_p4[] = Point{111};
	ptn_p3[] = {k*(hL)+p105[0], ptn_p4[1], 0}; 
	
	

	ptn_pline1[] = Point{15};
	ptn_pline2[] = Point{5};

	
	Call calc_intersection_Bezier_line;
	Call slice_bezier_param;

	Point(1022) = {ptn_x12, ptn_y12, 0}; // Control point
	Point(1023) = {ptn_x123, ptn_y123, 0}; // Control point
	Point(10) = {ptn_x1234, ptn_y1234, 0}; // Intersecting
	Point(1025) = {ptn_x234, ptn_y234, 0}; // Control point
	Point(1026) = {ptn_x34, ptn_y34, 0}; // Control point
	Bezier(312)  = {9, 1022, 1023, 10};
Return


Macro create_bezier_vertical_split_inside
	ptn_p1[] = Point{10};
	ptn_p2[] = Point{1025};
	ptn_p3[] = Point{1026};
	ptn_p4[] = Point{111};
	
	p5[] = Point{5};
	ptn_pline1[] = {p5[0],  0., 0.};
	ptn_pline2[] = {p5[0], 10., 0.};
	
	Call calc_intersection_Bezier_line;
	Call slice_bezier_param;
	
	Point(1028) = {ptn_x12, ptn_y12, 0}; // Control point
	Point(1029) = {ptn_x123, ptn_y123, 0}; // Control point
	Point(11) = {ptn_x1234, ptn_y1234, 0}; // Intersecting
	Point(1031) = {ptn_x234, ptn_y234, 0}; // Control point
	Point(1032) = {ptn_x34, ptn_y34, 0}; // Control point
	Bezier(314)  = {10, 1028, 1029, 11};

	//
	ptn_p1[] = Point{12};
	ptn_p2[] = Point{111};
	p12[] = Point{12};
	
	Call calc_distance_btw_two_points;
	
	Point(1033) = {ptn_p2[0]-0.4*ptn_dist, ptn_p2[1], 0};
	Point(1034) = {p12[0]+0.4*ptn_dist, p12[1], 0};
	Bezier(316) = {11, 1031, 1032, 111, 1033, 1034, 12};
Return
