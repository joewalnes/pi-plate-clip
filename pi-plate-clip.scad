$fn = 96;

pi_pcb_thickness = 1.41;
plate_pcb_thickness = 1.64;
board_space = 16.6;
inset_depth = 2.1;
vertical_padding = 3.3;
horizontal_padding = 3.3;
corner_radius = 2.33;

difference() {
	// Main rectangular area
	square([
		inset_depth + horizontal_padding, 
		vertical_padding + pi_pcb_thickness + board_space + plate_pcb_thickness + vertical_padding]);
	// Pi PCB cutout
	translate([0, vertical_padding]) {
		square([
			inset_depth,
			pi_pcb_thickness]);
	}
	// Plate PCB cutout
	translate([0, vertical_padding + pi_pcb_thickness + board_space]) {
		square([
			inset_depth,
			plate_pcb_thickness]);
	}
}