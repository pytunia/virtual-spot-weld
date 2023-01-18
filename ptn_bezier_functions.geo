Function slice_bezier_param
	
	// https://stackoverflow.com/questions/8369488/splitting-a-bezier-curve
	ptn_t = ptn_param;
	
    ptn_x12 = (ptn_p2[0]-ptn_p1[0])*ptn_t+ptn_p1[0];
    ptn_y12 = (ptn_p2[1]-ptn_p1[1])*ptn_t+ptn_p1[1];

    ptn_x23 = (ptn_p3[0]-ptn_p2[0])*ptn_t+ptn_p2[0];
    ptn_y23 = (ptn_p3[1]-ptn_p2[1])*ptn_t+ptn_p2[1];

    ptn_x34 = (ptn_p4[0]-ptn_p3[0])*ptn_t+ptn_p3[0];
    ptn_y34 = (ptn_p4[1]-ptn_p3[1])*ptn_t+ptn_p3[1];

    ptn_x123 = (ptn_x23-ptn_x12)*ptn_t+ptn_x12;
    ptn_y123 = (ptn_y23-ptn_y12)*ptn_t+ptn_y12;

    ptn_x234 = (ptn_x34-ptn_x23)*ptn_t+ptn_x23;
    ptn_y234 = (ptn_y34-ptn_y23)*ptn_t+ptn_y23;

    ptn_x1234 = (ptn_x234-ptn_x123)*ptn_t+ptn_x123;
    ptn_y1234 = (ptn_y234-ptn_y123)*ptn_t+ptn_y123;
	
Return



Macro calc_intersection_Bezier_line

ptn_pa1[] = {pline2[1]-pline1[1], pline1[0]-pline2[0], 0.};
ptn_pa_intercept=pline1[0]*(pline1[1]-pline2[1])+pline1[1]*(pline2[0]-pline1[0]);

ptn_param = 0.5; // initial guess
For (1:20) 
   //calc_func_intersect_Bezier_line
   ptn_func_inter = (1-ptn_param)^3*(ptn_pa1[0]*ptn_p1[0]+ptn_pa1[1]*ptn_p1[1]);
   ptn_func_inter = ptn_func_inter +3*ptn_param*(1-ptn_param)^2*(ptn_pa1[0]*ptn_p2[0]+ptn_pa1[1]*ptn_p2[1]);
   ptn_func_inter = ptn_func_inter+3*ptn_param^2*(1-ptn_param)*(ptn_pa1[0]*ptn_p3[0]+ptn_pa1[1]*ptn_p3[1]);
   ptn_func_inter = ptn_func_inter+ptn_param^3*(ptn_pa1[0]*ptn_p4[0]+ptn_pa1[1]*ptn_p4[1])+ptn_pa_intercept;

   
   //calc_derivative_intersect_Bezier_line
   ptn_deriv = -3*(ptn_pa1[0]*ptn_p1[0]+ptn_pa1[1]*ptn_p1[1])*ptn_param^2;
   ptn_deriv = ptn_deriv +  6*(ptn_pa1[0]*ptn_p1[0]+ptn_pa1[1]*ptn_p1[1])*ptn_param;
   ptn_deriv = ptn_deriv -  3*(ptn_pa1[0]*ptn_p1[0]+ptn_pa1[1]*ptn_p1[1]);
   ptn_deriv = ptn_deriv +  9*(ptn_pa1[0]*ptn_p2[0]+ptn_pa1[1]*ptn_p2[1])*ptn_param^2;
   ptn_deriv = ptn_deriv - 12*(ptn_pa1[0]*ptn_p2[0]+ptn_pa1[1]*ptn_p2[1])*ptn_param; 
   ptn_deriv = ptn_deriv +  3*(ptn_pa1[0]*ptn_p2[0]+ptn_pa1[1]*ptn_p2[1]);
   ptn_deriv = ptn_deriv -  9*(ptn_pa1[0]*ptn_p3[0]+ptn_pa1[1]*ptn_p3[1])*ptn_param^2;
   ptn_deriv = ptn_deriv +  6*(ptn_pa1[0]*ptn_p3[0]+ptn_pa1[1]*ptn_p3[1])*ptn_param;
   ptn_deriv = ptn_deriv +  3*(ptn_pa1[0]*ptn_p4[0]+ptn_pa1[1]*ptn_p4[1])*ptn_param^2;
   
   ptn_param = ptn_param - ptn_func_inter/ptn_deriv;
   //Printf("Next %g", ptn_param);  
EndFor

Return
