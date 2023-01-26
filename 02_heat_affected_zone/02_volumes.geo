// Resolve issue with extrusion of center
Delete{ Line{330, 331}; }

// --- Volume from surface loop 4 --- //
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
vol_tag_haz(1) = 721;

Coherence;

vol_tag_haz(2) = newv;
exttmp[] = Symmetry { 1, 0, -1, 0} { Duplicata{ Volume{721}; }   };





exttmp[] = Extrude{0, h4, 0}{
			Surface{surf_top_center[0]}; Layers{num_nodes_h4 - 1}; Recombine;
};

vol_tag_haz(3) = newv;


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

// --- Get tags for haz --- //
p = 0;
For(0:5)
	vol_tag_haz(p+4) = newv+p;
EndFor
// --- Extrude all surfaces of the side --- //
p= 1;
For(0:2)
		exttmp[] = Extrude{{0, -1, 0}, {0, 0, 0}, Pi/4}{
		   Surface{505+p}; Layers{nodes_8thcircum}; Recombine;
	   };
	   exttmp2[] = Extrude{{0, -1, 0}, {0, 0, 0}, Pi/4}{
		   Surface{exttmp[0]}; Layers{nodes_8thcircum}; Recombine;
	   };
	   //exttmp2[] = Symmetry { 1, 0, -1, 0} { Duplicata{ Volume{exttmp[1]}; }   };
  p++ ;
EndFor


// --- Get tags for shaz --- //
p = 0;
For(0:3)
	vol_tag_shaz(p+1) = newv+p;
EndFor
// --- Extrude all surfaces of the side --- //
p= 1;
For(0:1)
	  exttmp[] = Extrude{{0, -1, 0}, {0, 0, 0}, Pi/4}{
		   Surface{508+p}; Layers{nodes_8thcircum}; Recombine;
	   };
	   exttmp2[] = Extrude{{0, -1, 0}, {0, 0, 0}, Pi/4}{
		   Surface{exttmp[0]}; Layers{nodes_8thcircum}; Recombine;
	   };
	   //exttmp2[] = Symmetry { 1, 0, -1, 0} { Duplicata{ Volume{exttmp[1]}; }   };
  p++ ;
EndFor




allSurfaces[] = Surface "*" ;
Transfinite Surface{allSurfaces[]};
Recombine Surface{allSurfaces[]};

allVolumes[] = Volume "*" ;
Transfinite Volume{allVolumes[]};
Recombine Volume{allVolumes[]};

//Physical Volume("EL_HAZ", 102) = {vol_tag_haz[]};
//Physical Volume("EL_SHAZ", 103) = {vol_tag_shaz[]};

