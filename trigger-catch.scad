include <MCAD/triangles.scad>

$fn = 25;

    dia_pivot_hole = 4.4;
    dia_pivot = 10;
    l_hole_to_spine = 5;
    thk_trig = 2;
    
    x_tri = 10;
    y_tri = 5;
    thk_tri = 5;
    
    l_trigger = 30;
    w_spine = 6;
    
    pull_tab_hole = 2;
    od_pull_tab = 4;
    l_pull_tab = 3;
    
    chamfer = 5;
    difference()
    {
    union()
    {
    // pivot tab
    hole_tab(dia_pivot,dia_pivot_hole,l_hole_to_spine,thk_trig);
    
    // main spine
    translate([l_hole_to_spine,-dia_pivot/2,0])
    rotate([0,0,0])
    cube([w_spine,l_trigger,thk_trig]);
    
    // triangle bit
    translate([l_hole_to_spine,l_trigger-dia_pivot/2-y_tri,0])
    rotate([0,0,90])
    triangle(x_tri,y_tri,thk_tri);
    
    translate([l_hole_to_spine,l_trigger-dia_pivot/2,thk_trig])
    rotate([90,0,0])
    triangle(thk_tri-thk_trig,w_spine,thk_tri);
    
    // chamfer
    translate([l_hole_to_spine,dia_pivot/2,0])
    rotate([0,0,90])
    triangle(3,2,thk_trig);
    
    // pull tab
    translate([l_hole_to_spine+l_pull_tab+w_spine,l_trigger-dia_pivot/2-y_tri,thk_trig])
    rotate([0,180,0])
    hole_tab(od_pull_tab,pull_tab_hole,l_pull_tab,thk_trig);
    
}
    // chamfer
    translate([l_hole_to_spine+w_spine,-dia_pivot/2,0])
    rotate([0,0,90])
    triangle(chamfer,chamfer,thk_trig);

    //rubber band dent
    translate([l_hole_to_spine+w_spine,10,0])
    rotate([0,0,90])
    cylinder(d=4,h=thk_trig);



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