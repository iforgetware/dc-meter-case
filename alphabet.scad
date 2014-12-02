text_width = text_height * .75;
text_ctc = text_height * 1.137;
text_weight = text_height/10;
text_angle = 33.85;

module cap_i () {
	union () {
		vertical_bar ();
		top_bar ();
		bottom_bar ();
	}
}

module cap_n () {
	union () {
		side_bars ();
		back_slash ();
	}
}

module cap_o () {
	difference () {
		hull () {
			for (updown = [1, -1]) {
				translate ([0, 0, updown*(text_height-text_width)/2]) {
					rotate (a = [0,90,0]) {
						cylinder (h=text_depth, r=text_width/2, center=true);
					}
				}
			}
		}
		hull () {
			for (updown = [1, -1]) {
				translate ([0, 0, updown*(text_height-text_width)/2]) {
					rotate (a = [0,90,0]) {
						cylinder (h=text_depth+1, r=(text_width/2)-text_weight, center=true);
					}
				}
			}
		}
	}
}

module cap_u () {
	union () {
		difference () {
			cap_o ();
			upper_blank ();
		}
		difference () {
			side_bars ();
			lower_blank ();
		}
	}
}

module cap_t () {
	union () {
		top_bar ();
		vertical_bar ();
	}
}

module top_bar () {
	translate ([0, 0, (text_height-text_weight)/2]) {
		cube ([text_depth, text_width, text_weight], center=true);
	}
}

module bottom_bar () {
	translate ([0, 0, (text_weight-text_height)/2]) {
		cube ([text_depth, text_width, text_weight], center=true);
	}
}

module vertical_bar () {
	cube ([text_depth, text_weight, text_height], center=true);
}
module side_bars () {
	for (leftright = [1, -1]) {
		translate ([0, leftright*(text_width-text_weight)/2, 0]) {
			cube ([text_depth, text_weight, text_height], center=true);
		}
	}
}

module back_slash () {
	rotate (a = [text_angle, 0, 0]) {
		cube ([text_depth, text_weight, text_ctc], center=true);
	}
}

module slash () {
	rotate (a = [-text_angle, 0, 0]) {
		cube ([text_depth, text_weight, text_ctc], center=true);
	}
}

module upper_blank () {
	translate ([0, 0, (text_height/2)+.1]) {
		cube ([text_depth+1, text_width+1, text_height], center=true);
	}
}

module lower_blank () {
	translate ([0, 0, -(text_height/2)-.1]) {
		cube ([text_depth+1, text_width+1, text_height], center=true);
	}
}