//casing
$fn=100;
pillarH = 30 ;
pillarD = 10 ;
pillarID = 5 ;
pillarSpacing = 58 ;

battLidX = 55 ;
battLidY = 55 ;
battLidZ = 2 ;


module pillar() {
    difference() {
        cylinder(h=pillarH, d=pillarD);
        translate([0,0,-.1]) cylinder(h=pillarH+.2, d=pillarID);
    }
}


translate ([10,10,0]) union() {
    //both pillars
    translate([0,0,0]) pillar();
    translate([pillarSpacing,0,0]) pillar();
    //The rear mount
    translate([20,80,0]) 
    union(){
        difference(){
            cube([20,10,40]);
            translate([-.5,-.5,30])cube([21,6,5]);
        }
    }
}

//battLid
*cube ([battLidX,battLidY,battLidZ]);

//casing base
cube ([80,100,1]);

