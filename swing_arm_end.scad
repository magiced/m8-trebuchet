box = 11;
box_length = 30;
stud_dia = 8.2;
stud_hole_length = box_length-3;
flange_bolt_dia = 4.4;
flange_dia = box;
flange_thk = 3;
flange_finger_width = 3;
flange_length = 12;
m8_clr_length = 8;
m8_clr_width = 16;
nut_gap_center = 13;
nut_gap_circle_dia = 26;
nut_gap_circle_thk = 4;

color("blue") //just so it looks like the colour of my print filament!

difference()
{
    /* make base shape */
    union()
    {
        hull()
        {
        // box
        translate([-box/2,0,0])
            cube([box,box_length,box]);
                   
        // flange
        translate([-box/2,box_length+flange_length/2,box/2])
            rotate([-90,0,-90])
                cylinder(d=flange_dia,h=box);
        }
            
        //nut_hole_piece
        translate([0,nut_gap_center,0])
            cylinder(d=nut_gap_circle_dia, h=nut_gap_circle_thk);
    }

    /* then cut these bits out of it */
    
    //hole
    translate([0,0,box/2])
        rotate([-90,0,0])
            cylinder(d=stud_dia,h=stud_hole_length);

    //flange hole
    translate([-box/2,box_length+flange_length/2,box/2])
        rotate([-90,0,-90])
            cylinder(d=flange_bolt_dia,h=box);
    
    //flange cut
        translate([-(box/2)+flange_thk,box_length,0])  
            cube([box,flange_length,box]);

    // nut hole
    translate([0,nut_gap_center-m8_clr_length/2,box/2])
        rotate([-90,0,0])
            cylinder(d=m8_clr_width,h=m8_clr_length);
}