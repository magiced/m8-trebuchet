$fn = 25;

stud_clear_dia = 8.5;
washer_dia = 17;
thk = washer_dia;
flange_width = 10;
base_width = 17+flange_width*2;
base_hole_centres = base_width - flange_width;
base_depth = 5;
screw_hole_dia = 4.5;
csk_depth = 4;
csk_dia = 8;
centre_height = 20;

module csk_screw_hole(screw_dia, screw_depth, csk_dia, csk_depth)
{
    translate([0,0,-screw_depth])
        cylinder(d=screw_dia,h=screw_depth);
    
    translate([0,0,-csk_depth])
//        cylinder(d1=screw_dia,d2=csk_dia,csk_depth);
        cylinder(d1=0,d2=csk_dia,csk_depth);
}

//base solid
difference()
{
    union()
    {
        //vertical cylinder
        cylinder(d=washer_dia,h=thk);
        
        //middle block
        translate([-washer_dia/2,0,0])
            cube([washer_dia,centre_height-base_depth,washer_dia]);
        
        //base block
        translate([-base_width/2,centre_height-base_depth,0])
            cube([base_width,base_depth,thk]);
       
    }

//stud bar hole
cylinder(d=stud_clear_dia,h=thk);
    
        //screw hole and countersink
    rotate([90,0,0])
    {
    translate([base_hole_centres/2,thk/2,-(centre_height-base_depth)])
        csk_screw_hole(screw_hole_dia,base_depth,csk_dia,csk_depth);
    translate([-base_hole_centres/2,thk/2,-(centre_height-base_depth)])
        csk_screw_hole(screw_hole_dia,base_depth,csk_dia,csk_depth);
    }
    
}

    