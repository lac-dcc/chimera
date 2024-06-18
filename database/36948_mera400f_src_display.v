// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// Control Panel 7-seg display

module display(
	input clk_sys,
	input [0:15] w,
	input [10:0] rotary_bus,
	input [9:0] indicators,
	output [7:0] seg,
	output [7:0] dig
);

	wire [6:0] digs [7:0];

	hex2seg d0(.hex(w[12:15]), .seg(digs[0]));
	hex2seg d1(.hex(w[8:11]), .seg(digs[1]));
	hex2seg d2(.hex(w[4:7]), .seg(digs[2]));
	hex2seg d3(.hex(w[0:3]), .seg(digs[3]));
	none2seg d4(.seg(digs[4]));
	rb2seg d5(.r(rotary_bus), .seg(digs[5]));
	ra2seg d6(.r(rotary_bus), .seg(digs[6]));

	assign digs[7][0] = indicators[5];
	assign digs[7][6] = indicators[4];
	assign digs[7][5:1] = 0;

	sevenseg_drv DRV(
		.clk(clk_sys),
		.seg(seg),
		.dig(dig),
		.digs(digs),
		.dots({indicators[2:0], indicators[3], indicators[9:6]})
	);

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
