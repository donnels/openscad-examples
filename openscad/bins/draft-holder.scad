// a draft holder is work in progress

$fn = 100 ;
width = 40 ; 
length = 15 ;
height = 27 ;
holderH = 2.5 ;
pinH = 3 ;
pinW = 20 ;
holderDepth = 9 ;
bridgeW = 12.3 ;
insertDepth = 10 ;
cylD = (width - bridgeW) ;

module bracket() {
    difference(){
        union(){
            cube([length,width,height]);
            translate([length,0,0]) cube([holderDepth,width,holderH]);
            translate([length,0,height-holderH]) cube([holderDepth,width,holderH]);
            translate([length,(width-pinW)/2,(height-holderH)/2]) cube([pinH,pinW,holderH]);
        }
        translate ([0,0,-.1]) cylinder(h=height+.2,d=cylD);
        translate ([0,width,-.1]) cylinder(h=height+.2,d=cylD);
        translate([-.1,(cylD+2*holderH)/2,holderH]) cube([insertDepth,bridgeW-2*holderH,height-2*holderH]);
    }
}

bracket ();