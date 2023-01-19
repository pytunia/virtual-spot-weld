###  ptn_functions.geo

The ptn_functions.geo file contains various functions to solve for geometrical problems. All functions are designed for 2D space, i.e. the z-coordinate is ignored, unless otherwise stated.

#### calc_intersection_line_circle

**Description**

Calculates the x and y coordinates of a point on the intersection between a line and a circle.
Returns x and y coordinates of the point of the intersection.

**Parameters**   

| **Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** | **Description** | Default |
| -------- | --------- | --------- |
| `ptn_p1` and `ptn_p2` | Endpoints of a line. | required | 
| `ptn_p3` | Point at center of circle. | required | 
| `ptn_circ_rad` | Radius of circle. | required | 

** Returns**   
There are two solutions for the intersection between a line and a circle.   

| **Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** | **Description** |
| -------- | --------- |
| `ptn_inter1_x`| X-coordinate of first solution. | 
| `ptn_inter1_y`| Y-coordinate of first solution. | 
| `ptn_inter2_x`| X-coordinate of second solution. | 
| `ptn_inter2_y`| Y-coordinate of second solution. | 


#### calc_intersection_of_two_arcs

**Description**

Calculates the x and y coordinates of a point on the intersection between two arcs or circles of the same radius.

**Parameters**   

| **Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** | **Description** | Default |
| -------- | --------- | --------- |
| `ptn_p1` | Point at center of first circle. | required | 
| `ptn_p2` | Point at center of second circle. | required | 
| `ptn_circ_rad_1` | Radius of first circle. | required | 
| `ptn_circ_rad_2` | Radius of second circle. | required | 

** Returns**   
The function returns two solutions for intersection between two arcs or circles.  

| **Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** | **Description** |
| -------- | --------- |
| `ptn_inter1_x`| X-coordinate of first solution. | 
| `ptn_inter1_y`| Y-coordinate of first solution. | 
| `ptn_inter2_x`| X-coordinate of second solution. | 
| `ptn_inter2_y`| Y-coordinate of second solution. | 




#### calc_angle_btw_two_vectors

**Description**

Calculates angle between two vectors / lines with originate at the same point.
Returns angle in radians.

**Parameters**   

| **Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** | **Description** | Default |
| -------- | --------- | --------- |
| `ptn_p1` | Origin of both vectors / lines. | required | 
| `ptn_p2` | Endpoint of first line.. | required | 
| `ptn_p3` | Endpoint of second line. | required | 

** Returns**   
The function returns the intersection between two arcs or circles.  

| **Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** | **Description** |
| -------- | --------- |
| `ptn_anglex`| Angle between two vectors in radians. | 



#### calc_intersection_btw_two_lines

**Description**

Calculates the x and y coordinates of a point on the intersection between two lines. 

**Parameters**   

| **Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** | **Description** | Default |
| -------- | --------- | --------- |
| `ptn_p1` and `ptn_p2` | Endpoints of first line. | required | 
| `ptn_p3` and `ptn_p4` | Endpoints of second line. | required | 

** Returns**   
Returns intersection between two lines. 

| **Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** | **Description** |
| -------- | --------- |
| `ptn_inter_x`| X-coordinate of intersetion. | 
| `ptn_inter_y`| Y-coordinate of intersetion. |



#### calc_distance_btw_two_points

**Description**

Calculates the distance between two points. Works in 3D space.

**Parameters**   

| **Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** | **Description** | Default |
| -------- | --------- | --------- |
| `ptn_p1` | Point in 3D space. | required | 
| `ptn_p2` | Point in 3D space. | required | 

** Returns**   
Returns shortest distance between two points.  

| **Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** | **Description** |
| -------- | --------- |
| `ptn_dist`| Distance between two points. | 


### ptn_bezier_functions.geo

#### slice_bezier_param

**Description**  
Slices a cubic Bezier curve into two cubic Bezier curves. Endpoints are startpoint (`ptn_p1`) of first Bezier curve and endpoint (`ptn_p4`) of second Bezier curve.

**Parameters**   

| **Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** | **Description** | Default |
| -------- | --------- | --------- |
| `ptn_param` | Ratio at which curve is split. | required | 
| `ptn_p1` | End point of Bezier curve. | required | 
| `ptn_p2` | Control point of Bezier curve. | required | 
| `ptn_p3` | Control point of Bezier curve. | required | 
| `ptn_p4` | End point of Bezier curve. | required | 

** Returns**   

| **Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** | **Description** |
| -------- | --------- |
| `x12` and `y12`| Coordinates of control point for first new curve. | 
| `x123` and `y123` | Coordinates of control point for first new curve. | 
| `x1234` and `y1234` | Coordinates of splitting point. End point for both new bezier curves. | 
| `x234` and `y234`| Coordinates of control point for second new curve. | 
| `x34` and `y34` | Coordinates of control point for second new curve. | 



#### calc_intersection_Bezier_line


**Description**  
Calculates the intersection between a Bezier curve and a line by using the Newton's method.

**Parameters**   

| **Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** | **Description** | Default |
| -------- | --------- | --------- |
| `ptn_p1` | End point of Bezier curve. | required | 
| `ptn_p2` | Control point of Bezier curve. | required | 
| `ptn_p3` | Control point of Bezier curve. | required | 
| `ptn_p4` | End point of Bezier curve. | required |  
| `ptn_pline1` and `ptn_pline2` | End points of line. | required |  

** Returns**   
Calculates parameter, i.e. ratio at which Bezier needs to be split. Necessary as input for slice_bezier_param.

| **Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** | **Description** |
| -------- | --------- |
| `ptn_param`| Ratio at which curve is split for intersection. | 

#### Example
Slice circlular arc of radius 1 centered at origin (0,0) with a horizontal line at y=0.5.

```
Include "ptn_bezier_functions.geo";

k=0.5522847498;
Point(1) = {0, 1, 0};
Point(2) = {k, 1, 0};
Point(3) = {1, k, 0};
Point(4) = {1, 0, 0};


ptn_p1[] = Point{1};
ptn_p2[] = Point{2};
ptn_p3[] = Point{3};
ptn_p4[] = Point{4};

ptn_pline1[] = {0., 0.5, 0.};  // start point line
ptn_pline2[] = {10., 0.5, 0.}; // end point line


Call calc_intersection_Bezier_line;

Call slice_bezier_param;


Point(1002) = {ptn_x12, ptn_y12, 0}; // Control point
Point(1003) = {ptn_x123, ptn_y123, 0}; // Control point
Point(1004) = {ptn_x1234, ptn_y1234, 0}; // Intersecting
Point(1005) = {ptn_x234, ptn_y234, 0}; // Control point
Point(1006) = {ptn_x34, ptn_y34, 0}; // Control point
Bezier(101)  = {1, 1002, 1003, 1004};
Bezier(102)  = {1004, 1005, 1006, 4};
```
