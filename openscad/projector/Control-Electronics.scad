$fn = 100 ;
module toggleSwitch() {
    //twiddle the position a bit to account for material etc
    twiddle = [0,0,1] ;
    upperD = 6.5 ; upperH = 8.5 ;
    nutH   = 2 ; nutD   = 8 ;
    toggleH = 10 ; toggleD =1.5 ; toggleAngle = 10 ;
    toggleBody = [12.8,13.4,14] ; toggleBodyOff = [0,0,toggleBody.z/2] ;
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
module klemme(){
    import("Euroklemme-T80-15-6mm-Array.stl");
    translate([8,0,0]) import("Euroklemme-T80-15-6mm-Array.stl");
}
module motor(offset){
    cylD = 59.2 ;
    cylH = 60 ;
    motorMountPlate = [60.5,60.5,1.5] ;
    color("grey"){
        cylinder(h=cylH,d=cylD) ;
        translate([cylD/2+3,8,43]) rotate([0,90,0]) klemme() ;
        difference(){
            translate([0,0,cylH]) cube(motorMountPlate,center=true) ;
            translate([-25,25,cylH]) cylinder(h=3,d=4.3,center=true);
            translate([25,-25,cylH]) cylinder(h=3,d=4.3,center=true);
            translate([-25,-25,cylH]) cylinder(h=3,d=4.3,center=true);
            translate([25,25,cylH]) cylinder(h=3,d=4.3,center=true);
        }
        if (offset=="offset")  {
            translate([-10,0,.01]) cylinder(h=cylH+27,d=8);
            }
        else {
            translate([0,0,.01]) cylinder(h=cylH+27,d=8);
            }
    }
}
#motor("offset");
module pin() {
    pinH = 10 ; pinD1 =5 ; pinD2 = 2;
    cylinder(h = pinH, d1 = pinD1, d2 = pinD2);
}
module emboss(height,halign,text){
    height = height + .02 ;
    translate([0,0,-height + .01]) linear_extrude(height) text(text,valign="center",halign=halign,size=5);
}

//PCB mount
*union() {
    translate([-3,-3,0]) cube([76,50,1]);
    translate([0,0,0]) pin();
    translate([0,44.5,0]) pin();
    translate([70,0,0]) pin();
}

//toggles
translate([0,-50,0]) difference() {
    translate([0,0,-10]) cube([70,20,10]);
    //switch auto/off/man
    translate([20,10,0]) rotate([0,0,90]) toggleSwitch(); 
    translate([10,4,0]) emboss(5,"center","Auto");
    translate([30,4,0]) emboss(5,"center","Man");
    translate([20,17,0]) emboss(5,"center","OFF");
    //switch up/stop/down
    translate([45,10,0]) toggleSwitch(); 
    translate([50,16,0]) emboss(5,"left","Up");
    translate([50,10,0]) emboss(5,"left","STOP");
    translate([50,4,0]) emboss(5,"left","Down");

}
