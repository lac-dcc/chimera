// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
P1.1 SINGLE PORT SYNCHRONOUS SRAM 64K Bytes
************************************************/

module sram(
	input write_enable,
	input [15:0] address,
	input [7:0] data_in,
	input clk,
	output reg [7:0] data_out );

	reg [7:0] memory[65535:0];

	always@(posedge clk)
		if(write_enable)
			memory[address]<=data_in; else
		data_out<=memory[address];

endmodule