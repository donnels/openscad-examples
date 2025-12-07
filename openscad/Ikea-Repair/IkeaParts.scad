$fn=360;

module ivarPin(d=6, h=40) {
    cylinder(h=h, d=d);
}

module ilt(tw=50, tel=550, th=450, bel=50){
    bh=th-tw;bd=tel-bel;
    translate([0,0,bh])cube([tel,tel,tw]);
    for(x=[0,bd])for(y=[0,bd])translate([x,y,0])cube([bel,bel,bh]);
}

module ivarSegment(){
    ivarSegment = [32,44,100];
    ivarHPinSpace= 25 ;
    ivarVPinSpace = 32;
    pos1 = [9,9,9];
    offsetH=[0,25,0];
    offsetV=[0,0,32];
    #color("yellow") difference(){
        cube(ivarSegment);
        //row 1
        translate(pos1) rotate([0,90,0]) translate([0,0,-26]) ivarPin();
        translate(pos1+offsetH) rotate([0,90,0]) translate([0,0,-26]) ivarPin();
        //row2
        translate(pos1+offsetH+offsetV) rotate([0,90,0]) translate([0,0,-26]) ivarPin();
        translate(pos1+offsetV) rotate([0,90,0]) translate([0,0,-26]) ivarPin();
        //row3
        translate(pos1+offsetH+offsetV*2) rotate([0,90,0]) translate([0,0,-26]) ivarPin();
        translate(pos1+offsetV*2) rotate([0,90,0]) translate([0,0,-26]) ivarPin();
    }
}

module adapter(){
    pos1 = [9,9,9];
    offsetH=[0,25,0];
    offsetV=[0,0,32];
    translate(pos1+offsetV*2) rotate([0,90,0]) translate([0,0,-26]) ivarPin(5.8,35);
    translate(pos1+offsetV) rotate([0,90,0]) translate([0,0,-26]) ivarPin(5.8,35);
    translate([-20,0,34]) cube([20,14.9,47]);
}

module pinHanger(){
    positions = [40,20];
    pinD = 6 ; hangerW = 20 ; hangerL = 50 ; hangerT = 5;
    //top curve
    rotate_extrude(angle=180) translate([pinD/2, 0]) square([hangerT, hangerW]);
    //
    translate([-pinD/2-hangerT/2,0,0]) cylinder(h=hangerW, d=hangerT);
    //long pole with screw holes
    difference(){
        union(){
            translate([pinD/2,-hangerL,0]) cube([hangerT,hangerL,hangerW]);
            //add reinforcements here
             for(pos = positions) {
                translate([-8+6/2,-pos,10]) rotate([0,90,0])cylinder(h=8,d1=5,d2=20);
             }
        }
        //substract screw holes here
        for(pos = positions) {
            translate([-10+6/2,-pos,10]) rotate([0,90,0])cylinder(h=20,d=2);
        }
    }
}

//VISUALS
translate([0,0,450]){
    ivarSegment();
    translate([-20,9+25,9+64])rotate([90,0,90]) pinHanger();
    adapter();
    translate([-20,9+25,9+64]) rotate([0,90,0]) color("silver") ivarPin();
}
color("grey")ilt();