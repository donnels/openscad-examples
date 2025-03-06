$fn=100;
//prototype for haptic testing of control knob.
//The knob is to be built into the bottom of a drinking bottle (largte ring.. fits)
//the control knob is the bottletop (both brushed aluminium) (fits)
//the larger ring is also dimensioned to hold a heavy metal plate to add weight (fits)
// next step after press fitting this in is to see how the ontrols can be integrated. a USB Cinterface is already planned... but let's see.. might use an RP2040 or a leonardo.. let's see


//base
difference(){
    cylinder(h=6,d=69.1);
    translate([0,0,-.01]) cylinder(h=6.2,d=60);
}

translate([0,0,1]) {
    cube([68,6,2],center=true);
    rotate([0,0,90]) cube([68,6,2],center=true);
    cylinder(h=20,d=5);
}
//knob
knobH = 15 ;
translate([60,0,0])
difference(){
    union(){
        difference(){
            cylinder(h=knobH,d=41.9);
            translate([0,0,-.1]) cylinder(h=knobH +0.2,d=35);

        }
        translate([0,0,1]) {
        cube([40,6,2],center=true);
        rotate([0,0,90]) cube([40,6,2],center=true);
        }
    }
    cylinder(h=5,d=5,center=true);
}