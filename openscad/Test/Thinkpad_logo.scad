tlColor = [1,1,1] ;
tlH = 1 ;

//logo
color(tlColor) linear_extrude(height=tlH) import("ThinkPad_Logo.svg",center = true);

//base
cube([30,10,.5], center = true) ;