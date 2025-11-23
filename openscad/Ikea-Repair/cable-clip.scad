//Generic Cable clip
$fn=360;
wiggle=.01;
clipH=10;clipD=8;
difference() {
    union(){
        translate([0,clipD/2,0]) cylinder (h=clipH,d=clipD);
        //lower tab
        cube([10,1,clipH]);
        //upper tab
        translate([0,2,0]) cube([10,1,clipH]);
    }
    translate([0,(clipD)/2,-wiggle/2]) cylinder (h=clipH+wiggle,d=clipD-2);
    translate([0,1,-wiggle/2]) cube([10,1,clipH+wiggle]);
    translate([7,5,clipH/2])rotate([90,0,0])cylinder(h=10,d=2);
}