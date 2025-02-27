$fn=100;
screwX=91.5;
screwY=56.5;
screwD=4;

//inside of midleton wooden box with double doors
totHeight = 2 ;
totWidth = 101 ;
totDepth = 66.8 ;
dimensions = [ totWidth, totDepth, totHeight] ;
wiggle = [0, 0, 0] ;
volume = dimensions + wiggle ;
*cube(volume);
// Corner strength
cornerD = 3 ;
Blob=[cornerD,cornerD,volume.z];
DIM = volume ;

FL = [0, 0, 0] ;
FR = [DIM.x - Blob.x, 0, 0] ;
BR = [DIM.x - Blob.x, DIM.y -Blob.y, 0] ;
BL = [0, DIM.y -Blob.y, 0] ;

// List of corners
Corners = [FL,FR,BL,BR];

difference() {
	translate([Blob.x/2,Blob.y/2,0]) hull() {
		for (corner = Corners) {
			echo(corner);
			translate(corner) cylinder(h=DIM.z,d=Blob.x,center=true);
		}
	}
	translate([4.1,4.1,0]) cylinder(h=DIM.z+.1,d=screwD,center=true);
    notchW=10;
    notchOFF=18;
    translate ([notchOFF + (notchW/2), 0, 0]) cube([notchW, 2*2, DIM.z + .1], center=true);
    translate ([DIM.x - notchOFF - (notchW/2), 0, 0]) cube([notchW, 2*2, DIM.z + .1], center=true);
    translate ([notchOFF + (notchW/2), DIM.y, 0]) cube([notchW, 2*2, DIM.z + .1], center=true);
    translate ([DIM.x - notchOFF - (notchW/2), DIM.y, 0]) cube([notchW, 2*2, DIM.z + .1], center=true);


}
