`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 			Gpixel
// Engineer: 			HangWang
// 
// Create Date:    	16:28:29 11/25/2014 
// Module Name:    	cl_serial
// Project Name: 		GVISION200
// Target Devices: 	Spartan-6 xc6slx150-3fg900
// Tool versions: 	ISE13.1
// Description: 		camera link interface
// Revision: 
// 		V1.0-First created
//////////////////////////////////////////////////////////////////////////////////
module cl_serial_top(clk_fix, rst_fix_n, clk_rxg, rst_rx_n, spi_clk, clk_col_out,
	cl_sertc_p, cl_sertc_n, cl_sertfg_p, cl_sertfg_n,window_column_sel,
	cmd_wr_sensor_spi, cmd_rd_sensor_spi, spi_register, fifo_sensor_wen, fifo_sensor_din,
	reg_frames, reg_integration, hdr_enable, reg_cnt_timing_cycle, reg_window_row_start, reg_window_row_length, timing_bram_rd_addr, timing_bram_dout,
	training_word, reg_test_image_chan_0, reg_test_image_chan_1, reg_test_image_chan_2, reg_test_image_chan_3, fifo_train_wen, fifo_train_din,
	reg_test_image_enable, reg_camera_control, reg_ctrl_led,
	pll_sel, pll_sel_0, pll_sel_1, pll_sel_2, pll_sel_3,
	fot_rst_rd_addr,	fot_rst_bram_dout, fot_rst_timing_cycle,
	fot_sig_rd_addr,	fot_sig_bram_dout, fot_sig_timing_cycle,
	cnt_t3
	);
	
	// clcok & reset
	input				clk_fix;
	input				rst_fix_n;
	input				clk_rxg;
	input				rst_rx_n;
	input				spi_clk;
	input				clk_col_out;
	
	// cameralink serial lvds interface
	input				cl_sertc_p;
	input				cl_sertc_n;
	output			cl_sertfg_p;
	output			cl_sertfg_n;
	output [1:0]  	window_column_sel;
	// sensor_spi interface
	output			cmd_wr_sensor_spi;
	output			cmd_rd_sensor_spi;
	output [255:0]	spi_register;
	input				fifo_sensor_wen;
	input  [7:0]	fifo_sensor_din;
	
	// sequencer interface
	output [7:0]	reg_frames;
	output [23:0]	reg_integration;
	output			hdr_enable;
	output [9:0]	reg_cnt_timing_cycle;
	output [11:0]	reg_window_row_start;
	output [11:0]	reg_window_row_length;
	input  [9:0]	timing_bram_rd_addr;
	output [20:0]	timing_bram_dout;
	
	// image_rx interface
	output [11:0]	training_word;
	output [11:0]	reg_test_image_chan_0;
	output [11:0]	reg_test_image_chan_1;
	output [11:0]	reg_test_image_chan_2;
	output [11:0]	reg_test_image_chan_3;
	input				fifo_train_wen;
	input  [7:0]	fifo_train_din;
	
	// sensor_controller interface
	output			reg_test_image_enable;
	output [7:0]	reg_camera_control;
	
	// external interface
	output			reg_ctrl_led;
	output			pll_sel;
	output			pll_sel_0;
	output			pll_sel_1;
	output			pll_sel_2;
	output			pll_sel_3;
	
	output [4:0]	fot_sig_bram_dout;
	output [10:0]	fot_sig_timing_cycle;
	output [4:0]	fot_rst_bram_dout;
	output [10:0]	fot_rst_timing_cycle;
	input  [10:0]	fot_rst_rd_addr;
	input  [10:0]	fot_sig_rd_addr;
	output [7:0]	cnt_t3;

	wire [15:0]		measured_baud;
	wire				rb1_wen;
	wire				rb2_wen;
	wire				rb3_wen;
	wire				rb4_wen;
	wire [7:0]		reg_addr;
	wire [7:0]		reg_data;
	
	wire				fifo_empty;
	wire				fifo_ren;
	wire [7:0]		fifo_dout;
	
	// Instantiate cl_serial_in
	cl_serial_in cl_serial_in(
		.clk_fix				(clk_fix), 
		.rst_fix_n			(rst_fix_n), 
		.cl_sertc_p			(cl_sertc_p), 
		.cl_sertc_n			(cl_sertc_n), 
		.lvds_swap			(1'b1), 
		.measured_baud		(measured_baud), 
		.rb1_wen				(rb1_wen), 
		.rb2_wen				(rb2_wen), 
		.rb3_wen				(rb3_wen), 
		.rb4_wen				(rb4_wen),
		.reg_addr			(reg_addr), 
		.reg_data			(reg_data)
	);

	// Instantiate the module
	cl_protocol_decoder cl_protocol_decoder(
		.clk_fix						(clk_fix), 
		.rst_fix_n					(rst_fix_n), 
		.clk_rxg						(clk_rxg),
		.rb1_wen						(rb1_wen), 
		.rb2_wen						(rb2_wen), 
		.rb3_wen						(rb3_wen), 
		.rb4_wen						(rb4_wen),
		.reg_addr					(reg_addr), 
		.reg_data					(reg_data), 
		.reg_camera_control		(reg_camera_control), 
		.cmd_wr_sensor_spi		(cmd_wr_sensor_spi), 
		.cmd_rd_sensor_spi		(cmd_rd_sensor_spi), 
		.reg_frames					(reg_frames), 
		.reg_test_image_enable	(reg_test_image_enable), 
		.reg_test_image_chan_0	(reg_test_image_chan_0), 
		.reg_test_image_chan_1	(reg_test_image_chan_1), 
		.reg_test_image_chan_2	(reg_test_image_chan_2), 
		.reg_test_image_chan_3	(reg_test_image_chan_3), 
		.training_word				(training_word), 
		.reg_ctrl_led				(reg_ctrl_led), 
		.spi_register				(spi_register), 
		.reg_integration			(reg_integration), 
		.reg_cnt_timing_cycle	(reg_cnt_timing_cycle), 
		.hdr_enable					(hdr_enable), 
		.reg_window_row_start	(reg_window_row_start), 
		.reg_window_row_length	(reg_window_row_length), 
		.timing_bram_rd_addr		(timing_bram_rd_addr), 
		.timing_bram_dout			(timing_bram_dout),
		.window_column_sel      (window_column_sel),
		.pll_sel						(pll_sel),
		.pll_sel_0					(pll_sel_0),
		.pll_sel_1					(pll_sel_1),
		.pll_sel_2					(pll_sel_2),
		.pll_sel_3					(pll_sel_3),
		.clk_col_out				(clk_col_out),
		.fot_rst_rd_addr			(fot_rst_rd_addr),
		.fot_sig_rd_addr			(fot_sig_rd_addr),
		.fot_rst_bram_dout		(fot_rst_bram_dout),
		.fot_sig_bram_dout		(fot_sig_bram_dout),
		.fot_rst_timing_cycle	(fot_rst_timing_cycle),
		.fot_sig_timing_cycle	(fot_sig_timing_cycle),
		.cnt_t3						(cnt_t3)
	);

	// Instantiate fifo_mapping module
	fifo_mapping fifo_mapping(
		.clk_fix						(clk_fix), 
		.rst_fix_n					(rst_fix_n), 
		.clk_rxg						(clk_col_out), 
		.rst_rx_n					(rst_rx_n), 
		.spi_clk						(spi_clk),
		.fifo_train_wen			(fifo_train_wen), 
		.fifo_train_din			(fifo_train_din), 
		.fifo_sensor_wen			(fifo_sensor_wen), 
		.fifo_sensor_din			(fifo_sensor_din), 
		.fifo_ren					(fifo_ren), 
		.fifo_empty					(fifo_empty), 
		.fifo_dout					(fifo_dout)
	);

	// Instantiate cl_serial_out module
	cl_serial_out cl_serial_out(
		.clk_fix				(clk_fix), 
		.rst_fix_n			(rst_fix_n), 
		.measured_baud		(measured_baud), 
		.lvds_swap			(1'b0), 
		.fifo_empty			(fifo_empty), 
		.fifo_ren			(fifo_ren), 
		.fifo_dout			(fifo_dout), 
		.cl_sertfg_p		(cl_sertfg_p), 
		.cl_sertfg_n		(cl_sertfg_n)
	);
endmodule
