diam=9;
diamOut=14.4;
holeDiam=5;
height=8.2;
$fn=100;
knurlNum=8;
knurlInc=360/knurlNum;
knurlDiam=4;
insetHeight=5;
insetDiam=5;
totalHeight=10;


module knob() {
difference(){
    union(){
        cylinder(h=height, d=diamOut);
        translate([0,0,height]){
        cylinder(h=totalHeight-height,r1=7.2,r2=5);
        }
    }
    translate([0,0,-.5])
        cylinder(h=totalHeight+1, d=holeDiam);
    translate([0,0,-.5]){
        cylinder(h=totalHeight-insetHeight+.5,d1=holeDiam+5,d2=holeDiam);
    }
    }
    
for(i=[0: knurlInc: 360]){
   rotate([0,0,i]) 
        translate([diamOut/2,0,0])
            cylinder(h=height, d=knurlDiam);
}
    }
    

knob();






