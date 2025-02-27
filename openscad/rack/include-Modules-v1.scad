//Script to create a DC RU Rack
//Author Sean Donnellan
//VERSION 0.0.1

//
// Variables
//
// Global
//  an inch is 2.54cm
//  Srandard 19" rack has 1.75 inches per RU - convert to mm
Factor=2.54 * 10;
StandardRackUnitHeight=(1.75 * Factor);
// Floor covering and tiles
//
FloorColor=[200/255, 200/255, 255/255];
FloorTileHeight=40;
FloorTileGap=10;
FloorTileXOffset=600;
FloorTileYOffset=600;
FloorTile=[FloorTileXOffset - FloorTileGap,FloorTileYOffset - FloorTileGap,FloorTileHeight];
//DC Floor supports
//
RaisedFloorHeight=500;
RaisedFloorTransparency=0.8;
RaisedFloorColor=[150/255, 150/255, 150/255];
FSd=60;
RaisedFloorStrutDiameter=60;
FloorCarrierDiameter=60;
// Rack
//
StandardRackUnitWidth=19 * Factor;
//NumRackUnits=42;
//RackRackUnitDepth=650;
//RackWidth=800;
//RackDepth=1200;
//RackHeight=2000;
////first Rail mount hole offset from floor (normally one RU is enough for visuals Exaxt amount can also be entered)
//RailHeightOffset=StandardRackUnitHeight;
SpecsIndent=100;
RackFrameThickness=20;
//RAL9005 14,14,16
RackColor=[14/255, 14/255, 16/255];
//Variables Are hard coded as they are standard and do not vary
RailWidth=15.875;
RailDepth=5;
CageNutWidth=9;
RackNutPos1=6.35;
RackNutPos2=(RackNutPos1+15.875);
RackNutPos3=(RackNutPos2+15.875);
// Devices
//
//Cosmetic gap
RackUnitGap=3;
RackUnitColor=[100/255, 100/255, 100/255];
RackUnitColorRed=[200/255, 100/255, 100/255];
RackUnitColorGreen=[100/255, 200/255, 100/255];
RackUnitColorBlue=[100/255, 100/255, 200/255];
RackUnitColorYellow=[200/255, 200/255, 100/255];
Rotation=[0,0,0];
Translation=[0,0,0];
// Title
//
FloatLabelColor=[1,1,1];
FloatLabelColorTitle=[0,0,1];
//Label transparency - 1=solid 0=invisible 0.5=half transparent
LabelT=1;
// Air flow
//
afTransp=.23;
afCold=[0,0,1];
afHot=[1,0,0];
afArrowSize=300;

//
// Modules
//

// Rack mounted Devices
//
//
module placeInRack(RUp,RackUnitWidth,RackUnitHeight,RackUnitDepth,RackUnitColor,Label,AFIn,AFOut,Side){
    XWiggle=RackWidth - StandardRackUnitWidth;
    ZWiggle=RackDepth - RackRackUnitDepth;
    OffsetInRack=[ XWiggle/2 , ZWiggle/2 , ((RUp * StandardRackUnitHeight)-(StandardRackUnitHeight))+(RailHeightOffset)];

    translate(OffsetInRack)
        multiRackUnit(RackUnitWidth,RackUnitHeight,RackUnitDepth,RackUnitColor,Label,AFIn,AFOut,Side);
}

module multiRackUnit (RackUnitWidth,RackUnitHeight,RackUnitDepth,RackUnitColor,Label,afin,afout,Side) {
    Rotation=
        Side=="front-inside" ? [0,0,0] :
        Side=="right-inside" ? [0,0,90] :
        Side=="rear-inside" ? [0,0,180] :
        Side=="left-inside" ? [0,0,270] :
        Side=="front-inside-reverse" ? [0,0,180] :
        Side=="right-inside-reverse" ? [0,0,270] :
        Side=="rear-inside-reverse" ? [0,0,0] :
        Side=="left-inside-reverse" ? [0,0,90] :
        Side=="front-outside" ? [0,0,0] :
        Side=="right-outside" ? [0,0,90] :
        Side=="rear-outside" ? [0,0,180] :
        Side=="left-outside" ? [0,0,270] :
        Side=="front-outside-reverse" ? [0,0,180] :
        Side=="right-outside-reverse" ? [0,0,270] :
        Side=="rear-outside-reverse" ? [0,0,0] :
        Side=="left-outside-reverse" ? [0,0,90] :
		Side=="frp-inside" ? [0,0,0] :
		Side=="frp-outside" ? [0,0,0] :
		Side=="flp-inside" ? [0,0,0] :
		Side=="flp-outside" ? [0,0,0] :
		Side=="rrp-inside" ? [0,0,0] :
		Side=="rrp-outside" ? [0,0,0] :
		Side=="rlp-inside" ? [0,0,0] :
		Side=="rlp-outside" ? [0,0,0] :
		Side=="shelf-c" ? [0,0,0] :
		Side=="shelf-r" ? [0,0,0] :
		Side=="shelf-l" ? [0,0,0] :
        [0,0,0] ;

    Translation=
        Side=="front-inside" ? [(StandardRackUnitWidth/2)-(RackUnitWidth/2),0,0] :
        Side=="right-inside" ? [StandardRackUnitWidth,(RackRackUnitDepth/2)-(RackUnitWidth/2),0] :
        Side=="rear-inside" ? [(StandardRackUnitWidth/2)+(RackUnitWidth/2),RackRackUnitDepth,0] :
        Side=="left-inside" ? [0,(RackRackUnitDepth/2)+(RackUnitWidth/2),0] :
        Side=="front-inside-reverse" ? [(StandardRackUnitWidth/2)+(RackUnitWidth/2),RackUnitDepth,0] :
        Side=="right-inside-reverse" ? [StandardRackUnitWidth-RackUnitDepth,(RackRackUnitDepth/2)+(RackUnitWidth/2),0] :
        Side=="rear-inside-reverse" ? [(StandardRackUnitWidth/2)-(RackUnitWidth/2),RackRackUnitDepth-RackUnitDepth,0] :
        Side=="left-inside-reverse" ? [RackUnitDepth,(RackRackUnitDepth/2)-(RackUnitWidth/2),0] :
        Side=="front-outside" ? [(StandardRackUnitWidth/2)-(RackUnitWidth/2),-RackUnitDepth,0] :
        Side=="right-outside" ? [StandardRackUnitWidth+RackUnitDepth,(RackRackUnitDepth/2)-(RackUnitWidth/2),0] :
        Side=="rear-outside" ? [(StandardRackUnitWidth/2)+(RackUnitWidth/2),RackRackUnitDepth+RackUnitDepth,0] :
        Side=="left-outside" ? [-RackUnitDepth,(RackRackUnitDepth/2)+(RackUnitWidth/2),0] :
        Side=="front-outside-reverse" ? [(StandardRackUnitWidth/2)+(RackUnitWidth/2),0,0] :
        Side=="right-outside-reverse" ? [StandardRackUnitWidth,(RackRackUnitDepth/2)+(RackUnitWidth/2),0] :
        Side=="rear-outside-reverse" ? [(StandardRackUnitWidth/2)-(RackUnitWidth/2),RackRackUnitDepth,0] :
        Side=="left-outside-reverse" ? [0,(RackRackUnitDepth/2)-(RackUnitWidth/2),0] :
        Side=="frp-inside" ? [0,0,0] :
		Side=="frp-outside" ? [0,0,0] :
		Side=="flp-inside" ? [0,0,0] :
		Side=="flp-outside" ? [0,0,0] :
		Side=="rrp-inside" ? [0,0,0] :
		Side=="rrp-outside" ? [0,0,0] :
		Side=="rlp-inside" ? [0,0,0] :
		Side=="rlp-outside" ? [0,0,0] :
		Side=="shelf-c" ? [(StandardRackUnitWidth/2)-(RackUnitWidth/2),(RackRackUnitDepth/2)-(RackUnitDepth/2),0] :
		Side=="shelf-r" ? [(StandardRackUnitWidth-RackUnitWidth),(RackRackUnitDepth/2)-(RackUnitDepth/2),0] :
		Side=="shelf-l" ? [0,(RackRackUnitDepth/2)-(RackUnitDepth/2),0] :
		[0,0,0] ;

    translate(Translation) rotate(Rotation) {
        difference() {
            rackUnitSolid(RackUnitWidth,RackUnitHeight-RackUnitGap,RackUnitDepth,RackUnitColor);
            //render the label embossed
            *embossLabel(Label);
        }
        floatLabel(Label,FloatLabelColor,30,LabelT);
        afOffset=(afArrowSize+(afArrowSize/3))/2;
        front=[RackUnitWidth/2,-afOffset,0];
        back=[RackUnitWidth/2,RackUnitDepth+afOffset,0];
        left=[-afOffset,RackUnitDepth/2,0];
        right=[RackUnitWidth+afOffset,RackUnitDepth/2,0];
        outAdd=[0,0,21];
        if(useAirFlowYN=="true"){
            if(afin=="front"){
                translate(front) rotate([0,0,0]) afArrow(afCold,afTransp,afArrowSize);
            }else if(afin=="back"){
                translate(back) rotate([0,0,180]) afArrow(afCold,afTransp,afArrowSize);
            }else if(afin=="left"){
                translate(left) rotate([0,0,270]) afArrow(afCold,afTransp,afArrowSize);
            }else if(afin=="right"){
                translate(right) rotate([0,0,90]) afArrow(afCold,afTransp,afArrowSize);
            }
            if(afout=="front"){
                translate(front+outAdd) rotate([0,0,180]) afArrow(afHot,afTransp,afArrowSize);
            }else if(afout=="back"){
                translate(back+outAdd) rotate([0,0,0]) afArrow(afHot,afTransp,afArrowSize);
            }else if(afout=="left"){
                translate(left+outAdd) rotate([0,0,90]) afArrow(afHot,afTransp,afArrowSize);
            }else if(afout=="right"){
                translate(right+outAdd) rotate([0,0,270]) afArrow(afHot,afTransp,afArrowSize);
            }
        }
    }
}

module afArrow(temp,transp,Size){
    Height=20;
    Radius=Height/2;
    Width=Size/3;
    HeadHeight=(Size/10)*8;

    translate([-Width,-Size/2,0]) color(temp,transp) union(){
        hull(){
            //bottom of arrow base
            translate([Width/2,0,Radius]) sphere(r=Radius);
            translate([Width+Width/2,0,Radius]) sphere(r=Radius);
            //top of arrow base
            translate([Width/2,HeadHeight-Radius*3,Radius]) sphere(r=Radius);
            translate([Width+Width/2,HeadHeight-Radius*3,Radius]) sphere(r=Radius);
        }
        hull(){
            //tip
            translate([Width,Size,Radius]) sphere(r=Radius-5);
            //base of tip
            translate([0,HeadHeight,Radius]) sphere(r=Radius+7);
            translate([Width*2,HeadHeight,Radius]) sphere(r=Radius+7);
        }
    }
}

module rackUnitSolid(RUx,RUy,RUz,RUc){
    color(RUc) cube([RUx,RUz,RUy]);
}

module embossLabel(Label){
    TextDepth=20; //how deep to extrude the text so positioning in device and extruding out
    translate([10,TextDepth,10]) rotate([90,0,0])
        linear_extrude(height=TextDepth){text(Label, size=30);}
    ;
}

// DC Floor tiles
//
//
module DCfloor(NumTilesX,NumTilesY,Color,Transparency,RaisedFloorHeight,RFTrue){
    union(){
        for (yp=[1:FloorTileYOffset:NumTilesY * FloorTileYOffset]){
            for (xp=[1:FloorTileXOffset:NumTilesX * FloorTileXOffset]){
                translate([xp,yp,0]){
                    translate([0,0,-FloorTileHeight]){floorTile(FloorTile,Color,Transparency);}
                    //comment the next line to hide the raised floor details
                    if(RFTrue=="true"){
                        raisedFloor(RaisedFloorColor,RaisedFloorHeight,RaisedFloorStrutDiameter,FloorCarrierDiameter,FloorTileXOffset,FloorTileYOffset,FloorTileHeight);
                    }
                }
            }
        }
    }
}

module floorTile(Ft,Ftc,Ftt){
    color(Ftc,Ftt) cube(Ft);
}

// DC Raised floor
//
module raisedFloor(FSc,RFh,FSd,FCd,FTOx,FTOy,FTh){
	FloorCarrierAndTileHeight=FCd+FTh;
	SupportHeight=RFh-FloorCarrierAndTileHeight;
	SupportOffset=SupportHeight+FloorCarrierAndTileHeight;
	union(){
    	translate([0,0,-SupportOffset]) color(FSc) floorSupports(FSc,SupportHeight,FSd,FTOx,FTOy);
        translate([0,0,-FTh]) color(FSc) floorTileCarriers(FCd,FTOx,FTOy);
	}
}

module floorCarrier(FCd,FCl){
    translate([FCd/2,-FCd/2,-FCd]) cube([FCl-FCd,FCd,FCd]);
}

module floorTileCarriers(FTCd,FTOx,FTOy){
    floorCarrier(FTCd,FTOx);
    translate([0,FTOy,0]) floorCarrier(FTCd,FTOx);
    rotate([0,0,90]) floorCarrier(FTCd,FTOy);
    translate([FTOx,0,0]) rotate([0,0,90]) floorCarrier(FTCd,FTOy);
}


module floorSupports(FSc,FSh,FSd,FTOx,FTOy){
    color(FSc){
        floorSupport(FSh,FSd);
        translate([FTOx,0,0]) floorSupport(FSh,FSd);
        translate([0,FTOy,0]) floorSupport(FSh,FSd);
        translate([FTOx,FTOy,0]) floorSupport(FSh,FSd);
    }
}

module floorSupport(FSh,FSd) {
	union(){
		cylinder(h=FSh,d=FSd);
        cylinder(h=50, r1=FSd, r2=0);
        translate([0,0,FSh-50]) cylinder(h=50, r1=0, r2=FSd);
	}
}

// Titles
//
//
module floatLabel(Label,Color,Size,LabelT){
    TextDepth=Size/10; //how deep to extrude the text
    translate ([10,-30,10]) rotate([90,0,0]) color(Color,LabelT) linear_extrude(height=TextDepth){text(Label, size=Size);};
}

module StaticLabel(Label,Color,Size,LabelT){
    TextDepth=Size/10; //how deep to extrude the text
    translate ([0,0,0]) rotate([90,0,0]) color(Color,LabelT) linear_extrude(height=TextDepth){text(Label, size=Size);};
}
// Utilities
//
//
//power("Power Rail A",FloatLabelColorTitle,LabelT,0,2*600+500,2790,20*600,0.1);
//
module power(Label,Labelc,LabelT,Xo,Yo,Height,Width,Rt){
    translate([Xo,Yo,Height]){
        color([200/255,200/255,200/255],Rt) cube([Width,50,200]);
        translate([1100,0,100]) floatLabel(Label,Labelc,100,LabelT);
    }
}
//
//lighting("Lighting Row A",FloatLabelColorTitle,LabelT,0,2*600+500,2560,20*600,0.1);
//
module lighting(Label,Labelc,LabelT,Xo,Yo,Height,Width,Rt){
    translate([Xo,Yo,Height]){
        color([200/255,200/255,200/255],Rt) cube([Width,200,50]);
        translate([80,0,100]) floatLabel(Label,Labelc,100,LabelT);
    }
}
//
//sprinkler("Sprinkler Row A",FloatLabelColorTitle,LabelT,0,2*600+400,2860,20*600,0.1);
//
module sprinkler(Label,Labelc,LabelT,Xo,Yo,Height,Width,Rt){
    translate([Xo,2*600+400,2860]){
        union(){
            color([200/255,200/255,200/255],Rt){
                rotate([0,90,0])
                    cylinder(h=Width,d=50)
                ;
                translate([1000,0,0])
                    rotate([0,0,90])
                    cylinder(h=400,d=50)
                ;
            }
        }
    //there is a 2520mm high pipe linking the sprinler rows.
    translate([500,0,0]) floatLabel(Label,Labelc,100,LabelT);
    }
}
// Rack Stuff
module positionRack(FloorOffset,RackWidth,RackHeight,RackDepth,RackFrameThickness,RackColor,Label,TagsYN){
    translate(FloorOffset) rackFrame(RackWidth,RackHeight,RackDepth,RackFrameThickness,RackColor);
	translate(FloorOffset+[0,0,RackHeight+10]) floatLabel("Front",[0,0,0],40,LabelT);
    translate(FloorOffset+[RackWidth/4,0,RackHeight+10]) floatLabel(Label,[0,0,1],60,LabelT);
	translate(FloorOffset+[RackWidth,RackDepth,RackHeight+10]) rotate([0,0,180]) floatLabel("Rear",[0,0,0],40,LabelT);
    if(TagsYN=="true"){
	    translate(FloorOffset+[RackWidth+SpecsIndent,RackDepth/2,RackHeight-3*StandardRackUnitHeight]) floatLabel("Rack Dimensions:",[0,0,0],40,LabelT);
	    translate(FloorOffset+[RackWidth+SpecsIndent,RackDepth/2,RackHeight-5*StandardRackUnitHeight]) floatLabel("Rack Height (mm) -",[0,0,0],40,LabelT);
	    translate(FloorOffset+[RackWidth+SpecsIndent,RackDepth/2,RackHeight-6*StandardRackUnitHeight]) floatLabel(str(RackHeight),[0,0,0],40,LabelT);
	    translate(FloorOffset+[RackWidth+SpecsIndent,RackDepth/2,RackHeight-8*StandardRackUnitHeight]) floatLabel("Rack Width (mm) -",[0,0,0],40,LabelT);
	    translate(FloorOffset+[RackWidth+SpecsIndent,RackDepth/2,RackHeight-9*StandardRackUnitHeight]) floatLabel(str(RackWidth),[0,0,0],40,LabelT);
	    translate(FloorOffset+[RackWidth+SpecsIndent,RackDepth/2,RackHeight-11*StandardRackUnitHeight]) floatLabel("Rack Depth (mm) -",[0,0,0],40,LabelT);
	    translate(FloorOffset+[RackWidth+SpecsIndent,RackDepth/2,RackHeight-12*StandardRackUnitHeight]) floatLabel(str(RackDepth),[0,0,0],40,LabelT);
    }
    XWiggle=RackWidth - StandardRackUnitWidth;
    ZWiggle=RackDepth - RackRackUnitDepth;
    OffsetInRack=[ XWiggle/2 , ZWiggle/2 , RailHeightOffset];
    echo(OffsetInRack);
    translate(FloorOffset) translate(OffsetInRack) rails();
}
module rackFrame(Rx,Ry,Rz,St,Rc){
    //Rx RackWidth, Ry RackHeight, Rz RackDepth, St StrutThickness, Rc RackColor
    union(){
        //front and back Struts
        translate ([0,0,0]) rackStrutX(St,Rx,Rc);
        translate ([0,Rz-St,0]) rackStrutX(St,Rx,Rc);
        translate ([0,Rz-St,Ry-St]) rackStrutX(St,Rx,Rc);
        translate ([0,0,Ry-St]) rackStrutX(St,Rx,Rc);
        //Side Struts
        translate ([0,0,0]) rackStrutZ(St,Rz,Rc);
        translate ([Rx-St,0,0]) rackStrutZ(St,Rz,Rc);
        translate ([Rx-St,0,Ry-St]) rackStrutZ(St,Rz,Rc);
        translate ([0,0,Ry-St]) rackStrutZ(St,Rz,Rc);
        //Uprights
        translate ([0,0,0]) rackStrutY(St,Ry,Rc);
        translate ([0,Rz-St,0]) rackStrutY(St,Ry,Rc);
        translate ([Rx-St,Rz-St,0]) rackStrutY(St,Ry,Rc);
        translate ([Rx-St,0,0]) rackStrutY(St,Ry,Rc);
    }
}

module rackStrutX(RackFrameThickness,RackWidth,Color){
    //all measurements in mm
    color(Color,0.8) cube([RackWidth,RackFrameThickness,RackFrameThickness]);
}
module rackStrutZ(RackFrameThickness,RackDepth,Color){
    //all measurements in mm
    color(Color,0.8) cube([RackFrameThickness,RackDepth,RackFrameThickness]);
}
module rackStrutY(RackFrameThickness,RackHeight,Color){
    //all measurements in mm
    color(Color,0.8) cube([RackFrameThickness,RackFrameThickness,RackHeight]);
}

module rails() {
	posts=[["FR",[StandardRackUnitWidth,0,0],"false"],["FL",[-RailWidth,0,0],"true"],["BR",[-RailWidth,RackRackUnitDepth,0],"false"],["BL",[StandardRackUnitWidth,RackRackUnitDepth,0],"true"]];
    for (outl=[0:len(posts)-1]) {
		for(i=[1:1:NumRackUnits]) {
            var=posts[outl];
            FBLR=var[0];
            Translate=var[1];
            LabelYN=var[2];
    		translate(Translate+[0,0,(i*StandardRackUnitHeight)-StandardRackUnitHeight]) railSection(LabelYN,"true",RackColor,str(i),FBLR);
        }
    }
}
module railSection (LabelYN,RailYN,Color,RU,RailFBLR) {
    //module creates a rack rail section for exactly one RU
    //Front right or left and rear right or left post plus RU numbering
	Translation=
        RailFBLR=="FL" ? [-50,4,10] :
        RailFBLR=="FR" ? [20,4,10] :
        RailFBLR=="BL" ? [65,0,10] :
        RailFBLR=="BR" ? [0,0,10] :
		[0,0,0] ;
	Rotation=
        RailFBLR=="FL" ? [0,0,0] :
        RailFBLR=="FR" ? [0,0,0] :
        RailFBLR=="BL" ? [0,0,180] :
        RailFBLR=="BR" ? [0,0,180] :
		[0,0,0] ;
    if(RailYN=="true"){
	    color(Color) difference(){
		    cube([RailWidth,RailDepth,StandardRackUnitHeight]);
		    translate([(RailWidth-CageNutWidth)/2,-.1,RackNutPos1]) translate([0,0,-CageNutWidth/2]) cube([CageNutWidth,CageNutWidth,CageNutWidth]);
		    translate([(RailWidth-CageNutWidth)/2,-.1,RackNutPos2]) translate([0,0,-CageNutWidth/2]) cube([CageNutWidth,CageNutWidth,CageNutWidth]);
		    translate([(RailWidth-CageNutWidth)/2,-.1,RackNutPos3]) translate([0,0,-CageNutWidth/2]) cube([CageNutWidth,CageNutWidth,CageNutWidth]);
	    }
    }
    if(LabelYN=="true"){
	    translate(Translation) rotate(Rotation) StaticLabel(RU,FloatLabelColorTitle,30,1);
    }
}

if (library) {} else  {
	echo("trying to compile a library!");
	linear_extrude(height = 4) {
		text("trying to compile a library!");
		}
	}

// User Data
// after this
