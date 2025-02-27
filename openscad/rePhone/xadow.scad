$fn=100;
module xadow_pin(){
    union(){
        translate([0,0,0]) cylinder(h=1,r1=1,r2=1);
        translate([0,0,1]) cylinder(h=3,r1=1,r2=.5);
    }
}
module xadow_gsm(){
    difference(){    
    union(){
            //Xadow madule
            //turns out the GSM module has exactly  25.37mm X 20.30mm / 1’’ X 0.8’’
            //approx 2mm hole 17.5mm x18mm
            cube([25.4,20.3,.75]);
            translate([3,1.5,0]) xadow_pin();
            translate([21.4,1.5,0]) xadow_pin();
            translate([3,18.5,0]) xadow_pin();
            translate([21.4,18.5,0]) xadow_pin();
            }
            *translate([25.4,20.3,0]) cylinder(h=1,r1=1,r2=1);
        }
}

xadow_gsm();