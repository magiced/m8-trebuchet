$fn = 25;
stud_dia = 7.95;
wall_thk = 1.5;
base_thk = 1;
cap_depth = 8;

//todo add internal/external chamfer
//todo add interal ribs from library

module rotational_chamfer_equal_sides(od,chamfer_size,overlap_tol=0.1)
{
    o_rad = od/2;
    rotate_extrude()
    {
    polygon( points = [[o_rad-chamfer_size,0-overlap_tol], [o_rad+overlap_tol,chamfer_size], [o_rad+overlap_tol,0-overlap_tol]]);
    }
}

difference()
{
    union()
    {
        cylinder(d=(stud_dia+wall_thk*2),h=cap_depth-wall_thk);
        
        translate([0,0,cap_depth-wall_thk])
            rotational_chamfer_equal_sides(stud_dia+wall_thk*2,wall_thk,0);
    }
    translate([0,0,base_thk])
        cylinder(d=stud_dia,h=cap_depth);
    
    rotational_chamfer_equal_sides(stud_dia+wall_thk*2,1);
}
