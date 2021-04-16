cube_dims = 20;
thk = 0.8;
inner_cube_dims = cube_dims - thk*2;

marker_x_h = 6.6;
marker_x_l = 6.6;
marker_y_h = 10-4.2;
marker_y_l = 10-1;
marker_spacing = 0.4;

marker_square_dim = 2;
marker_square_length = thk;

difference()
{
cube([cube_dims,cube_dims,cube_dims]);
translate([thk,thk,thk])
    cube([inner_cube_dims,inner_cube_dims,cube_dims]);
    
    // x marker
    translate([marker_x_l,0,marker_x_h])
    {
        cube([marker_square_dim,marker_square_length,marker_square_dim]);
        translate([(2*marker_square_dim+2*marker_spacing),0,0])
            cube([marker_square_dim,marker_square_length,marker_square_dim]);
        
        translate([(marker_square_dim+marker_spacing),0,(marker_square_dim+marker_spacing)])
            cube([marker_square_dim,marker_square_length,marker_square_dim]);
        
        translate([0,0,(2*marker_square_dim+2*marker_spacing)])
            cube([marker_square_dim,marker_square_length,marker_square_dim]);
        translate([(2*marker_square_dim+2*marker_spacing),0,(2*marker_square_dim+2*marker_spacing)])
            cube([marker_square_dim,marker_square_length,marker_square_dim]);  
    }
    
    // y marker
    translate([0,marker_y_l,marker_y_h])
    {
        cube([marker_square_length,marker_square_dim,marker_square_dim*2]);
        
        translate([0,-(marker_square_dim+marker_spacing),marker_square_dim*2+marker_spacing])
            cube([marker_square_length,marker_square_dim,2*marker_square_dim]);
        
        translate([0,(marker_square_dim+marker_spacing),marker_square_dim*2+marker_spacing])
            cube([marker_square_length,marker_square_dim,2*marker_square_dim]);
        
    }
}


// y marker