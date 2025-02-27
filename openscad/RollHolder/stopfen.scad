$fn=100;

//Variables
baseX = 9.5 /2 ;
baseY = 19.6 /2 ;
cornerR = 1 ;
bottomExtrude = 10 ;
topExtrude = 1 ;
bumpTB = .15 ;
bumpRL = 1.25 ;
//Composites
    baseRight = [+baseX, 0, 0] + [-cornerR, 0, 0] ;
    baseLeft  = [-baseX, 0, 0] + [+cornerR, 0, 0] ;
    baseBottom  = [0, -baseY, 0] + [0, +cornerR, 0] ;
    baseTop = [0, +baseY, 0] + [0, -cornerR, 0] ;
    bumpRad = cornerR ;

// Temp handle
* cylinder(h=20,d=3);

hull() {
    //Corners
    translate(baseTop + baseRight) cylinder(h=bottomExtrude, r=cornerR, center = true) ;
    translate(baseBottom + baseRight) cylinder(h=bottomExtrude, r=cornerR, center = true) ;
    translate(baseBottom + baseLeft) cylinder(h=bottomExtrude, r=cornerR, center = true) ;
    translate(baseTop + baseLeft) cylinder(h=bottomExtrude, r=cornerR, center = true) ;
    //bumps
    translate(baseTop    + [0,+bumpTB,0]) sphere(r=bumpRad);
    translate(baseRight  + [+bumpRL,0,0]) sphere(r=bumpRad);
    translate(baseBottom + [0,-bumpTB,0]) sphere(r=bumpRad);
    translate(baseLeft   + [-bumpRL,0,0]) sphere(r=bumpRad);
}


translate([0,0,bottomExtrude/2+topExtrude/2]) hull() {
    lidSideR = 2 ;
    lidX = baseX + .5 ;
    lidRight = [+lidX, 0, 0] + [-lidSideR, 0, 0] ;
    lidLeft  = [-lidX, 0, 0] + [+lidSideR, 0, 0] ;
    //bumps
    translate(lidRight  + [+bumpRL,0,0]) scale([1,5.2,1]) cylinder(h=topExtrude, r=lidSideR, center = true) ;
    translate(lidLeft   + [-bumpRL,0,0]) scale([1,5.2,1]) cylinder(h=topExtrude, r=lidSideR, center = true) ;
    //top blob
    translate([0, 0, 1]) scale([5,10,1]) sphere(r=bumpRad);
}