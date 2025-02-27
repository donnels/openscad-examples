//This is an inlet for a whiskey presentation box from Midleton
$fn=50;
//Lower Notches
LowerNotchDepth=3.5;
LowerNotchLength=8;
LowerRNotchLengthOffset=15;
LowerLNotchLengthOffset=14.3;
module LLnotch(LowerLNotchLengthOffset){
    //Lower Left Notch
    translate([-LowerNotchDepth,LowerLNotchLengthOffset,0])
        cube([LowerNotchDepth,LowerNotchLength,BoxHeight]);
}
module LRnotch(LowerRNotchLengthOffset){
    //Lower Right Notch
    translate([BoxWidth,LowerRNotchLengthOffset,0])
        cube([LowerNotchDepth,LowerNotchLength,BoxHeight]);
}

//Variables for screen
ScreenTopY=75;
ScreenTopX=141;
ScreenTopZ=1;
ScreenEdge=1;
ScreenMaxDepth=7;
module waveshareHDMIscreen(wiggle){
    //full hd screen top face
    //and yes it has rounded corners but let's just start simple.
    union(){
        //Screen dimensions
  		cube([ScreenTopY,ScreenTopX,ScreenTopZ+wiggle]);
		translate([ScreenEdge,ScreenEdge,-ScreenMaxDepth])
			cube([ScreenTopY-(2*ScreenEdge),ScreenTopX-(2*ScreenEdge),ScreenMaxDepth+wiggle]);
		//connecting cable at the edge.
		translate([57,0,-ScreenMaxDepth]) cube([7,7,ScreenMaxDepth]);
        //USB for touch with offseted connector - wiggle through
		translate([12,19,-ScreenMaxDepth-10])
			cube([30,9,ScreenMaxDepth+10]);
		translate([12,10,-ScreenMaxDepth-10])
			cube([15,12,ScreenMaxDepth+10]);
        //USB for power - wriggle thrrough
		translate([65,95,-ScreenMaxDepth-10])
			cube([5,15,ScreenMaxDepth+10]);
		translate([57,97,-ScreenMaxDepth-10])
			cube([17,11,ScreenMaxDepth+10]);
        //HDMI connector - Wriggle through might not work... might have to make hole larger
		translate([44,72,-ScreenMaxDepth-10])
			cube([30,20,ScreenMaxDepth+10]);
        //Audio?
		translate([51,56.75,-ScreenMaxDepth-4])
			cube([23,7.5,ScreenMaxDepth+4]);
        //The screw holes
        Standoffs();
        //The mounting holes for the displaycover
        translate([0+10,0-5,-ScreenMaxDepth-6])
            cylinder(h=20,d=4.8);
        translate([0+10,ScreenTopX+5,-ScreenMaxDepth-6])
            cylinder(h=20,d=4.8);
        translate([ScreenTopY-10,0-5,-ScreenMaxDepth-6])
            cylinder(h=20,d=4.8);
        translate([ScreenTopY-10,ScreenTopX+5,-ScreenMaxDepth-6])
            cylinder(h=20,d=4.8);
    }
}
StandoffDepth=9;
StandoffSpace=1;
StandoffScrewHead=2;
module HolePeg(offset1){
    //standoff
	translate([0,0,-StandoffDepth+1]+offset1)
		cylinder(h=StandoffDepth-1,r=3.05);
    //screwwshaft
	translate([0,0,-StandoffDepth-StandoffSpace+1]+offset1)
		cylinder(h=StandoffDepth+StandoffSpace-1,r=1);
    //Screw head
	translate([0,0,-StandoffDepth-StandoffSpace-StandoffScrewHead+1]+offset1)
		cylinder(h=StandoffScrewHead,r=3);
}
module Standoffs(){
    //Outside holes
    //one
    *HolePeg([6,9,0]);
    HolePeg([6.5,9.75,0]);
    //the rest
    HolePeg([69,22,0]);
    HolePeg([6,132.5,0]);
    HolePeg([53,132.5,0]);

    //inside holes
    HolePeg([11.5,52.5,0]);
    HolePeg([60.5,52.5,0]);
    HolePeg([60.5,110.5,0]);
    HolePeg([11.5,110.5,0]);    
}

// Midleton box measurements
//Real total Height
//BoxHeight=61;
//Display inset Height
BoxHeight=10.5;
//testprint
//BoxHeight=8.5;
BoxWidth=83.8;
LowerPartLength=162.5;
//testing value
//LowerPartLength=50;
LowerPartWallThickness=1.5;
LowerPartFloorThickness=1.5;
module Displaymodule() {
    //Lower part of the box
    difference(){
        //Outercube
        cube([BoxWidth,LowerPartLength,BoxHeight]);
        //subtract for inner space
        *translate([LowerPartWallThickness,LowerPartWallThickness,LowerPartFloorThickness])
            cube([BoxWidth-2*LowerPartWallThickness,LowerPartLength,BoxHeight-(2*LowerPartFloorThickness)]);
    }
    LLnotch(LowerLNotchLengthOffset);
    LRnotch(LowerRNotchLengthOffset);
}
//Displaymodule();
//Standoffs();
//waveshareHDMIscreen();

// put it all together
difference(){
    Displaymodule();
    //Screen
    translate([(BoxWidth-ScreenTopY)/2,(BoxWidth-ScreenTopY)/2+6,BoxHeight-ScreenTopZ])
        waveshareHDMIscreen(.1);
    //for testprint only
    *translate([-10,10,2.5])cube([100,130,15]);
    *translate([10,-10,2.5])cube([65,160,15]);
}
//remove for print... only for animation
*translate([((BoxWidth-ScreenTopY)/2),(BoxWidth-ScreenTopY)/2+6,(BoxHeight-ScreenTopZ)+30*(1-$t)]) waveshareHDMIscreen(0);
 

