$fn = 25;
bolt_hole = 4.5;
finger_dia = 3;
flange_od = 10;
flange_thk = finger_dia;
finger_length = 10;

difference()
{
    union()
    {
        //flange
        cylinder(d=flange_od, h=flange_thk);
        
        //finger
        translate([bolt_hole,-finger_dia/2,0])
            cube([finger_length,finger_dia,finger_dia]);
    }

cylinder(d=bolt_hole,h=flange_thk);
}