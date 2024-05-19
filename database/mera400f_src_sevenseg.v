// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

/*
	7-segment driver

	.--0--.
	5     1
	|--6--|
	4     2
	`--3--'  7
*/

`define SSEG_0 7'b0111111
`define SSEG_1 7'b0000110
`define SSEG_2 7'b1011011
`define SSEG_3 7'b1001111
`define SSEG_4 7'b1100110
`define SSEG_5 7'b1101101
`define SSEG_6 7'b1111101
`define SSEG_7 7'b0000111
`define SSEG_8 7'b1111111
`define SSEG_9 7'b1101111
`define SSEG_A 7'b1110111
`define SSEG_B 7'b1111100
`define SSEG_C 7'b0111001
`define SSEG_D 7'b1011110
`define SSEG_E 7'b1111001
`define SSEG_F 7'b1110001

`define SSEG_NONE		7'b0000000
`define SSEG_MINUS	7'b1000000
`define SSEG_R			7'b1010000
`define SSEG_K			7'b1110100
`define SSEG_N			7'b1010100
`define SSEG_II			7'b0010100
`define SSEG_1_			7'b0110000
`define SSEG_I			`SSEG_1
`define SSEG_S			`SSEG_5
`define SSEG_Z			`SSEG_2

// -----------------------------------------------------------------------
module sevenseg_drv(
	input clk,
	input [6:0] digs [7:0],
	input [7:0] dots,
	output reg [7:0] dig,
	output reg [7:0] seg
);

	reg [0:18] counter;
	always @ (posedge clk) begin
		counter <= counter + 1'b1;
	end

	wire [2:0] addr = counter[0:2]; // 3 most significant bits as the digit address
	always @ (addr, dots, digs) begin
		dig <= ~(1'b1 << addr);
		seg <= ~{dots[addr], digs[addr]};
	end

endmodule

// -----------------------------------------------------------------------
module none2seg(
	output reg [6:0] seg
);

	assign seg = `SSEG_NONE;

endmodule

// -----------------------------------------------------------------------
module ra2seg(
	input [10:0] r,
	output reg [6:0] seg
);

	always @ (r) begin
		if (r[10]) seg <= `SSEG_R;
		else if (r[6]) seg <= `SSEG_I;
		else if (r[5]) seg <= `SSEG_A;
		else if (r[4]) seg <= `SSEG_A;
		else if (r[3]) seg <= `SSEG_I;
		else if (r[2]) seg <= `SSEG_S;
		else if (r[1]) seg <= `SSEG_I;
		else if (r[0]) seg <= `SSEG_II;
		else seg <= `SSEG_NONE;
	end

endmodule

// -----------------------------------------------------------------------
module rb2seg(
	input [10:0] r,
	output reg [6:0] seg
);

	always @ (r) begin
		if (r[10]) begin
			case (r[9:7])
				3'd0 : seg <= `SSEG_0;
				3'd1 : seg <= `SSEG_1_;
				3'd2 : seg <= `SSEG_2;
				3'd3 : seg <= `SSEG_3;
				3'd4 : seg <= `SSEG_4;
				3'd5 : seg <= `SSEG_5;
				3'd6 : seg <= `SSEG_6;
				3'd7 : seg <= `SSEG_7;
				default : seg <= `SSEG_NONE;
			endcase
		end else begin
			if (r[6]) seg <= `SSEG_C;
			else if (r[5]) seg <= `SSEG_C;
			else if (r[4]) seg <= `SSEG_R;
			else if (r[3]) seg <= `SSEG_R;
			else if (r[2]) seg <= `SSEG_R;
			else if (r[1]) seg <= `SSEG_N;
			else if (r[0]) seg <= `SSEG_II;
			else seg <= `SSEG_NONE;
		end
	end

endmodule

// -----------------------------------------------------------------------
module hex2seg(
	input [3:0] hex,
	output reg [6:0] seg
);

	always @ (hex) begin
		case (hex)
			4'h0 : seg <= `SSEG_0;
			4'h1 : seg <= `SSEG_1;
			4'h2 : seg <= `SSEG_2;
			4'h3 : seg <= `SSEG_3;
			4'h4 : seg <= `SSEG_4;
			4'h5 : seg <= `SSEG_5;
			4'h6 : seg <= `SSEG_6;
			4'h7 : seg <= `SSEG_7;
			4'h8 : seg <= `SSEG_8;
			4'h9 : seg <= `SSEG_9;
			4'ha : seg <= `SSEG_A;
			4'hb : seg <= `SSEG_B;
			4'hc : seg <= `SSEG_C;
			4'hd : seg <= `SSEG_D;
			4'he : seg <= `SSEG_E;
			4'hf : seg <= `SSEG_F;
		endcase
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
