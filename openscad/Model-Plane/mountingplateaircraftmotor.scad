//second attempt with rotated arms so as to save on cutting out.
//set number of faces higher so that the cylinder doesn't lok like a pentagon
$fn=100;
//global vars
//text font Arial and so far size under 1.8 didn't show in print.....
font = "Arial";
letter_size = 2.5;
letter_height = 1.5;
line1="Ser#1";
line2="VSR";
line3="V6";
//pin depth into airframe of the wooden original was 30 test prints 20 is enough
//also of note is that I had to rotate the blasted pin by 45 and 3° as I drilled the hole wrong. guess might be 5 or 6 (angle2) and one or two (angle1) to the side
pinheight=30;
pinangle1=2;
pinangle2=7;
//radius of the mounting holes
screwhole=.81;
holeOffset=15.5;
//radius of screw hole opening
flare=1;

module letter(l) {
	// Use linear_extrude() to make the letters 3D objects as they
	// are only 2D shapes when only using text()
	linear_extrude(height = letter_height) {
		text(l, size = letter_size, font = font);
	}
}

//this is the 4 armed mount with drill holes
module mount()
    {
    union(){
        for ( arm = [0:90:360]){
            rotate([0,0,arm])
                //arm with drill hole
                difference(){
                    union(){
                        //arm
                        translate ([0,-4,0]) cube([15,8,3] );
                        //rounded tip
                        translate ([15,0,0]) cylinder(h=3, r1=4, r2=4);
                        }
                    //  subtract drill hole plus additional
                    translate([holeOffset,0,0]) cylinder(h=3, r1=screwhole, r2=screwhole);
                    //flaring
                    translate([holeOffset,0,2.8]) cylinder(h=.5, r1=screwhole, r2=flare);
                    translate([holeOffset,0,0]) cylinder(h=.25, r1=flare, r2=screwhole);
                    //central mounting hole for spindle
                    cylinder(h=1.5, r1=2.5, r2=2.1);
                }
            }
        }
    }
    

module mountpluspin()
{
//the mount and the pin for insertion into the aircraft body
    union(){
        mount();
        //central mounting rod should be 30 long as measured but shorter    for test prints
        //aslo of note is that I had to rotate the blasted pin by 45 and 3° as I drilled the hole wrong. guess is 3° might be 5 or 6
        rotate ([pinangle1,pinangle2,45]) translate ([0,0,2]) cylinder(h=pinheight, r1=3.5, r2=3.5);
        *translate ([4,1,2.2])  letter (line1);
        *rotate(90,90,90) translate ([4,-1,2.2])  letter (line2);
        *translate ([4,-3,2.2])  letter (line3);
        }
}
//add some antispin pegs.
union (){
    mountpluspin();
    translate ([0,-8,2]) rotate ([pinangle1,pinangle2,45]) cylinder(h=8, r1=1.2, r2=.5);
    translate ([-8,0,2]) rotate ([pinangle1,pinangle2,45]) cylinder(h=8, r1=1.2, r2=.5);
}
