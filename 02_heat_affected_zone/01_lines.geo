// ------- Point 19 ------
p15[] = Point{15};
p2[] = Point{2};
Point(19) = {p15[0], (h1+h2+h3+h4), 0, clen};

Point(20) = {p5[0], (h1+h2+h3+h4), 0, clen};
Point(21) = {p2[0], (h1+h2+h3+h4), 0, clen};
Point(22) = {0, (h1+h2+h3+h4), 0, clen};

Point(23) = {(b1+b2+b3+b4+b5+b6), 0, 0, clen};

// ------- Point 25 ------
//p19[] = Point{19}; 
//circ_rad = (b3+b4+b5+b6);
//p1[] = {p19[0], p19[1], 0}; // start line
//p2[] = {p19[0]+10., p19[1], 0}; // end line
//p3[] = Point{5}; // center of circle
//Call calc_intersection_line_circle;
//Point(25) = {inter1_x, inter1_y, 0, clen};
p23 = Point{23};
p25x = p23[0]-t0/Tan(angle_wez);
p25y = t0;
Point(25) = {p25x, p25y, 0, clen};


// ----- Point 24 ------
p15[] = Point{15};
ptn_p1[] = Point{15}; // start line 1
ptn_p2[] = {p15[0]+10., p15[1], 0}; // end line 1
ptn_p3[] = Point{23}; // start line 2
ptn_p4[] = Point{25}; // end line 2
Call calc_intersection_btw_two_lines;
Point(24) = {ptn_inter_x, ptn_inter_y, 0, clen};


p23[] = Point{23};
Point(26) = {p23[0]+b7, 0, 0, clen};
p25[] = Point{25};
Point(28) = {p25[0]+b7, p25[1], 0, clen};

// ----- Point 27 ------
p15[] = Point{15};
ptn_p1[] = Point{15}; // start line 1
ptn_p2[] = {p15[0]+10., p15[1], 0}; // end line 1
ptn_p3[] = Point{26}; // start line 2
ptn_p4[] = Point{28}; // end line 2
Call calc_intersection_btw_two_lines;
Point(27) = {ptn_inter_x, ptn_inter_y, 0, clen};


Line(329) = {17, 21};
Line(330) = {21, 22};
Line(331) = {18, 22};
Line(332) = {16, 20};
Line(333) = {20, 21};

Line(334) = {15, 19};
Line(335) = {19, 20};
Line(336) = {14, 23};
Line(337) = {23, 24};
Line(338) = {15, 24};
Line(339) = {24, 25};
Line(340) = {19, 25};

Line(341) = {23, 26};
Line(342) = {26, 27};
Line(343) = {24, 27};
Line(344) = {27, 28};
Line(345) = {25, 28};