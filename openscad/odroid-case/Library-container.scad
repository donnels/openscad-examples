	module nibLeft(x,y,z,nibR) {
		translate([x,y/10,0]) cylinder(h=z,r=nibR);
		translate([x,9*(y/10),0]) cylinder(h=z,r=nibR);
	}
	module nibRight(x,y,z,nibR) {
		translate([0,y/10,0]) cylinder(h=z,r=nibR);
		translate([0,9*(y/10),0]) cylinder(h=z,r=nibR);
	}
	module nibBottom(x,y,z,nibR) {
		translate([x/10,0,0]) cylinder(h=z,r=nibR);
		translate([9*(x/10),0,0]) cylinder(h=z,r=nibR);
	}
	module nibTop(x,y,z,nibR) {
		translate([x/10,y,0]) cylinder(h=z,r=nibR);
		translate([9*(x/10),y,0]) cylinder(h=z,r=nibR);
	}
	module containerOpenLid(x,y,z,rimThick,bottomThick,nibYN,nibR) {
	rimR=rimThick/2;
	//all 8 corners defined first
	//corners should be AROUND the contained cube defined by x y z
	corner000=[0,0,0];
	corner0=[-rimR,-rimR,-(rimR+bottomThick)];
	corner0x=[x+rimR,-rimR,-(rimR+bottomThick)];
	corner0y=[-rimR,y+rimR,-(rimR+bottomThick)];
	corner0xy=[x+rimR,y+rimR,-(rimR+bottomThick)];
	corner0z=[-rimR,-rimR,z];
	corner0xz=[x+rimR,-rimR,z];
	corner0yz=[-rimR,y+rimR,z];
	corner0xyz=[x+rimR,y+rimR,z];	//draw the debug contents
	translate([0,0,-bottomThick]) cube([x,y,bottomThick]);
	module corner0() {
		translate(corner0) sphere(r=rimR);
	}
	module corner0x() {
		translate(corner0x) sphere(r=rimR);
	}
	module corner0y() {
		translate(corner0y) sphere(r=rimR);
	}
	module corner0xy() {
		translate(corner0xy) sphere(r=rimR);
	}
	module corner0z() {
		translate(corner0z) sphere(r=rimR);
	}
	module corner0xz() {
		translate(corner0xz) sphere(r=rimR);
	}
	module corner0yz() {
		translate(corner0yz) sphere(r=rimR);
	}
	module corner0xyz() {
		translate(corner0xyz) sphere(r=rimR);
	}
	if (nibYN=="nibY") {
		nibBottom(x,y,z,nibR);
		nibLeft(x,y,z,nibR);
		nibRight(x,y,z,nibR);
		nibTop(x,y,z,nibR);
	}
	union(){
		//floor
		hull(){	
			corner0();
			corner0x();
			corner0y();
			corner0xy();
		}
		//left
		hull(){	
			corner0();
			corner0z();
			corner0y();
			corner0yz();
		}
		//right
		hull(){	
			corner0x();
			corner0xy();
			corner0xyz();
			corner0xz();
		}
		//top
		hull(){	
			corner0y();
			corner0yz();
			corner0xyz();
			corner0xy();
		}
		//bottom
		hull(){	
			corner0();
			corner0z();
			corner0x();
			corner0xz();
		}
	}	
}

// example
//caseRim=1.5;
//$fn=100;
//odH=10;
//odW=156;
//odD=73;
//odJSH=6;
//#containerOpenLid(odW,odD,odH,caseRim,odJSH-caseRim,"nibY",.6);
//cube([odW,odD,odH]);

module containerVertSlot(x,y,z,rimThick,bottomThick,nibYN,nibR) {
	rimR=rimThick/2;
	//all 8 corners defined first
	//corners should be AROUND the contained cube defined by x y z
	corner000=[0,0,0];
	corner0=[-rimR,-rimR,-(rimR+bottomThick)];
	corner0x=[x+rimR,-rimR,-(rimR+bottomThick)];
	corner0y=[-rimR,y+rimR,-(rimR+bottomThick)];
	corner0xy=[x+rimR,y+rimR,-(rimR+bottomThick)];
	corner0z=[-rimR,-rimR,z];
	corner0xz=[x+rimR,-rimR,z];
	corner0yz=[-rimR,y+rimR,z];
	corner0xyz=[x+rimR,y+rimR,z];	//draw the debug contents
	translate([0,0,-bottomThick]) cube([x,y,bottomThick]);
	module corner0() {
		translate(corner0) sphere(r=rimR);
	}
	module corner0x() {
		translate(corner0x) sphere(r=rimR);
	}
	module corner0y() {
		translate(corner0y) sphere(r=rimR);
	}
	module corner0xy() {
		translate(corner0xy) sphere(r=rimR);
	}
	module corner0z() {
		translate(corner0z) sphere(r=rimR);
	}
	module corner0xz() {
		translate(corner0xz) sphere(r=rimR);
	}
	module corner0yz() {
		translate(corner0yz) sphere(r=rimR);
	}
	module corner0xyz() {
		translate(corner0xyz) sphere(r=rimR);
	}
	if (nibYN=="nibY") {
		nibLeft(x,y,z,nibR);
		nibRight(x,y,z,nibR);
	}
	union(){
		//floor
		hull(){	
			corner0();
			corner0x();
			corner0y();
			corner0xy();
		}
		//left
		hull(){	
			corner0();
			corner0z();
			corner0y();
			corner0yz();
		}
		//right
		hull(){	
			corner0x();
			corner0xy();
			corner0xyz();
			corner0xz();
		}
	}	
}
// example
//caseRim=1.5;
//$fn=100;
//odH=10;
//odW=15;
//odD=73;
//odJSH=6;
//containerVertSlot(odW,odD,odH,caseRim,odJSH-caseRim,"nibY",.6);
//cube([odW,odD,odH]);

if (library) {} else  {
	echo("trying to compile a library!");
	linear_extrude(height = 4) {
		text("trying to compile a library!");
		}
	}