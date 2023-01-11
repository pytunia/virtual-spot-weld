// Surfaces
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
Line Loop(506) = {336, 337, -338, -321};
Plane Surface(506) = 506;
Line Loop(507) = {338, 339, -340, -334};
Plane Surface(507) = 507;
Line Loop(508) = {-323, 334, 335, -332};
Plane Surface(508) = 508;
Line Loop(510) = {341, 342, -343, -337};
Plane Surface(510) = 510;
Line Loop(511) = {343, 344, -345, -339};
Plane Surface(511) = 511;




// ------ BOTTOM ------
// Surfaces
Line Loop(521) = {301, 351, 352, -353};
Plane Surface(521) = 521;

Line Loop(522) = {305, 354, -355, -351};
Plane Surface(522) = 522;

Line Loop(523) = {355, 356, -357, -352};
Plane Surface(523) = 523;



// ------- btm
Line Loop(524) = {-358, 359, 360, -361};
Plane Surface(524) = 524;

// ----- btm sides
Line Loop(526) = {-358, 362, 366, -365};
Plane Surface(526) = 526;
Line Loop(528) = {359, 363, -367, -362};
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
Line Loop(538) = {-366, 370, 374, -373};
Plane Surface(538) = 538;
Line Loop(540) = {367, 371, -375, -370};
Surface(540) = {540};
Line Loop(541) = {368, 372, -376, -371};
Plane Surface(541) = 541;
Line Loop(542) = {-369, 373, 377, -372};
Surface(542) = 542;


allSurfaces[] = Surface "*" ;
Transfinite Surface{allSurfaces[]};
Recombine Surface{allSurfaces[]};

