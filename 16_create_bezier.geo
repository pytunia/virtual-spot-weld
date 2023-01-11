// ------ Outside Bezier

Macro create_bezier_outside
	p5[] = Point{5};
	circ_rad = (b1+b2+b3+b4+b5) - b9 - p5[0];
	k=0.5522847498; // kappa for Bezier circle

	If (angle_wn > 90)
	   k2=0.2;
	Else
	   k2=0.75;
	EndIf

	If (angle_wn == 90)
	  k2=k;
	EndIf

	p1[] = Point{14};
	p2[] = {p1[0]-k2*circ_rad*Cos(angle_wn), p1[1]+k2*circ_rad*Sin(angle_wn), 0}; //Point{998};
	p3[] = {k*circ_rad+p5[0], 1*circ_rad+p5[1], 0}; //Point{999};
	p4[] = Point{16};


	// ---- calculating intersection btw Bezier and horizontal line
	If (Round(t0*10) % 2 == 0)
		pline1[] = {0., t0/2.-0*clen, 0.};	
		pline2[] = {10., t0/2.-0*clen, 0.};
	Else
		pline1[] = {0., Floor(10*t0/2.)/10-clen, 0.};	
		pline2[] = {10., Floor(10*t0/2.)/10-clen, 0.};
	EndIf
	Printf("pline1[1] %g", pline1[1]);

	pa1[] = {pline2[1]-pline1[1], pline1[0]-pline2[0], 0.};
	pa_intercept=pline1[0]*(pline1[1]-pline2[1])+pline1[1]*(pline2[0]-pline1[0]);
	
	Call calc_intersection_Bezier_line;
	// ---

	
	Call slice_bezier_param;

	Point(1002) = {x12, y12, 0}; // Control point
	Point(1003) = {x123, y123, 0}; // Control point
	Point(15) = {x1234, y1234, 0}; // Intersecting
	Point(1005) = {x234, y234, 0}; // Control point
	Point(1006) = {x34, y34, 0}; // Control point
	//Bezier(321)  = {14, 1002, 1003, 15};
	//Bezier(323) = {15, 1005, 1006, 16};

Return

// ---- Inside Bezier

Macro create_bezier_inside
	p5[] = Point{5};
	circ_rad = b3+b4; 
	k=0.5522847498; // kappa for Bezier circle

	If (angle_wn > 90)
	   k2=0.2;
	Else
	   k2=0.75;
	EndIf

	If (angle_wn == 90)
	  k2=k;
	EndIf

	
	p1[] = Point{9};
	p2[] = {p1[0]-k2*circ_rad*Cos(angle_wn), p1[1]+k2*circ_rad*Sin(angle_wn), 0}; //Point{998};
	p3[] = {k*circ_rad+p5[0], 1*circ_rad+p5[1], 0}; //Point{999};
	p4[] = Point{11};
	

	// ---- calculating intersection btw Bezier and horizontal line
	// ---- this is different from code with fusion boundary elements
//	If (Round(t0*10) % 2 == 0)
//		pline1[] = {0., t0/2.-0*clen, 0.};	
//		pline2[] = {10., t0/2.-0*clen, 0.};
//	Else
//		pline1[] = {0., Floor(10*t0/2.)/10-0*clen, 0.};	
//		pline2[] = {10., Floor(10*t0/2.)/10-0*clen, 0.};
//	EndIf



	pline1[] = {0., Round(10*0.6*hL)/10, 0.};	
	pline2[] = {10., Round(10*0.6*hL)/10, 0.};

	Printf("pline1[1] %g", pline1[1]);

	pa1[] = {pline2[1]-pline1[1], pline1[0]-pline2[0], 0.};
	pa_intercept=pline1[0]*(pline1[1]-pline2[1])+pline1[1]*(pline2[0]-pline1[0]);
	
	Call calc_intersection_Bezier_line;
	// ---
	
	Call slice_bezier_param;
	
	Point(1012) = {x12, y12, 0}; // Control point
	Point(1013) = {x123, y123, 0}; // Control point
	Point(10) = {x1234, y1234, 0}; // Intersecting
	Point(1015) = {x234, y234, 0}; // Control point
	Point(1016) = {x34, y34, 0}; // Control point
    Bezier(312)  = {9, 1012, 1013, 10};
    Bezier(314) = {10, 1015, 1016, 11};
Return

