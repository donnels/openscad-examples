//door fram stoppers for adjustment screw
$fn=100;
wiggle = 0.01 ;
wiggleZ = [0,0,wiggle] ;
plugD = 7 ;
plugInnerD = plugD - 2 ;
plugH = 6.7 ;
plugHeadD = 14 ;
plugHeadOffsetH = 5.5 ;
knurlNum = 3 ;
knurlD = 1 ;
knurlOffsetH = 1 ;
sphereR = 25;
difference(){
    cylinder(h=plugHeadOffsetH + wiggle, d=plugD);
    translate(-wiggleZ/2)cylinder(h=plugHeadOffsetH + wiggle, d=plugInnerD);
}
translate([0,0,plugHeadOffsetH])
intersection(){
    cylinder(h = plugH - plugHeadOffsetH, d = plugHeadD);
    translate([0,0,-sphereR + 1]) sphere(r=sphereR);
}

for (i=[0:360/knurlNum:360]){
    rotate([0,0,i]) translate([plugD/2,0,knurlOffsetH]) cylinder(h = plugHeadOffsetH -1,d=knurlD);
    rotate([0,0,i]) translate([plugD/2,0,knurlOffsetH]) sphere(d=knurlD);
}