//42 RU twinrack 80x120x200
// Requires the include files to be present in order to work
include <include-Modules-v1.scad>;
include <logo-VSR.scad>;
library="true"; //set this to remove the warning when compiling the library on its own
//Rack Dimension Variables
NumRackUnits=42;
RackRackUnitDepth=900;
RackWidth=800;
RackDepth=1200;
RackHeight=2000;

//default titles
floorLevelTitle = "Empty Rack from settings file";
rackTopTitle1 = "Rack A";
rackTopTitle2 = "Rack B";

//first Rail mount hole offset from floor (normally one RU is enough for visuals Exact amount can also be entered)
RailHeightOffset=StandardRackUnitHeight;

// Generate DC Floor (each tile is 600x600 unless otherwise specified in the main modules)
useRaisedFloorYN="true";
DCfloor(4,4,FloorColor,RaisedFloorTransparency,RaisedFloorHeight,useRaisedFloorYN);

// Define Positions on DC Floor
RowOffset0=[400,600,0];
Rack1=[RackWidth*0,0,0]+RowOffset0;
Rack2=[RackWidth*1,0,0]+RowOffset0;
//invisible rack for optional animation (pop out)
Rack1A=[RackWidth*0,-RackDepth*$t,0]+RowOffset0;
Rack2A=[RackWidth*1,-RackDepth*$t,0]+RowOffset0;
//invisible rack for optional animation (pop in)
Rack1B=[RackWidth*0,(RackDepth*($t))-RackDepth,0]+RowOffset0;
Rack2B=[RackWidth*0,(RackDepth*($t))-RackDepth,0]+RowOffset0;

// Title
translate([0,0,-.5]) logo();
translate([300,50,-10]) floatLabel(floorLevelTitle,FloatLabelColorTitle,60,LabelT);

// Don't modify these. Instead USE them in the section to generate the racks below
RackBSidebarInfoON="true";
RackASidebarInfoON="false";

//Generate Racks
positionRack(Rack1,RackWidth,RackHeight,RackDepth,RackFrameThickness,RackColor,rackTopTitle1,RackASidebarInfoON);
positionRack(Rack2,RackWidth,RackHeight,RackDepth,RackFrameThickness,RackColor,rackTopTitle2,RackBSidebarInfoON);



