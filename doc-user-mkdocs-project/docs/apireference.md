###  ptn_functions.geo

The ptn_functions.geo file contains various functions to solve for geometrical problems. All functions are designed for 2D space, i.e. the z-coordinate is ignored.

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
| `ptn_circ_rad` | Radius of both circles. | required | 

** Returns**   
The function returns the intersection between two arcs or circles.  

| **Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** | **Description** |
| -------- | --------- |
| `ptn_xinter`| X-coordinate of intersection. | 
| `ptn_yinter`| Y-coordinate of intersection. | 




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

Calculates the distance between two points.

**Parameters**   

| **Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;** | **Description** | Default |
| -------- | --------- | --------- |
| `ptn_p1` | Point in 2D space. | required | 
| `ptn_p2` | Point in 2D space. | required | 

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
