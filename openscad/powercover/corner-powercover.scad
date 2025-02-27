//in a corner there is a blasted power cable that needs a cover
$fn=36;
coverR = 100 ;
cableD = 10 ;
shellT = 1 ;
cornerR = 20 ;
sideH = 7; 
//the shell to fit in the corner of oscar's room
difference(){
    difference() {
        //Whole 1/8 sphere
        intersection() {
            cube([coverR,coverR,coverR]);
            sphere(r=coverR);
        }
        translate([shellT,shellT,shellT]) intersection() {
            cube([coverR,coverR,coverR]);
            sphere(r=coverR-2*shellT);
        }
    }
    //cable passthrough
    translate([shellT+cableD/2,0,cableD/2+shellT]) rotate([-90,90,0])cylinder(h=coverR+shellT,d=cableD);
    translate([0,cableD/2+shellT,cableD/2+shellT]) rotate([0,90,0])cylinder(h=coverR+shellT,d=cableD);
    //corner
    sphere(r=cornerR);
    //the inner inner volume for subtraction
    difference() {
        translate([0,0,sideH])intersection() {
            sphere(coverR-2*sideH);
            translate([-coverR,-coverR,0]) cube([2*coverR,2*coverR,coverR]);
        }
        translate([-sideH,-sideH,0])cube([2*sideH,2*sideH,coverR]);
        sphere(r=cornerR+sideH);
    }
}

