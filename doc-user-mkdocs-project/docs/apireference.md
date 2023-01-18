###  ptn_functions.geo

The ptn_functions.geo file contains various functions to solve for geometrical problems. All functions are designed for 2D space, i.e. the z-coordinate is ignored.

#### calc_intersection_line_circle

**Description**

Calculates the x and y coordinates of a point on the intersection between a line and a circle.
Returns x and y coordinates of the point of the intersection.

**Parameters**

ptn_p1 and ptn_p2 are endpoints of a line.  
ptn_p3 is point at center of circle.      
ptn_circ_rad is radius of circle.   

**What the function returns**

There are two solutions for the intersection between a line and a circle.   
ptn_inter1_x is x-coordinate of first solution.   
ptn_inter1_y is y-coordinate of first solution.
ptn_inter2_x is x-coordinate of second solution.   
ptn_inter2_y is y-coordinate of second solution.   

#### calc_intersection_of_two_arcs
**Description**

Calculates the x and y coordinates of a point on the intersection between two arcs or circles of the same radius.

**Parameters**
ptn_p1 is point at center of first circle.
ptn_p2 is point at center of second circle.
ptn_circ_rad is radius of both circles.

**What the function returns**
The function returns the intersection between two arcs or circles.
ptn_xinter is x-coordinate of intersection.
ptn_yinter is y-coordinate of intersection.

#### calc_angle_btw_two_vectors

**Description**

Calculates angle between two vectors / lines with originate at the same point.
Returns angle in radians.

**Parameters**

ptn_p1 is origin of both vectors / lines.  
ptn_p2 is endpoint of first line.    
ptn_p3 is endpoint of second line.  


**What the function returns**
Returns angle between two vectors.  
ptn_anglex is angle in radians.

#### calc_intersection_btw_two_lines

**Description**

Calculates the x and y coordinates of a point on the intersection between two lines. 


**Parameters**

ptn_p1 and ptn_p2 are endpoints of first line.    
ptn_p3 and ptn_p4 are endpoints of second line.


**What the function returns**  

Returns intersection between two lines.
ptn_inter_x is x-coordinate of intersetion.
ptn_inter_y is y-coordinate of intersection.

#### calc_distance_btw_two_points

**Description**

Calculates the distance between two points.


**Parameters**

ptn_p1 and ptn_p2 are two points in 2D space.

**What the function returns**  

Returns shortest distance between two points.  
ptn_dist is distance between two points.

### ptn_bezier_functions.geo