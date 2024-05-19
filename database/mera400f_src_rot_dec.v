// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// Control Panel rotational switch decoder

module rot_dec(
	input [3:0] in,
	output [10:0] out
);

	localparam ROT_BUS_R0 = 11'b10000000000;
	localparam ROT_BUS_R1 = 11'b10010000000;
	localparam ROT_BUS_R2 = 11'b10100000000;
	localparam ROT_BUS_R3 = 11'b10110000000;
	localparam ROT_BUS_R4 = 11'b11000000000;
	localparam ROT_BUS_R5 = 11'b11010000000;
	localparam ROT_BUS_R6 = 11'b11100000000;
	localparam ROT_BUS_R7 = 11'b11110000000;
	localparam ROT_BUS_IC = 11'b00001000000;
	localparam ROT_BUS_AC = 11'b00000100000;
	localparam ROT_BUS_AR = 11'b00000010000;
	localparam ROT_BUS_IR = 11'b00000001000;
	localparam ROT_BUS_SR = 11'b00000000100;
	localparam ROT_BUS_RZ = 11'b00000000010;
	localparam ROT_BUS_KB = 11'b00000000001;

	always @ (in) begin
		case (in)
			4'b0000 : out <= ROT_BUS_R0;
			4'b0001 : out <= ROT_BUS_R1;
			4'b0010 : out <= ROT_BUS_R2;
			4'b0011 : out <= ROT_BUS_R3;
			4'b0100 : out <= ROT_BUS_R4;
			4'b0101 : out <= ROT_BUS_R5;
			4'b0110 : out <= ROT_BUS_R6;
			4'b0111 : out <= ROT_BUS_R7;
			4'b1000 : out <= ROT_BUS_IC;
			4'b1001 : out <= ROT_BUS_AC;
			4'b1010 : out <= ROT_BUS_AR;
			4'b1011 : out <= ROT_BUS_IR;
			4'b1100 : out <= ROT_BUS_SR;
			4'b1101 : out <= ROT_BUS_RZ;
			4'b1110 : out <= ROT_BUS_KB;
			4'b1111 : out <= ROT_BUS_KB;
		endcase
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
