$fn=100;
tischXYZ=[200,50,70]; tischPlatteDicke=2;tischEcke=5;
bankXYZ=[200,25,45]; bankPlatteDicke=2;bankEcke=5;
beinDicke=2;
//beispiel bein aus dem Internet
*rotate([90,0,90]) scale([.5,.5,.5]) import("Bierbank_Leg.stl",1);
//echter Tisch
//#translate([0,bankEcke/2+bankXYZ.y+5,0]) cube(tischXYZ);


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
//drucken
groesse=.5;
//tisch
scale(groesse) tischPlatte();
//bänke
scale(groesse) translate ([0,57,0]) bankPlatte();
scale(groesse) translate ([0,-32,0]) bankPlatte();
//beine
scale(groesse) translate ([148,86,0]) rotate([0,-90,270]) Bein(bankXYZ,bankEcke,15);
scale(groesse) translate ([13,86,0]) rotate([0,-90,270]) Bein(bankXYZ,bankEcke,15);
scale(groesse) translate ([93,93,0]) rotate([0,-90,0]) Bein(bankXYZ,bankEcke,15);
scale(groesse) translate ([146,93,0]) rotate([0,-90,0]) Bein(bankXYZ,bankEcke,15);
scale(groesse) translate ([42,86,0]) rotate([0,-90,270]) Bein(tischXYZ,tischEcke,25);
scale(groesse) translate ([95,86,0]) rotate([0,-90,270]) Bein(tischXYZ,tischEcke,25);
// ansehen
////tisch
//translate([0,bankEcke/2+bankXYZ.y+5,tischXYZ.z]) tischPlatte();
////bank
//translate([0,bankEcke/2,bankXYZ.z])   
//translate([0,-beinDicke/2,0]) Bein(bankXYZ,bankEcke,15);
//translate([0,tischEcke/2+bankXYZ.y+1.5,0]) Bein(tischXYZ,tischEcke,25);