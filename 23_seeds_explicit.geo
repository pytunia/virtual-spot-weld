// check if odd or even number of rows over thickness
If (Round(t0*10) % 2 == 0)
		subtr_row = 0;
	Else
		subtr_row = 1;
EndIf

nodes_8thcircum = 18;
// ----- fusion line
Transfinite Line{328, 326, 324, 322, 320} = 2; 

nodes321 = Floor(0.75*hL/clen)+2;//Ceil((Pi/4)*(b3+b4)/clen) + 1 - subtr_row;
Printf("Nodes on 321: %g", nodes321);
Transfinite Line{304, 302, 306, 309, 312, 321, 337, 342} = nodes321;
Transfinite Line{308, 310, 314, 323, 335} = 7;//nodes321;

// --- consider height
// Ceil(t0/clen) is number of elements over thickness
// (nodes321 -1) is number of elements over h1
nodes334 = Ceil(t0/clen) - (nodes321-1) + 1; 
Printf("Nodes on 334: %g", nodes334);
Transfinite Line{331, 329, 332, 334, 339, 344, 349} = nodes334;

nodes311 = 4;
//nodes311 = Ceil(b4+b9/clen) + 1;
Transfinite Line{311, 313, 315, 317, 319} = nodes311;

nodes336 = Ceil(b6/clen) + 1;
Transfinite Line{336, 338, 340} = nodes336;

nodes341 = Ceil(b7/clen) + 1;
Transfinite Line{341, 343, 345} = nodes341;


// ------ BOTTOM -----
Transfinite Line{353, 351, 354} = nodes_8thcircum +1;
Transfinite Line{301, 352, 356} = nodes_8thcircum +1;

nodes305 = Ceil(b2/clen)+1;
Transfinite Line{305, 355, 357} = nodes305;


// ----- transition to perpendicular
Transfinite Line{359, 367, 375, 361, 369, 377} = nodes_8thcircum +1;
Transfinite Line{362, 363, 364, 365} = nodes321;
Transfinite Line{370, 371, 372, 373} = nodes334;
nodes358 = Ceil(b8/clen) + 1;
Transfinite Line{358, 366, 374, 360, 368, 376} = nodes358;
