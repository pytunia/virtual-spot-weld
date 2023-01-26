// ------- btm
Line Loop(524) = {-358, 359, 360, -361};
Plane Surface(524) = 524;

// ----- btm sides
Line Loop(526) = {-358, 342, 366, -365};
Plane Surface(526) = 526;
Line Loop(528) = {359, 363, -367, -342};
Surface(528) = {528};
Line Loop(530) = {360, 364, -368, -363};
Plane Surface(530) = 530;
Line Loop(532) = {-361, 365, 369, -364};
Surface(532) = 532;

// ------- middle
Line Loop(534) = {-366, 367, 368, -369};
Plane Surface(534) = 534;


// ------- top
Line Loop(536) = {-374, 375, 376, -377};
Plane Surface(536) = 536;

// ----- top sides
Line Loop(538) = {-366, 344, 374, -373};
Plane Surface(538) = 538;
Line Loop(540) = {367, 371, -375, -344};
Surface(540) = {540};
Line Loop(541) = {368, 372, -376, -371};
Plane Surface(541) = 541;
Line Loop(542) = {-369, 373, 377, -372};
Surface(542) = 542;


Surface Loop(2001) = {524, 526, 528, 530, 532, 534};
Volume(2001) = {2001};

Surface Loop(2002) = {534, 538, 540, 541, 542, 536};
Volume(2002) = {2002};

vol_tag_bm(0) = 2001;
vol_tag_bm(1) = 2002;


// --- Reflect surfaces --- //
vol_tag_bm(2) = newv;
exttmp[] = Symmetry { 1, 0, -1, 0} { Duplicata{ Volume{2001}; }   };
vol_tag_bm(3) = newv;
exttmp[] = Symmetry { 1, 0, -1, 0} { Duplicata{ Volume{2002}; }   };

allSurfaces[] = Surface "*" ;
Transfinite Surface{allSurfaces[]};
Recombine Surface{allSurfaces[]};

allVolumes[] = Volume "*" ;
Transfinite Volume{allVolumes[]};
Recombine Volume{allVolumes[]};


Physical Volume("EL_BM", 104) = {vol_tag_bm[]};