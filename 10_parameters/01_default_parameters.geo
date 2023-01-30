// --- PARAMETERS defining spot weld geometry --- //
clen = 	0.1;
dL 		= 	DefineNumber[ 6., Name "Parameters/dL" ];
bSHAZ 	= 	DefineNumber[ 0.4, Name "Parameters/bSHAZ" ];
bHAZ 	= 	DefineNumber[ 0.8, Name "Parameters/bHAZ" ];
t0 		= 	DefineNumber[ 1.2, Name "Parameters/t0" ];
hL 		= 	DefineNumber[ 0.8, Name "Parameters/hL" ];
//angle_wn is always >= 45!
angle_wn	= 	DefineNumber[ 65, Name "Parameters/angle_wn" ];
angle_haz 	= 	DefineNumber[ 70, Name "Parameters/angle_haz" ];

flag_halo = DefineNumber[ 0, Name "Generate halo (no = 0, yes = 1)?" ];
// 0: omit. It will still be displayed but not exported as a separate unit.
flag_shaz = DefineNumber[ 0, Name "Generate SHAZ (no = 0, yes = 1)?" ];

roundness = 1; // either 1: squarish tip, or 2: round tip, i.e. circular if angle_wn = 90

// angles in radians
angle_wn 	= 	angle_wn*(Pi/180);
angle_haz 	= 	angle_haz*(Pi/180);

// --- PARAMETERS defining mesh construction --- //
h1 		= 	0.75*hL;
h2 		= 	hL - h1;
h3 		= 	clen; // fusion line thickness
h4 		= 	t0-(h1+h2+h3);



b4 		= 	Ceil(1.25*h2/clen)*clen;
Printf("dist b4 %g", b4);
If (angle_wn < (Pi/2))
    b3 		= 	Ceil(hL/clen)*clen + Floor((0.5*hL/Tan(angle_wn))/clen)*clen - b4;
Else
    b3 		= 	Ceil(hL/clen)*clen - b4;
EndIf
b5 		= 	h3; // h3/Sin(angle_wn); // fusion line thickness
b1 		= 	dL/2 - Floor(0.7*(dL/2)/clen)*clen;
b2 		= 	(dL/2 - b1) - (b3+b4);

b6 		= 	bHAZ -b5;
b7 		= 	bSHAZ;
b8 		= 	6 - (b1+b2+b3+b4+b5+b6+b7);
If (angle_wn < (Pi/2))
    b9 	= 	Floor((hL/Tan(angle_wn))/clen)*clen;
Else
    b9 	= 	0;
EndIf

	
b200 	= 	(b1+b2)-b3;
b201 	= 	b1+b2-b9;
h200 	= 	-0.2*b4;


// --- PARAMETERS defining number of elements --- //
num_nodes_b1 		= 	Round(b1/clen) + 1;
num_nodes_b2 		= 	Round(b2/clen) + 1;
num_nodes_b3 		= 	Round(b3/clen) + 1;
num_nodes_b4 		= 	Round(b4/clen) + 1;
num_nodes_b5 		= 	2;
num_nodes_b6 		= 	Round(b6/clen) + 1;
num_nodes_b7 		= 	Round(b7/clen) + 1;
num_nodes_b8 		= 	Round(b8/clen) + 1;

num_nodes_h1 		= 	Round(0.8*hL/clen) + 1;
// num_nodes_h2 	= 	num_nodes_b4;
// num_nodes_h3 	= 	num_nodes_b5;
num_nodes_h4 		= 	Round(t0/clen) - num_nodes_h1 + 2;

nodes_8thcircum = 	18;

If (flag_halo == 0)
	b5 = 0;
	b6 	= bHAZ -b5;
	h3 = 0;
	h4 	= t0-(h1+h2+h3);
EndIf


If (flag_shaz == 0) 
	bSHAZ = clen;
	b7 = bSHAZ;
	num_nodes_b7 	= 	Round(b7/clen) + 1;
EndIf
