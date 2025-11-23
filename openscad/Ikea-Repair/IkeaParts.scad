$fn=360;

module ivarPin(d=6, h=40) {
    cylinder(h=h, d=d);
}

module ilt(tw=50, tel=550, th=450, bel=50){
    bh=th-tw;bd=tel-bel;
    translate([0,0,bh])cube([tel,tel,tw]);
    for(x=[0,bd])for(y=[0,bd])translate([x,y,0])cube([bel,bel,bh]);
}

rotate([0,0,0]) ivarPin();
//color("grey")ilt();
