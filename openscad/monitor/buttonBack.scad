$fn=100;
holeEndD=16.1;
holeLength=120.1;
buttonHolderHeight=.5;

hull(){
    cylinder(h=buttonHolderHeight,d=holeEndD);
    translate([holeLength-holeEndD,0,0]) cylinder(h=buttonHolderHeight,d=holeEndD);
}