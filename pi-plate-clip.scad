// ---------------------------------------------------------------
// PI PLATE CLIPS
// https://github.com/joewalnes/pi-plate-clip
//
// These are little clips designed to add strength to Adafruit's Prototyping Pi Plate:
// http://learn.adafruit.com/adafruit-prototyping-pi-plate
//
// They prevent the board from buckling when downwards force is applied (e.g. pushing
// wires into headers) and protect the Raspberry Pi pins.
//
// It is designed to be cut out of acyllic with a laser cutter.
//
// License: Creative Commons Attribution 3.0 Unported (CC BY 3.0)
// http://creativecommons.org/licenses/by/3.0/
// Attribution: Joe Walnes - http://joewalnes.com/


// ---------------------------------------------------------------
// DIMENSIONS
// Adjust these if necessary for other boards. The default settings should work for Adafruit's Pi Plate.
// All values are in millimeters.

// Thickness of Raspberry Pi PCB.
pi_pcb_thickness = 1.41;

// Thickness of Pi Plate PCB (or alternative board).
plate_pcb_thickness = 1.64;

// Vertical distance between the Raspberry Pi and the Pi Plate.
// This is the inner distance - i.e. from top of Pi to bottom of Plate.
board_space = 16.6;

// How deep to make the inset notches (horizontally).
// The deeper this is, the stronger it will be, but also more likely to collide with components
// on the boards.
inset_depth = 2.1;

// Additional vertical and horizontal distance from the edge of the notches to the
// edge of the clips. If these were zero, the clips would be useless. The larger they
// are, the stronger they are, but they also add to the total dimensions of the Pi + Plate.
vertical_padding = 3.3;
horizontal_padding = 3.3;

// How rounded the corners should be.
// This should be less than both vertical_padding and horizontal_padding.
corner_radius = 1.5;

// Special OpenSCAD variable to deterine resolution of curves. Specifically, how many fragments
// to break a circle down into. Higher means smoother curves. Lower means faster rendering.
// http://en.wikibooks.org/wiki/OpenSCAD_User_Manual/The_OpenSCAD_Language#.24fa.2C_.24fs_and_.24fn
$fn = 96;


// ---------------------------------------------------------------
// GEOMETRY

module rounded_rect(w, h, corner_radius) {
	// Convenience function to created a rounded rectangle.
	// Simplest way to do this is use a minkowski function.
	translate([corner_radius, corner_radius]) {
		minkowski() {
			circle(corner_radius);
			square([w - corner_radius * 2, h - corner_radius * 2]);
		}
	}
}

difference() {
	// Main rectangular area
	rounded_rect(
		inset_depth + horizontal_padding, 
		vertical_padding + pi_pcb_thickness + board_space + plate_pcb_thickness + vertical_padding,
		corner_radius);
	// Pi PCB notch
	translate([0, vertical_padding]) {
		square([
			inset_depth,
			pi_pcb_thickness]);
	}
	// Plate PCB notch
	translate([0, vertical_padding + pi_pcb_thickness + board_space]) {
		square([
			inset_depth,
			plate_pcb_thickness]);
	}
}