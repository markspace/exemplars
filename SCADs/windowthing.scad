//39.43mm long x
max_x=39.43;
//10mm min wide y
//11.95mm max wide y
max_y=11.95;
min_y=10;

//5.71deep
max_z=5.71;
//1.39mm bottom depth
bottom=1.39;
// wall 1.30
wall=1.30;
// window 27.14


//spoke outside to outside 23.83
//spoke inside to inside 14.82
//spoke width 4.51 y
//spoke width 4.74 x
//long spoke 13.11 z
//long spoke start 1.86mm from edge y
//short spoke 12.13 z
//spoke joined 6.38 z
//spoke gap 1.5 y
//short spoke nodule start 8mm
//short spoke max nodule x 2.44

module windowthing()
{
	difference() {
		base_shape(max_x,max_y,max_z);
		translate([0,0,bottom])
			base_shape(max_x - 2*wall, max_y - 2*wall, max_z);
	}
}

module base_shape(x,y,z)
{
	cube([x-y,y,z], center = true);
	translate([x/2 - y/2,0,0])
   		cylinder(h=z,r=y/2,center=true);
	translate([-x/2 + y/2,0,0])
   		cylinder(h=z,r=y/2,center=true);
}

windowthing();