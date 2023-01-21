// --- Volume from surface loop 4 --- //
p_432[] = Translate {0, t0, 0} { Duplicata{ Point{32}; } };
p_433[] = Translate {0, t0, 0} { Duplicata{ Point{33}; } };

// center points
p_203[] = Translate {0, t0, 0} { Duplicata{ Point{203}; } };
Circle(4351) = {21, p_203[0], p_432[0]};
Circle(4354) = {20, 22, p_433[0]};

Line(1333) = {p_432[0], p_433[0]};
Line(1329) = {p_332[0], p_432[0]};
Line(1332) = {p_333[0], p_433[0]};

Line Loop(721) = {-325, 332, 333, -329};
Plane Surface(721) = 721;

Line Loop(722) = {1325, 1332, -1333, -1329};
Plane Surface(722) = 722;

Line Loop(723) = {-3354, 332, 4354, -1332};
Surface(723) = 723;

Line Loop(724) = {-3351, 329, 4351, -1329};
Surface(724) = 724;

Line Loop(725) = {-333, 4354, -1333, -4351};
Surface(725) = 725;

Surface Loop(721) = {721, 722, 723, 724, 725, 717};
Volume(721) = {721};


exttmp[] = Symmetry { 1, 0, -1, 0} { Duplicata{ Volume{721}; }   };


Line Loop(506) = {336, 337, -338, -321};
Plane Surface(506) = 506;
Line Loop(507) = {338, 339, -340, -334};
Plane Surface(507) = 507;
Line Loop(508) = {-323, 334, 335, -332};
Plane Surface(508) = 508;
Line Loop(509) = {341, 342, -343, -337};
Plane Surface(509) = 509;
Line Loop(510) = {343, 344, -345, -339};
Plane Surface(510) = 510;


exttmp[] = Extrude{0, h4, 0}{
			Surface{surf_top_center[0]}; Layers{nodes334-1}; Recombine;
};



// --- Extrude all surfaces of the side --- //
p= 1;
For(0:4)
	  exttmp[] = Extrude{{0, -1, 0}, {0, 0, 0}, Pi/4}{
		   Surface{505+p}; Layers{nodes_8thcircum}; Recombine;
	   };
	   exttmp2[] = Symmetry { 1, 0, -1, 0} { Duplicata{ Volume{exttmp[1]}; }   };
  p++ ;
EndFor
