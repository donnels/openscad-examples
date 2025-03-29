// holder for Link sword

$fn=100;

restL=120;
standD=30;
standH=5;
standTaper=5;
holder1H=50;
holder2H=30;
holderD=5;
wiggle=.002;
hull(){
    cylinder(h=standH,d1=standD,d2=standD-standTaper);
    translate([restL, 0, 0]) cylinder(h=5,d1=standD,d2=standD-standTaper);
}

cylinder(h=holder1H+wiggle,d=holderD);
translate([restL, 0, 0])  cylinder(h=holder2H+wiggle,d=holderD);

module grip(){
    d=5; h=10; space=3;
    difference(){
        hull(){
            translate([0,0,h]) rotate([90,0,0]) cylinder(h=7,d=d,center=true);
            cube([5,7,5],center=true);
        }
        translate([0,0,7]) cube([10,3,15],center=true);
    }
}

translate([0,0,holder1H]) grip();
translate([restL,0,holder2H]) grip();