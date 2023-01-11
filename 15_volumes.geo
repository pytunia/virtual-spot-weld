// check if odd or even number of rows over thickness
If (Round(t0*10) % 2 == 0)
		num_layers = nodes321-1;
	Else
		num_layers = nodes321-2;
EndIf

// ---------- Extrusion center
ext521[] = Extrude{0, h1, 0} {
Surface{521}; Layers{num_layers}; Recombine;
};
Printf("Tag for surface on top of extrusion %g", ext521[0]);
exttemp = Extrude{0, h2, 0}{
			Surface{ext521[0]}; Layers{nodes311-1}; Recombine;
};
//exttemp = Extrude{0, h3, 0}{
//			Surface{exttemp[0]}; Layers{1}; Recombine;
//};
exttemp = Extrude{0, t0-(h1+h2), 0}{
			Surface{exttemp[0]}; Layers{nodes334-1}; Recombine;
};



// ------ Extrusion center 2
ext522[] = Extrude{0, h1, 0} {
Surface{522}; Layers{num_layers}; Recombine;
};
Printf("Tag for surface on top of extrusion %g", ext522[0]);
exttemp = Extrude{0, h2, 0}{
			Surface{ext522[0]}; Layers{nodes311-1}; Recombine;
};
//exttemp = Extrude{0, h3, 0}{
//			Surface{exttemp[0]}; Layers{1}; Recombine;
//};
exttemp = Extrude{0, t0-(h1+h2), 0}{
			Surface{exttemp[0]}; Layers{nodes334-1}; Recombine;
};

// ------ Extrusion center 3
ext523[] = Extrude{0, h1, 0} {
Surface{523}; Layers{num_layers}; Recombine;
};
Printf("Tag for surface on top of extrusion %g", ext523[0]);
exttemp = Extrude{0, h2, 0}{
			Surface{ext523[0]}; Layers{nodes311-1}; Recombine;
};
// = Extrude{0, h3, 0}{
//			Surface{exttemp[0]}; Layers{1}; Recombine;
//};
exttemp = Extrude{0, t0-(h1+h2), 0}{
			Surface{exttemp[0]}; Layers{nodes334-1}; Recombine;
};



// Extrude all surfaces of the side
p= 1;
For(0:10)
	If (( p != 4 ) && (p != 5 ) && (p != 9 ))
	Printf("p %g", p);
	  exttemp[] = Extrude{{0, -1, 0}, {0, 0, 0}, Pi/4}{
		   Surface{500+p}; Layers{nodes_8thcircum}; Recombine;
	   };
	  exttemp[] = Extrude{{0, -1, 0}, {0, 0, 0}, Pi/4}{
		   Surface{exttemp[0]}; Layers{nodes_8thcircum}; Recombine;
	  };
    EndIf
  p++ ;
EndFor
//


Surface Loop(2001) = {524, 526, 528, 530, 532, 534};
Volume(2001) = {2001};

Printf("Tag for surface on top of extrusion %g", exttemp[3]);

// Create irregular volume from 8 surfaces
// surface 1 is (exttemp[0] - 3)

Surface Loop(2002) = {534, 538, 540, 541, 542, 536};
Volume(2002) = {2002};


allVolumes[] = Volume "*" ;

Transfinite Volume{allVolumes[]};



