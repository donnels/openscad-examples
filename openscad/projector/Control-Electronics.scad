$fn = 100 ;
module toggleSwitch() {
    //twiddle the position a bit to account for material etc
    twiddle = [0,0,1] ;
    upperD = 6.5 ; upperH = 8.5 ;
    nutH   = 2 ; nutD   = 8 ;
    toggleH = 10 ; toggleD =1.5 ; toggleAngle = 10 ;
    toggleBody = [12.8,13.4,14] ; toggleBodyOff = [0,0,toggleBody.z/2] ;
    totH = toggleBody.z + upperH ;
    translate([0,0,-totH + nutH] + twiddle) {
        //Nut
        translate([0,0,toggleBody.z + upperH - nutH]) cylinder(h=nutH , d=nutD,$fn=6);
        //upper part
        cylinder(h=upperH + toggleBody.z, d=upperD);
        //toggle
        translate([0,0,toggleBody.z + upperH]) rotate([-toggleAngle,0,0]) cylinder(h=toggleH, d=toggleD);
        translate(toggleBodyOff) cube(toggleBody,center=true);
    }
}
//toggleSwitch();
module klemme(){
    import("Euroklemme-T80-15-6mm-Array.stl");
    translate([8,0,0]) import("Euroklemme-T80-15-6mm-Array.stl");
}
module motor(offset){
    cylD = 59.2 ;
    cylH = 60 ;
    motorMountPlate = [60.5,60.5,1.5] ;
    color("grey"){
        cylinder(h=cylH,d=cylD) ;
        translate([cylD/2+3,8,43]) rotate([0,90,0]) klemme() ;
        difference(){
            translate([0,0,cylH]) cube(motorMountPlate,center=true) ;
            translate([-25,25,cylH]) cylinder(h=3,d=4.3,center=true);
            translate([25,-25,cylH]) cylinder(h=3,d=4.3,center=true);
            translate([-25,-25,cylH]) cylinder(h=3,d=4.3,center=true);
            translate([25,25,cylH]) cylinder(h=3,d=4.3,center=true);
        }
        if (offset=="offset")  {
            translate([-10,0,.01]) cylinder(h=cylH+27,d=8);
            }
        else {
            translate([0,0,.01]) cylinder(h=cylH+27,d=8);
            }
    }
}

module OLED() {
    //OLED
    //Variable for subtractions so as to be slightly above borders
    diffWiggle = .2;
    //PCB dimensions
    PCB1306holeD = 2;
    PCB1306holeOff = [2,2,0] ;
    PCB1306 = [26.9, 27.9, 1.7] ;
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
}
module pin() {
    //for test fitting the PCB only
    pinH = 10 ; pinD1 =5 ; pinD2 = 2;
    cylinder(h = pinH, d1 = pinD1, d2 = pinD2);
}

module heatInset(height) {
    //instead of Pin for final heat inset mounting
    difference() {
        cylinder(h=height,d=7);
        //inside
        translate([0,0,-.01]) cylinder(h=height+.02,d=4.8);
    }
}
module emboss(height,halign,text){
    height = height + .02 ;
    translate([0,0,-height + .01]) linear_extrude(height) text(text,valign="center",halign=halign,size=5);
}
module statusLED() {
    cylinder(h=20,d=3.5);
    translate([0,0,10]) cube([5,5,2],center=true);
    translate([0,0,5])cube([7,8,10],center=true);
}
module OLEDhole() {
    //display cut out
    cutOut = [25,15,10] ;
    wiggle = [0,0,.01] ;
    translate([0,2,-cutOut.z/2]-wiggle) cube(cutOut+wiggle,center=true);
    //base plate
    basePlate = [27.5,27.8,20] ;
    translate([0,0,-basePlate.z/2-cutOut.z]) cube(basePlate,center=true);
}

//PCB mount
union() {
    translate([-4,-5,0]) cube([78,54,2]);
    translate([0,0,0]) heatInset(10);
    translate([0,44.5,0]) heatInset(10);
    translate([70,0,0]) heatInset(10);
}


//toggles
translate([0,-50,0]) difference() {
    translate([0,0,-10]) cube([70,20,10]);
    //switch auto/off/man
    translate([20,10,0]) rotate([0,0,90]) toggleSwitch(); 
    translate([10,4,0]) emboss(5,"center","Auto");
    translate([30,4,0]) emboss(5,"center","Man");
    translate([20,17,0]) emboss(5,"center","OFF");
    //switch up/stop/down
    translate([45,10,0]) toggleSwitch(); 
    translate([50,16,0]) emboss(5,"left","Up");
    translate([50,10,0]) emboss(5,"left","STOP");
    translate([50,4,0]) emboss(5,"left","Down");

}

//status
translate([0,-100,0]) difference() {
    translate([0,-3,-10]) cube([70,37,10]);
    translate([10,10,-15]) statusLED();
    translate([10,17,0]) emboss(5,"center","Status");
    translate([40,15,8]) union() {
        *translate([0,0,-11]) OLED();
        OLEDhole();
    }
}

translate([-75,0,0]) motor("offset");

translate([-70,-80,0]) union() {
    //approximation of cross sectio on casing!!! DRAFT
    cubeTest = [90,37,2] ;
    cube(cubeTest,center=true);
    rotate([0,0,45])cube(cubeTest,center=true);
    rotate([0,0,90])cube(cubeTest,center=true);
    rotate([0,0,135])cube(cubeTest,center=true);
}