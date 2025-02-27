//handrail
handRailH=35;
handRailD=60;
handRailL=3.52*10*100;
//Post(s)
postX=30;
postY=30;
postH=1.17*10*100;
postOff=handRailD-postY;
post1Pos=15*10;
post2Pos=1.695*10*100;
post3Pos=3.235*10*100;
//Balcony
balconyD=2.08*10*100;
balconyW=3.45*10*100;
railOff=[-100,0,95*10];
blech1W=1.73*10*100;
blech1H=1.10*10*100;
blech1OffX=-2.5*10;//inside post1pos
blech1OffY=-8.5*10;//inside RailH
blech2W=1.48*10*100;
blech2H=1.10*10*100;
blech2OffX=-2.5*10;//inside post1pos
blech2OffY=blech1OffY;
//solar panel
panelW=1.755*10*100;//m
panelH=1.10*10*100;//m
panelD=30;//mm

module HandRail() {
    color([.6,.6,.6])
        translate (railOff)
            cube([handRailD,handRailL,handRailH]);
}

module HandRail() {
    color([.6,.6,.6])
        translate (railOff)
            cube([handRailD,handRailL,handRailH]);
}
module Post(pos) {
    color([.6,.6,.6])
        translate (railOff)
            translate([postOff,pos,-postH])
                cube([postX,postY,postH]);
}
module Blech(pos,w,h) {
    color([.6,.6,.6])
        translate (railOff)
            translate([0,pos,0])
                translate ([-10,-w,-h + blech1OffY])
                    cube([10,w,h]);
}
module Panel(x,y,z) {
    color([.1,.1,.3])
        translate([x,y,z])
            translate([0,0,0])
                cube([panelD,panelW,panelH]);
}
//balcony
color([.8,.8,.8]) translate ([0,0,-100]) cube([balconyD,balconyW,100]);

HandRail();
Post(post1Pos);
Post(post2Pos);
Post(post3Pos);
Blech(post2Pos-postX-blech1OffX,blech1W,blech1H);
Blech(post3Pos-postX-blech2OffX,blech2W,blech2H);

Panel(-200,0,-200);
Panel(-200,1.75*1000+20,-200);