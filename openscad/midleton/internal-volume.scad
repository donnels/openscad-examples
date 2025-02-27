//inside of midleton wooden box with double doors
totHeight = 260 ;
totWidth = 111.1 ;
totDepth = 108.5 ;
dimensions = [ totWidth, totDepth, totHeight] ;
wiggle = [1.25, 1, 1] ;
volume = dimensions - wiggle ;

//inner structure definitions
structDivs = 20 ;
structStrength = 1 ;
structH = totHeight/structDivs ;
post = [structStrength, structStrength, structH] ;
block = [structStrength, structStrength, structStrength] ;

//Volume Visual
#cube( dimensions );

FL = [0, 0, 0];
FR = [volume.x - post.x, 0, 0];
BR = [volume.x - post.x, volume.y - post.y, 0];
BL = [0, volume.y - post.y, 0];

i=0;
translate(wiggle/2) *union() {
    translate ([0,0,i]) {
        //left and right sides
        hull() {
            translate( FR ) cube( post );
            translate( BR ) cube( post );
        }
        hull() {
            translate( FL ) cube( post );
            translate( BL ) cube( post );
        }
        //Base plate
        hull() {
            cube([volume.x, post.y, post.y]) ;
            translate ([0, 0, 0] + BL) cube([volume.x, post.y, post.y]) ;
        }
    }
}

translate(wiggle/2)
hull(){
    translate(FR) cube(block);
    translate(BL) cube(block);
}