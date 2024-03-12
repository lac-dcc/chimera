`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:59:52 12/12/2014
// Design Name:   cl_serial
// Module Name:   E:/working/Project/G200/Program/GVISION200/tb_cl_serial.v
// Project Name:  GVISION200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cl_serial
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_cl_serial;

	// Inputs
	reg cl_sertc_p;
	reg cl_sertc_n;
	reg clk_spi;
	reg fifo_spi_wen;
	reg [7:0] fifo_spi_din;
	reg fifo_train_wen;
	reg [7:0] fifo_train_din;
	reg clk_sys;
	reg rst_sys_n;
	reg clk_rxg;

	// Outputs
	wire cl_sertfg_p;
	wire cl_sertfg_n;
	wire cmd_spi_wr;
	wire cmd_spi_rd;
	wire [255:0] spi_register;
	wire [23:0] reg_integration;
	wire [7:0] reg_frame;
	wire hdr_enable;
	wire rolling_enable;
	wire [9:0] reg_cnt_timing_cycle;
	wire [11:0] reg_window_row_start;
	wire [11:0] reg_window_row_length;
	wire [9:0] timing_bram_rd_addr;
	wire [20:0] timing_bram_dout;
	wire [11:0] reg_test_image_chan_0;
	wire [11:0] reg_test_image_chan_1;
	wire [11:0] reg_test_image_chan_2;
	wire [11:0] reg_test_image_chan_3;
	wire [11:0] training_word;
	wire [7:0] reg_camera_control;
	wire reg_ctrl_led;
	wire reg_test_image_enable;

	// Instantiate the Unit Under Test (UUT)
	cl_serial uut (
		.cl_sertc_p(cl_sertc_p), 
		.cl_sertc_n(cl_sertc_n), 
		.cl_sertfg_p(cl_sertfg_p), 
		.cl_sertfg_n(cl_sertfg_n), 
		.cmd_spi_wr(cmd_spi_wr), 
		.cmd_spi_rd(cmd_spi_rd), 
		.clk_spi(clk_spi), 
		.spi_register(spi_register), 
		.fifo_spi_wen(fifo_spi_wen), 
		.fifo_spi_din(fifo_spi_din), 
		.reg_integration(reg_integration), 
		.reg_frame(reg_frame), 
		.hdr_enable(hdr_enable), 
		.rolling_enable(rolling_enable), 
		.reg_cnt_timing_cycle(reg_cnt_timing_cycle), 
		.reg_window_row_start(reg_window_row_start), 
		.reg_window_row_length(reg_window_row_length), 
		.timing_bram_rd_addr(timing_bram_rd_addr), 
		.timing_bram_dout(timing_bram_dout), 
		.reg_test_image_chan_0(reg_test_image_chan_0), 
		.reg_test_image_chan_1(reg_test_image_chan_1), 
		.reg_test_image_chan_2(reg_test_image_chan_2), 
		.reg_test_image_chan_3(reg_test_image_chan_3), 
		.training_word(training_word), 
		.fifo_train_wen(fifo_train_wen), 
		.fifo_train_din(fifo_train_din), 
		.reg_camera_control(reg_camera_control), 
		.reg_ctrl_led(reg_ctrl_led), 
		.reg_test_image_enable(reg_test_image_enable), 
		.clk_sys(clk_sys), 
		.rst_sys_n(rst_sys_n), 
		.clk_col(clk_col)
	);

	initial begin
		// Initialize Inputs
		cl_sertc_p = 0;
		cl_sertc_n = 0;
		clk_spi = 1;
		fifo_spi_wen = 0;
		fifo_spi_din = 0;
		fifo_train_wen = 0;
		fifo_train_din = 0;
		clk_sys = 0;
		rst_sys_n = 0;
		clk_rxg = 0;

		// Wait 100 ns for global reset to finish
		#100;
		#1000 rst_sys_n = 1;
       
		// Add stimulus here

	end
      always #20	clk_sys = ~clk_sys;
		always #20  clk_spi = ~clk_spi;
		always #20  clk_rxg = ~clk_rxg;

		
		
		
endmodule

