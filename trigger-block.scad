include <MCAD/triangles.scad>

$fn = 25;
w_block = 10;
h_block = 50;
d_block = 5;

w_hinge = 20;
h_hinge = 20;
d_hinge = d_block/2;

y_pivot = 15;
x_pivot = 20;
dia_pivot = 4.4;

x_cone = w_block/2;
y_cone = 25;
dia_cone_base = 3;
dia_cone_top = 5;
h_cone = 4;

tri_x = 5;
tri_y = 5;

//base dims
thk_feet = 4;
screw_hole_dia = 4.5;
csk_depth = 4;
csk_dia = 8;
feet_centres = 45;
d_feet = 15;


//main block workplane
translate([0,d_block,thk_feet])
rotate([90,0,0])
{
difference()
    {
union()
    {
    //base block    
    cube([w_block,h_block,d_block]);
    //main cutout
    translate([w_block,0,0])
        cube([w_hinge,h_hinge,d_hinge]);
        //cone
    translate([x_cone,y_cone,d_block])
        cylinder(d1=dia_cone_base,d2=dia_cone_top,h=h_cone);
    }
    //hole
    translate([x_pivot,y_pivot,0])
        cylinder(d=dia_pivot,h=d_block);


    
    //hinge block chamfer
    translate([w_hinge+w_block,h_hinge,0])
    rotate([0,0,180])
    {
        triangle(tri_x,tri_y,d_block);
    }
}    
} //end of main block workplane

translate([-7.5,-2.5,0])
foot();

module foot()
    {
        
    difference()
    {
        //rounded foot shape
        hull()
        {
            cylinder(d=d_feet,h=thk_feet);
            translate([feet_centres,0,0])    
                cylinder(d=d_feet,h=thk_feet);
        }
        //screw hole and countersinks
        translate([0,0,thk_feet])
            csk_screw_hole(screw_hole_dia,thk_feet,csk_dia,csk_depth);
        translate([feet_centres,0,thk_feet])
            csk_screw_hole(screw_hole_dia,thk_feet,csk_dia,csk_depth);
    }
}    
    
module csk_screw_hole(screw_dia, screw_depth, csk_dia, csk_depth)
{
    translate([0,0,-screw_depth])
        cylinder(d=screw_dia,h=screw_depth);
    
    translate([0,0,-csk_depth])
//        cylinder(d1=screw_dia,d2=csk_dia,csk_depth);
        cylinder(d1=0,d2=csk_dia,csk_depth);
}
