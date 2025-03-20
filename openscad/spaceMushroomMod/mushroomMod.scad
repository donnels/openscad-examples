// modding the shaft to fit the jowsitcks I have better
//fist let's load the shaft as a reference
#translate([0,0,35]) import("shaft.stl");
$fn=100;
//next step is to rebuild it
// ... pending :-) please wait

*translate([0,-20,0]) text("WORK IN PROGRESS...",halign="center");

points  =   [
                [0,0,0],
                [20,0,0],
                [0,0,26],
                [20,0,26]
            ];
       
 
module draw_object() {
    rotate([90,0,0]) cylinder(h=8,d=1.5);  // Replace with your desired object
}

translate([-8.5,-6,22.9]) for (p = points) {
    translate(p) draw_object();
}   
translate([-9.5,-6,21.8]) rotate([90,0,0]) cube([22,28,1]);