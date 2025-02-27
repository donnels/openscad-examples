$fn=50;

module tabbedCylinder(){
    difference(){
        union (){
            cylinder(h=2,d1=3,d2=3);
            cylinder(h=4.6,d1=1.8,d2=1.8);
            translate ([0,0,3.4]) cylinder(h=1.2,d1=2.2,d2=1.8);
        }
        translate ([0,0,3.5]) cube([.6,2.5,2.5],center=true);
    }
}
module EndCylinder(){
        union (){
            cylinder(h=2,d1=3,d2=3);
            cylinder(h=4.6,d1=1.8,d2=1.8);
        }
}

module steeringAxle(){
    //axis
    translate ([1.5,0,0]) cube([34,3,2]);
    //connector
    translate ([1.5,1.5,0]) EndCylinder();
    //connector
    translate ([35.5,1.5,0]) EndCylinder();
}

steeringAxle();
translate([0,15,0]) tabbedCylinder();
