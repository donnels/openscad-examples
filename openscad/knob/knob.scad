$fn=100;
//prototype for haptic testing of control knob.
//The knob is to be built into the bottom of a drinking bottle (largte ring.. fits)
//the control knob is the bottletop (both brushed aluminium) (fits)
//the larger ring is also dimensioned to hold a heavy metal plate to add weight (fits)
// next step after press fitting this in is to see how the ontrols can be integrated. a USB Cinterface is already planned... but let's see.. might use an RP2040 or a leonardo.. let's see

animate1=50*(1-$t);     //Knob
animate2=10*(1-$t);     //608zz
animate3=90*-(1-$t);    //axle goes down
animate4=40*-(1-$t);     //metal base
animate5=20*-(1-$t);     //base
animate6=60*-(1-$t);     //underbase
module 608zz() {
    outer_diameter = 22;  // Outer race diameter
    inner_diameter = 8;   // Inner bore diameter
    width = 7;            // Bearing width
    difference() {
        cylinder(d=outer_diameter, h=width);
        translate([0,0,-.1]) cylinder(d=inner_diameter, h=width+.2);    }
}

module 608zzHolder () {
    axleD=8;      //axle diameter of the axle for the 608 bearing - we;ll add for printer tolerance
    bearingH=7;   //608 skateboard bearing height
    bearingD=22;  //608 skateboard bearing diameter we'll add amillimeter or two later to account for the fitting ring
    fittingD=bearingD+7;  //outer diameter of the fitting ring for the bearing
    nubAngle=360/16;  //the fitting nubs for the bearing at x degree rotation
    printerRadTol=.0; //add this value to the radius
    nubRad=.5;    //the nub radius for the bearing fitting ring
    module ring(inRad,outRad,height,tol) {
        difference(){
        cylinder(h=height,r=outRad+tol);
        translate([0,0,-.1]) cylinder(h=height+.2,r=inRad+tol);
        }  
    }
    module fittingNubsCircle(nubRad,height,inRad,angle,tol) {
        rad=inRad+nubRad+tol;
        for (pos=[0:angle:360]) {
            *echo(pos);
            rotate ([0,0,pos]) translate([rad,0,0]) cylinder(h=height,r=nubRad);
        }
    }
    ring( (bearingD/2)+nubRad, (fittingD/2) , bearingH , printerRadTol );
    fittingNubsCircle( nubRad , bearingH , bearingD/2 , nubAngle , printerRadTol ); 
}
module disc(){
    //metal disc
    color("silver")
        difference(){
            wiggle=.02;
            cylinder(h=5,d=60);
            translate([0,0,-wiggle/2]) cylinder(h=5+wiggle,d=10);
        }
    }
 module discHolder() {
    //metal disc holder under top
    translate([0,0,-1]) difference(){
        wiggle=.02; angle=360/3;
        cylinder(h=6+wiggle/2,d=66.5);
        translate([0,0,1]) cylinder(h=5+wiggle,d=60);
        //bottom hole
        translate([0,0,-wiggle])cylinder(h=10,d=18);
        //3 holes
        for (pos=[0:angle:360]) {
            *echo(pos);
            rotate ([0,0,pos]) translate([31.5,0,-wiggle/2]) cylinder(h=8,d=2.4);
        }
        rotate([0,0,63])translate([31,0,4-wiggle])cube([10,10,10],center=true);
    }
}
module Axle(){
    wiggle=.02;
    numMagnets = 3;
    holderOuterD = 13;
    holderInnerD = 6.15;
    holderH = numMagnets * 2 + 2;
    holderInnerH = numMagnets * 2;
    holderSlot = 2;
    //magnet holder head
    difference(){
        cylinder(h=holderH,d=holderOuterD);
        translate([0,0,-wiggle]) cylinder(h=holderInnerH+wiggle,d=holderInnerD);
        translate([0,0,holderInnerH/2-wiggle/2]) cube([holderSlot,holderOuterD+wiggle,holderInnerH+wiggle],center=true);
    }
    //axle
    H=24; D=8; insetD=5; insetH=8;
    translate([0,0,holderH-wiggle/2]) difference(){
        cylinder(h=H+wiggle/2,d=D);
        translate([0,0,(H-insetH)+wiggle])cylinder(h=insetH+wiggle,d=insetD);
    }
    //ring for better bering fit
    translate([0,0,14]) cylinder(h=7,d=8.1);
}
//base
module base() {
    //top inner mount disc
    angle=360/3;
    translate([0,0,5]) {
        difference(){
            baseRingH=7;wiggle=.02;baseRingD=69.1;baseRingInnerD=28;
            union(){
                difference(){
                    cylinder(h=baseRingH,d=baseRingD);
                    translate([0,0,.5]) cylinder(h=baseRingH+wiggle,d=baseRingInnerD);
                    translate([0,0,-wiggle/2]) cylinder(h=1+wiggle,d=18);
                }
                608zzHolder();
                //rounded top
                translate([0,0,2])
                intersection(){
                    translate([0,0,14.99])
                        cube([70,70,20],center=true);
                    translate([0,0,5])
                    rotate_extrude( angle=360)
                    translate([28,0,0])
                        circle(d=13);
                }
            } 

            //3 holes
            for (pos=[0:angle:360]) {
                *echo(pos);
                rotate ([0,0,pos]) translate([31.5,0,-wiggle/2]) cylinder(h=8,d=3.5);
            }
            rotate([0,0,63])translate([31,0,4.9]) cube([3,10,10],center=true);
            //PCB draft poaition
            *rotate([0,0,63])translate([25,0,3.5]) cube([22,18,6],center=true);
        }
        }
    
}
//knob
module knob(){
knobTotH = 15 ; knobOuterD=41.8; knobInnerD=8.1; bearingLipD=12; bearingLipH=1;wiggle=.2;
screwHoleHeadH = 4; screwHoleHeadD=6; srewHoleT=1;screwHoleD=3;
    union(){
        //knob - central hole
        translate([0,0,bearingLipH]) 
            difference(){
                union(){
                    cylinder(h=knobTotH,d=knobOuterD);
                    cylinder(h=.5,d=knobOuterD+1);
                }
                translate([0,0,-.1]) cylinder(h=knobTotH +0.2,d=knobInnerD);
            }
        //lip for bearing
        difference(){
            cylinder(h=bearingLipH,d=bearingLipD);
            translate([0,0,-wiggle/2])cylinder(h=bearingLipH+wiggle,d=knobInnerD);
        }
        //screw hole inset
        translate([0,0,bearingLipH+knobTotH-screwHoleHeadH-srewHoleT])
        difference(){
            cylinder(h=screwHoleHeadH+srewHoleT,d=knobInnerD+srewHoleT);
            translate([0,0,-wiggle/2]) cylinder(h=screwHoleHeadH+srewHoleT+wiggle,d=screwHoleD);
            translate([0,0,screwHoleHeadH/2-wiggle/2]) cylinder(h=screwHoleHeadH+wiggle,d=screwHoleHeadD);
        }
    }
}

//All together now and animate it
*union(){
    $t=1;
    translate([0,0,25 + .5 + animate2]){
        color("silver") 608zz();
    }
    translate([0,0,11.5+animate3]) color("silver")Axle();
    translate([0,0,20+animate5]) base();
    translate([0,0,32+animate1]) knob();
    translate([0,0,20+animate4])disc();
    translate([0,0,20+animate6])discHolder();
    #translate([0,0,5-.5])cube([60,60,1],center=true);
}

//All together now and print it
union(){
    translate([0,0,0]) color("silver")Axle();
    translate([45,0,-5]) base();
    translate([-30,0,15.5]) rotate([180,0,0])knob();
    translate([0,60,1])discHolder();
}