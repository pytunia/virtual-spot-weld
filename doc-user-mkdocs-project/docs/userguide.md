### Mesh construction
The information in this guide explains how the mesh is constructed. Including: 

* Where to find the parameters in the geometry
* How the geometry is constrained by various parameters
* Step-by-step guide on how the mesh geometry is calculated

The default settings lead to well constructed meshes in most cases.
Sometimes it might be necessary to customize some parameters.
This guide will help you to find the position in the .geo-files, where you need to make adjustments for your specific cases.

#### Fusion zone

`01_fusion_zone.geo`

##### Overview


##### Center of fusion zone
![Center of fusion zone](images\01_fusion_zone_center.PNG){ width="300px" }  
Generally, the coordinates of the points are set first. For the definition of lines the point with lower tag is given first.
Therefore the direction of lines is usually from the lower point tag to the higher point tag.  

##### Create fusion zone boundary outside
![Fusion Zone boundary Outside 1](images\01_fusion_zone_boundary_outside_1.PNG){ width="400px" }  
A cubic Beziér curve is given, which spans the contour from Point(116) to (14).
The curve is then split into two separate Beziér curves. One curve runs from Point(14) to Point(15) the other one from Point(15) to Point(116).
File `06_create_bezier.geo` handels the splitting of the curves.

![Fusion Zone boundary Outside 2](images\01_fusion_zone_boundary_outside_2.PNG){ width="400px" }  
The cubic Bezier curve from Point(15) to (116) is split again at Point(6). A new cubic Bezier curve is given to describe the contour from Point(15) to (6). 
The position for Point(6) does not depend on the angle of the weld nugget. This allows to generate congruent meshes. As long as the weld nugget diameter is the same for two spot weld halves.
The mesh will be congruent at the interface.  
In order to get a continous line from Point(16) to (17) the cubic Beziér and the straight horizontal line need to be fused. The resulting Beziér curve (325) is of grade 5.

##### Create fusion zone boundary inside
![Fusion Zone boundary Inside](images\01_fusion_zone_boundary_inside_2.PNG){ width="400px" }  
The contour from Point(9) to Point(12) consists of three Beziér curves. They are generated in the same way as the outside contour.

##### Y-grid transition corner to arc
![Fusion Zone Y-grid 1](images\01_fusion_zone_ygrid_1.PNG){ width="400px" }  
In order to create a structured mesh, all surfaces must be constructed using four lines which make four corners. This is not yet the case at the front part of the mesh. 
Therefore, a so called y-grid is created. Four steps are necessary: 

* Calculate position of Point(8).
* Create circular arc spanning from Point(7) to (8) with center at Point(200).
* Create circular arc spanning from Point(8) to (106) with center at Point(201).
* Calculate position of Point(6).
* Create Beziér curve from Point(6) to Point(4).

![Fusion Zone Y-grid 2](images\01_fusion_zone_ygrid_2.PNG){ width="400px" }  
Lorem ipsum

#####  Create Bezier curves
![Fusion Zone Complete](images\01_fusion_zone_complete.PNG){ width="400px" }  
Lorem ipsum


```c
int foo (void) 
{
    int i;
}
```

## Heat-affected zone
```c
int foo (void) {
    int i;
}
```

## Softened heat-affected zone

## Base material

## Coarsening

## Square fill