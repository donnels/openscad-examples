$fn=360;
Height=100;
Diameter=18;
HolePos=(Height/2);
HoleDiam=3;
HoleDepth=10;
difference () {
    hull() { 
        translate([0,0,0]) 
            cylinder(h=1,d2=Diameter,d1=Diameter-2);
        translate([0,0,Height]) 
            cylinder(h=1,d1=Diameter,d2=Diameter-2);
    }
    translate([0,0,HolePos])
        rotate([90,0,0])
            cylinder(h=HoleDepth,d=HoleDiam);
}