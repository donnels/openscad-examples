//button for radio tape counter reset replacement
$fn=360; 
r = 6 ; //This SHOULD NOT be less than 1/2 of top z
buttonTop = [4,4,11] ;
buttonBottom = [5,5,6] ;
buttonBottomCavity = [3.1,3.1,7] ;
buttonBrim = [6,6,1] ;
wiggle = .01;
textDepth = 1;

module topButton(){
    difference(){
        intersection(){
            //the button (top)
            cube(buttonTop);
            //the sphere to be the rounded top (should always be larger (r) than the z of button/2 or button will be
            translate([buttonTop.x/2,buttonTop.y/2,-r+buttonTop.z]) sphere(r);
        }
        translate([buttonTop.x/2,buttonTop.y/2,buttonTop.z-textDepth]) linear_extrude(textDepth+wiggle)text("K",valign="center",halign="center",size=3.5);
    }
}

difference () {
    union(){
        //bottom
        cube(buttonBottom);
        //top
        translate([buttonBottom.x/2-buttonTop.x/2,buttonBottom.y/2-buttonTop.y/2,buttonBottom.z]) topButton();
        //brim
        translate([buttonBottom.x/2-buttonBrim.x/2,buttonBottom.y/2-buttonBrim.y/2,buttonBottom.z]) cube(buttonBrim);
    }
    //cavity
    translate([buttonBottom.x/2-buttonBottomCavity.x/2,buttonBottom.y/2-buttonBottomCavity.y/2,-wiggle]) cube(buttonBottomCavity+[0,0,wiggle]);
}
