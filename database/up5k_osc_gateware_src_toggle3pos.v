// This program was cloned from: https://github.com/emeb/up5k_osc
// License: MIT License

// toggle3pos.v - 3-pos'n toggle input w/ pullup and translation to binary
// 04-19-21 E. Brombaugh

// NOTE: this assumes pullups on the 2 input pins - either in HW or via
// the PCF file using the syntax:
// set_io -pullup yes name number

`default_nettype none

module toggle3pos(
    input [1:0] pkgpin,	// raw pin input
	output reg [1:0] out
);
	always @(*)
		case(pkgpin)
			2'b00: out = 2'b11;		// can't happen
			2'b01: out = 2'b00;		// top
			2'b10: out = 2'b10;		// bottom
			2'b11: out = 2'b01;		// center
		endcase
endmodule
