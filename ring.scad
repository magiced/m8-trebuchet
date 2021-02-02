


module ring(od,id,thk)
{
    difference()
    {
        cylinder(d=od,h=thk);
        cylinder(d=id,h=thk);
    }
}

ring(30,4.5,1.6);