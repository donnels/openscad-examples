$fn = 100 ;
module toggleSwitch() {
    //twiddle the position a bit to account for material etc
    twiddle = [0,0,1] ;
    upperD = 6 ; upperH = 8.5 ;
    nutH   = 2 ; nutD   = 8 ;
    toggleH = 10 ; toggleD =1.5 ; toggleAngle = 10 ;
    toggleBody = [12.7,13.3,14] ; toggleBodyOff = [0,0,toggleBody.z/2] ;
    totH = toggleBody.z + upperH ;
    translate([0,0,-totH + nutH] + twiddle) {
        //Nut
        translate([0,0,toggleBody.z + upperH - nutH]) cylinder(h=nutH , d=nutD,$fn=6);
        //upper part
        cylinder(h=upperH + toggleBody.z, d=upperD);
        //toggle
        translate([0,0,toggleBody.z + upperH]) rotate([-toggleAngle,0,0]) cylinder(h=toggleH, d=toggleD);
        translate(toggleBodyOff) cube(toggleBody,center=true);
    }
}
//toggleSwitch();

module pin() {
    pinH = 10 ; pinD1 =5 ; pinD2 = 2;
    cylinder(h = pinH, d1 = pinD1, d2 = pinD2);
}

translate([-3,-3,0]) cube([76,50,1]);
translate([0,0,0]) pin();
translate([0,44.5,0]) pin();
translate([70,0,0]) pin();
