//
//  Double C-mount adapter
//  This is the thing required for my AmScope to get the
//  same focus plane for the camera as for the eyepiece
//
//  
//

// you can tune this to change the focal plane
dist = 7.5; 

depth = 4.0; // depth of threads

taper = 2.5;
ring = 28.0; // diameter of ring
knurls = 64;
kdia = 1.0;

include <threads.scad>

intersection
//union 
() {
difference () {
    union () {
        english_thread (0.99, 32, (depth*2 + dist)/25.4);
        translate([0,0,depth]) cylinder(d1 = 25.4 + 0.3, d2 = ring, h=taper, $fn=12*8);
        translate([0,0,depth+taper]) {
            cylinder(d = ring, h=dist-taper, $fn=12*8);
            for (n = [0:knurls-1]) rotate([0,0,(360/knurls)*n]) hull () {
                translate([ring/2,0,kdia/2]) sphere(d = kdia, h=dist-taper, $fn=6);
                translate([ring/2,0,dist-taper-kdia/2]) sphere(d = kdia, h=dist-taper, $fn=6);
            }
        }
    }
    translate([0,0,-1]) cylinder(d = 21.5, h=depth*2 + dist + 2, $fn=128);
}
translate ([0,0,-0.01]) cylinder(d1 = 25.4 - 2.0, d2 = 25.4 - 2.0 + 2*(depth*2+dist), h=depth*2+dist, $fn=12*8);
}