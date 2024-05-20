// This program was cloned from: https://github.com/emeb/up5k_osc
// License: MIT License

// pdm.v - Pulse Density Modulation
// 03-21-21 E. Brombaugh

`default_nettype none

module pdm(
    input clk,              // system clock
    input reset,			// system reset
	input ena,				// systetm clock enable
	input signed [15:0] in,	// signed binary input
	output pdm_p, pdm_n		// differential pdm output
);
	// convert input to offset binary
	wire [15:0] ob = in ^ 16'h8000;
	
	// 1st-order sigma-delta
	reg [16:0] sd_acc;
	always @(posedge clk)
		if(reset)
			sd_acc = 0;
		else if(ena)
			sd_acc <= {1'b0,sd_acc[15:0]} + {1'b0,ob};

`define EDGE_BAL
`ifdef EDGE_BAL
	// balanced rising/falling edges - does it help distortion?
	reg [2:0] ccnt;
	reg out;
	always @(posedge clk)
		if(reset)
		begin
			ccnt <= 3'b000;
			out <= 1'b0;
		end
		else
		begin
			if(ena)
			begin
				ccnt <= 3'b000;
				out <= 1'b0;
			end
			else
			begin
				ccnt <= ccnt + 1;
				case(ccnt)
					3'b000: out <= 1'b1;
					3'b001: out <= sd_acc[16];
					default: out <= out;
				endcase
			end
		end
		wire oclk = clk;
`else
	// simple output
	wire out = sd_acc[16];

	// clock for output reg
	reg oclk;
	always @(posedge clk)
		oclk <= ena;	
`endif

	// Instantiate IO
	SB_IO #(
		.PIN_TYPE(6'b1001_01), 	// registered, enabled w/ simple input
		.PULLUP(1'b0),			// no pullup
		.NEG_TRIGGER(1'b0),		// positive edge
		.IO_STANDARD("SB_LVCMOS")
	) io_pdm_p(
		.PACKAGE_PIN (pdm_p),
		.LATCH_INPUT_VALUE (1'b0),
		.CLOCK_ENABLE (1'b1),
		.INPUT_CLK (1'b0),
		.OUTPUT_CLK (oclk),
		.OUTPUT_ENABLE (1'b1),
		.D_OUT_0 (out),
		.D_OUT_1 (1'b0),
		.D_IN_0 (),
		.D_IN_1 ()
	);
	SB_IO #(
		.PIN_TYPE(6'b1001_01), 	// registered, enabled w/ simple input
		.PULLUP(1'b0),			// no pullup
		.NEG_TRIGGER(1'b0),		// positive edge
		.IO_STANDARD("SB_LVCMOS")
	) io_pdm_n(
		.PACKAGE_PIN (pdm_n),
		.LATCH_INPUT_VALUE (1'b0),
		.CLOCK_ENABLE (1'b1),
		.INPUT_CLK (1'b0),
		.OUTPUT_CLK (oclk),
		.OUTPUT_ENABLE (1'b1),
		.D_OUT_0 (!out),
		.D_OUT_1 (1'b0),
		.D_IN_0 (),
		.D_IN_1 ()
	);
endmodule

