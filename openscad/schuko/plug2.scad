// mental gymnastics for centered and parametric 3d object

$fn=100;

//Variable for subtractions so as to be slightly above borders
diffWiggle = .2;

//PCB dimensions
PCB1306holeD = 2;
PCB1306holeOff = [2,2,0] ;
    PCB1306Z = 1.7 ;
    PCB1306X = 26.9 ;
    PCB1306Y = 27.9 ;
PCB1306 = [PCB1306X, PCB1306Y, PCB1306Z] ;
//1306 Top components
    LCDmaskY = 4; //how much to cover up at the bottom
    LCDX = 27.5 ; // left to right
    LCDY = 20 ; // topR to bottomR
    LCDZ = 2 ; // height from PCB
    LCDflexX = 13 ; //flex cable width
    LCDflexY = 3 ; //flex cable length from LCD to edge
LCD = [LCDX, LCDY, LCDZ] ;
LCDpos = [0, 0, PCB1306.z] ; //sits on top of the PCB and is centered
LCDviewPos = [0, LCDmaskY/2, PCB1306.z] ; //on top of the PCB above the masked part
LCDmask = [LCD.x, LCDmaskY, LCD.z] ; // is part of the LCD so shares X and Z
LCDmaskPos = [0, -LCD.y/2 +LCDmask.y/2, LCDpos.z] ; // sits below the viewport of the LCD
LCDview = [LCD.x, LCD.y - LCDmask.y, LCD.z]; // is part of the LCD just without the masked part
LCDflex = [LCDflexX, LCDflexY, LCD.z] ; //is considered as high as the LCD
LCDflexPos = [0, -LCD.y/2 -LCDflex.y/2, PCB1306.z] ; //sits bellow the LCD
//1306 bottom clearance items

//array - put the parts together
extrudeFalse = false ; extrudeTrue = true ;
object = [
    [PCB1306, [0, 0, 0], "green", extrudeFalse],
    [LCDview, LCDviewPos, "black", extrudeTrue],
    [LCDflex, LCDflexPos, "brown", extrudeTrue],
    [LCDmask, LCDmaskPos, "grey", extrudeTrue]
];
 
module pegs(XYZ,offset,holeD) {
    //mounting holes - no need to zdiff as centered
    //relative positions
        H = XYZ.z ;
        XY = [XYZ.x, XYZ.y, 0] ;
        TR= [ [+1, 0, 0], [0, +1, 0], [0, 0, 0] ];
        TL= [ [-1, 0, 0], [0, +1, 0], [0, 0, 0] ];
        BR= [ [+1, 0, 0], [0, -1, 0], [0, 0, 0] ];
        BL= [ [-1, 0, 0], [0, -1, 0], [0, 0, 0] ];
        // move to TR then move back towards BL by offset etc 
        posTR = (TR * XY/2) + (offset * BL) ;
        posTL = (TL * XY/2) + (offset * BR) ;
        posBR = (BR * XY/2) + (offset * TL) ;
        posBL = (BL * XY/2) + (offset * TR) ;
    translate (posTR) cylinder(h = H, d = holeD, center = true);
    translate (posTL) cylinder(h = H, d = holeD, center = true);
    translate (posBR) cylinder(h = H, d = holeD, center = true);
    translate (posBL) cylinder(h = H, d = holeD, center = true);
}

module brickLayer(array) {
    module blocks(list) {
        translate (list[1]) color(list[2]) cube(list[0], center=true);
    }
    for ( i = [0 : len(array) - 1] ) { blocks(array[i]); }
}
//OUTPUT
difference(){
    brickLayer(object);
    pegs(PCB1306 + [0, 0, diffWiggle], PCB1306holeOff, PCB1306holeD);
}
