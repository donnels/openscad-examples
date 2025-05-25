mountsTR=[60,37];mountsD=4;mountsH=5;
anderson=[43,37,50];
plate=[85,90,2];
plateMount=[60,0];


module mounts4(pos,d,h) {
    // this also works for 2 holes as 2 will overlap if y=0 or x=0)
    // so no need to check :-)
    $fn=100;
    translate([0,0,0]) cylinder(h=h,d=d);
    translate([pos.x,0,0]) cylinder(h=h,d=d);
    translate([pos.x,pos.y,0]) cylinder(h=h,d=d);
    translate([0,pos.y,0]) cylinder(h=h,d=d);
}

difference(){
    wiggle=[0,0,.02];
    cube([85,90,2]);
    translate(-wiggle) translate(plate/2-mountsTR/2) mounts4(mountsTR,mountsD,mountsH);
    translate(-wiggle) translate(plate/2-plateMount/2) mounts4(plateMount,mountsD,mountsH);
    translate(-wiggle) translate(plate/2-anderson/2) cube(anderson);
}