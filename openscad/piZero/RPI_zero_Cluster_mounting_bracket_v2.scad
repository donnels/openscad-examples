$fn = 100;

module mount(x, y, z)
{
	mount_h = 7;
	mount_h2 = 3;

	difference()
	{
		union()
		{
			translate([-29, 11.5, mount_h/2]) { cylinder(h=mount_h, r=2, center=true); }
			translate([ 29,-11.5, mount_h/2]) { cylinder(h=mount_h, r=2, center=true); }
			translate([-29,-11.5, mount_h/2]) { cylinder(h=mount_h, r=2, center=true); }
			translate([ 29, 11.5, mount_h/2]) { cylinder(h=mount_h, r=2, center=true); }

			translate([x+29, y, z + 3/2]) { cube([4, 23.0, mount_h2], center=true); }
			translate([x-29, y, z + 3/2]) { cube([4, 23.0, mount_h2], center=true); }

			translate([x, y, z + mount_h2/2]) { cube([58, 5.0, mount_h2], center=true); }


			delta=2.1;
			translate([x+35-delta, y-17.5+delta, z + mount_h/2]) rotate([0, 0, 45]) {{ cube([4, 12.0, mount_h], center=true); }}
			translate([x+35-delta, y+17.5-delta, z + mount_h/2]) rotate([0, 0,-45]) {{ cube([4, 12.0, mount_h], center=true); }}


			translate([x-35+delta, y-17.5+delta, z + mount_h/2]) rotate([0, 0,-45]) {{ cube([4, 12.0, mount_h], center=true); }}
			translate([x-35+delta, y+17.5-delta, z + mount_h/2]) rotate([0, 0, 45]) {{ cube([4, 12.0, mount_h], center=true); }}

		}
		union()
		{
			translate([ 29, 11.5, mount_h/2 + mount_h * 0.15]) { cylinder(h=mount_h, r=2.70/2, center=true); }
			translate([-29, 11.5, mount_h/2 + mount_h * 0.15]) { cylinder(h=mount_h, r=2.70/2, center=true); }
			translate([-29,-11.5, mount_h/2 + mount_h * 0.15]) { cylinder(h=mount_h, r=2.70/2, center=true); }
			translate([ 29,-11.5, mount_h/2 + mount_h * 0.15]) { cylinder(h=mount_h, r=2.70/2, center=true); }
		}
	}


}

module stack_joins(x, y, z)
{
	mount_h = 20;
	Ro=4;		
	Ri=2.5;		
	Rp=Ri-0.4; 

	difference()
	{
		union()
		{
			translate([-39, 21.5, mount_h/2]) { cylinder(h=mount_h, r=Ro, center=true); }
			translate([ 39,-21.5, mount_h/2]) { cylinder(h=mount_h, r=Ro, center=true); }
			translate([-39,-21.5, mount_h/2]) { cylinder(h=mount_h, r=Ro, center=true); }
			translate([ 39, 21.5, mount_h/2]) { cylinder(h=mount_h, r=Ro, center=true); }

			translate([ 39, 21.5, mount_h/2 + mount_h * 0.35]) { cylinder(h=mount_h, r=Rp, center=true); }
			translate([-39, 21.5, mount_h/2 + mount_h * 0.35]) { cylinder(h=mount_h, r=Rp, center=true); }
			translate([-39,-21.5, mount_h/2 + mount_h * 0.35]) { cylinder(h=mount_h, r=Rp, center=true); }
			translate([ 39,-21.5, mount_h/2 + mount_h * 0.35]) { cylinder(h=mount_h, r=Rp, center=true); }

			translate([ 39, 21.5, mount_h + mount_h * 0.35]) { sphere(r=Rp); }
			translate([-39, 21.5, mount_h + mount_h * 0.35]) { sphere(r=Rp); }
			translate([-39,-21.5, mount_h + mount_h * 0.35]) { sphere(r=Rp); }
			translate([ 39,-21.5, mount_h + mount_h * 0.35]) { sphere(r=Rp); }
		}
		union()
		{
			translate([ 39, 21.5, mount_h/2 - mount_h * 0.15]) { cylinder(h=mount_h, r=Ri, center=true); }
			translate([-39, 21.5, mount_h/2 - mount_h * 0.15]) { cylinder(h=mount_h, r=Ri, center=true); }
			translate([-39,-21.5, mount_h/2 - mount_h * 0.15]) { cylinder(h=mount_h, r=Ri, center=true); }
			translate([ 39,-21.5, mount_h/2 - mount_h * 0.15]) { cylinder(h=mount_h, r=Ri, center=true); }
		}
	}
}

module model()
{
	mount(0, 0, 0);
	stack_joins(0, 0, 0);
}

model();

