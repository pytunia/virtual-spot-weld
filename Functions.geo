Function calc_intersection_line_circle

	x1 = p1[0]; y1 = p1[1];
	x2 = p2[0]; y2 = p2[1];
	cx = p3[0]; cy = p3[1];

	dx = x2 - x1;
	dy = y2 - y1;

	A = dx*dx + dy*dy;
	B = 2 * (dx * (x1 - cx) + dy * (y1 - cy));
	C = (x1 - cx) * (x1 - cx) + (y1 - cy) * (y1 - cy) - circ_rad*circ_rad;

	det = B*B - 4*A*C;

	// two solutions
	t= (-B + Sqrt(det)) / (2.*A);
	inter1_x = x1 + t*dx;
	inter1_y = y1 + t*dy;

	t = (-B -Sqrt(det)) / (2.*A);
	inter2_x = x1 + t*dx;
	inter2_y = y1 + t*dy;

Return

Function calc_intersection_perpendicular

	p1[] = Point{1}; // top boundary of center band - start
	p2[] = Point{7}; // top boundary of center band - end
	p3[] = Point{2}; // center of circle
	circ_rad = radius+arc_offset;

	Call calc_intersection_line_circle;

    xdist_origin = inter2_x; // distance from origin
	ydist_origin = inter2_y;
	dx_tiny = 0.5*lc*Sin(Pi*angle/180);
	dy_tiny = 0.5*lc*Cos(Pi*angle/180);
	dx_on_center_line = lc*Cos(Pi*angle/180);
	dy_on_center_line = lc*Sin(Pi*angle/180);
  	cent_dx = xdist_origin + dx_on_center_line;
  	cent_dy = ydist_origin - dy_on_center_line;

Return

Function calc_intersection_perpendicular_semiold

    len = x_notch_center - (radius + arc_offset + lc); // distance from origin
	cent_dx = len * Cos(Pi*angle/180);
	cent_dy = len * Sin(Pi*angle/180);
	
	dx = 0.5*lc*Sin(Pi*angle/180);
	dy = 0.5*lc*Cos(Pi*angle/180);
	
Return

Function calc_intersection_perpendicular_top_btm
	p18[] = Point{18};
	p22[] = Point{22};
	p26[] = Point{26};
	p27[] = Point{27};

	dy_top = (-p18[0] + p26[0])*Tan(Pi*(angle2)/180); //p18[1] - (-p18[0] + p26[0])*Tan(Pi*(angle2)/180);
	dy_btm = (p22[0] - p27[0])*Tan(Pi*(angle2)/180); //p22[1] + (-p22[0] + p27[0])*Tan(Pi*(angle2)/180);

Return

Function calc_intersection_perpendicular_old

    len = x_notch_center - (radius + arc_offset + lc); // distance from origin
	cent_dx = len * Cos(Pi*angle/180);
	cent_dy = len * Sin(Pi*angle/180);
	
	dx_top = top_offset*Sin(Pi*angle/180);
	dy_top = top_offset*Cos(Pi*angle/180);
	
    dx_btm = btm_offset*Sin(Pi*angle/180);
	dy_btm = btm_offset*Cos(Pi*angle/180);
	
	dx = 0.5*lc*Sin(Pi*angle/180);
	dy = 0.5*lc*Cos(Pi*angle/180);
	
Return

Function get_angle

	If (px[1] > 0)
		anglex = Asin(px[1]/radius);
	Else
		anglex = Asin((-1)*px[1]/radius);
	EndIf
	
Return

Function get_angle_arbitrary_radius

	If (px[1] > 0)
		anglex = Asin(px[1]/circ_rad);
	Else
		anglex = Asin((-1)*px[1]/circ_rad);
	EndIf
	
Return

Function calc_intersection_of_two_arcs

	xA = p1[0]; yA = p1[1]; // center first arc
	xB = p2[0]; yB = p2[1]; // center second arc
	rA = circ_rad;
	rB = rA;
	
    // intersection of two arcs
	d2 = (xB-xA)^2 + (yB-yA)^2;
	K = (1/4)*Sqrt(((rA+rB)^2-d2)*(d2-(rA-rB)^2));
	xinter = (1/2)*(xB+xA) + (1/2)*(xB-xA)*(rA^2-rB^2)/d2 - 2*(yB-yA)*K/d2;
	yinter = (1/2)*(yB+yA) + (1/2)*(yB-yA)*(rA^2-rB^2)/d2 + 2*(xB-xA)*K/d2;

Return

Function calc_intersection_of_two_arcs_3

	xA = -x_notch_center-pos_rad_big_top_x; yA = 0;
	xB = -x_notch_center; yB = pos_rad_big_top_x;
	rA = rad_big;
	rB = rA;
	
    // intersection of two arcs
	d2 = (xB-xA)^2 + (yB-yA)^2;
	K = (1/4)*Sqrt(((rA+rB)^2-d2)*(d2-(rA-rB)^2));
	xinter = (1/2)*(xB+xA) + (1/2)*(xB-xA)*(rA^2-rB^2)/d2 + 2*(yB-yA)*K/d2;
	yinter = (1/2)*(yB+yA) + (1/2)*(yB-yA)*(rA^2-rB^2)/d2 - 2*(xB-xA)*K/d2;

Return

Function calc_intersection_of_two_arcs_4

	xA = -x_notch_center-3*lc; yA = 0;
	xB = -x_notch_center; yB = 3*lc;
	rA = rad_big;
	rB = rA;
	
    // intersection of two arcs
	d2 = (xB-xA)^2 + (yB-yA)^2;
	K = (1/4)*Sqrt(((rA+rB)^2-d2)*(d2-(rA-rB)^2));
	xinter = (1/2)*(xB+xA) + (1/2)*(xB-xA)*(rA^2-rB^2)/d2 + 2*(yB-yA)*K/d2;
	yinter = (1/2)*(yB+yA) + (1/2)*(yB-yA)*(rA^2-rB^2)/d2 - 2*(xB-xA)*K/d2;

Return

Function calc_intersection_of_two_arcs_5

	xA = p1[0]; yA = p1[1]; 
	xB = p2[0]; yB = p2[1];
	rA = rad_big;
	rB = rA;
	
    // intersection of two arcs
	d2 = (xB-xA)^2 + (yB-yA)^2;
	K = (1/4)*Sqrt(((rA+rB)^2-d2)*(d2-(rA-rB)^2));
	xinter = (1/2)*(xB+xA) + (1/2)*(xB-xA)*(rA^2-rB^2)/d2 + 2*(yB-yA)*K/d2;
	yinter = (1/2)*(yB+yA) + (1/2)*(yB-yA)*(rA^2-rB^2)/d2 - 2*(xB-xA)*K/d2;

Return

Function calc_intersection_of_two_arcs_2

	xA = -x_notch_center-3*lc; yA = 0;
	xB = -x_notch_center; yB = -3*lc;
	rA = circ_rad;
	rB = rA;
	
	// Test
	//Point(60) = {xA, yA, 0, lc};
	//Point(61) = {xB, yB, 0, lc};
	// Test
	
    // intersection of two arcs
	d2 = (xB-xA)^2 + (yB-yA)^2;
	K = (1/4)*Sqrt(((rA+rB)^2-d2)*(d2-(rA-rB)^2));
	xinter = (1/2)*(xB+xA) + (1/2)*(xB-xA)*(rA^2-rB^2)/d2 + 2*(yB-yA)*K/d2;
	yinter = (1/2)*(yB+yA) + (1/2)*(yB-yA)*(rA^2-rB^2)/d2 - 2*(xB-xA)*K/d2;

Return


// angle bisector
Function calc_angle_btw_two_vectors

	// Set origin to p1
	x2 = p2[0] - p1[0]; y2 = p2[1] - p1[1];
	x3 = p3[0] - p1[0]; y3 = p3[1] - p1[1];
	// cos(theta) = u dot v/(u_norm*v_norm)
	dot_product = x2*x3 + y2*y3;
	norm = Sqrt(x2^2+y2^2)*Sqrt(x3^2+y3^2);
	anglex = Acos(dot_product/norm);

Return

Function calc_tangent

	x1 = p1[0]; y1 = p1[1]; // point on cirlce
	x2 = p2[0]; y2 = p2[1]; // center of circle
	m = -((x2-x1)/(y2-y1));
	y_tangent =  m*(x_tangent - x1) + y1;

Return

Function calc_point_on_line

	x1 = p1[0]; y1 = p1[1]; // first point on line
	x2 = p2[0]; y2 = p2[1]; // second point on line
	m = -((x2-x1)/(y2-y1));
	y_tangent =  m*(x_tangent - x1) + y1;

Return


Function calc_intersection_btw_two_lines

	x1 = p1[0]; y1 = p1[1]; // first point on line
	x2 = p2[0]; y2 = p2[1]; // second point on line
	x3 = p3[0]; y3 = p3[1]; // first point on line
	x4 = p4[0]; y4 = p4[1]; // second point on line	
	
	If ((x1 != x2) && (x3 != x4))
		m1 = (y1-y2)/(x1-x2);
		b1_tmp = y1-m1*x1;
		m2 = (y3-y4)/(x3-x4);
		b2_tmp = y3-m2*x3;
		inter_x = (b1_tmp-b2_tmp)/(m2-m1);
		inter_y = m1*inter_x + b1_tmp;
	ElseIf (x1 == x2)
		m2 = (y3-y4)/(x3-x4);
		b2_tmp = y3-m2*x3;
		inter_x = x1;
		inter_y = m2*inter_x + b2_tmp;	
	ElseIf (x3 == x4)
		m1 = (y1-y2)/(x1-x2);
		b1_tmp = y1-m1*x1;
		inter_x = x3;
		inter_y = m1*inter_x + b1_tmp;
	EndIf

Return


Function calc_distance_btw_two_points

	x1 = p1[0]; y1 = p1[1];
	x2 = p2[0]; y2 = p2[1];
	dist = Sqrt((x1 - x2)^2 + (y1 - y2)^2);

Return

Function calc_length_of_arc

	Call calc_angle_btw_two_vectors;
	temp_rad = Sqrt(x2^2+y2^2);
	len_arc = temp_rad*anglex;
	
	Printf("Length of radius: %g", temp_rad);
	Printf("%g", len_arc);


Return

Function set_point_on_ratio_of_length

	x1 = p1[0]; y1 = p1[1]; // first point on line
	x2 = p2[0]; y2 = p2[1]; // second point on line
	x_at_ratio = x1 + ratio * (x2 - x1);
	y_at_ratio = y1 + ratio * (y2 - y1);
	
Return

Function reflect_point

	x_reflected = 2*p1[0] - p2[0]
	y_reflected = 2*p1[1] - p2[1]
	
Return

Function get_midpoint_btw_two_points
	
	pmid[] = {(p1[0]+p2[0])/2, (p1[1]+p2[1])/2, 0};

Return

Function calc_arc_offset

	y_1 = (lc*0.5)*Cos((angle/180)*Pi);
	y_2 = -(lc*0.5)*Cos((angle/180)*Pi);
	//p2[] 
	p3[] = {-x_notch_center, y_notch_center, 0}; //Point{2}; // center
	
	p1[] = {0, y_1, 0};
	p2[] = {-x_notch_center, x_notch_center*Cos((angle/180)*Pi-Pi/2)+y_1 , 0};
	circ_rad = radius;
	Call calc_intersection_line_circle;
	ptmp1[] = {inter2_x, inter2_y, 0};
	
	
	p1[] = {0, y_2, 0};
	p2[] = {-x_notch_center, x_notch_center*Cos((angle/180)*Pi-Pi/2)+y_2, 0};
	circ_rad = radius;
	Call calc_intersection_line_circle;
	ptmp2[] = {inter2_x, inter2_y, 0};
	
	
	p1[] = {ptmp1[0], ptmp1[1], 0};
	p2[] = {ptmp2[0], ptmp2[1], 0};
	Call calc_distance_btw_two_points;
	
	
	b1_temp = dist;
	b2_temp = b1_temp; // simplification (not exact)
	
	arc_offset = (2*lc*lc)/(b1_temp+b2_temp);
	
	If (arc_offset <= 0.75*lc) // Avoid extremly distorted element
		arc_offset = 0.75*lc;
	EndIf

Return
	