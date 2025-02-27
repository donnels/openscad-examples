//koordinaten system
hoehe=70;
breite=70;
tiefe=70;
dicke=2;

//ein viertel
module viertel(text1,text2,text3,text4,text5) {
	cube([breite,tiefe,dicke]);
	hull(){
	cube([breite,dicke,tiefe]);
	translate([breite/3,0,hoehe])cube([breite/2,tiefe/4,dicke]);
	}
	//text1
	translate([breite/2,dicke,hoehe/2+hoehe/4]) rotate([90,0,0]) linear_extrude(dicke*2) scale([.5,.5,.5])text(text1);
	//text2
	translate([breite/4,dicke,hoehe/2]) rotate([90,0,0]) linear_extrude(dicke*2) text(text2);
	//text3
	translate([breite/4,tiefe/2+tiefe/4,0]) rotate([0,0,90]) linear_extrude(dicke*2) scale([.5,.5,.5]) text(text3);
	//text4
	translate([tiefe/2,tiefe/2,0])rotate([0,0,90]) linear_extrude(dicke*2) text(text4);
	//text5
	translate([breite/2,dicke,hoehe])rotate([0,0,0]) linear_extrude(dicke*2) text(text5);
}
viertel("1","2","3","4","5");
rotate([0,0,90]) viertel("6","7","8","9","10");
rotate([0,0,180]) viertel("11","12","13","14","15");
rotate([0,0,270]) viertel("16","17","18","19","20");