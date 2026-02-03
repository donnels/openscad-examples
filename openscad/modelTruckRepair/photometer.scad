//rund
$fn=100;
//Variablen
wiggle = 0.01 ;
wiggleZ = [0,0,wiggle] ;
unten = [30,17,12] ;
untenHoch = 51 ;
curvette = [12.65,12.65,44] ;
curvetteIn = [10,10,41.8] ;
curvetteOffset = [5,(unten.y-curvette.y)/2,2];
ledLochD = 5.2 ;
ledLochRimD = ledLochD + 1.1;
ledLochRimH = 1 ;
ledLochH = unten.x - (curvette.x + curvetteOffset.x)  ;
ldrD = 4.2 ;
ldrW = 5.2 ;
bodenFreiheit = [0,0,5] ;

module Curvette () {
    color([1,1,1],.3) difference (){
        cube(curvette);
        translate([(curvette.x-curvetteIn.x)/2,(curvette.y-curvetteIn.y)/2,curvette.z-curvetteIn.z]) cube(curvetteIn + wiggleZ);
    }
}

difference() {
    //das ding
    union(){
        cube(unten);
        translate([curvetteOffset.x-(unten.y-curvette.x)/2,0,0])cube([unten.y,unten.y,untenHoch]);
    }
    //curvettenloch
    translate(curvetteOffset)cube(curvette+[0,0,10]);
    //LED Loch
    translate([unten.x-ledLochH- wiggle/2,(unten.y)/2,ledLochD/2]+bodenFreiheit) rotate([0,90,0]) cylinder(h=ledLochH + wiggle, d=ledLochD);
    translate([unten.x-ledLochRimH+wiggle/2,(unten.y)/2,ledLochD/2]+bodenFreiheit) rotate([0,90,0]) cylinder(h=ledLochRimH, d=ledLochRimD);
    //LDR Loch
    translate([-wiggle/2,(ldrW-ldrD)/2+(unten.y)/2,ldrD/2+(ledLochD-ldrD)/2]+bodenFreiheit)
        rotate([0,90,0])
            hull() {
                cylinder(d=ldrD,h=7);
                translate([0,ldrD-ldrW,0])cylinder(d=ldrD,h=7);
            }
}


*translate(curvetteOffset) Curvette();


