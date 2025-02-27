$fn=300;
//35mm measured fromn the 3 initial rings plus 2 mm
height=35;
//following testing only
height=5;
innerD=61.8 ;
// outerD=66 is good enough for the upper 1/3 part of the zoe can holder
// outerD=65 is good enough for the middle 1/3 part of the zoe can holder
// inner D 61 sticks just a slight bit on the fritzcola bottles but works
// turns out that while innerD 61.2 is fine for the one bottle I tested with the others are wider
// testing with .5mm extra
// and exchange upper and lower D to make it grow thinnner upwards
// should probably add three indents to make it fit even better but hey.... iterative :-)
// 61.7 sticks just slightly so adding.1mm
lowerOuterD=64;
upperOuterD=66.5;
module flange () {
    difference(){
        translate([0,0,.5]) cylinder(d2=lowerOuterD,d1=upperOuterD,h=height);
        cylinder(d=innerD,h=height+1);
    
    }
}
flange();