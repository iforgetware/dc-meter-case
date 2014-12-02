include <meter_variables.scad>;
include <lib/alphabet.scad>;

rotate ([180,0,0]) {
	difference () {
		union () {
			top ();
			sides ();
		}
		screw_holes ();
		switch_hole ();
		meter_hole ();
	}
}

// Main Modules

module top () {
	translate ([0, 0, (height+wall)/2]) {
		cube ([length, width, wall], center=true);
	}
}

module sides () {
	for (side_y = [1, -1]) {
		translate ([0, side_y*(((width-boss_size)/2)-wall), height/4]) {
				cube ([(length-(wall*2))-clearance, boss_size-clearance, height/2], center=true);
		}
		
		translate ([-dock_offset, side_y*(((width-side_skirt_width)/2)-wall-(clearance/2)), (height-side_skirt_height)/2]) {
			cube ([hd_length, side_skirt_width, side_skirt_height], center=true);
		}
	}
}

module screw_holes () {
	for (hole_x = [1, -1]) {
		for (hole_y = [1, -1]) {
			peg (
				hole_x*(((length-boss_size)/2)-wall),
				hole_y*(((width-boss_size)/2)-wall),
				height/4, (height/2)+.1,
				boss_thread_radius,
				boss_thread_radius
			);
		}
	}
}

module switch_hole () {
	difference () {
		peg (
			0,
			switch_hole_offset,
			(height+wall)/2,
			wall+.1,
			switch_hole_radius,
			switch_hole_radius
		);
		for (cut = [1, -1]) {
			translate ([cut*switch_hole_width, switch_hole_offset, (height+wall)/2]) {
				cube ([switch_hole_width, switch_hole_width,wall+.1], center=true);
			}
		}
	}
}

module meter_hole () {
	translate ([0, meter_offset, (height+wall)/2]) {
		cube ([meter_length, meter_width, wall+.1], center=true);
	}
}