include <meter_variables.scad>;
include <alphabet.scad>;

difference () {
	box ();
	screw_holes ();
	in_out_holes ();
	labels ();
}

// Main Modules

module box () {
	union () {
		difference () {
			cube ([length, width, height], center=true);
			hollow_out ();
		}
		docks ();
	}
}

module screw_holes () {
	for (hole_x = [1, -1]) {
		for (hole_y = [1, -1]) {
			translate ([hole_x*(((length-boss_size)/2)-wall), hole_y*(((width-boss_size)/2)-wall), -height/4]) {
				union () {
					peg (
						0,
						0,
						0,
						(height/2)+.1,
						screw_hole_radius,
						screw_hole_radius
					);
					peg (
						0,
						0,
						countersink-(wall/2)-(height/4),
						countersink+.1,
						screw_head_radius,
						screw_hole_radius
					);
				}
			}
		}
	}
	for (side = [1, -1]) {
		peg (
			length/5,
			side*md_ctc/2,
			((md_peg_height+wall-height)/2),
			md_peg_height+3,
			md_thread_radius,
			md_thread_radius
		);
	}

}	

module in_out_holes () {
	for (inout = [1, -1]) {
		for (hole = small_holes) {
			connector_hole (
				inout*(length-wall)/2,
				hole,
				(height-small_height)/2,
				small_height,
				small_width,
				small_radius
			);
		}
		for (hole = big_holes) {
			connector_hole (
				inout*(length-wall)/2,
				hole,
				(height-big_height)/2,
				big_height,
				big_width,
				big_radius
			);
		}
	}
}

module labels () {
	translate ([length/2, -text_height/2, wall-(height/4)]) {
		cap_i ();
	}
	translate ([length/2, text_height/2, wall-(height/4)]) {
		cap_n ();
	}
	translate ([-length/2, text_height, wall-(height/4)]) {
		cap_o ();
	}
	translate ([-length/2, 0, wall-(height/4)]) {
		cap_u ();
	}
	translate ([-length/2, -text_height, wall-(height/4)]) {
		cap_t ();
	}
}

// Second Level Modules

module hollow_out () {
	difference () {
		translate ([0, 0, wall]) {	
  			cube ([length-(2*wall), width-(2*wall), height], center=true);
		}
		for (boss_y = [1, -1]) {
			for (boss_x = [1, -1]) {
				translate ([boss_x*(((length-boss_size)/2)-wall), boss_y*(((width-boss_size)/2)-wall), -height/4]) {
					cube ([boss_size, boss_size, height/2], center=true);
				}
			}
		}
	}
}

module docks () {
	for (side = [1, -1]) {
		translate ([-dock_offset, side*((hd_shunt_length/2)-(hd_width/2)+hd_edge), ((hd_height-height)/2)+wall]) {
			difference () {
				cube ([hd_length, hd_width, hd_height], center=true);
				translate ([0, -side*hd_edge, hd_step]) {
					cube ([hd_shunt_width, hd_length, hd_height], center=true);
				}
				translate ([0, -side*(hd_edge+((hd_shunt_width-hd_hex_width)/2)), 0]) {
					cube ([hd_hex_width, hd_length, hd_height], center=true);
				}
			}
		}
		peg (dock_offset,
			side*md_ctc/2,
			((md_peg_height+wall-height)/2),
			md_peg_height,
			md_peg_radius,
			md_peg_radius
		);
	}
}


module connector_hole (hole_x, hole_y, hole_z, hole_h, hole_w, hole_r) {
	translate ([hole_x, hole_y, hole_z]) {
		difference () {
			cube ([wall+2, hole_w, hole_h], center=true);
			peg (0, hole_w/2, 0, hole_h+1, hole_r, hole_r);
			peg (0, -hole_w/2,0, hole_h+1, hole_r, hole_r);
		}
	}
}

