// Torch clamp
//

bolthead_d=8;
bolthead_h=5.2;
bolt_d=5;
bolt_h=12;

torchclamp();

module torchclamp() {

	difference() {
		cube([24, 25, 20]);
		translate([12,12.5,20]) torch();
		//translate([0,0,-12]) barclamp();
		translate([12,19.5,7.8]) bolt();
		translate([12,5.5,7.8]) bolt();
		translate([12,12.5,1.4]) tie();
		translate([12,12.5,4]) roundedge();
	}

}

module torch() {
	rotate([90,0,0])
	difference() {
		cylinder(r=10.75,h=26,center=true);
		translate([14.75,0,0]) cube([10,18,18],center=true);
		translate([-14.75,0,0]) cube([10,18,18],center=true);
	}
}

module barclamp() {
	cube([12, 22, 6], center = true);
}

module bolt() {
	union() {
		cylinder(r=(bolthead_d/2)+0.5,h=bolthead_h+1.8,center = true);
		translate([0,0,-((bolthead_h + bolt_h)/2)])
			cylinder(r=(bolt_d/2)+0.5, h=bolt_h, center = true);
	}
}

module tie() {
	cube([30,5.5,3],center=true);
}

module roundedge() {
	difference() {
		cube([26,27,10], center=true);
		translate([0,0,7]) rotate([90,0,0]) cylinder(r=13,h=30,center=true);
	}
}