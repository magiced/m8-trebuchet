l_trough = 220;
d_trough = 30;
h_trough = 25;
cl_h_trough = 0;
thk_trough = 2;
w_base = 15;
thk_base = 2;
thk_feet = 4;
screw_hole_dia = 4.5;
csk_depth = 4;
csk_dia = 8;
feet_centres = d_trough+ 5;
d_feet = 15;

//trough

{
    // trough
    difference()
    {
        union()
        {
        // trough outer
            translate([0,0,d_trough/2+cl_h_trough])
            rotate([-90,0,0])
            {
            cylinder(d=d_trough,h=l_trough);
                translate([-d_trough/2,-(h_trough-d_trough/2),0]) // 
                    cube([d_trough,h_trough-d_trough/2,l_trough]);
            }
            
            // base cube
            translate([-w_base/2,0,0])
            cube([w_base,l_trough,thk_base]);
            // feet
            translate([0,l_trough/3,0])
            foot();
            translate([0,2*l_trough/3,0])
            foot();
        }
        
        //inner trough cutout
        id = d_trough-2*thk_trough;
        translate([0,0,d_trough/2+cl_h_trough])
        rotate([-90,0,0])
        {
            cylinder(d=id,h=l_trough);
                   translate([-id/2,-(h_trough),0]) // 
                        cube([id,h_trough,l_trough]);
        }

    }
    // trough sides
    



}





module foot()
    {
        translate([-feet_centres/2,0,0])
        {
    difference()
    {
        //rounded foot shape
        hull()
        {
            cylinder(d=d_feet,h=thk_feet);
            translate([feet_centres,0,0])    
            cylinder(d=d_feet,h=thk_feet);
        }
        //screw hole and countersinks
        translate([0,0,thk_feet])
            csk_screw_hole(screw_hole_dia,thk_feet,csk_dia,csk_depth);
        translate([feet_centres,0,thk_feet])
            csk_screw_hole(screw_hole_dia,thk_feet,csk_dia,csk_depth);
    }
}
    
    }    
    
module csk_screw_hole(screw_dia, screw_depth, csk_dia, csk_depth)
{
    translate([0,0,-screw_depth])
        cylinder(d=screw_dia,h=screw_depth);
    
    translate([0,0,-csk_depth])
//        cylinder(d1=screw_dia,d2=csk_dia,csk_depth);
        cylinder(d1=0,d2=csk_dia,csk_depth);
}
