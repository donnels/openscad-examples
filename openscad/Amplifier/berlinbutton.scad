//Draft button for radio replacement
//Draft structure only not real measurments yet
//Shape should be approx correct

buttonTop = [10,10,10] ;
buttonBottom = [20,20,20] ;
buttonBottomCavity = [15,15,15] ;
wiggle = .01;
difference () {
    cube(buttonBottom);
    translate([buttonBottom.x/2-buttonBottomCavity.x/2,buttonBottom.z/2-buttonBottomCavity.y/2,-wiggle]) cube(buttonBottomCavity+[0,0,wiggle]);
}    
translate([buttonBottom.x/2-buttonTop.x/2,buttonBottom.z/2-buttonTop.y/2,buttonBottom.z]) cube(buttonTop) ;