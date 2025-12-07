//led holder clip
$fn=100; //how round is this? one face for every degree
clipThick = 2; clipW = 10;
strip = [100,10,3]; //a snippet of led strip (in silicon sleeve

//the strip approximation for scale
*cube(strip);
pos0=[clipThick/2,strip.y,clipThick/2+strip.z];
pos1=[clipThick/2,-clipThick/2,clipThick/2+strip.z];
pos2=[clipThick/2,-clipThick/2,clipThick/2];
pos3=[clipThick/2,-clipThick/2-strip.y,clipThick/2];
widthOffset=[clipW,0,0];
wiggle=.01;
module screw() {
    height=11;
    shaftD=2;
    headH=3;headD=5.75;
    translate([0,0,0]) {
        //shaft
        translate([0,0,-height]) cylinder(h=height,d=shaftD);
        //head
        translate([0,0,-headH]) cylinder(h=headH+wiggle,d1=shaftD,d2=headD);
    }
}
//the clip
module clip(){
    union(){
        //top plate
        hull() {
            hull() {
                translate(pos0) sphere(d=clipThick);
                translate(pos0+widthOffset) sphere(d=clipThick);
            }
            hull() {
                translate(pos1) sphere(d=clipThick);
                translate(pos1+widthOffset) sphere(d=clipThick);
            }
        }
        //knee
        hull() { 
            hull() {
                translate(pos1) sphere(d=clipThick);
                translate(pos1+widthOffset) sphere(d=clipThick);
            }
            hull() {
                translate(pos2) sphere(d=clipThick);
                translate(pos2+widthOffset) sphere(d=clipThick);
            } 
        }
        //mount plate
        hull(){
            hull() {
                translate(pos2) sphere(d=clipThick);
                translate(pos2+widthOffset) sphere(d=clipThick);
            } 
            hull() {
                translate(pos3) sphere(d=clipThick);
                translate(pos3+widthOffset) sphere(d=clipThick);
            }
        }   
    } 
}
difference(){
    clip();
    translate([clipW/2+clipThick/2,-strip.y/2-clipThick/2,clipThick]) screw();
}

