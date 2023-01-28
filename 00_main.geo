Include "99_functions\ptn_functions.geo";
Include "99_functions\ptn_bezier_functions.geo";

Geometry.CopyMeshingMethod = 1;
Geometry.AutoCoherence = 0;

Include "10_parameters\01_default_parameters.geo";
// Include "10_parameters\02_custom_parameters.geo";
flag_halo = 0;


Include "01_fusion_zone\01_lines.geo";
Coherence;
Include "01_fusion_zone\02_seeds.geo";
Coherence;
Include "01_fusion_zone\03_volumes.geo";
Coherence;

Include "02_heat_affected_zone\01_lines.geo";
Coherence;
Include "02_heat_affected_zone\02_seeds.geo";
Coherence;
Include "02_heat_affected_zone\03_volumes.geo";
Coherence;


Include "03_base_material\01_lines.geo";
Coherence;
Include "03_base_material\02_seeds.geo";
Coherence;
Include "03_base_material\03_volumes.geo";
Coherence;



// ----
//Geometry.Tolerance = 1e-4; // equivalence
//Mesh.ElementOrder = 1;
//Mesh.Algorithm3D = 1;
//Mesh 3;
//Coherence Mesh;
//
