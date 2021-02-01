$fn = 25; //boots

l_finger = 40;
dia_finger = 5;

stud_clear_dia = 8.5;
washer_dia = 17;
thk = dia_finger;

module hollow_cylinder(id,od,height)
{
    difference()
    {
        cylinder(d=od,h=height);
        cylinder(d=id,h=height);
    }
    
}

union()
{
//ring
hollow_cylinder(id=stud_clear_dia, od=washer_dia, height=thk);

//finger
translate([0,washer_dia/2-1,dia_finger/2])
rotate([270,0,0])
cylinder(d=dia_finger,h=l_finger);
}
    