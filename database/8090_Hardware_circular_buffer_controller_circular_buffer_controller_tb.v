// This program was cloned from: https://github.com/wtiandong/Hardware_circular_buffer_controller
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:03:47 07/16/2014
// Design Name:   circular_buffer_controller
// Module Name:   
// Project Name:  
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: circular_buffer_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module circular_buffer_controller_tb;

	// Inputs
	reg wr_clk_i;
	reg rd_clk_i;
	reg rst_i;
	reg wr_req_i;
	reg wr_finish_i;
	reg wr_en_i;
	reg [63:0] wr_data_i;
	reg [255:0] wr_addr_i;
	reg rd_req_i;
	reg rd_finish_i;
	reg [63:0] rd_addr_i;
	

	// Outputs
	wire wr_req_ack_o;
	wire wr_req_result_o;
	wire wr_finish_ack_o;
	wire rd_req_ack_o;
	wire rd_req_result_o;
	wire rd_finish_ack_o;
	wire [255:0] rd_data_o;
	wire ram_wr_clk_o;
	wire ram_rd_clk_o;
	wire ram_rst_o;
	wire ram_wr_en_o;
	wire [63:0] ram_wr_data_o;
	wire [8:0] ram_wr_addr_o;
	wire [6:0] ram_rd_addr_o;
	wire [255:0] ram_rd_data_i;
	// Instantiate the Unit Under Test (UUT)
	circular_buffer_controller  
	#(
		.WRITE_DATA_WIDTH(64),
		.WRITE_DATA_DEPTH(256),
		.READ_DATA_WIDTH(256),
		.READ_DATA_DEPTH(64),
		.BUFFER_NUM(2)
	)
	circular_buffer_controller_INST
	(
		.wr_clk_i(wr_clk_i),
		.rd_clk_i(rd_clk_i),
		.rst_i(rst_i),

		.wr_req_i(wr_req_i),
		.wr_req_ack_o(wr_req_ack_o),
		.wr_req_result_o(wr_req_result_o),
		.wr_finish_i(wr_finish_i),
		.wr_finish_ack_o(wr_finish_ack_o),
		.wr_en_i(wr_en_i),
		.wr_data_i(wr_data_i),
		.wr_addr_i(wr_addr_i),
		
		.rd_req_i(rd_req_i),
		.rd_req_ack_o(rd_req_ack_o),
		.rd_req_result_o(rd_req_result_o),
		.rd_finish_i(rd_finish_i),
		.rd_finish_ack_o(rd_finish_ack_o),
		.rd_data_o(rd_data_o),
		.rd_addr_i(rd_addr_i),
//--------------ram--------------------------
		.ram_wr_clk_o(ram_wr_clk_o),
		.ram_rd_clk_o(ram_rd_clk_o),
		.ram_rst_o(ram_rst_o),
		.ram_wr_en_o(ram_wr_en_o),
		.ram_wr_data_o(ram_wr_data_o),
		.ram_wr_addr_o(ram_wr_addr_o),
		.ram_rd_data_i(ram_rd_data_i),
		.ram_rd_addr_o(ram_rd_addr_o)
	);
RAM_64x512_256x128 RAM_64x512_256x128_INST (
  .clka(ram_wr_clk_o), // input clka
  .wea(ram_wr_en_o), // input [0 : 0] wea
  .addra(ram_wr_addr_o), // input [8 : 0] addra
  .dina(ram_wr_data_o), // input [63 : 0] dina
  .clkb(ram_rd_clk_o), // input clkb
  .addrb(ram_rd_addr_o), // input [6 : 0] addrb
  .doutb(ram_rd_data_i) // output [255 : 0] doutb
);
reg flag_wr;
	initial begin
		// Initialize Inputs
		wr_clk_i = 0;
		rd_clk_i = 0;
		rst_i = 1;
		wr_req_i = 0;
		wr_finish_i = 0;
		wr_en_i = 0;
		wr_data_i = 0;
		wr_addr_i = 0;
		rd_req_i = 0;
		rd_finish_i = 0;
		rd_addr_i = 0;
flag_wr = 0;
		// Wait 100 ns for global reset to finish
		#50;
        rst_i = 0;
		// Add stimulus here

	end

	always # 5 wr_clk_i = ~wr_clk_i;
	always # 7 rd_clk_i = ~rd_clk_i;

integer i;

always
begin
	wr_req_i = 1'b1;
	wait(wr_req_ack_o);
	if(wr_req_result_o)
	begin
		@(posedge wr_clk_i);
		wr_req_i = 1'b0;
		for(i=0;i<256;i=i+1)
		begin
			@(posedge wr_clk_i)
			wr_en_i = 1;
			wr_data_i = i+flag_wr;
			wr_addr_i = i;
		end
		@(posedge wr_clk_i);
		wr_en_i = 0;
		wr_finish_i = 1;
		wait(wr_finish_ack_o);
		@(posedge wr_clk_i);
		wr_finish_i = 0;
		flag_wr = ~flag_wr;
	end
	else
	begin
		@(posedge wr_clk_i);
		wr_req_i = 1'b0;
		#50;
		flag_wr = 0;
	end
end

integer j;
always
begin
	
	rd_req_i = 1'b1;
	wait(rd_req_ack_o);
	if(rd_req_result_o)
	begin
		@(posedge rd_clk_i)
		rd_req_i = 1'b0;

		for(j=0;j<64;j=j+1)
		begin
			@(posedge rd_clk_i)
			rd_addr_i = j;
		end

		@(posedge rd_clk_i);
		rd_finish_i = 1;
		wait(rd_finish_ack_o);
		@(posedge rd_clk_i);
		rd_finish_i = 0;
	end
	else
	begin
		@(posedge rd_clk_i)
		rd_req_i = 1'b0;
		# 43;
	end
end
endmodule

