$fn = 25;
radius = 20;
width = 80; //x
length = 80; //y
h_pivot = 80;
h_tub = 60;
od_pivot = 20;
face_dia = 17;
h_boss = 5;
hole_dia = 8.8;
thk = 2;

mid_clevis_width = width-2*thk-2*h_boss;

echo("Width between bosses: ", mid_clevis_width);

difference()
{
union()
{
difference()
{
//outer hull
    hull()
    {
        translate([0,radius,radius]) rotate([0,90,0]) cylinder(r=radius,h=width);

        translate([0,length-radius,radius]) rotate([0,90,0]) cylinder(r=radius,h=width);

        translate([0,0,h_tub]) cube([width,length,0.1]);

        translate([0,length/2,h_pivot]) rotate([0,90,0]) cylinder(d=od_pivot,h=width);
    }

    //inner cutout
    hull()
    {
        i_rad = radius - thk;
        i_width = width - 2*thk;
        i_length = length - 2*thk;
        translate([thk,thk,thk])
        {
        translate([0,i_rad,i_rad]) rotate([0,90,0]) cylinder(r=i_rad,h=i_width);

        translate([0,i_length-i_rad,i_rad]) rotate([0,90,0]) cylinder(r=i_rad,h=i_width);

        translate([0,0,h_pivot+od_pivot]) cube([i_width,i_length,0.1]);
        }
    }
}

    translate([thk,length/2,h_pivot]) rotate([0,90,0]) cylinder(d1=od_pivot,d2=face_dia,h=h_boss);
    translate([width-thk,length/2,h_pivot]) rotate([0,-90,0]) cylinder(d1=od_pivot,d2=face_dia,h=h_boss);
}    
translate([0,length/2,h_pivot]) rotate([0,90,0]) cylinder(d=hole_dia,h=width);
}