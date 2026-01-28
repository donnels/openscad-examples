//temp mounting for pi ups lite v1.2 and pi cam
$fn = 100 ;
wiggle = .01 ;
basePlate = [38,100,3] ;
basePlateCenter = [basePlate.x/2, basePlate.y/2, basePlate.z] ;
//test pos center of baseplate
//translate(basePlateCenter) sphere(d=5);
camPCB = [25,1,24]+[.5,.5,.5] ; //measure and add wiggle
camDiff = camPCB + [-2,3,0]; // shorter on the sides, deeper for subtraction
slotDiff = [8,0,0] ;
holeD = 4.5 ;
piHoleFootprint = [23, 58, 0] ; //the position of the screws the look out the bottom of the ups hat.
piPCBFootprint = [30, 70.5, 0] + [.5,.5,0]; //the outside dimensions of the ups hat (plus some wiggle).
piPCBCenter = piPCBFootprint/2; //Center of the pi ups hat
piHoleCenter = piHoleFootprint/2 - [0, -2.6, 0]; // center the holes then move them in relation to the PCB
piOffset = [0,10,0] ; //position the pi back from the center
piHolePos = basePlateCenter - piHoleCenter + piOffset + [0,0,-2] ; // sink the holes
piPCBPos = basePlateCenter + piOffset ;
holderVar = [10,2,5] ; //tab length (symetrical "L"), tab strength, tab Height
module cam(size,diff) {
    translate([size.x/2,diff.y/2,size.z/2]) {
        cube(size,center=true);     //the cam PCB
        cube(diff + [0,wiggle,0],center=true);
    }     
}
module holder (footprint,var) {  
    wiggleH = [0,0,wiggle] ;
    tabL = var[0] ;
    tabThick = var[1] ;
    tabH = [0, 0, var[2]] ;
    translate(tabH/2) difference(){
        cube(footprint + tabH + [tabThick,tabThick,0], center=true);
        cube(footprint + tabH + wiggleH , center=true);
        cube(footprint + tabH + wiggleH + [- tabL, + tabThick + wiggle, 0], center=true);
        cube(footprint + tabH + wiggleH + [+ tabThick + wiggle, -tabL, 0], center=true);
    }
}

module rectangular_holes(spacing, hole_h, hole_d) {
    positions = [[0, 0], [spacing[0], 0], [spacing[0], spacing[1]], [0, spacing[1]]];
    for (pos = positions) {
        translate([pos[0], pos[1], 0]) 
            cylinder(h=hole_h, d=hole_d);
    }
}
//baseplate
difference(){
    cube(basePlate) ;
    //holes first
    translate(piHolePos){
        rectangular_holes(piHoleFootprint, basePlate.z, holeD);
    }
}
//slot for cam
translate([basePlate.x/2-camPCB.x/2,0,basePlate.z]) {
    difference() {
        translate(-slotDiff/2) cube([camPCB.x,camDiff.y,camPCB.z-wiggle]+slotDiff);
        cam(camPCB,camDiff);
    }
}
translate(piPCBPos) holder(piPCBFootprint,holderVar);