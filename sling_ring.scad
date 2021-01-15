$fn=25;

wall_thk = 1.5;

ring_id = 12;
ring_od = ring_id + 2*wall_thk;

string_hole_id = 2;
string_hole_od = string_hole_id + 2*wall_thk;


thk = 1.5;
hole_centres = 10;

difference()
{
hull()
{
    cylinder(d=ring_od,h=thk);
    translate([hole_centres,0,0])
    cylinder(d=string_hole_od,h=thk);
}

    cylinder(d=ring_id,h=thk);
    translate([hole_centres,0,0])
        cylinder(d=string_hole_id,h=thk);
}
