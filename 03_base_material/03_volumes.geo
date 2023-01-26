// ----- btm sides
Line Loop(526) = {441, 442, -443, -342};
Plane Surface(526) = 526;

// ----- top sides
Line Loop(527) = {443, 444, -445, -344};
Plane Surface(527) = 527;

// --- Reflect surfaces --- //
exttmp[] = Extrude{{0, -1, 0}, {0, 0, 0}, Pi/4}{
		   Surface{526}; Layers{nodes_8thcircum}; Recombine;
	   };
vol_tag_bm(0) = exttmp[1];
exttmp2[] = Extrude{{0, -1, 0}, {0, 0, 0}, Pi/4}{
		   Surface{exttmp[0]}; Layers{nodes_8thcircum}; Recombine;
	   };
vol_tag_bm(1) = exttmp2[1];	   

exttmp[] = Extrude{{0, -1, 0}, {0, 0, 0}, Pi/4}{
		   Surface{527}; Layers{nodes_8thcircum}; Recombine;
	   };
vol_tag_bm(2) = exttmp[1];
exttmp2[] = Extrude{{0, -1, 0}, {0, 0, 0}, Pi/4}{
		   Surface{exttmp[0]}; Layers{nodes_8thcircum}; Recombine;
	   };
vol_tag_bm(3) = exttmp2[1];
	   

allSurfaces[] = Surface "*" ;
Transfinite Surface{allSurfaces[]};
Recombine Surface{allSurfaces[]};

allVolumes[] = Volume "*" ;
Transfinite Volume{allVolumes[]};
Recombine Volume{allVolumes[]};


Physical Volume("EL_BM", 104) = {vol_tag_bm[]};