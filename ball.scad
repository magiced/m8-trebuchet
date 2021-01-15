ball_dia = 20;
flat_dist = 4;
hole_dia = 2;
spotface_dia = 3;
spotface_depth = 3;

difference()
{
translate([0,0,(ball_dia/2)-flat_dist])
sphere(d=ball_dia);
    
//hole
cylinder(d=hole_dia,h=ball_dia,$fn=20);
    
//spotface
cylinder(d=spotface_dia,h=spotface_depth);
    
//cut_face
    
translate([0,0,-5])
    cube([100,100,10],center=true);
    
}
