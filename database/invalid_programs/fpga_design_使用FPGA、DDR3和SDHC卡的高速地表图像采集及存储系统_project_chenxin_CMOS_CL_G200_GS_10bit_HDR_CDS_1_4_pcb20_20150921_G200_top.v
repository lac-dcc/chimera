`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 			Gpixel
// Engineer: 			HangWang
// 
// Create Date:    	16:28:29 11/25/2014 
// Module Name:    	G200_top 
// Project Name: 		GVISION200
// Target Devices: 	Spartan-6 xc6slx150-3fg900
// Tool versions: 	ISE13.1
// Description: 		Interface of each part.
// Revision: 
// 		V1.0-First created
//////////////////////////////////////////////////////////////////////////////////
module G200_top( 
	clk_50M, rst_n,
	cl_sertc_p, cl_sertc_n, cl_sertfg_p, cl_sertfg_n,
	spi_out, spi_clk, spi_write, spi_read, spi_in,
	pixel_read_timing, decoder,
	clk_col_out, clk_lvds_ddr_out_p, clk_lvds_ddr_out_n, 
	clk_main,  sensor_reset_n, clk_lvds_sdr_in_p, clk_lvds_sdr_in_n,
	sensor_data_ser_p, sensor_data_ser_n,
	cl_xdata_p, cl_xdata_n, cl_xclk_p, cl_xclk_n,
	cl_ydata_p, cl_ydata_n, cl_yclk_p, cl_yclk_n,
	cl_zdata_p, cl_zdata_n, cl_zclk_p, cl_zclk_n,
	test_io,
	pll_sel, pll_sel_0, pll_sel_1, pll_sel_2, pll_sel_3,
	fot_dout, tx2
	);
	
	// input clock & reset
	input				clk_50M;
	input				rst_n;
	
	// camera link serial interface
	input				cl_sertc_p;
	input				cl_sertc_n;
	output			cl_sertfg_p;
	output			cl_sertfg_n;
	
	
	// sensor spi
	input				spi_out;
	output			spi_clk;
	output			spi_write;
	output			spi_read;
	output			spi_in;
	
	// sequencer
	output [17:0]	pixel_read_timing;
	output [11:0]	decoder;
	
	// sensor output clk
	input				clk_col_out;
	input				clk_lvds_ddr_out_p;
	input				clk_lvds_ddr_out_n;
	
	// sensor input clk & rst
	output			clk_main;
	output			clk_lvds_sdr_in_p;
	output			clk_lvds_sdr_in_n;
	output			sensor_reset_n;
	//output			train;
	
	// sensor lvds data
	input  [31:0]	sensor_data_ser_p;
	input  [31:0]	sensor_data_ser_n;
	
	// cameralink
	output [3:0]	cl_xdata_p;
	output [3:0]	cl_xdata_n;
	output			cl_xclk_p;
	output			cl_xclk_n;
	
	output [3:0]	cl_ydata_p;
	output [3:0]	cl_ydata_n;
	output			cl_yclk_p;
	output			cl_yclk_n;
	
	output [3:0]	cl_zdata_p;
	output [3:0]	cl_zdata_n;
	output			cl_zclk_p;
	output			cl_zclk_n;
	
	// test io
	output [7:0]	test_io;
	output			pll_sel;
	output			pll_sel_0;
	output			pll_sel_1;
	output			pll_sel_2;
	output			pll_sel_3;
	
	output [4:0]	fot_dout;
	output			tx2;
	
	/**** signals ****/
	wire [2:0]		reg_clk_main_ctrl;
	wire				rst_spll_n;
	wire				clk_fix;
	
	wire				rst_fix_n;
	wire				clk_rxg;
	wire				clk_rxio;
	wire				rst_rx_n;
	wire				clk_txg;
	wire				clk_txio;
	wire				rst_tx_n;
	wire				tx_strobe;
	wire				clk_lvds_ddr_out;
	wire [1:0]     window_column_sel;
	wire				cmd_wr_sensor_spi;
	wire				cmd_rd_sensor_spi;
	wire [255:0]	spi_register;
	wire				fifo_sensor_wen;
	wire [7:0]		fifo_sensor_din;
	wire [7:0]		reg_frames;
	wire [23:0]		reg_integration;
	wire				hdr_enable;
	wire [9:0]		reg_cnt_timing_cycle;
	wire [11:0]		reg_window_row_start;
	wire [11:0]		reg_window_row_length;
	wire [9:0]		timing_bram_rd_addr;
	wire [20:0]		timing_bram_dout;
	wire [11:0]		training_word;
	wire [11:0]		reg_test_image_chan_0;
	wire [11:0]		reg_test_image_chan_1;
	wire [11:0]		reg_test_image_chan_2;
	wire [11:0]		reg_test_image_chan_3;
	wire				fifo_train_wen;
	wire [7:0]		fifo_train_din;
	wire				reg_test_image_enable;
	wire [7:0]		reg_camera_control;
	wire				reg_ctrl_led;
	
   wire           clk_col_out1;
	
	wire				training_done;
	wire				grab_done;
	wire				cmd_start_training;
	wire				cmd_gen_test_image;
	wire				frame_req;

	wire				sync_x;
	wire [7:0]		chan_0;
	wire [7:0]		chan_1;
	wire [7:0]		chan_2;
	wire [7:0]		chan_3;
	wire [7:0]		chan_4;
	wire [7:0]		chan_5;
	wire [7:0]		chan_6;
	wire [7:0]		chan_7;
	
	wire				fval;
	wire				lval;
	wire				dval;
	
	wire [4:0]		fot_sig_bram_dout;
	wire [10:0]		fot_sig_timing_cycle;
	wire [4:0]		fot_rst_bram_dout;
	wire [10:0]		fot_rst_timing_cycle;
	wire [10:0]		fot_rst_rd_addr;
	wire [10:0]		fot_sig_rd_addr;
	
	wire [7:0]		cnt_t3;
	
	/**** clocking ****/
	clocking clocking(
		.clk_50M						(clk_50M),
		.clk_lvds_ddr_out_p		(clk_lvds_ddr_out_p), 
		.clk_lvds_ddr_out_n		(clk_lvds_ddr_out_n), 
		.clk_col_out				(clk_col_out1),
		.rst_n						(rst_n), 
		.clk_main					(clk_main), 
		.clk_fix						(clk_fix), 
		.rst_fix_n					(rst_fix_n), 
		.clk_rxg						(clk_rxg), 
		.clk_rxio					(clk_rxio), 
		.rst_rx_n					(rst_rx_n), 
		.clk_txg						(clk_txg), 
		.clk_txio					(clk_txio), 
		.tx_strobe					(tx_strobe), 
		.rst_tx_n					(rst_tx_n), 
		.clk_lvds_sdr_in_p		(clk_lvds_sdr_in_p), 
		.clk_lvds_sdr_in_n		(clk_lvds_sdr_in_n), 
		.clk_lvds_ddr_out			(clk_lvds_ddr_out)
	);

  BUFG	BUFG_INPUT_CLOCK(
		.O		(clk_col_out1), 
		.I		(clk_col_out)
	);
	
	/**** cl_serial ****/
	cl_serial_top cl_serial(
		.clk_fix						(clk_fix), 
		.rst_fix_n					(rst_fix_n), 
		.clk_rxg						(clk_rxg), 
		.rst_rx_n					(rst_rx_n), 
		.spi_clk						(spi_clk),
		.clk_col_out				(~clk_col_out1),
		.cl_sertc_p					(cl_sertc_p), 
		.cl_sertc_n					(cl_sertc_n), 
		.cl_sertfg_p				(cl_sertfg_p), 
		.cl_sertfg_n				(cl_sertfg_n), 
		.cmd_wr_sensor_spi		(cmd_wr_sensor_spi), 
		.cmd_rd_sensor_spi		(cmd_rd_sensor_spi), 
		.spi_register				(spi_register), 
		.fifo_sensor_wen			(fifo_sensor_wen), 
		.fifo_sensor_din			(fifo_sensor_din), 
		.reg_frames					(reg_frames), 
		.reg_integration			(reg_integration), 
		.hdr_enable					(hdr_enable), 
		.reg_cnt_timing_cycle	(reg_cnt_timing_cycle), 
		.reg_window_row_start	(reg_window_row_start), 
		.reg_window_row_length	(reg_window_row_length), 
		.timing_bram_rd_addr		(timing_bram_rd_addr), 
		.timing_bram_dout			(timing_bram_dout), 
		.training_word				(training_word), 
		.reg_test_image_chan_0	(reg_test_image_chan_0), 
		.reg_test_image_chan_1	(reg_test_image_chan_1), 
		.reg_test_image_chan_2	(reg_test_image_chan_2), 
		.reg_test_image_chan_3	(reg_test_image_chan_3), 
		.fifo_train_wen			(fifo_train_wen), 
		.fifo_train_din			(fifo_train_din), 
		.reg_test_image_enable	(reg_test_image_enable), 
		.reg_camera_control		(reg_camera_control),
      .window_column_sel      (window_column_sel),		
		.pll_sel						(pll_sel),
		.pll_sel_0					(pll_sel_0),
		.pll_sel_1					(pll_sel_1),
		.pll_sel_2					(pll_sel_2),
		.pll_sel_3					(pll_sel_3),
		.reg_ctrl_led				(reg_ctrl_led),
		.fot_rst_rd_addr			(fot_rst_rd_addr),
		.fot_sig_rd_addr			(fot_sig_rd_addr),
		.fot_rst_bram_dout		(fot_rst_bram_dout),
		.fot_sig_bram_dout		(fot_sig_bram_dout),
		.fot_rst_timing_cycle	(fot_rst_timing_cycle),
		.fot_sig_timing_cycle	(fot_sig_timing_cycle),
		.cnt_t3						(cnt_t3)
	);


	/**** sensor_controller ****/
	sensor_controller sensor_controller(
		.clk_rxg						(~clk_rxg), 
		.rst_rx_n					(rst_rx_n), 
		.reg_camera_control		(reg_camera_control), 
		.reg_test_image_enable	(reg_test_image_enable), 
		.training_done				(training_done), 
		.cmd_start_training		(cmd_start_training), 
		.cmd_gen_test_image		(cmd_gen_test_image), 
		.sensor_reset_n			(sensor_reset_n), 
		.frame_req					(frame_req)
	);	
	
	
	/**** sensor_spi ****/
	sensor_spi sensor_spi(
		.clk_fix						(clk_fix), 
		.rst_fix_n					(rst_fix_n), 
		.cmd_wr_sensor_spi		(cmd_wr_sensor_spi), 
		.cmd_rd_sensor_spi		(cmd_rd_sensor_spi), 
		.spi_register				(spi_register), 
		.spi_out						(spi_out), 
		.spi_clk						(spi_clk), 
		.spi_write					(spi_write), 
		.spi_in						(spi_in), 
		.spi_read					(spi_read), 
		.fifo_sensor_wen			(fifo_sensor_wen), 
		.fifo_sensor_din			(fifo_sensor_din)
	);


	/**** sequencer ****/
	sequencer_g200 sequencer(
		.clk_rxg						(clk_col_out1), //~
		.rst_rx_n					(rst_rx_n),
		.frame_req					(frame_req), 
		.reg_frames					(reg_frames), 
		.reg_integration			(reg_integration), 
		.hdr_enable					(hdr_enable), 
		.reg_cnt_timing_cycle	(reg_cnt_timing_cycle), 
		.reg_window_row_start	(reg_window_row_start), 
		.reg_window_row_length	(reg_window_row_length), 
		.timing_bram_rd_addr		(timing_bram_rd_addr), 
		.timing_bram_dout			(timing_bram_dout), 
		.pixel_read_timing		(pixel_read_timing), 
		.decoder						(decoder),
		.fot_dout					(fot_dout),
		.fot_rst_rd_addr			(fot_rst_rd_addr),
		.fot_sig_rd_addr			(fot_sig_rd_addr),
		.fot_rst_bram_dout		(fot_rst_bram_dout),
		.fot_sig_bram_dout		(fot_sig_bram_dout),
		.fot_rst_timing_cycle	(fot_rst_timing_cycle),
		.fot_sig_timing_cycle	(fot_sig_timing_cycle),
		.tx2							(tx2),
		.cnt_t3						(cnt_t3)
	);
	
	assign	sync_x = pixel_read_timing[5];
	
	/**** image_rx ****/
	image_rx image_rx(
		.clk_rxg						(clk_col_out1), 
		.clk_rxio					(clk_rxio), 
		.clk_txg						(clk_txg), 
		.clk_fix						(clk_fix),
		.rst_rx_n					(rst_rx_n), 
		.rst_tx_n					(rst_tx_n),
		.cmd_start_training		(cmd_start_training), 
		.cmd_gen_test_image		(cmd_gen_test_image), 
		.sync_x						(sync_x), 
		.training_word				(training_word), 
		.reg_cnt_timing_cycle	(reg_cnt_timing_cycle), 
		.window_row_length		(reg_window_row_length), 
		.reg_test_image_chan_0	(reg_test_image_chan_0), 
		.reg_test_image_chan_1	(reg_test_image_chan_1), 
		.reg_test_image_chan_2	(reg_test_image_chan_2), 
		.reg_test_image_chan_3	(reg_test_image_chan_3), 
		.sensor_data_ser_p		(sensor_data_ser_p), 
		.sensor_data_ser_n		(sensor_data_ser_n), 
		.window_column_sel      (window_column_sel),
		.chan_0						(chan_0), 
		.chan_1						(chan_1), 
		.chan_2						(chan_2), 
		.chan_3						(chan_3), 
		.chan_4						(chan_4), 
		.chan_5						(chan_5), 
		.chan_6						(chan_6), 
		.chan_7						(chan_7), 
		.fval							(fval),
		.lval							(lval), 
		//.dval							(dval), 
		.training_done				(training_done), 
		.fifo_train_wen			(fifo_train_wen), 
		.fifo_train_din			(fifo_train_din) 
	);
	 
	 /**** image_tx ****/
	 image_tx image_tx(
		.clk_txg						(clk_txg), 
		.clk_txio					(clk_txio), 
		.tx_strobe					(tx_strobe), 
		.rst_tx_n					(rst_tx_n), 
		.fval							(fval), 
		.lval							(lval), 
		.dval							(dval), 
		.chan_0						(chan_0), 
		.chan_1						(chan_1), 
		.chan_2						(chan_2), 
		.chan_3						(chan_3), 
		.chan_4						(chan_4), 
		.chan_5						(chan_5), 
		.chan_6						(chan_6), 
		.chan_7						(chan_7),  
		.cl_x_p						(cl_xdata_p), 
		.cl_x_n						(cl_xdata_n), 
		.cl_xclk_p					(cl_xclk_p), 
		.cl_xclk_n					(cl_xclk_n), 
		.cl_y_p						(cl_ydata_p), 
		.cl_y_n						(cl_ydata_n), 
		.cl_yclk_p					(cl_yclk_p), 
		.cl_yclk_n					(cl_yclk_n),
		.cl_z_p						(cl_zdata_p), 
		.cl_z_n						(cl_zdata_n), 
		.cl_zclk_p					(cl_zclk_p), 
		.cl_zclk_n					(cl_zclk_n)
	);
	
	
	/**** test_io ****/
	test_io_module test(
		.test_in_0					(fval), 
		.test_in_1					(lval), 
		.test_in_2					(clk_txg), 
		.test_in_3					(frame_req), 
		.test_in_4					(1'b0), 
		.test_in_5					(reg_ctrl_led), 
		.test_in_6					(1'b0), 
		.test_in_7					(1'b0), 
		.test_out					(test_io)
	);

endmodule