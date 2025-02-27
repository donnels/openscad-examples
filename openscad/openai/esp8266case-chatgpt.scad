// Create the base of the case
translate([0, 0, 5]) {
  cube([30, 20, 10]);
}


// Create the sides of the case
translate([0, 0, 15]) {
  cube([30, 20, 10]);
  translate([15, 10, 15]) {
    rotate([0, 90, 0]) {
      cube([30, 20, 10]);
    }
  }
}

// Create the lid of the case
translate([0, 0, 25]) {
  cube([30, 20, 5]);
  translate([15, 10, 25]) {
    rotate([0, 90, 0]) {
      cube([30, 20, 5]);
    }
  }
}

// Create the opening for the ESP8266
translate([15, 10, 30]) {
  rotate([0, 90, 0]) {
    cube([20, 15, 5]);
  }
}
