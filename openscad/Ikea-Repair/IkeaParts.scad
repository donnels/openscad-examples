$fn=360;

module ivarPin(d=6, h=40) {
    cylinder(h=h, d=d);
}

module ilt(tw=50, tel=550, th=450, bel=50){
    bh=th-tw;bd=tel-bel;
    translate([0,0,bh])cube([tel,tel,tw]);
    for(x=[0,bd])for(y=[0,bd])translate([x,y,0])cube([bel,bel,bh]);
}

*rotate([0,90,0]) ivarPin();
*color("grey")ilt();

ivarSegment = [32,44,100];
ivarHPinSpace= 25 ;
ivarVPinSpace = 32;
pos1 = [9,9,9];
offsetH=[0,25,0];
offsetV=[0,0,32];
color("yellow") difference(){
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
    color("silver")translate(pos1+offsetV*2) rotate([0,90,0]) translate([0,0,-26]) ivarPin();
