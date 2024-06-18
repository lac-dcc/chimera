// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:54:52 07/29/2017
// Design Name:   frame_fifo_write
// Module Name:   C:/Xilinx/14.7/ISE_DS/SysGen/project/sd_sdram_vga/sd_sdram_vga.v
// Project Name:  sd_sdram_vga
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: frame_fifo_write
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sd_sdram_vga;

	// Inputs
	reg rst;
	reg mem_clk;
	reg wr_burst_data_req;
	reg wr_burst_finish;
	reg write_req;
	reg [22:0] write_addr_0;
	reg [22:0] write_addr_1;
	reg [22:0] write_addr_2;
	reg [22:0] write_addr_3;
	reg [1:0] write_addr_index;
	reg [22:0] write_len;
	reg [15:0] rd_data_count;

	// Outputs
	wire wr_burst_req;
	wire [9:0] wr_burst_len;
	wire [22:0] wr_burst_addr;
	wire write_req_ack;
	wire write_finish;
	wire fifo_aclr;

	// Instantiate the Unit Under Test (UUT)
	frame_fifo_write uut (
		.rst(rst), 
		.mem_clk(mem_clk), 
		.wr_burst_req(wr_burst_req), 
		.wr_burst_len(wr_burst_len), 
		.wr_burst_addr(wr_burst_addr), 
		.wr_burst_data_req(wr_burst_data_req), 
		.wr_burst_finish(wr_burst_finish), 
		.write_req(write_req), 
		.write_req_ack(write_req_ack), 
		.write_finish(write_finish), 
		.write_addr_0(write_addr_0), 
		.write_addr_1(write_addr_1), 
		.write_addr_2(write_addr_2), 
		.write_addr_3(write_addr_3), 
		.write_addr_index(write_addr_index), 
		.write_len(write_len), 
		.fifo_aclr(fifo_aclr), 
		.rd_data_count(rd_data_count)
	);

	initial begin
		// Initialize Inputs
		rst = 0;
		mem_clk = 0;
		wr_burst_data_req = 0;
		wr_burst_finish = 0;
		write_req = 0;
		write_addr_0 = 0;
		write_addr_1 = 0;
		write_addr_2 = 0;
		write_addr_3 = 0;
		write_addr_index = 0;
		write_len = 0;
		rd_data_count = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

