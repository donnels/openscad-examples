$fn=100;
doorX = 550 ; doorY = 290 ; doorZ = 21 ;
coverX = 497 ; coverY = 350 ; coverZ = 35 ;

module door (x,y,z) {
    Xwiggle = [.1,0,0] ;
    holeH = 15 ; holeD = 7 ;
    holeOff = [0,19,13] ;
    difference(){
        cube ([x,y,z]);
        translate([0,y,0] - [0,holeOff.y,-holeOff.z] - Xwiggle) rotate([0,90,0]) cylinder(h=holeH + 2*Xwiggle.x ,d=holeD);
    }
    translate([x,y,0] - [0,holeOff.y,-holeOff.z] - Xwiggle) rotate([0,90,0]) cylinder(h=holeH + 2*Xwiggle.x ,d=holeD);
}

module cover () {
    x = coverX ;
    y = coverY ;
    z = coverZ ;
    mount = [3,30,115] ;
    cube([x,y,z]);
    difference(){
        union() {
            translate([71,0,0]) cube(mount);
            translate([410,0,0]) cube(mount);
        }
        hull(){
            translate ([0,mount.y/2,100]) rotate([0,90,0]) cylinder(h=coverX,d=10);
            translate ([0,mount.y/2,85]) rotate([0,90,0]) cylinder(h=coverX,d=10);
        }
    }
}

//shelf
module shelf() {
    //bottom of shelf
    translate([0,0,-20]) cube([1100,530,20]);
    //top of shelf
    translate([0,0,370]) cube([1100,530,20]);
}
module components(){
        union(){
        //zendure
        translate([70,100,0]) cube([350,250,70]);
        //deye
        translate([70,120,75]) cube([350,185,40]);
        //battery
        battOffZ = [0,0,100] ;
        translate([630,110,0]+battOffZ) union(){
            batt = [360,200,290] ;
            translate([0,0,-batt.z]) cube(batt);
            translate([30,batt.y/2,0]) cylinder(h=110,d=30);
        }
    }
    //left side
    translate([0,0,0]){
        translate([0,0,0]) rotate([45,0,0]) door(doorX, doorY, doorZ);
        translate([(doorX-coverX)/2,doorY-100,240]) rotate([-45,0,0]) cover();
    }
    //right side
    *translate([555,0,0]){
        translate([(doorX-coverX)/2,doorY-100,240]) rotate([-45,0,0]) cover();
        translate([0,0,0]) rotate([45,0,0]) door(doorX, doorY, doorZ);
    }
}


//holder draft
module armL() {
    H = 200 ;
    holeD = 6 ;
    armD = 40 ;
    baseX = 80;
    difference () {
        hull(){
            translate([0,20,H]) rotate([0,90,0]) cylinder(h=10,d=armD);
            cube ([10,baseX,10]);
            translate ([-30,10,0]) cube ([30,60,10]);
        }
        translate([0, armD/2, H]) translate([-10,0,0]) rotate([0,90,0]) cylinder(h=50, d=6);
    }
    cube([70,baseX,5]);
}

#shelf();
#translate([11,50,0]) components();

translate([0,212,0]) armL();

*cover();
