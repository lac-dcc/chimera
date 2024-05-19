// This program was cloned from: https://github.com/bangonkali/sram
// License: MIT License

`timescale 1ns/1ps

module tb_sram_ctrl();

	reg clk;
	reg [7:0] address;
	wire [15:0] data_read;
	reg [15:0] data_write;
	inout [15:0] data;
	reg chip_enable;
	reg write_enable;
	reg output_enable; 
	reg reset;

	assign data = (!write_enable && !chip_enable && output_enable) ? data_write : 'bz;
	// assign data_read = (write_enable && chip_enable && output_enable) ? data : 'bz;
	assign data_read = data;
	
	sram SRAM1(
		.address(address),
		.data(data),
		.chip_enable(chip_enable), 
		.write_enable(write_enable), 
		.output_enable(output_enable),
		.reset(reset)
	);

	always begin
		#1 clk = ~clk;
	end
	
	initial begin
		$dumpfile("tb_sram_testcase1.vcd");
		$dumpvars;
		// $vcdplusfile("tb_sram_v3.vpd");
		// $vcdpluson;
		chip_enable = 1;
		write_enable = 0;
		data_write =0;
		output_enable =0;
		address=0;
		
		clk = 0;
		reset = 0;
		#1
		reset = 1;
		
		// TestCase: Writing to SRAM. 
		#1
		output_enable = 1;
		chip_enable = 0;
		write_enable = 0; // write (active low)
		data_write = 24;
		address = 28;
		
		// TestCase: Reading the sram.
		#1 
		output_enable = 0;
		chip_enable = 0;
		write_enable = 1; // read (active low)
		data_write = 26; // dummy test to make sure data is not read
		address = 28;
		
		// TestCase: Writing to memory location 28;
		#1
		output_enable = 1;
		chip_enable = 0;
		write_enable = 0;
		data_write = 30;
		address = 28;
		
		// TestCase: Memory location 28 should be the same as before.
		#1
		output_enable = 0;
		chip_enable = 0;
		write_enable = 1;
		data_write = 40;
		address = 28;
		
		// TestCase: Memory location 28 should be the same as before.
		#1
		output_enable = 0;
		chip_enable = 0;
		write_enable = 1;
		data_write = 40;
		address = 242;
		
		#1
		$finish;
	end
endmodule



