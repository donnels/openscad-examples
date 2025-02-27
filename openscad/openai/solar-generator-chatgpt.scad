// Create the base of the solar generator
translate([0, 0, 5]) {
  cube([200, 100, 10]);
}

// Create the solar panels of the solar generator
translate([0, 0, 15]) {
  for (i = [0:3]) {
    rotate([0, i * 90, 0]) {
      cube([100, 10, 10]);
    }
  }
}

// Create the handle of the solar generator
translate([100, -50, 25]) {
  rotate([90, 0, 0]) {
    cylinder(r=5, h=50);
  }
}

// Create the control panel of the solar generator
translate([0, 0, 65]) {
  cube([20, 20, 10]);
  translate([5, 5, 10]) {
    rotate([0, 45, 0]) {
      cube([10, 10, 10]);
    }
  }
}

// Create the outlets of the solar generator
translate([0, 0, 75]) {
  for (i = [0:2]) {
    translate([i * 35, 0, 0]) {
      rotate([0, 90, 0]) {
        cylinder(r=5, h=10);
      }
    }
  }
}
