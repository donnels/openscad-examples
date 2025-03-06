// this is for a small esp8266-01 module adapter
$fn=100;

module usbcConnectorPCB(extrude) {
    //PCB
    board = [ 15.5, 15, .8] ;
    color("green") cube(board,center=true);
    //connector
    usbcD=3.3; usbcL=12 + extrude; usbcW=9; usbcEgress=2;
    color("silver")
        translate([-usbcW/2 + usbcD/2, (board.y - usbcL)/2 + usbcEgress, 0]) 
            rotate([-90, 0, 0]) 
                hull(){
                    translate([0, 0, 0]) cylinder(h=usbcL, d=usbcD, center=true);
                    translate([usbcW - usbcD, 0, 0]) cylinder(h=usbcL, d=usbcD, center=true);
                }
}

module usbcConnectorMount(){
    version="V1.3";
    difference() {
        translate([0, 6, 0]) cube([20, 6, 10],center=true);
        scale([1.05, 1.05, 1.05]) usbcConnectorPCB(7);
        translate([0,6,3.5]) linear_extrude(2) text(version,size=5,halign="center",valign="center");
    }
    //add a tab with hole to fix the connector
    difference(){
        translate([0, -5, -3.5])  cube([10, 20, 3],center=true);
        translate([0, -9, -6])  cylinder(h=10,d=3);
    }
}
translate([0,0,0]) color("lightblue") usbcConnectorMount();
*usbcConnectorPCB(0);

module ledController() {
    board = [21,25,1.5] ;
    boardHoleD = 2.5 ;
    difference() {
        cube(board,center=true);
        translate([-8.8,-10.5,0]) cylinder(h=2*board.z,d=boardHoleD,center=true);
    }
    boardConn = [8,10,6] ;
    boardButton = [2,3,1.5] ;
    boardButtonCase = [4,6,4] ;
    esp826601 = [15.7,25,1.5] ;
    translate([-(board.x - esp826601.x)/2,0,11]) cube(esp826601,center=true);
    translate([-(board.x - boardConn.x)/2,0,(esp826601.z+boardConn.z)/2]) color("white") cube(boardConn,center=true);
    translate([(board.x - boardButton.x)/2+boardButton.x,-(esp826601.y+boardButton.y)/2+boardButton.y+3.4,(esp826601.z+boardButton.z)/2+.5]) color("white") cube(boardButton,center=true);
    translate([(board.x - boardButtonCase.x)/2,-(esp826601.y+boardButton.y)/2+boardButton.y+3.4,(esp826601.z+boardButton.z)/2+.5])cube(boardButtonCase,center = true);
}
*translate([0,-2,7]) rotate([0,0,90])ledController();

h=11;innerD=5;outerD=7;

translate([15,4,0]) rotate([90,0,0]) cylinder(h=10,d=3,center=true);

translate([-13,-17,-7])  cube([27,26,2]);