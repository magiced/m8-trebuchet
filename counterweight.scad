//square hole pattern

thk = 3;
box_height = 50;
radius = 10;
l = 80; //y
w = 60; //x
h = box_height+radius; //z

hole_dia = 8.5;
pivot_thk = 

module rounded_box(w,l,h,radius)
{
    // mod vals to make w,l,h 
    _w = w-2*radius;
    _l = l-2*radius;
    _h = h-2*radius;
    
    translate([radius,radius,radius])
    
    hull()
    {
        for (z = [0: _h: _h]) translate([0,0,z])
        {
            for (y = [0: _l: _l]) translate([0,y,0])
            {
                for (x = [0: _w: _w]) translate([x,0,0]) sphere(r=radius);
            }
        }
    }
}

//tub
difference()
{
rounded_box(w,l,h,radius);
translate([thk,thk,thk])rounded_box(w-2*thk,l-2*thk,h-2*thk,radius-thk);
translate([0,0,box_height]) cube([w,l,radius]);
}

//clevis

translate([0,0,0])
rotate([0,0,0])
cylinder(

//arms

//hole
