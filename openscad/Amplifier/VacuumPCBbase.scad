$fn = 100 ;
mountD = 2.5 ;
mountH = 5 ;
xyz = [70,59.5,1] ;
xyzH = [0,0,10] ;

module PCBBed(position,pillarH, pillarD) {
    translate([position.x,position.y,0]) cylinder(h=pillarH + xyzH.z, d=pillarD) ;
    translate([position.x,0,0]) cylinder(h=pillarH + xyzH.z, d=pillarD) ;
    translate([0,0,0]) cylinder(h=pillarH + xyzH.z, d=pillarD) ;
    translate([0,position.y,0]) cylinder(h=pillarH + xyzH.z, d=pillarD) ;
    translate(xyzH - [0,0,mountH]) hull(){
        translate([position.x,position.y,0]) cylinder(h=pillarH, d=pillarD) ;
        translate([position.x,0,0]) cylinder(h=pillarH, d=pillarD) ;
    }
    translate(xyzH - [0,0,mountH]) hull(){
        translate([position.x,0,0]) cylinder(h=pillarH, d=pillarD) ;
        translate([0,0,0]) cylinder(h=pillarH, d=pillarD) ;   
    }
    translate(xyzH - [0,0,mountH]) hull(){
        translate([0,0,0]) cylinder(h=pillarH, d=pillarD) ;
        translate([0,position.y,0]) cylinder(h=pillarH, d=pillarD) ;
    }
    translate(xyzH - [0,0,mountH]) hull(){
        translate([0,position.y,0]) cylinder(h=pillarH, d=pillarD) ;
        translate([position.x,position.y,0]) cylinder(h=pillarH, d=pillarD) ;  
    }
    translate(xyzH - [0,0,mountH]) hull(){
        translate([position.x,position.y,0]) cylinder(h=pillarH, d=pillarD) ;
        translate([0,0,0]) cylinder(h=pillarH, d=pillarD) ;
    }
    translate(xyzH - [0,0,mountH]) hull(){
        translate([position.x,0,0]) cylinder(h=pillarH, d=pillarD) ;
        translate([0,position.y,0]) cylinder(h=pillarH, d=pillarD) ;
    }
}

PCBBed(xyz,mountH,mountD);

