$fn=360;
plateH = 2.5 ;
topInsideH = 6 ;
topInsideD = 18.35 ;
topInsideR = topInsideD/2 ;
insideD = 17.5 ;
insideH = 40 ;
lipH = .09 ;
lipW = .5 ;
lipOffH = 2.4 ;
headH = 2 ;
headD = 26.5 ;
plateHoleD = 19.22 ;
plateHoleH = 3 ;
//diameter of top inside
color("grey") translate([0,0,-plateH]) cylinder(h=6+plateH,d=topInsideD);
//diameter of inside
color("grey") translate([0,0,5]) cylinder(h=insideH,d=insideD);
//Lip
color("red") translate([0,0,lipOffH]) cylinder(h=lipW,r1=topInsideR+lipH,r2=topInsideR);
color("red") translate([0,0,lipOffH-lipW]) cylinder(h=lipW,r2=topInsideR+lipH,r1=topInsideR);
//mount ring
color("grey") translate([0,0,-plateHoleH+.1]) cylinder(h=plateHoleH+.1,d=plateHoleD);

//head
color("grey") translate([0,0,-(headH+plateH)]) cylinder(h=headH,d=headD);
//plate
*translate([0,0,-2.5]) difference(){
    translate([-20,-20.0])cube([40,40,plateH]);
    translate([0,0,-.1]) cylinder(h=plateHoleH,d=plateHoleD);
}