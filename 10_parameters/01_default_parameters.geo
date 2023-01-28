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

// angles in radians
angle_wn 	= 	angle_wn*(Pi/180);
angle_haz 	= 	angle_haz*(Pi/180);

flag_halo = 1; // 1: generate halo, 0: omit halo
flag_shaz = 0; // 1: generate shaz, 0: omit shaz, it will still be displayed but not exported as a separate unit

// --- PARAMETERS defining mesh construction --- //
h1 		= 	0.75*hL;
h2 		= 	hL - h1;
h3 		= 	0.1; // fusion line thickness
h4 		= 	t0-(h1+h2+h3);


b3 		= 	h1;
b4 		= 	hL - b3;
b5 		= 	h3; //h3/Sin(angle_wn); // fusion line thickness
b1 		= 	Floor(0.4*(dL/2)/clen)*clen;
b2 		= 	(dL/2 - b1) - (b3+b4);

b6 		= 	bHAZ -b5;
b7 		= 	bSHAZ;
b8 		= 	6 - (b1+b2+b3+b4+b5+b6+b7);
If (angle_wn < (Pi/2))
    b9 	= 	Floor(10*hL/Tan(angle_wn))/10.;
Else
    b9 	= 	0;
EndIf

	
b200 	= 	(b1+b2)-b3;
b201 	= 	b1+b2-b9;
h200 	= 	0;


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
	b7 = clen;
	num_nodes_b7 	= 	Round(b7/clen) + 1;
EndIf
