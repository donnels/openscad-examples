$fn= 368;
basedepth = 30;
basewidth = 9;
baseheight = 3;

holderheight = 15;
holderwidth = 3;
holderdepth = 15;

module holderleft() {
 
difference() { 
 
cube([basewidth, basedepth, baseheight]);
translate([4.5, 25, -0.05]) cylinder(3.1, 1);
translate([4.5, 5, -0.05]) cylinder(3.1, 1);

    }

    difference() {
    
    translate([-3, 15, 0]) 
    cube([holderwidth, holderdepth, holderheight]);
    translate([-3, 14.95, 12]) rotate([0, 315, 0]) cube([5, 15.1, 3]);
    translate([0, 14.95, 0]) rotate([0, 225, 0]) cube([5, 15.1, 3]);
    
        }
  
}
    
module holderright() {

difference() { 
 
cube([basewidth, basedepth, baseheight]);
translate([4.5, 25, -0.05]) cylinder(3.1, 1);
translate([4.5, 5, -0.05]) cylinder(3.1, 1);

    }

    difference() {
    
    translate([-3, 0, 0]) 
    cube([holderwidth, holderdepth, holderheight]);
    translate([-3, -0.05, 12]) rotate([0, 315, 0]) cube([5, 15.1, 3]);
    translate([0, -0.05, 0]) rotate([0, 225, 0]) cube([5, 15.1, 3]);
    
        }
        
}
    
holderleft();
translate([0, 35, 0]) holderright();