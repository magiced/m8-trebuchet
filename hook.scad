include <MCAD/triangles.scad>

$fn=25;

wall_thk = 2;

ring_id = 7;
ring_od = ring_id + 2*wall_thk;

string_hole_id = 2;
string_hole_od = string_hole_id + 2*wall_thk;

thk = 1.5;
hole_centres = 12;

l_neck = hole_centres - ring_od/2 - string_hole_od/2;
echo(l_neck);
wall_tol = wall_thk/2;

difference()
{
union()
{
    cylinder(d=ring_od,h=thk);
    translate([hole_centres,0,0])
    cylinder(d=string_hole_od,h=thk);
        translate([ring_od/2-wall_thk/2,-wall_thk/2,0])
        cube([l_neck+wall_thk,wall_thk,thk]);


}

    //holes
    cylinder(d=ring_id,h=thk);
    translate([hole_centres,0,0])
        cylinder(d=string_hole_id,h=thk);
    //cutout
    translate([ring_od/2,wall_thk/2,0])
        rotate([0,0,90])
            triangle(ring_od/2,20,10);
}
