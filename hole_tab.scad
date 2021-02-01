


module hole_tab(dia,hole_dia,l_centre_to_end,tab_thk)
{
    difference()
    {
        hull()
        {
            cylinder(d=dia,h=tab_thk);
            translate([l_centre_to_end-0.1,-dia/2,0])
                cube([0.1,dia,tab_thk]);
        }
        //hole
        cylinder(d=hole_dia,h=tab_thk);
    }
}

hole_tab(20,10,50,5);