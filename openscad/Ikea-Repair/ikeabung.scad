$fn=100;
totH=30;
baseH=6;
baseW=32;
wingW=3.5;
wingD=8;
centreD=17;

for (i = [0:360/6:360]) {
rotate([0,0,i]) translate([((baseW-2)/2)-wingD,-wingW/2,baseH]) cube([wingD,wingW,totH-baseH]);
}

difference(){
	union(){
		cylinder(h=totH,d=centreD);
		cylinder(h=6,d=32);
		translate([0,0,baseH]) cylinder(h=6,d1=baseW-2,d2=22);
		}
	translate([0,0,-.1]) cylinder(h=totH+.2,d=8.2);
		
	translate([0,0,-.1]) cylinder(h=8.1,d=15,$fn=6);
}
