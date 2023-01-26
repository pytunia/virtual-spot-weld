// -- Surfaces -- //
Line Loop(501) = {308, 309, -310, -306};
Plane Surface(501) = 501;
Line Loop(502) = {311, 312, -313, -309};
Plane Surface(502) = 502;
Line Loop(503) = {313, 314, -315, 310};
Plane Surface(503) = 503;
Line Loop(504) = {320, 321, -322, -312};
Plane Surface(504) = 504;
Line Loop(505) = {322, 323, -324, -314};
Plane Surface(505) = 505;

// Resolve issue with extrusion of center
Delete{ Line{303, 304, 318, 319, 327, 328}; }

// ------ BOTTOM ------
// Surfaces
Line Loop(521) = {301, 351, 352, -353};
Plane Surface(521) = 521;

Line Loop(522) = {305, 354, -355, -351};
Plane Surface(522) = 522;



// --- Volume from surface loop 1 --- //
Line Loop(701) = {305, 306, -307, -302};
Plane Surface(701) = 701;

Line Loop(702) = {355, 1306, -1307, -1302};
Plane Surface(702) = 702;

Line Loop(703) = {-354, 306, 1354, -1306};
Surface(703) = 703;

Line Loop(704) = {-351, 302, 1351, -1302};
Surface(704) = 704;

Line Loop(705) = {307, 1354, -1307, -1351};
Surface(705) = 705;

Surface Loop(701) = {701, 702, 703, 704, 705, 522};
Volume(701) = {701};

vol_tag_fz(0) = 701;

// --- Volume from surface loop 2 --- //
Line Loop(707) = {307, 315, 316, -317};
Plane Surface(707) = 707;

Line Loop(708) = {1307, 1315, -1316, -1317};
Plane Surface(708) = 708;

Line Loop(709) = {-1354, 315, 2354, -1315};
Surface(709) = 709;

Line Loop(710) = {-1351, 317, 2351, -1317};
Surface(710) = 710;

Line Loop(711) = {-316, 2354, -1316, -2351};
Surface(711) = 711;

Surface Loop(702) = {707, 708, 709, 710, 711, 705};
Volume(702) = {702};

vol_tag_fz(1) = 702;

// --- Volume from surface loop 3 --- //
Line Loop(713) = {-316, 324, 325, -326};
Plane Surface(713) = 713;

Line Loop(714) = {1316, 1324, -1325, -1326};
Plane Surface(714) = 714;

Line Loop(715) = {-2354, 324, 3354, -1324}; 
Surface(715) = 715;

Line Loop(716) = {-2351, 326, 3351, -1326};
Surface(716) = 716;

Line Loop(717) = {-325, 3354, -1325, -3351};
Surface(717) = 717;

Surface Loop(703) = {713, 714, 715, 716, 717, 711};
Volume(703) = {703};
vol_tag_halo(0) = 703;

Coherence;

// --- Reflect surfaces --- //
vol_tag_fz(2) = newv;
exttmp[] = Symmetry { 1, 0, -1, 0} { Duplicata{ Volume{701}; }   };

vol_tag_fz(3) = newv;
exttmp[] = Symmetry { 1, 0, -1, 0} { Duplicata{ Volume{702}; }   };

vol_tag_halo(1) = newv;
exttmp[] = Symmetry { 1, 0, -1, 0} { Duplicata{ Volume{703}; }   };


// --- Extrude center --- //
ext521[] = Extrude{0, h1, 0} {
Surface{521}; Layers{num_nodes_h1 - 1}; Recombine;
};
vol_tag_fz(4) = ext521[1];


Printf("Tag for surface on top of extrusion %g", ext521[0]);
exttmp[] = Extrude{0, h2, 0}{
			Surface{ext521[0]}; Layers{num_nodes_b4 - 1}; Recombine;
};
vol_tag_fz(5) = exttmp[1];


surf_top_center[] = Extrude{0, h3, 0}{
			Surface{exttmp[0]}; Layers{1}; Recombine;
};
Printf("Tag for surf_top_center %g", surf_top_center[0]);
vol_tag_halo(2) = surf_top_center[1];


// --- Extrude all surfaces of the side --- //
p= 1;
For(0:2)
	  vol_tag = newv;
	  exttmp[] = Extrude{{0, -1, 0}, {0, 0, 0}, Pi/4}{
		   Surface{500+p}; Layers{nodes_8thcircum}; Recombine;
	   };
	   vol_tag_fz(p+5) = exttmp[1];
	   exttmp2[] = Extrude{{0, -1, 0}, {0, 0, 0}, Pi/4}{
		   Surface{exttmp[0]}; Layers{nodes_8thcircum}; Recombine;
		};
	   vol_tag_fz(p+6) = exttmp2[1];
  p++ ;
EndFor

Coherence;

// --- Get tags for fusion zone boundary / halo --- //
//p = 0;
//For(0:3)
//	vol_tag_halo(p+3) = newv+p;
//EndFor

p = 4;
For(0:1)
	  vol_tag = newv;
	  exttmp[] = Extrude{{0, -1, 0}, {0, 0, 0}, Pi/4}{
		   Surface{500+p}; Layers{nodes_8thcircum}; Recombine;
	   };
	   vol_tag_halo(p-1) = exttmp[1];
	   exttmp2[] = Extrude{{0, -1, 0}, {0, 0, 0}, Pi/4}{
		   Surface{exttmp[0]}; Layers{nodes_8thcircum}; Recombine;
		};
	   vol_tag_halo(p) = exttmp2[1];
	p++ ;
EndFor

allSurfaces[] = Surface "*" ;
Transfinite Surface{allSurfaces[]};
Recombine Surface{allSurfaces[]};

allVolumes[] = Volume "*" ;
Transfinite Volume{allVolumes[]};
Recombine Volume{allVolumes[]};


Physical Volume("EL_FZ", 100) = {vol_tag_fz[]};

Physical Volume("EL_HALO", 101) = {vol_tag_halo[]};

