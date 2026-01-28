//engraver stuff to mount the engraver to
//aim is to hold wooden credit card sized nfc cards in place under the engraver
//effectively this MAY turn into a modular rig to hold holders and the engraver in place

$fn=110;
wiggle=0.01;
wiggleZ=[0,0,wiggle];
holder = [130,4,10] ;
k6Out = [169,167,165] ; // see product specs
basePlate = [k6Out.x+holder.y*2, k6Out.y+holder.y*2, 2] ;
burnArea = [80,80,basePlate.z] + wiggleZ;
burnAreaOffset = [20,20,0] - wiggleZ/2;
card = [85.5,54,1.4] ;
//Base
difference(){
    cube(basePlate);
    *translate(burnAreaOffset)color("red")cube(burnArea);
}
//Tabs
translate([basePlate.x/2-holder.x/2, 0, basePlate.z]) cube(holder);
translate([basePlate.x/2-holder.x/2, basePlate.y-holder.y, basePlate.z]) cube(holder);
translate([holder.y,basePlate.y/2-holder.x/2,basePlate.z]) rotate([0, 0, 90]) cube(holder);
translate([basePlate.x,basePlate.y/2-holder.x/2,basePlate.z]) rotate([0, 0, 90]) cube(holder);
//engraver
*translate(basePlate/2-k6Out/2+[0,0,basePlate.z/2+k6Out.z/2]) cube(k6Out);

//Card
*translate(burnAreaOffset - [-(burnArea.x-card.x)/2,(-burnArea.y+card.y)/2,0] + [0,0,basePlate.z+10]) color("green") cube(card);