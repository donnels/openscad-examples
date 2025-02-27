$fn = 100 ;
width = 220 ;
height = 15 ;
thickness = 1 ;
pinH = 10 ;
pinD = 3 ;
clipW = 40 ;
clipWout = 60 ;
clipH = 20 ;
clipHout = 40 ;
totWidth = width+2*pinD ;
totHeight = height+2*pinD ;

module pin() {
    cylinder(h=pinH,d=pinD);
}

translate([0, 0, 0]) cube([totWidth, totHeight, thickness]);
translate([pinD, pinD, 0]) {
	//move all pins at once while retaining their relative pos
	translate([0, 0, 0]) pin();
	translate([0, height, 0]) pin();
	translate([width, 0, 0]) pin();
	translate([width, height, 0]) pin();
}
difference() {
    translate([totWidth/2 - clipWout/2, totHeight, 0]) cube([clipWout, clipHout, thickness]);
    translate([totWidth/2 - clipW/2, totHeight + clipH/2, -.1]) cube([clipW, clipH, thickness + .2]);
}
