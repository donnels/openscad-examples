//Script to create a wire mesh cube with 8x8x8 empty spaces
//Virtual Space and  
//Global communications research department 
//logo base object with 8.2 cm side length
//consisting of the multiplied basic primitives of 
//an x,y,and z axis beam iterate in one dimension in loops
//also includes the inner primitive (in 3 flavours)
$fn=100;
module x_beam(){ //just a cube with parameters in one place
    cube([82,2,2]);
}
module y_beam(){ //just a cube with parameters in one place
    cube([2,82,2]);
}
module z_beam(){ //just a cube with parameters in one place
    cube([2,2,82]);
}
module x_block(){ //primitive used for 8 points in the 3d grid
    *color([0,1,0]) translate ([02,02,02]) cube([8,8,8]);
    translate ([6,6,6]) sphere (r=1);
}
module vsr_cube(){ //loops for the xyz forests of beams
    union(){
        //xbeam
        for (xj=[0:10:80]){
            for (xi=[0:10:80]){
                translate([0,xi,xj])
                x_beam();
            }
        }
        //ybeam
        for (yj=[0:10:80]){
            for (yi=[0:10:80]){
                translate([yi,0,yj])
                y_beam();
            }
        }
        //zbeam
        for (zj=[0:10:80]){
            for (zi=[0:10:80]){
                translate([zi,zj,0])
                z_beam();
            }
        }
    }
}
module inner_vsr_cube(){ //the manual inner cube
    union(){
        //first set
        hull() {
            translate ([30,50,70]) x_block();
            translate ([10,10,60]) x_block();
        }
        hull() {
            translate ([70,40,50]) x_block();
            translate ([50,00,40]) x_block();
        }
        hull() {
            translate ([20,70,30]) x_block();
            translate ([00,30,20]) x_block();
        }
        hull() {
            translate ([60,60,10]) x_block();
            translate ([40,20,00]) x_block();
        }
        //second set
        hull() {
            translate ([30,50,70]) x_block();
            translate ([20,70,30]) x_block();
        }
        hull() {
            translate ([10,10,60]) x_block();
            translate ([00,30,20]) x_block();
        }
        hull() {
            translate ([70,40,50]) x_block();
            translate ([60,60,10]) x_block();
        }
        hull() {
            translate ([50,00,40]) x_block();
            translate ([40,20,00]) x_block();
        }
        //third set
        hull() {
            translate ([30,50,70]) x_block();
            translate ([70,40,50]) x_block();
        }
        hull() {
            translate ([10,10,60]) x_block();
            translate ([50,00,40]) x_block();
        }
        hull() {
            translate ([20,70,30]) x_block();
            translate ([60,60,10]) x_block();
        }
        hull() {
            translate ([00,30,20]) x_block();
            translate ([40,20,00]) x_block();
        }
    }
    //fourth full set as option
    *hull() { //hull over all 8 points in 3d space
        translate ([30,50,70]) x_block();
        translate ([10,10,60]) x_block();
        translate ([70,40,50]) x_block();
        translate ([50,00,40]) x_block();
        translate ([20,70,30]) x_block();
        translate ([00,30,20]) x_block();
        translate ([60,60,10]) x_block();
        translate ([40,20,00]) x_block();
    }
}
//paint the outer framed cube 8x8x8
vsr_cube();
//paint the inner cube either as wire or solid or points
*inner_vsr_cube();
