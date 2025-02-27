boardThick=2;
boardWidth=107;
boardDepth=55;
holeRad=2;

module hdmiBoard(ext) {
    Extrude=ext; //extrude the ports or set to 0 for real board
    difference(){
        $fn=100;
        union(){
            color([0,.5,0]) cube([boardWidth,boardDepth,boardThick]);
            color([.2,.2,.2]) translate([6,boardDepth-15,boardThick]) cube([9,15+Extrude,11]); //power
            color([.2,.2,.2]) translate([19,boardDepth-15,boardThick]) cube([7,15+Extrude,10]); //audio
            color([0,0,0.6]) translate([29,boardDepth-9,boardThick]) cube([31,15+Extrude,13]); //vga
            color([.9,.9,.9]) translate([74,boardDepth-9.5,boardThick]) cube([15,11+Extrude,6]); //hdmi
            color([.9,.9,.9]) translate([62,0-Extrude,boardThick]) cube([20,7+Extrude,2]); //display cable 30 pin
        }
        translate([2+holeRad,5+holeRad,-.01]) cylinder(h=boardThick+.1,r=holeRad);
        translate([2+holeRad,boardDepth-2.5-holeRad,-.01]) cylinder(h=boardThick+.1,r=holeRad);
        translate([boardWidth-holeRad-2,boardDepth-holeRad-2,-.01]) cylinder(h=boardThick+.1,r=holeRad);
        translate([boardWidth-holeRad-3,11+holeRad,-.01]) cylinder(h=boardThick+.1,r=holeRad);
    }
}

module pillars(ext) {
    $fn=100;
    translate([2+holeRad,5+holeRad,-.01]) cylinder(h=boardThick+.1,r=holeRad);
    translate([2+holeRad,boardDepth-2.5-holeRad,-.01]) cylinder(h=boardThick+.1,r=holeRad);
    translate([boardWidth-holeRad-2,boardDepth-holeRad-2,-.01]) cylinder(h=boardThick+.1,r=holeRad);
    translate([boardWidth-holeRad-3,11+holeRad,-.01]) cylinder(h=boardThick+.1,r=holeRad);
}
module plate(width,depth,height,inRad,Off) {
    //blanking plate
    plateWidth=width;
    plateDepth=depth;
    plateHeight=height;
    screwHoleRad=inRad;
    screwEdgeOff=Off;
    difference(){
        //plate
        cube([plateWidth,plateDepth,plateHeight]);
        //screwholes
        $fn=100;
        translate([screwEdgeOff,screwEdgeOff,-.5]) cylinder(h=plateHeight+1,r=screwHoleRad);
        translate([plateWidth-screwEdgeOff,screwEdgeOff,-.5]) cylinder(h=plateHeight+1,r=screwHoleRad);
        translate([screwEdgeOff,plateDepth-screwEdgeOff,-.5]) cylinder(h=plateHeight+1,r=screwHoleRad);
        translate([plateWidth-screwEdgeOff,plateDepth-screwEdgeOff,-.5]) cylinder(h=plateHeight+1,r=screwHoleRad);
    }
}
module pillar(height,inRad,outRad) {
    $fn=100;
    difference(){
        cylinder(h=height,r=outRad);
        translate([0,0,-.05]) cylinder(h=height+.1,r=inRad);
        }
}
module housing(width,depth,height,wallThick,floorThick,inRad,pillarThick,off) {
    //housing
    boxWidth=width;
    boxDepth=depth;
    boxFloorHeight=floorThick;
    boxWallThick=wallThick;
    boxWallHeight=height;
    screwHoleRad=inRad;
    screwPillarRad=inRad+pillarThick;
    screwEdgeOff=off;
    union(){
        //plate
        cube([boxWidth,boxDepth,boxFloorHeight]);
        echo("Dimensions floor plate",boxWidth,boxDepth,boxFloorHeight);
        translate([screwEdgeOff,screwEdgeOff,0]) pillar(boxWallHeight,screwHoleRad,screwPillarRad);
        translate([boxWidth-screwEdgeOff,screwEdgeOff,0]) pillar(boxWallHeight,screwHoleRad,screwPillarRad);
        translate([screwEdgeOff,boxDepth-screwEdgeOff,0]) pillar(boxWallHeight,screwHoleRad,screwPillarRad);
        translate([boxWidth-screwEdgeOff,boxDepth-screwEdgeOff,0]) pillar(boxWallHeight,screwHoleRad,screwPillarRad);
    }
    //color([1,0,0])
    translate([0,boxWallThick,boxFloorHeight]) cube([boxWallThick,boxDepth-boxWallThick,boxWallHeight-boxFloorHeight]);
    echo("Dimensions left wall", boxWallThick,boxDepth-boxWallThick,boxWallHeight-boxFloorHeight);
    //color([0,1,0])
    translate([0,0,boxFloorHeight]) cube([boxWidth-boxWallThick,boxWallThick,boxWallHeight-boxFloorHeight]);
    echo("Dimensions front wall", boxWidth-boxWallThick,boxWallThick,boxWallHeight-boxFloorHeight);
    //color([1,0,0])
    translate([boxWidth-boxWallThick,0,boxFloorHeight]) cube([boxWallThick,boxDepth-boxWallThick,boxWallHeight-boxFloorHeight]);
    echo("Dimensions right wall", boxWallThick,boxDepth-boxWallThick,boxWallHeight-boxFloorHeight);
    //color([0,1,0])
    translate([boxWallThick,boxDepth-boxWallThick,boxFloorHeight]) cube([boxWidth-boxWallThick,boxWallThick,boxWallHeight-boxFloorHeight]);
    echo("Dimensions rear wall", boxWidth-boxWallThick,boxWallThick,boxWallHeight-boxFloorHeight);
}
//width,depth,height,wallThick,floorThick,inRad,pillarThick,off
//housing(20,20,20,2,2,1.5,1.5,4);

difference() {
    housing(122,61,25,2,2,1.5,1.5,4); //width,depth,height,wallThick,floorThick,inRad,pillarThick,off
    translate([7,3,5]) hdmiBoard(20);
}
translate([7,4,2]) pillars();
*translate([7,4,5]) hdmiBoard(0);
*translate([0,0,70]) plate(122,61,2,1.5,4); //width,depth,height,inRad,Off

