$fn=100;
//Tisch Zeug
tischXYZ=[200,50,70]; tischPlatteDicke=2;tischEcke=5;
bankXYZ=[200,25,45]; bankPlatteDicke=2;bankEcke=5;
beinDicke=2;
//Box Zeug
wiggle=.02;
boxAussenD=30;
boxAussenH=2;
boxInnenD=28;
boxInnenH=2;
boxXYZ=[35,25,45];

module tischPlatte () {
    hull() {
        //4 Ecken
        translate([0,0,0]) cylinder(h=tischPlatteDicke,d=tischEcke);
        translate([tischXYZ.x,0,0]) cylinder(h=tischPlatteDicke,d=tischEcke);
        translate([tischXYZ.x,tischXYZ.y,0]) cylinder(h=tischPlatteDicke,d=tischEcke);
        translate([0,tischXYZ.y,0]) cylinder(h=tischPlatteDicke,d=tischEcke);
    }
}
module bankPlatte() {
    hull() {
        //4 Ecken
        translate([0,0,0]) cylinder(h=bankPlatteDicke,d=bankEcke);
        translate([bankXYZ.x,0,0]) cylinder(h=bankPlatteDicke,d=bankEcke);
        translate([bankXYZ.x,bankXYZ.y,0]) cylinder(h=bankPlatteDicke,d=bankEcke);
        translate([0,bankXYZ.y,0]) cylinder(h=bankPlatteDicke,d=bankEcke);
    }
}
module Bein(maase,ecke,kreuzH) {
    //Bein
    union() {
        //Beine
        translate([0,ecke/2,0]) cube([beinDicke,beinDicke,maase.z]);
        translate([0,maase.y+ecke/2,0]) cube([beinDicke,beinDicke,maase.z]);
        //unten
        translate([0,ecke/2+beinDicke/2,0]) cube([beinDicke,maase.y,beinDicke]);
        //oben
        translate([0,ecke/2+beinDicke/2,maase.z-beinDicke]) cube([beinDicke*4,maase.y,beinDicke]);
        //mitten
        translate([0,ecke/2+beinDicke/2,maase.z-beinDicke-kreuzH]) cube([beinDicke,maase.y,beinDicke]);
        //quer
        hull() {
            translate([0,ecke/2,maase.z-beinDicke-kreuzH]) cube([beinDicke,beinDicke,beinDicke]);
            translate([0,maase.y+ecke/2,maase.z-beinDicke]) cube([beinDicke,beinDicke,beinDicke]);
        }
        hull() {
            translate([0,ecke/2,maase.z-beinDicke]) cube([beinDicke,beinDicke,beinDicke]);
            translate([0,maase.y+ecke/2,maase.z-beinDicke-kreuzH]) cube([beinDicke,beinDicke,beinDicke]);
        }
    }
}

module lautsprecher() {
    translate([0,0,-(boxAussenH+boxInnenH)]) {
        cylinder(h=boxInnenH+wiggle,d=boxInnenD);
        translate([0,0,boxInnenH]) cylinder(h=boxAussenH+wiggle,d=boxAussenD);
        //loch
        translate([0,0,-boxXYZ.y+2]) cylinder(h=boxXYZ.y+wiggle,d=boxInnenD);
    }
}

//drucken
groesse=.5;
*scale(groesse) {
    //tisch
    tischPlatte();
    //bänke
    translate ([0,57,0]) bankPlatte();
    translate ([0,-32,0]) bankPlatte();
    //beine
    translate ([148,86,0]) rotate([0,-90,270]) Bein(bankXYZ,bankEcke,15);
    translate ([13,86,0]) rotate([0,-90,270]) Bein(bankXYZ,bankEcke,15);
    translate ([93,93,0]) rotate([0,-90,0]) Bein(bankXYZ,bankEcke,15);
    translate ([146,93,0]) rotate([0,-90,0]) Bein(bankXYZ,bankEcke,15);
    translate ([42,86,0]) rotate([0,-90,270]) Bein(tischXYZ,tischEcke,25);
    translate ([95,86,0]) rotate([0,-90,270]) Bein(tischXYZ,tischEcke,25);
}
// ansehen
translate([50,0,0]) scale(groesse) {
    color("yellow") {
        //tisch
        translate([0,bankEcke/2+bankXYZ.y+5,tischXYZ.z]) tischPlatte();
        //bank
        translate([0,bankEcke/2,bankXYZ.z]) bankPlatte();
    }
    color("green") {
        translate([10,-beinDicke/2,0]) Bein(bankXYZ,bankEcke,15);
        translate([10,tischEcke/2+bankXYZ.y+1.5,0]) Bein(tischXYZ,tischEcke,25);
        translate([190,31,0]) rotate([0,0,180]) Bein(bankXYZ,bankEcke,15);
        translate([190,86,0]) rotate([0,0,180]) Bein(tischXYZ,tischEcke,25);
    }
}
difference(){
    color("grey") cube(boxXYZ);
    translate([boxXYZ.x/2,0,boxXYZ.z/2]) rotate([90,0,0]) lautsprecher();
}
