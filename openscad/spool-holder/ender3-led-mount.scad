// led bar mount for ender 3 with re-used idea colour led bars
// mounts to 2020 vslot

$fn=100;
ledStripL = 250;
ledStripH = 7 ;
ledStripW = 9.6 ;
holderWallT = 2 ;
HolderSize = 10 ;
wiggle = .02;
include <AluminumExtrusionProfile.scad>



*translate([0,10,0]) linear_extrude(10) 2020_extrusion_profile(slot = "v");

module nut1(HolderSize) {
    linear_extrude (HolderSize) {
        for (i = [0:1:1]) {
            mirror([i,0,0]) 
                polygon([
                    [ 0,0],  // center
                    [ -5,0],
                    [ -3,2],
                    [ -6.2,2],
                    [ -6.2,2.5],
                    [ -2.7,5.8],
                    [ 0,5.8]
                ]);
        }
    }
}
module nut2(HolderSize) {
    linear_extrude (HolderSize) {
        for (i = [0:1:1]) {
            mirror([i,0,0]) 
                polygon([
                    [ 0,0],  // center
                    [ -4.5,0],
                    [ -2.3,2.3],
                    [ -5.5,2.3],
                    [ -5.5,2.8],
                    [ -2.4,5.3],
                    [ 0,5.3]
                ]);
        }
    }
}

#nut1(10);
//The led holder part
*translate([0,-(ledStripW + holderWallT)/2 + wiggle, HolderSize/2])
    difference(){    
        //The holder part
        cube([ledStripH + holderWallT, ledStripW + holderWallT, HolderSize],center=true);
        //The removed inside (led bar)
        cube([ledStripH, ledStripW, HolderSize + wiggle],center=true);
    }

nut2(9.5);
