Function slice_bezier
	// angle in radians
	// t is (ratio_of_quarter_circle)*circ_rad on circle
	// p1,p4 points on curve
	// p2,p3 control points
	
	// https://www.mathworks.com/matlabcentral/fileexchange/6844-approximation-of-circle-using-cubic-bezier-curve    
	k=0.5522847498; // kappa for circle

	// bezier curve approximation of a circle
	p4[] = {1*circ_rad, 0, 0};
	p3[] = {1*circ_rad, k*circ_rad, 0};
	p2[] = {k*circ_rad, 1*circ_rad, 0};
	p1[] = {0, 1*circ_rad, 0};
	
	// https://stackoverflow.com/questions/8369488/splitting-a-bezier-curve
	t = anglex/(Pi/2);
	
    x12 = (p2[0]-p1[0])*t+p1[0];
    y12 = (p2[1]-p1[1])*t+p1[1];

    x23 = (p3[0]-p2[0])*t+p2[0];
    y23 = (p3[1]-p2[1])*t+p2[1];

    x34 = (p4[0]-p3[0])*t+p3[0];
    y34 = (p4[1]-p3[1])*t+p3[1];

    x123 = (x23-x12)*t+x12;
    y123 = (y23-y12)*t+y12;

    x234 = (x34-x23)*t+x23;
    y234 = (y34-y23)*t+y23;

    x1234 = (x234-x123)*t+x123;
    y1234 = (y234-y123)*t+y123;
	
	//Point(1) = {0, 1*circ_rad, 0};
	//Point(2) = {x12, y12, 0};
	//Point(3) = {x123, y123, 0};
	//Point(4) = {x1234, y1234, 0};
	
	//Bezier(1) = {1,2,3,4};
	
Return


Function slice_bezier_param
	
	// https://stackoverflow.com/questions/8369488/splitting-a-bezier-curve
	t = param;
	
    x12 = (p2[0]-p1[0])*t+p1[0];
    y12 = (p2[1]-p1[1])*t+p1[1];

    x23 = (p3[0]-p2[0])*t+p2[0];
    y23 = (p3[1]-p2[1])*t+p2[1];

    x34 = (p4[0]-p3[0])*t+p3[0];
    y34 = (p4[1]-p3[1])*t+p3[1];

    x123 = (x23-x12)*t+x12;
    y123 = (y23-y12)*t+y12;

    x234 = (x34-x23)*t+x23;
    y234 = (y34-y23)*t+y23;

    x1234 = (x234-x123)*t+x123;
    y1234 = (y234-y123)*t+y123;
	
Return


Function calc_bezier_curve_for_notch
	
	p1[] = Point{pid_center};
	p2[] = Point{pid_circle_edge};
	p3[] = Point{pid_end};
	Call calc_angle_btw_two_vectors; // calculates anglex
	Printf("%g", (180*anglex)/Pi);
	
	Call slice_bezier;
	
	p1[] = Point{pid_start};
	p2[] = Point{pid_circle_edge};
	Call calc_distance_btw_two_points;

Return


// ------ test function
// angle = (Pi/8);
// circ_rad=1;

// Call slice_bezier;

// Point(8) = {1*circ_rad, 0, 0};
// Point(7) = {1*circ_rad, k*circ_rad, 0};
// Point(6) = {k*circ_rad, 1*circ_rad, 0};
// Point(5) = {0, 1*circ_rad, 0};

// Bezier(2) = {5,6,7,8};



Macro calc_intersection_Bezier_line

param = 0.5; // initial guess
For (1:20) 
   //calc_func_intersect_Bezier_line
   func_inter = (1-param)^3*(pa1[0]*p1[0]+pa1[1]*p1[1]);
   func_inter = func_inter +3*param*(1-param)^2*(pa1[0]*p2[0]+pa1[1]*p2[1]);
   func_inter = func_inter+3*param^2*(1-param)*(pa1[0]*p3[0]+pa1[1]*p3[1]);
   func_inter = func_inter+param^3*(pa1[0]*p4[0]+pa1[1]*p4[1])+pa_intercept;

   
   //calc_derivative_intersect_Bezier_line
   deriv = -3*(pa1[0]*p1[0]+pa1[1]*p1[1])*param^2;
   deriv = deriv + 6*(pa1[0]*p1[0]+pa1[1]*p1[1])*param;
   deriv = deriv - 3*(pa1[0]*p1[0]+pa1[1]*p1[1]);
   deriv = deriv + 9*(pa1[0]*p2[0]+pa1[1]*p2[1])*param^2;
   deriv = deriv - 12*(pa1[0]*p2[0]+pa1[1]*p2[1])*param; 
   deriv = deriv + 3*(pa1[0]*p2[0]+pa1[1]*p2[1]);
   deriv = deriv - 9*(pa1[0]*p3[0]+pa1[1]*p3[1])*param^2;
   deriv = deriv + 6*(pa1[0]*p3[0]+pa1[1]*p3[1])*param;
   deriv = deriv + 3*(pa1[0]*p4[0]+pa1[1]*p4[1])*param^2;
   
   param = param - func_inter/deriv;
   //Printf("Next %g", param);  
EndFor

Return


//If (hL % 2 == 0)
//	pline1[] = {0., hL/2., 0.};	
//	pline2[] = {10., hL/2., 0.};
//Else
//	pline1[] = {0., Floor(hL/2.)+clen, 0.};	
//	pline2[] = {10., Floor(hL/2.)+clen, 0.};
//EndIf
//
//pa1[] = {pline2[1]-pline1[1], pline1[0]-pline2[0], 0.};
//pa_intercept=pline1[0]*(pline1[1]-pline2[1])+pline1[1]*(pline2[0]-pline1[0]);

//Printf("Intercept %g", pa_intercept);
//
//p1[] = {2., 0., 0.};
//p2[] = {1.8, 1., 0.};
//p3[] = {1., 2., 0.};
//p4[] = {0., 2.,0.};
//
//Call calc_intersection_Bezier_line;
//
//Point(1) = {p1[0], p1[1], 0};
//Point(2) = {p2[0], p2[1], 0};
//Point(3) = {p3[0], p3[1], 0};
//Point(4) = {p4[0], p4[1], 0};
//
//Point(5) = {pline1[0], pline1[1], 0};
//Point(6) = {pline2[0], pline2[1], 0};
//
////Point(1001) = {x1, y1, 0};// Control point
//Point(1002) = {x12, y12, 0};// Control point
//Point(1003) = {x123, y123, 0};// Control point
//Point(1004) = {x1234, y1234, 0};// Control point
//Bezier(1008)  = {1, 1002, 1003, 1004};
//
////Bezier(1009) = {1, 2, 3, 4};
//
//Line(1010) = {5,6};