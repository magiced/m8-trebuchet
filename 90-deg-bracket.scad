$fn = 25;

stud_clear_dia = 8.5;
washer_dia = 17;
thk = washer_dia;

module hollow_cylinder(id,od,height)
{
    difference()
    {
        cylinder(d=od,h=height);
        cylinder(d=id,h=height);
    }
    
}

//outers
difference()
{
    union()
    {
        //vertical cylinder
        cylinder(d=washer_dia,h=thk);
        
        //middle block
        translate([-washer_dia/2,0,0])
            cube([washer_dia,washer_dia*(2/3),washer_dia]);
        
     //horizontal cylinder   
        translate([-thk/2,washer_dia*(2/3),thk/2])
            rotate([0,90,0])
                cylinder(d=washer_dia,h=thk);
    }

//holes
cylinder(d=stud_clear_dia,h=thk);
translate([-thk/2,washer_dia*(2/3),thk/2])
    rotate([0,90,0])
        cylinder(d=stud_clear_dia,h=thk);
}
/*
hollow_cylinder(id=stud_clear_dia, od=washer_dia, height=thk);
translate([-thk/2,washer_dia*(2/3),thk/2])
    rotate([0,90,0])
        hollow_cylinder(id=stud_clear_dia, od=washer_dia, height=thk);
*/
    