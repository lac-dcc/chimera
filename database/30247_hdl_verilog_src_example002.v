// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 100ps

// simulate with:
// iverilog -m testbench example002.v -o example002.out
// vvp example002.out
// gtkwave # (open new tab with waveform example002.vcd)

// last updated 2020-06-01 by mza
`define icestick

`ifndef SYNTHESIS
module testbench;
	reg [31:0] counter = 0;
	wire [5:1] LED;
	reg CLK = 0;
	always
		#41.7 CLK = ~CLK;
	always @(posedge CLK) begin
		counter <= counter + 1;
	end
	initial begin
		#0
		$dumpfile("work/example002.vcd");
		$dumpvars(0, testbench);
		#100000 $finish;
	end
	top #(.LOG2DELAY(1)) my_top_instance (.CLK(CLK), .LED1(LED[1]), .LED2(LED[2]), .LED3(LED[3]), .LED4(LED[4]), .LED5(LED[5]));
endmodule // testbench
`endif

// https://github.com/cliffordwolf/icestorm/blob/master/examples/icestick/example.v
module top #(parameter LOG2DELAY=20) (input CLK, output LED1, output LED2, output LED3, output LED4, output LED5);
	localparam BITS = 5;
	reg [BITS+LOG2DELAY-1:0] counter = 0;
	reg [BITS-1:0] outcnt = 0;
	always @(posedge CLK) begin
		counter <= counter + 1;
		outcnt <= counter >> LOG2DELAY;
	end
	assign {LED1, LED2, LED3, LED4, LED5} = outcnt ^ (outcnt >> 1);
endmodule // top

