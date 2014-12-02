$fn = 36;

length = 100; // X
width = 130; // Y
height = 70; // Z
wall = 4;

clearance = .6; // gap between top and bottom, set to twice desired value

small_width = 8.4; // Y
small_height = 9; // Z
small_radius = 1.25; // key slot

big_width = 16; // Y
big_height = 17; // Z
big_radius = 2.35; // key slot

md_ctc = 101; // Y - center to center of holes in medium duty shunt
md_peg_height = 9; // Z 
md_peg_radius = 2.9;
md_thread_radius = 1.15;

hd_shunt_width = 23; // X - 90 degress to rest of naming convention
hd_length = hd_shunt_width + 4; // X - length of hd mount
hd_hex_width = 16; // X - width of channel for protruding bolt head, also 90 out 

hd_shunt_length = 110; // Y - length of heavy duty shunt, also 90 out
hd_width = hd_length; // Y - hd mount base is square
hd_edge = ((width-hd_shunt_length)/2)-wall; // Y - distance from hd shunt to wall

hd_shunt_height = 9; // Z
hd_height = 24.5; // Z - height of hd mount
hd_step = hd_height - hd_shunt_height; // Z - height of ledge in hd mount

dock_offset = length / 5; 

text_height = (height/2)-(wall*2);
text_depth = 1;

small_holes = [-22, -8, 6, 45];
big_holes = [-42, 25];

boss_size = 8;
screw_hole_radius = 1.8;
screw_head_radius = 3.8;
boss_thread_radius = 1.4;
countersink = screw_head_radius - screw_hole_radius;

side_skirt_width = hd_edge + 1;
side_skirt_height = height - wall - hd_height - .2;

switch_hole_offset = small_holes[1];
switch_hole_radius = 6.2;
switch_hole_width = 10;

meter_length = 45.7; // X
meter_width = 26; // Y
meter_offset = 38; // Y


module peg (peg_x, peg_y, peg_z, peg_h, peg_r1, peg_r2) {
	translate ([peg_x, peg_y, peg_z]) {
		cylinder (h=peg_h, r1=peg_r1, r2=peg_r2, center=true);
	}
}
             
