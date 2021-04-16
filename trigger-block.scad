include <MCAD/triangles.scad>

$fn = 25;
w_block = 10;
h_block = 40;
d_block = 5;

w_hinge = 20;
h_hinge = 20;
d_hinge = d_block/2;

y_pivot = 15;
x_pivot = 16;
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

/***** trigger *****/

// trigger workplane - centre on pivot point
//color("blue")
//translate([x_pivot,2,y_pivot+thk_feet])
//rotate([90,0,0])
//{
//    dia_pivot_hole = 4.4;
//    dia_pivot = 10;
//    l_hole_to_spine = 5;
//    thk_trig = 2;
//    
//    x_tri = 10;
//    y_tri = 5;
//    thk_tri = 5;
//    
//    l_trigger = 30;
//    w_spine = 6;
//    
//    pull_tab_hole = 2;
//    od_pull_tab = 4;
//    l_pull_tab = 3;
//    
//    chamfer = 5;
//    difference()
//    {
//    union()
//    {
//    // pivot tab
//    hole_tab(dia_pivot,dia_pivot_hole,l_hole_to_spine,thk_trig);
//    
//    // main spine
//    translate([l_hole_to_spine,-dia_pivot/2,0])
//    rotate([0,0,0])
//    cube([w_spine,l_trigger,thk_trig]);
//    
//    // triangle bit
//    translate([l_hole_to_spine,l_trigger-dia_pivot/2-y_tri,0])
//    rotate([0,0,90])
//    triangle(x_tri,y_tri,thk_tri);
//    
//    translate([l_hole_to_spine,l_trigger-dia_pivot/2,thk_trig])
//    rotate([90,0,0])
//    triangle(thk_tri-thk_trig,w_spine,thk_tri);
//    
//    // chamfer
//    translate([l_hole_to_spine,dia_pivot/2,0])
//    rotate([0,0,90])
//    triangle(3,2,thk_trig);
//    
//    // pull tab
//    translate([l_hole_to_spine+l_pull_tab+w_spine,l_trigger-dia_pivot/2-y_tri,thk_trig])
//    rotate([0,180,0])
//    hole_tab(od_pull_tab,pull_tab_hole,l_pull_tab,thk_trig);
//    
//}
//    // chamfer
//    translate([l_hole_to_spine+w_spine,-dia_pivot/2,0])
//    rotate([0,0,90])
//    triangle(chamfer,chamfer,thk_trig);
//
//    //rubber band dent
//    translate([l_hole_to_spine+w_spine,10,0])
//    rotate([0,0,90])
//    cylinder(d=4,h=thk_trig);
//
//
//
//}
//    
//}   //end trigger workplane

/***** end trigger *****/

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

module hole_tab(dia,hole_dia,l_centre_to_end,tab_thk)
{
    difference()
    {
        hull()
        {
            cylinder(d=dia,h=tab_thk);
            translate([l_centre_to_end-0.1,-dia/2,0])
                cube([0.1,dia,tab_thk]);
        }
        //hole
        cylinder(d=hole_dia,h=tab_thk);
    }
}

