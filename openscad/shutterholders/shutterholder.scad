//spacer to keep the shutters from scraping

$fn= 100;
base = [42, 9, 3];
deflector = [15, 3, 15] ;
screwHoleD = 1.8 ;
flareH = 1.6 ;
flareD = 3.6 ;
wiggle=.2;

module deflector(deflector) {
    //deflector
    translate([deflector.x,0,deflector.z]) 
        rotate([0,90,180]) 
            linear_extrude(deflector.x) 
                polygon(points  =   [   [0,0],
                                        [deflector.z,0],
                                        [deflector.z-deflector.y,deflector.y],
                                        [deflector.y,deflector.y]
                                    ]);
}
module screws() {
        //screw hole
        translate([base.x/2-base.y/2, base.y/2, -wiggle/2]) {
            cylinder(d=screwHoleD, h=base.z + wiggle);
            cylinder(h=flareH,d1=flareD,d2=screwHoleD);
        }
        //screw hole
        translate([base.y/2, base.y/2, -wiggle/2]) {
            cylinder(d=screwHoleD, h=base.z + wiggle);
            cylinder(h=flareH,d1=flareD,d2=screwHoleD);
        }
}

module holder(base,deflector,screwHoleD,flareH,flareD,side) {
    textD = 1;
    //depending on if right or left
    offsetDeflector = (side == "R") ? [0,0,0] : (side == "L") ? [base.x-deflector.x,0,0] : undef;
    offsetScrews = (side == "R") ? [base.x/2,0,0] : (side == "L") ? [0,0,0] : undef;
    difference() { 
        //mounting plate
        cube(base);
        translate(offsetScrews) screws();
        //Label
        translate([base.x/2,base.y/2,base.z-textD+wiggle/2])
            linear_extrude(textD+wiggle) 
                rotate([0,0,180]) 
                    text(side,size=5,valign="center",halign="center");
    }
    translate(offsetDeflector) deflector(deflector);  
 
}
    
translate([0, 00, 0]) holder(base,deflector,screwHoleD,flareH,flareD,"L");
translate([0, 14, 0]) holder(base,deflector,screwHoleD,flareH,flareD,"R");

