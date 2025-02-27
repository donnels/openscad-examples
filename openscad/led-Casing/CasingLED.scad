// OPENSCA Model for encloser for Tine's table
// Curently 3 devices Waatuino, 3.3v to 5v and esp wemos d1 mini
$fn=100;
wiggle=0.01;
module wemos(){
    difference(){
        union(){
            //wemos d1 mini 26mmx35mm h7mm 
            cube([26,35,10]);
            translate([9,32,0]) cube([10,5,5]);
        }
        translate([3,5,-wiggle]) cube([1,20,3+wiggle]);
        translate([21,5,-wiggle]) cube([1,20,3+wiggle]);
    }
}
module v5v3(){
    union(){
        difference(){
            //volatege level shifter 5v 3v 14mmx16mm h7mm 
            cube([14,16,10]);
            translate([3,3,-wiggle]) cube([8,10,3+wiggle]);
        }
        translate([4,4,0]) cube([6,8,3+wiggle]);
    }
}
module blanker(){
    //volatege level shifter 5v 3v 14mmx16mm h7mm 
    cube([14,18,10]);
}
module wattuino(){
    //wattuino arduino 5v clone 22mmx32mm h7mm 
    union(){
        difference(){
            cube([19,34,10]);
            translate([2.5,4,-wiggle]) cube([14,26,3+wiggle]);
        }
        translate([3.5,5,0]) cube([12,24,3+wiggle]); 
    }
}
module casing(){
    //outer casing 
    cube([63,37,10]);
}
module cabling(){
    //cabling boom 
    cube([50,8,3.01]);
}
module enclosure(){
    //outer casing and substract
    difference(){
        casing();
        translate([1,1,1]) wemos();
        translate([28,1,1]) v5v3();
        translate([43,1,1]) wattuino();
        translate([28,18,1]) blanker();
        translate([7,7,7]) cabling();
        }
}

enclosure();
