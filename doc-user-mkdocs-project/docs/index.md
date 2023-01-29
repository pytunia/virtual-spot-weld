# Welcome to virtual-spot-weld

Generate a structured mesh with only hexahedral elements for a spot weld finite element calculation.

## Getting Started

* Download and install Gmsh: [https://gmsh.info/](https://gmsh.info/) 
* Download virtual-spot-weld repository
* Open `00_main.geo` in Gmsh
* Set parameters on the interface or in `10_parameters/02_custom_parameters.geo`
* Click on `Modules -> Geometry -> Reload script` to reload the new geometry
* Click on `Modules -> Mesh -> 3D` to create mesh
* Press `Alt + Shift + B` to inspect the mesh
* Use `File -> Export...` and choose any Mesh file format
* Edit the final spot weld mesh in a software of your choosing!
