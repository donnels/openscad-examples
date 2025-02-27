//since my jetson nano waveshare case has a reset and power button
// but they're swapped AND labeled.. this is to cover the reset label

$fn=100;

difference() {
    cylinder(h=1,d1=23,d2=21);
    translate([0,0,-.1]) cylinder(h=1.2,d=11);
}
