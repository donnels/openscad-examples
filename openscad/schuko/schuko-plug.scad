// Shuko plug
$fn = 100;
height = 19; //total height to top rim
plugTopD = 42; //diameter of top cover
plugTopH = 2; //2mm rim height of top cover
plugTopOff = 16.8 ; //from bottom to top rim
diffWiggle = .2;
diffWiggleA = [diffWiggle, diffWiggle, diffWiggle];
diffWiggleX = [diffWiggle, 0, 0];
diffWiggleY = [0, diffWiggle, 0];
diffWiggleZ = [0, 0, diffWiggle];
plugBottomD = 38;
plugBottomH = plugTopOff;
plugSideCutH = 3;
plugSideCutW = 5;
zdiff = [0,0,-diffWiggle/2];
cutCube = 8;
cubeXY = plugBottomD-(plugSideCutH+9);
cubeFloor = 2;
pinR = 9.5 ; //The distance from the center that the 220v power pins should be at

//ssd1306 variables
ssd1306X = 26.9 ;
ssd1306Y = 27.9 ;
ssd1306off = [2,2,0] ; 
ssd1306XY = [ssd1306X,ssd1306Y,0] ;
ssd1306PCBH = 1.7 ;
ssd1306PCBZ = [0, 0, ssd1306PCBH] ;
ssd1306PCBdim = ssd1306PCBZ + ssd1306XY ;
ssd1306mountD = 2 ;
LCDX = 27.5 ; // left to right
LCDY = 20 ; // topR to bottomR
LCDZ = 2 ; // height from PCB
LCDflexW = 13 ; //flex cable width
LCDflexH = 3 ; //flex cable length from LCD to edge
LCDmask = 4; //how much to cover up at the bottom
LCDdim = [LCDX,LCDY,LCDZ]; //Dimensions
FLEXdim = [LCDflexW,LCDflexH,LCDdim.z]; //Dimensions
LCDdimXY = [LCDX, LCDY, 0]; //XY Dimensions only without Z

module pegs(XYdimensions,offset,height,diameter) {
    //mounting holes - no need to zdiff as centered
    //relative positions
        TR= [ [+1, 0, 0], [0, +1, 0], [0, 0, 0] ];
        TL= [ [-1, 0, 0], [0, +1, 0], [0, 0, 0] ];
        BR= [ [+1, 0, 0], [0, -1, 0], [0, 0, 0] ];
        BL= [ [-1, 0, 0], [0, -1, 0], [0, 0, 0] ];
        // move to TR then move back towards BL by offset etc 
        mPosTR = (TR * XYdimensions/2) + (offset * BL) ;
        mPosTL = (TL * XYdimensions/2) + (offset * BR) ;
        mPosBR = (BR * XYdimensions/2) + (offset * TL) ;
        mPosBL = (BL * XYdimensions/2) + (offset * TR) ;
    translate (mPosTR) cylinder(h = height, d = diameter, center = true);
    translate (mPosTL) cylinder(h = height, d = diameter, center = true);
    translate (mPosBR) cylinder(h = height, d = diameter, center = true);
    translate (mPosBL) cylinder(h = height, d = diameter, center = true);
}

module ssd1306(PCBdim,LCDdim,FLEXdim,PCBwiggle,LCDwiggle) {
    difference() {
        union() {
            //PCB
            translate( [0, 0, PCBdim.z/2] )  color("green") cube(PCBdim + PCBwiggle, center = true);
            //LCD
            translate( [0, 0, PCBdim.z + LCDdim.z/2] ) color("black") cube(LCDdim + LCDwiggle, center = true);
            //FLEX
            translate( [0, -LCDdim.y/2 - FLEXdim.y/2, PCBdim.z + FLEXdim.z/2] ) color("brown") cube(FLEXdim, center = true);
        }
        translate( [0, 0, PCBdim.z/2] ) pegs(ssd1306XY, ssd1306off, PCBdim.z + diffWiggle, 2);
    }
}


module PCB(resize) {
    difference() {
        //ssd1306 PCB
        cube( ssd1306XY + ssd1306PCBZ + resize, center = true );
        //holes only needed for initial tests to see if alligned
        *pegs(ssd1306XY,ssd1306off,ssd1306PCBH+diffWiggle,ssd1306mountD);
    }
}

//ssd1306 mounting harness
module ssd1306Harness(resize) {
    pegD = 1.7 ;
    pegH = 5 ;
    pegZ = [0, 0, pegH] ;
    difference() {
        PCB(resize);
        cube([22,22,diffWiggle] + ssd1306PCBZ, center=true);
        translate([0, 12, 0]) cube([15, 3, diffWiggle] + ssd1306PCBZ, center=true);
        translate([0, 0, 0]) cube([25, 6, diffWiggle] + ssd1306PCBZ, center=true);
    }
    //add mounting pegs
    translate( pegZ/2 + ssd1306PCBZ/2 ) pegs(ssd1306XY,ssd1306off,pegH,pegD);
}

module cover() {
    //cover
    coverThick = .5 ;
    rimH = 1.5 ;
    vieportThick = .5 ;
    rimThick = 1;
    union() {
        translate([0,0,+coverThick/2]) difference() {
            //top cover
            cylinder(h=coverThick, d=plugTopD, center=true);
            //LCD assumed to be dead center
            cube(LCDdimXY + [0, 0, coverThick + diffWiggle], center=true);
            //flex cable
            translate([0, -LCDY/2 - LCDflexH/2 + diffWiggle, 0])
                cube([LCDflexW, LCDflexH + diffWiggle, coverThick + diffWiggle], center=true);
            //subtract mounting holes
            pegs(ssd1306XY,ssd1306off,coverThick + diffWiggle,ssd1306mountD+.3);
        }
    }
}

module plug() {
    //plug inset
    difference () {
        union() {
            difference() {
                //Plug
                cylinder(h=plugBottomH,d=plugBottomD);
                //Cut the guide left and right
                    cutOffTR=[(plugBottomD/2)-plugSideCutH,plugSideCutW/2,0];
                    cutOffTL=[-((plugBottomD/2)+plugSideCutH)+plugSideCutH,plugSideCutW/2,0];
                    cutOffBR=[(plugBottomD/2)-plugSideCutH,-(plugSideCutW/2)-cutCube,0];
                    cutOffBL=[-((plugBottomD/2)+plugSideCutH)+plugSideCutH,-plugSideCutW/2-cutCube,0];
                    cutCube=[plugSideCutH,cutCube,plugBottomH+diffWiggle];
                translate(cutOffTR+zdiff)cube(cutCube);
                translate(cutOffTL+zdiff)cube(cutCube);
                translate(cutOffBR+zdiff)cube(cutCube);
                translate(cutOffBL+zdiff)cube(cutCube);
            }
            // add a top rim
            translate([0,0,plugTopOff]) cylinder(h=plugTopH, d=plugTopD);
        }
        //cube cutout for inner volume
        translate([0, 0, height/2 + cubeFloor]) cube([cubeXY, cubeXY, height], center = true);
        //punch holes for cabling where 220v power pins should be
        translate([pinR,0,0])translate(zdiff) cylinder(h=cubeFloor+diffWiggle,d=6);
        translate([-pinR,0,0])translate(zdiff) cylinder(h=cubeFloor+diffWiggle,d=6);
        //make room for the PCB
        translate([0,0,plugTopOff+1]) PCB([1, 1, 0]);
        translate([0,0,plugTopOff+2]) PCB([1, 1, 0]);
    }
    //add in the harness
    translate([0,0,plugTopOff-.7]) ssd1306Harness([-1, -1, 0]);
}
//
// OUTPUT
//

//plug
    plug();
//SSD1306 LCD
    translate([0,0,25]) ssd1306 ( ssd1306PCBdim, LCDdim, FLEXdim, [0, 0, 0], [0, 0, 0] );
//top cover
    translate([0,0,33]) cover();
