Function calc_intersection_line_circle

	ptn_x1 = ptn_p1[0]; ptn_y1 = ptn_p1[1];
	ptn_x2 = ptn_p2[0]; ptn_y2 = ptn_p2[1];
	ptn_cx = ptn_p3[0]; ptn_cy = ptn_p3[1];

	ptn_dx = ptn_x2 - ptn_x1;
	ptn_dy = ptn_y2 - ptn_y1;

	ptn_A = ptn_dx*ptn_dx + ptn_dy*ptn_dy;
	ptn_B = 2 * (ptn_dx * (ptn_x1 - ptn_cx) + ptn_dy * (ptn_y1 - ptn_cy));
	ptn_C = (ptn_x1 - ptn_cx) * (ptn_x1 - ptn_cx) + (ptn_y1 - ptn_cy) * (ptn_y1 - ptn_cy) - ptn_circ_rad*ptn_circ_rad;

	ptn_det = ptn_B*ptn_B - 4*ptn_A*ptn_C;

	// two solutions
	ptn_t= (-ptn_B + Sqrt(ptn_det)) / (2.*ptn_A);
	ptn_inter1_x = ptn_x1 + ptn_t*ptn_dx;
	ptn_inter1_y = ptn_y1 + ptn_t*ptn_dy;

	ptn_t = (-ptn_B -Sqrt(ptn_det)) / (2.*ptn_A);
	ptn_inter2_x = ptn_x1 + ptn_t*ptn_dx;
	ptn_inter2_y = ptn_y1 + ptn_t*ptn_dy;

Return


Function calc_intersection_of_two_arcs

	ptn_xA = ptn_p1[0]; ptn_yA = ptn_p1[1]; // center first arc
	ptn_xB = ptn_p2[0]; ptn_yB = ptn_p2[1]; // center second arc
	ptn_rA = ptn_circ_rad_1;
	ptn_rB = ptn_circ_rad_2;
	
    // intersection of two arcs
	ptn_d2 = (ptn_xB-ptn_xA)^2 + (ptn_yB-ptn_yA)^2;
	ptn_K = (1./4.)*Sqrt(((ptn_rA+ptn_rB)^2-ptn_d2)*(ptn_d2-(ptn_rA-ptn_rB)^2));
	ptn_inter1_x = (1./2.)*(ptn_xB+ptn_xA) + (1./2.)*(ptn_xB-ptn_xA)*(ptn_rA^2-ptn_rB^2)/ptn_d2 - 2.*(ptn_yB-ptn_yA)*ptn_K/ptn_d2;
	ptn_inter1_y = (1./2.)*(ptn_yB+ptn_yA) + (1./2.)*(ptn_yB-ptn_yA)*(ptn_rA^2-ptn_rB^2)/ptn_d2 + 2.*(ptn_xB-ptn_xA)*ptn_K/ptn_d2;
	
	ptn_inter2_x = (1./2.)*(ptn_xB+ptn_xA) + (1./2.)*(ptn_xB-ptn_xA)*(ptn_rA^2-ptn_rB^2)/ptn_d2 + 2.*(ptn_yB-ptn_yA)*ptn_K/ptn_d2;
	ptn_inter2_y = (1./2.)*(ptn_yB+ptn_yA) + (1./2.)*(ptn_yB-ptn_yA)*(ptn_rA^2-ptn_rB^2)/ptn_d2 - 2.*(ptn_xB-ptn_xA)*ptn_K/ptn_d2;

Return

// angle bisector
Function calc_angle_btw_two_vectors

	// Set origin to ptn_p1
	ptn_x2 = ptn_p2[0] - ptn_p1[0]; ptn_y2 = ptn_p2[1] - ptn_p1[1];
	ptn_x3 = ptn_p3[0] - ptn_p1[0]; ptn_y3 = ptn_p3[1] - ptn_p1[1];
	// cos(theta) = u dot v/(u_norm*v_norm)
	ptn_dot_product = ptn_x2*ptn_x3 + ptn_y2*ptn_y3;
	ptn_norm = Sqrt(ptn_x2^2+ptn_y2^2)*Sqrt(ptn_x3^2+ptn_y3^2);
	ptn_anglex = Acos(ptn_dot_product/ptn_norm);

Return


Function calc_intersection_btw_two_lines

	ptn_x1 = ptn_p1[0]; ptn_y1 = ptn_p1[1]; // first point on line
	ptn_x2 = ptn_p2[0]; ptn_y2 = ptn_p2[1]; // second point on line
	ptn_x3 = ptn_p3[0]; ptn_y3 = ptn_p3[1]; // first point on line
	ptn_x4 = ptn_p4[0]; ptn_y4 = ptn_p4[1]; // second point on line	
	
	If ((ptn_x1 != ptn_x2) && (ptn_x3 != ptn_x4))
		ptn_m1 = (ptn_y1-ptn_y2)/(ptn_x1-ptn_x2);
		ptn_b1_tmp = ptn_y1-ptn_m1*ptn_x1;
		ptn_m2 = (ptn_y3-ptn_y4)/(ptn_x3-ptn_x4);
		ptn_b2_tmp = ptn_y3-ptn_m2*ptn_x3;
		ptn_inter_x = (ptn_b1_tmp-ptn_b2_tmp)/(ptn_m2-ptn_m1);
		ptn_inter_y = ptn_m1*ptn_inter_x + ptn_b1_tmp;
	ElseIf (ptn_x1 == ptn_x2)
		ptn_m2 = (ptn_y3-ptn_y4)/(ptn_x3-ptn_x4);
		ptn_b2_tmp = ptn_y3-ptn_m2*ptn_x3;
		ptn_inter_x = ptn_x1;
		ptn_inter_y = ptn_m2*ptn_inter_x + ptn_b2_tmp;	
	ElseIf (ptn_x3 == ptn_x4)
		ptn_m1 = (ptn_y1-ptn_y2)/(ptn_x1-ptn_x2);
		ptn_b1_tmp = ptn_y1-ptn_m1*ptn_x1;
		ptn_inter_x = ptn_x3;
		ptn_inter_y = ptn_m1*inter_x + ptn_b1_tmp;
	EndIf

Return


Function calc_distance_btw_two_points
	// works in 2D and 3D space
	ptn_x1 = ptn_p1[0]; ptn_y1 = ptn_p1[1]; ptn_z1 = ptn_p1[2];
	ptn_x2 = ptn_p2[0]; ptn_y2 = ptn_p2[1]; ptn_z2 = ptn_p2[2];
	ptn_dist = Sqrt((ptn_x1 - ptn_x2)^2 + (ptn_y1 - ptn_y2)^2 + (ptn_z1 - ptn_z2)^2);

Return

