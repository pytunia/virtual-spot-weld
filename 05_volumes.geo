// ---------- Extrusion center
ext521[] = Extrude{0, h1, 0} {
Surface{521}; Layers{nodes321-1}; Recombine;
};
Printf("Tag for surface on top of extrusion %g", ext521[0]);
exttemp = Extrude{0, h2, 0}{
			Surface{ext521[0]}; Layers{nodes311-1}; Recombine;
};
exttemp = Extrude{0, h3, 0}{
			Surface{exttemp[0]}; Layers{1}; Recombine;
};
exttemp = Extrude{0, h4, 0}{
			Surface{exttemp[0]}; Layers{nodes334-1}; Recombine;
};



// ------ Extrusion center 2
ext522[] = Extrude{0, h1, 0} {
Surface{522}; Layers{nodes321-1}; Recombine;
};
Printf("Tag for surface on top of extrusion %g", ext522[0]);
exttemp = Extrude{0, h2, 0}{
			Surface{ext522[0]}; Layers{nodes311-1}; Recombine;
};
exttemp = Extrude{0, h3, 0}{
			Surface{exttemp[0]}; Layers{1}; Recombine;
};
exttemp = Extrude{0, h4, 0}{
			Surface{exttemp[0]}; Layers{nodes334-1}; Recombine;
};

// ------ Extrusion center 3
ext523[] = Extrude{0, h1, 0} {
Surface{523}; Layers{nodes321-1}; Recombine;
};
Printf("Tag for surface on top of extrusion %g", ext523[0]);
exttemp = Extrude{0, h2, 0}{
			Surface{ext523[0]}; Layers{nodes311-1}; Recombine;
};
exttemp = Extrude{0, h3, 0}{
			Surface{exttemp[0]}; Layers{1}; Recombine;
};
exttemp = Extrude{0, h4, 0}{
			Surface{exttemp[0]}; Layers{nodes334-1}; Recombine;
};



// Extrude all surfaces of the side
p= 1;
For(0:10)
	If ( p != 9 )
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



