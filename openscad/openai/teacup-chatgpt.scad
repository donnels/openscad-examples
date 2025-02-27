// Create the base of the tea cup
cylinder(r=50, h=10);

// Create the handle of the tea cup
translate([-60, 30, 0]) {
  rotate([0, 90, 0]) {
    cylinder(r=10, h=30);
  }
}

// Create the rim of the tea cup
translate([0, 0, 10]) {
  cylinder(r=60, h=5);
}

// Create the body of the tea cup
translate([0, 0, 15]) {
  cylinder(r=50, h=50);
}

// Cut out the handle from the body of the tea cup
translate([-60, 30, 0]) {
  rotate([0, 90, 0]) {
    difference() {
      cylinder(r=50, h=50);
      cylinder(r=10, h=30);
      }
      }
      }
