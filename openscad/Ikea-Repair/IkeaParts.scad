$fn=360;

module ivarPin() {
    //ivar shelf pin
    ivarPinD=6;
    ivarPinH=40;
    cylinder(h=ivarPinH, d=ivarPinD);
}

rotate([45,0,0]) ivarPin();
