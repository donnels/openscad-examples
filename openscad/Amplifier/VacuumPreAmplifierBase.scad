box1X=105.5;
box1Y=106;
box1Z=36;
box1BaseH=3;

box2X=89;
box2Y=91;
box2Z=45.5;

box3X=83;
box3Y=85;
box3Z=50;

lidX=box1X;
lidY=box1Y;
lidZ=23;
lidDepth=20.3;
lidStampR=20;
lidHingeAngle=50;
lidAnimZ=0;

preampBoardX=77;
preampBoardY=66;
preampBoardZ=1.5;
preampTubeR=17/2;
preampTubeH=42;
preampTubeBaseH=10;
preampTubeTipH=51;
preampTubeC=[200/255,200/255,200/255];
preampKnobR=11.5;
preampKnobH=16;
preampAxleH=29;

brown=[139/255,69/255,19/255];
gold=[255/255,215/255,0/255];
Blue=[0/255,0/255,200/255];

module box(){
	color(brown)
	difference(){
		union(){
			cube([box1X,box1Y,box1Z]);
			translate([box1X/2-box2X/2,box1Y/2-box2Y/2,box1BaseH]) cube([box2X,box2Y,box2Z]);
		}
		translate([box1X/2-box3X/2,box1Y/2-box3Y/2,3]) cube([box3X,box3Y,box3Z]);
		// star the next line to see inside the box
		*translate([-.5,-.5,-.5]) cube([box1X+1,box1Y*.85+1,box1Z/2+1]);
	}
}

//lid
module lid(){
	color(gold) translate([(box1X/2),(box1Y/2),lidZ+.0001]) cylinder(h=1,r1=lidStampR,r2=lidStampR);
	color(brown) translate([0,0,0])
		difference(){
			translate([0,0,.001]) cube([lidX,lidY,lidZ]);
			translate([box1X/2-box2X/2,box1Y/2-box2Y/2,0]) cube([box2X,box2Y,lidDepth]);
	}
}

module tube () {
	union(){
		color(preampTubeC,.5) translate([0,0,preampTubeBaseH])cylinder(h=42-preampTubeBaseH,r1=preampTubeR,r2=preampTubeR);
		color([1,1,1])cylinder(h=preampTubeBaseH,r=preampTubeR);
		translate([0,0,preampTubeH]) color(preampTubeC) cylinder(h=preampTubeTipH-preampTubeH,r1=preampTubeR,r2=1);
	}
}

translate([(box1X-box3X)/2,((box1Y-box3Y)/2)+(box3Y-preampBoardY)-1,box1BaseH+21])
union() {
	//board
	cube([preampBoardX,preampBoardY,preampBoardZ]);
	//tubes
	translate([15+preampTubeR,15+preampTubeR,preampBoardZ]) tube();
	translate([52+preampTubeR,15+preampTubeR,preampBoardZ]) tube();
	//Volume Knob Base
	translate([38,0,preampBoardZ]) color([0,1,0]) cube([10,10,10]);
	//volume knob
	translate([43,-(preampKnobH+preampAxleH),preampBoardZ+5]) rotate([270,0,0])
	union(){
		difference() {
			color([50/255,50/255,50/255]) cylinder(h=preampKnobH,r=preampKnobR);
			translate([0,0,-.001]) cylinder(h=1,r=(preampKnobR/100)*60);
		}
		color([255/255,255/255,255/255])cylinder(h=1,r=(preampKnobR/100)*60);
		//knob axle
		translate([0,0,preampKnobH]) color([1,1,1])cylinder(h=preampAxleH,r=3);
	}
}
//draft base 
translate([15,box1Y-((box1Y-box3Y)/2)-1,box1BaseH]) color([0,0,0])cube([8,1,21]);
//enclosure	
box();
translate([box1X,box1Y,(box1Z)+lidAnimZ+.5]) rotate([lidHingeAngle,0,180]) lid();