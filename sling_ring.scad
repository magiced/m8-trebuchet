$fn=25;

ring_od = 12;
ring_id = 10;

string_hole_od = 4;
string_hole_id = 2;

thk = 2;
hole_centres = 12;

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
