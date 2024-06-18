// This program was cloned from: https://github.com/altASIC/Open-CryptoNight-ASIC
// License: Apache License 2.0

`timescale 1 ns / 1 ns // timescale for following modules

module dpram
#(parameter DATA_WIDTH=128, parameter ADDR_WIDTH=6)
(
	input clk,
	input we1, we2,
	input  [ADDR_WIDTH-1:0] addr1, addr2,
	input  [DATA_WIDTH-1:0] din1, din2,
	output [DATA_WIDTH-1:0] dout1, dout2
);
	// initial $display("dpram_be: using dual port SRAM");
	reg [DATA_WIDTH-1:0] q1, q2;
	reg [DATA_WIDTH-1:0] ram[(1<<ADDR_WIDTH)-1:0];

	always @ (posedge clk) begin
		if (we1) begin
			ram[addr1] <= din1;
			q1 <= din1; // New data in case of write. We really don't care; This is the most compatible inference case.
		end else
			q1 <= ram[addr1];

//`define ALTERA_DPRAM
`ifdef ALTERA_DPRAM
	end
	always @ (posedge clk) begin
`endif

		if (we2) begin
			ram[addr2] <= din2;
			q2 <= din2;
		end else
			q2 <= ram[addr2];
	end

	assign dout1 = q1;
	assign dout2 = q2;

endmodule
