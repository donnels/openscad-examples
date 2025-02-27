//for LED lamps in ceiling in Howth
// the originals are wider and therefore the new ones need a spacer to cover the hole
//colour is white
//led lamps are 105mm Diameter (4 lamps)

lampD=105;
lampH=2;
holeD=99;
coverD=125;
coverInD=99;
coverH=2;
coverRidgeW=5;
$fn=100;

//lamp
*color("white")
	translate([0,0,coverH])
		cylinder(h=2,d=lampD);

color("white") union(){
	difference(){
		cylinder(h=coverH,d=coverD);
		translate([0,0,-.1]) cylinder(h=coverH+.2,d=coverInD);
	}
	translate([0,0,coverH])
	difference(){
		cylinder(h=lampH,d=lampD+coverRidgeW);
		translate([0,0,-.1]) cylinder(h=lampH+.2,d=lampD+1);
	}
}