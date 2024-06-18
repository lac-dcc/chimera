// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

`default_nettype none

//  Simple I/O expander
//
//  Input pinout:
//    0  clk     logic clock
//    1  reset   logic reset (positive)
//    2  sclk    spi clock
//    3  CE      spi chip enable (negative)
//    4  sin     spi in (into this device)
//    5  IN0     input 0
//    6  IN1     input 1
//    7  IN2     input 2
//
//  Output pinout:
//    0  OUT0
//    1  OUT1
//    2  OUT2
//    3  OUT3
//    4  OUT4
//    5  OUT5
//    6  OUT6
//    7  sout    spi out (out of this device)

//  Top level io for this module should stay the same to fit into the scan_wrapper.
//  The pin connections within the user_module are up to you,
//  although (if one is present) it is recommended to place a clock on io_in[0].
//  This allows use of the internal clock divider if you wish.
module user_module_341432284947153491(
	input [7:0] io_in, 
	output [7:0] io_out
);

	wire clk, reset, sclk, ce, sin, in0, in1, in2;
	assign clk   = io_in[0];
	assign reset = io_in[1];
	assign sclk  = io_in[2];
	assign ce    = io_in[3];
	assign sin   = io_in[4];
	assign in0   = io_in[5];
	assign in1   = io_in[6];
	assign in2   = io_in[7];

	wire [6:0] out;
	wire sout;
	assign io_out = { sout, out };

	wire [2:0] ioexp_in;
	assign ioexp_in = { io_in[7], io_in[6], io_in[5] };

	spi_341432284947153491 #(.INBITS(3), .OUTBITS(7)) spi_core (
		.reset(reset),
		.clk(clk),
		.sclk(sclk),
		.ce(ce),
		.sin(sin),
		.sout(sout),
		.inputs(ioexp_in),
		.outputs(out)
	);

	// The SPI module latches in the inputs on neg CE and latches out the
	// outputs on pos CE

endmodule

//  SPI in, shift in new output while shifting out old outputs
module spi_341432284947153491 #(
	parameter INBITS = 4,
	parameter OUTBITS = 4
) (
	input                reset, // synchronous internal reset
	input                clk, // system clock
	input                sclk, // negative polarity
	input                ce, // active low
	input                sin,
	output               sout,
	input  [INBITS-1:0]  inputs,
	output [OUTBITS-1:0] outputs
);

	// Note: We shift IN the IO OUTPUTS. We shift OUT the IO INPUTS.
	reg [OUTBITS-1:0] inlatch; // serial input latch (latch on CE rising edge)
	reg [OUTBITS-1:0] inbuf; // serial input buffer (latch on CE rising edge)
	reg [INBITS-1:0] outlatch; // serial output latch (latch on CE falling edge)
	
	assign sout = outlatch[0];
	assign outputs = inlatch;

	wire ce_posedge, ce_negedge;
	posedge_341432284947153491 pe_ce(.clk(clk), .in(ce), .pedge(ce_posedge));
	negedge_341432284947153491 ne_ce(.clk(clk), .in(ce), .nedge(ce_negedge));

	wire sclk_posedge, sclk_negedge;
	posedge_341432284947153491 pe_sclk(.clk(clk), .in(sclk), .pedge(sclk_posedge));
	negedge_341432284947153491 ne_sclk(.clk(clk), .in(sclk), .nedge(sclk_negedge));

	always @(posedge clk) begin
		if (reset) begin
			inbuf <= 0;
			inlatch <= 0;
			outlatch <= 0;
		end else if (ce_posedge) begin
			inlatch <= inbuf;
		end else if (ce_negedge) begin
			outlatch <= inputs;
		//end else if (ce) begin
			//inbuf <= 0;
			//outlatch <= 0;
		end else begin
			if (sclk_posedge) begin
				outlatch <= { 1'b0, outlatch[INBITS-1:1] };
			end else if (sclk_negedge) begin
				inbuf <= { inbuf[OUTBITS-2:0], sin };
			end
		end
	end

endmodule

module posedge_341432284947153491(input clk, input in, output pedge);
	reg last, now;
	assign pedge = !last && now;
	always @(posedge clk) begin
		{last, now} = {now, in};
	end
endmodule

module negedge_341432284947153491(input clk, input in, output nedge);
	reg last, now;
	assign nedge = last && !now;
	always @(posedge clk) begin
		{last, now} = {now, in};
	end
endmodule

