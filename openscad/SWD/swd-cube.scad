font = "Liberation Sans";
cube_size = 70;
letter_size = 50;
letter_height = 5;
o = cube_size / 2 - letter_height / 2;

module letter(letter) {
	linear_extrude(height = letter_height) {
		text(letter, size = letter_size, font = font, halign = "center", valign = "center", $fn = 100);
	}
}

union() {
	color("gray") cube(cube_size, center = true);
	translate([0, -o, 0]) rotate([90, 0, 0]) letter("W");
	translate([o, 0, 0]) rotate([90, 0, 90]) letter("D");
  translate([0, 0, o])  letter("S");
}
