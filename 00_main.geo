Include "Functions.geo" ;
Include "Bezier_Functions.geo";
// Gmsh project created on Fri Jun 28 14:28:54 2019
//SetFactory("OpenCASCADE");
Geometry.AutoCoherence = 0;

// ----- PARAMETERS  ------
clen = 0.1;
//dL = 10.;
dL = DefineNumber[ 6., Name "Parameters/dL" ];
//bEWZ = 0.8;
bEWZ = DefineNumber[ 0.8, Name "Parameters/bEWZ" ];
//bWEZ = 1.1;
bWEZ = DefineNumber[ 1.1, Name "Parameters/bWEZ" ];
//t0 = 2.4;
t0 = DefineNumber[ 1.2, Name "Parameters/t0" ];
//hL = 1.5;
hL = DefineNumber[ 0.8, Name "Parameters/hL" ];
//angle_wn = 68; //; always >= 45!
angle_wn = DefineNumber[ 68, Name "Parameters/angle_wn" ];
//angle_wez=70;
angle_wez = DefineNumber[ 70, Name "Parameters/angle_wez" ];
// ------------------------

angle_wn = angle_wn*(Pi/180);
angle_wez = angle_wez*(Pi/180);

h1 = 0.75*(hL);
h2 = 0.25*(hL);
h3 = clen; // fusion line thickness
h4 = t0-(h1+h2+h3);


b3 = h1;
b4 = h2;
b5 = h3/Sin(angle_wn); // fusion line thickness
b1 = 0.8*(dL/2 - (b3+b4));
b2 = 0.2*(dL/2 - (b3+b4));

b6 = bWEZ;
b7 = bEWZ;
b8 = 6 - (b1+b2+b3+b4+b5+b6+b7);
If (angle_wn < (Pi/2))
    b9 = 0.7;//Floor(10*hL/Tan(angle_wn))/10.;
Else
    b9 = 0;
EndIf



b200 = (b1+b2)-0.3-b9;
b201 = b1+b2-b9;
h200 = 0;
h201 = -0.8;//-0.3;

nodes_circum = Ceil(2*Pi*(b1+b2+b3+b4+b5)/clen); // number of nodes on circumference
nodes_8thcircum = 18;//Ceil(nodes_circum/8) + 1;

// ------ Creating Geometry ----
Include "06_create_bezier_2.geo" ;
Include "01_points.geo" ;
Include "02_lines.geo" ;
Include "03_seeds_2.geo" ;
Include "04_surfaces.geo" ;
Include "05_volumes.geo" ;
