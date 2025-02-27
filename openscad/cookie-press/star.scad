$fn=100;

points=8;
innerR=6;
outerR=12;
fittingD=51;
fittingH=3;

module Star(p=5, r1=6, r2=12) {
    s = [for(i=[0:p*2]) [(i % 2 == 0 ? r1 : r2)*cos(180*i/p), (i % 2 == 0 ? r1 : r2)*sin(180*i/p)]];
    polygon(s);
}

difference() {
    cylinder(h=fittingH,d=fittingD);
	translate([0,0,-.1]) linear_extrude(fittingH+.2) Star(points, innerR, outerR);
}