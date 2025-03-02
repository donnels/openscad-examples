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
    version="V1.1";
    difference() {
        translate([0, 2, 0]) cube([20, 13, 10],center=true);
        scale([1.05, 1.05, 1.05]) usbcConnectorPCB(7);
        translate([4.5,-3,0]) rotate([-90, 0, 0]) cylinder(h=9,d=2,center=true);
        translate([-4.5,-3,0]) rotate([-90, 0, 0]) cylinder(h=9,d=2,center=true);
        translate([0,0,3.5]) linear_extrude(2) text(version,size=6,halign="center",valign="center");
    }
    //add a tab with hole to fix the connector
    difference(){
        translate([0, -5, -3.5])  cube([10, 20, 3],center=true);
        translate([0, -9, -6])  cylinder(h=10,d=3);
    }
}
color("lightblue") usbcConnectorMount();
*usbcConnectorPCB(0);
