//approximation of the ends
$fn=100;
length=191.5;
height=10;
topDepth=2;
end1W=13;
end2W=10;
wiggle=.1;
legD=3;
legR=legD/2;
translate([0,0,height-topDepth]) hull(){
    rotate([90,0,0]) cube([end1W,topDepth,wiggle]);
    translate([0,length-wiggle,0]) rotate([90,0,0]) cube([end2W,topDepth,wiggle]);
}

//end1
translate([legR,legR,0]) cylinder(h=height,r=legR);
translate([end1W-legR,legR,0]) cylinder(h=height,r=legR);

//end2
translate([legR,length-legR-wiggle,0]) cylinder(h=height,r=legR);
translate([end2W-legR,length-legR-wiggle,0]) cylinder(h=height,r=legR);

//middle
translate([((end2W+end1W)/2)/2,length/2,0]) cylinder(h=height,r=legR);