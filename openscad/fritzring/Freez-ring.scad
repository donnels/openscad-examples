$fn=100;
height=5;
innerD=54 ;
upperOuterD=73;
lowerOuterD=72.5;
module flange () {
    difference(){
        translate([0,0,.5]) cylinder(d2=lowerOuterD,d1=upperOuterD,h=height);
        cylinder(d=innerD,h=height+1);
    
    }
}
flange();