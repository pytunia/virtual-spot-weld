// --- PARAMETERS defining spot weld geometry --- //
clen = 0.1;
dL = 5.;
bSHAZ = 0.8;
bHAZ = 1.2;
t0 = 1.2;
hL = 0.8;
angle_wn = 65; //angle_wn is always >= 45!
angle_haz = 70;

// angles in radians
angle_wn = angle_wn*(Pi/180);
angle_haz = angle_haz*(Pi/180);


// --- PARAMETERS defining mesh construction --- //
h1 = Floor(0.75*hL*10/clen)/10.;
h2 = hL - h1;
h3 = clen; // fusion line thickness
h4 = t0-(h1+h2+h3);


b3 = Floor(0.5*hL*10/clen)/10.;
b4 = hL - b3;
b5 = h3/Sin(angle_wn); // fusion line thickness
b1 = Floor(0.4*(dL/2)/clen)/10.;
b2 = (dL/2 - b1) - (b3+b4);

b6 = bHAZ;
b7 = bSHAZ;
b8 = 6 - (b1+b2+b3+b4+b5+b6+b7);
If (angle_wn < (Pi/2))
    b9 = Floor(10*hL/Tan(angle_wn))/10.;
Else
    b9 = 0;
EndIf


b200 = (b1+b2)-b3;
b201 = b1+b2-b9;
h200 = 0;


// --- set number of elements --- //
num_els_h1 = Floor(h1/clen);
num_els_h2 = Floor(h2/clen);
num_els_h3 = Floor(h3/clen);
num_els h4 = Floor(h4/clen);

num_els_b1 = Floor(b1/clen);
num_els_b2 = Floor(b2/clen);
num_els_b3 = Floor(b3/clen);
num_els_b4 = Floor(b4/clen);
num_els_b5 = Floor(b5/clen);
num_els_b6 = Floor(b6/clen);
num_els_b7 = Floor(b7/clen);
num_els_b8 = Floor(b8/clen);

nodes_8thcircum = 18;
nodes311 = 5;
nodes321 = 2;
nodes334 = 4;