$fn = 25;
stud_dia = 8.5;
wall_thk = 1;
base_thk = 1;
cap_depth = 8;

difference()
{
cylinder(d=(stud_dia+wall_thk*2),h=cap_depth);
translate([0,0,base_thk])
    cylinder(d=stud_dia,h=cap_depth);
}