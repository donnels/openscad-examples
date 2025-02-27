$fn=100;
baseH=7;
baseD=100;
baseL=200;
holeSpacing=95;
screwSpacing=75;
mountD=2.5;
flaringD1=3.5;
flaringH=3;
flaringD2=8;
textTop="DONNELLAN";
textBottom="KLINGEL";
module BLOCKTEXT (content,pos) {
	translate(pos)
		linear_extrude(height = 2) 
			text(content, size = 7, direction = "ltr", spacing = 1, valign="center",halign="center", font = "DejaVu Serif:style=bold");
}
module ScrewHole (topH,topD,flaringH,shaftH,shaftD) {
	//screw is relative to the top of the flaring
	//this is a subtractive component
	wiggle=0.001;
	color([1,0,0]) union() {
		//top clearance
		translate([0,0,-wiggle]) cylinder(h=topH+wiggle,d=topD);
		//flaring
		translate([0,0,-flaringH]) cylinder(h=flaringH,d2=topD,d1=shaftD);
		//bottom shaft
		translate([0,0,-shaftH-flaringH]) cylinder(h=baseH,d=flaringD1);
	}
}
//mounting plate
module doorbell () {
	difference () {
		//plate
		translate([0,baseD/2,0]) hull(){
			cylinder(h=baseH,d=baseD);
			translate([0,baseL-baseD,0]) cylinder(h=baseH,d=baseD);
		}
		BLOCKTEXT(textBottom,[0,baseD/6,baseH-.25]);
		BLOCKTEXT(textTop,[0,baseL-baseD/4,baseH-.25]);
		//screwholes
		translate([0,0,-1]+[0,baseL/2-holeSpacing/2,baseH]) ScrewHole(10,flaringD2,flaringH,5,flaringD1);
		translate([0,0,-1]+[0,baseL/2+holeSpacing/2,baseH]) ScrewHole(10,flaringD2,flaringH,5,flaringD1);
		//mount holes
		translate([1.7,baseL/2-screwSpacing/2,0]) rotate([0,-12.5,0]) translate([0,0,-1])cylinder(h=baseH+2,d=mountD);
		translate([1.7,baseL/2+screwSpacing/2,0]) rotate([0,-12.5,0]) translate([0,0,-1])cylinder(h=baseH+2,d=mountD);
		//cable truss
		translate([0,baseL/2-15,-.1]) cylinder(h=baseH+.2,d=30);
	}
	//bottom mount alignment tabs
	translate([-15,baseL/2-screwSpacing/2,baseH]) cylinder(h=1.5,d=2);
	translate([+15,baseL/2-screwSpacing/2,baseH]) cylinder(h=1.5,d=2);
	//top mount alignment tabs
	translate([-15,baseL/2+screwSpacing/2,baseH]) cylinder(h=1.5,d=2);
	translate([+15,baseL/2+screwSpacing/2,baseH]) cylinder(h=1.5,d=2);
}

intersection() {
	doorbell();
	*translate([0,52.5,0]) cylinder(h=20,d=15);
	*translate([-5,42.5,0]) cube([10,10,20]);
}
*translate([0,60,baseH]) color([0,0,0])
hull(){
    cylinder(h=20,d=50);
    translate([0,130-50,0]) cylinder(h=20,d=50);
}

