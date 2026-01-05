//Draft button for radio replacement
//Draft structure only not real measurments yet
//Shape should be approx correct
//might round corners of top button of needed

buttonTop = [4,4,11] ;
buttonBottom = [5,5,6] ;
buttonBottomCavity = [3.1,3.1,7] ;
buttonBrim = [6,6,1] ;
wiggle = .01;
#difference () {
    union(){
        //bottom
        cube(buttonBottom);
        //Brim
        translate([buttonBottom.x/2-buttonTop.x/2,buttonBottom.y/2-buttonTop.y/2,buttonBottom.z]) cube(buttonTop);
        //top
        translate([buttonBottom.x/2-buttonBrim.x/2,buttonBottom.y/2-buttonBrim.y/2,buttonBottom.z]) cube(buttonBrim);
    }
    //cavity
    translate([buttonBottom.x/2-buttonBottomCavity.x/2,buttonBottom.y/2-buttonBottomCavity.y/2,-wiggle]) cube(buttonBottomCavity+[0,0,wiggle]);
}    
    translate([buttonBottom.x/2-buttonBottomCavity.x/2,buttonBottom.y/2-buttonBottomCavity.y/2,-wiggle]) cube(buttonBottomCavity+[0,0,wiggle]);
