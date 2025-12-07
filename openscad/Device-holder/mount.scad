$fn=360;
clampH=20;
clampD=33.7;
clampThick=10;
wiggle=.1;
intersect=[2*(clampH+clampThick*2),clampH+clampThick,clampH+wiggle];
intersection(){
    translate([-intersect.x/2,0,-wiggle/2]) cube(intersect);
    difference(){
        union(){
            cylinder(h=clampH, d=clampD+clampThick);
            translate([clampD/2+clampThick/2,0,clampH/2]) rotate([90,0,0]) cylinder(h=clampThick/2,d=clampH,center=true);
            translate([-(clampD/2+clampThick/2),0,clampH/2]) rotate([90,0,0]) cylinder(h=clampThick/2,d=clampH,center=true);
        }
        translate([0,0,-wiggle/2]) cylinder(h=clampH+wiggle,d=clampD);
    }
}