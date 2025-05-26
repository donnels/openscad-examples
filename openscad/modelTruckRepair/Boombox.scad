//lautsprecher

module lautsprecher() {
aussenD=30;
aussenH=2;
innenD=28;
innenH=2;
Wigglw=.02;
cylinder(h=innenH+wiggle,d=innenD);
translate([0,0,innenH]) cylinder(h=aussenH,d=aussenD);
}

lautsprecher();
