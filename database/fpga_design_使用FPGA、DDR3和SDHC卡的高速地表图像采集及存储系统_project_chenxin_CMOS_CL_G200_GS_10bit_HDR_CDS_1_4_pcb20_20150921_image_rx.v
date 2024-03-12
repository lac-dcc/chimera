`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 			Gpixel
// Engineer: 			HangWang
// 
// Create Date:    	16:28:29 11/25/2014 
// Module Name:    	image_rx 
// Project Name: 		GVISION200
// Target Devices: 	Spartan-6 xc6slx150-3fg900
// Tool versions: 	ISE13.1
// Description: 		G200 sequencer and receive command from labview
// Revision: 
// 		V1.0-First created
//////////////////////////////////////////////////////////////////////////////////
module image_rx(clk_rxg, clk_rxio, clk_txg, clk_fix, rst_rx_n, rst_tx_n,
	cmd_gen_test_image, sync_x,cmd_start_training,
	training_word, reg_cnt_timing_cycle, window_row_length,
	reg_test_image_chan_0, reg_test_image_chan_1, reg_test_image_chan_2, reg_test_image_chan_3,
	sensor_data_ser_p, sensor_data_ser_n, window_column_sel,
	chan_0, chan_1, chan_2, chan_3, chan_4, chan_5, chan_6, chan_7,
	fval, lval, 
	training_done,
	fifo_train_wen, fifo_train_din
	);

	// clock & reset
	input				clk_rxg;
	input				clk_rxio;
	input				clk_txg;
	input				clk_fix;
	input				rst_rx_n;
	input				rst_tx_n;
	
	// cmd
	input				cmd_start_training;
	input				cmd_gen_test_image;
	input				sync_x;
	
	// register
	input  [11:0]	training_word;
	input	 [9:0]	reg_cnt_timing_cycle;
	input  [11:0]	window_row_length;
	input [1:0]    window_column_sel;
	
	// test image
	input	 [11:0]	reg_test_image_chan_0;
	input	 [11:0]	reg_test_image_chan_1;
	input	 [11:0]	reg_test_image_chan_2;
	input	 [11:0]	reg_test_image_chan_3;

	// lvds input
	input	 [31:0]	sensor_data_ser_p;
	input  [31:0]	sensor_data_ser_n;

	// output to camera link
	output [7:0]	chan_0;
	output [7:0]	chan_1;
	output [7:0]	chan_2;
	output [7:0]	chan_3;
	output [7:0]	chan_4;
	output [7:0]	chan_5;
	output [7:0]	chan_6;
	output [7:0]	chan_7;
	
	// sync info of camera link
	output			fval;
	output			lval;
	
	// interface to controller 
	output			training_done;
	
	// interface to labview
	output			fifo_train_wen;
	output [7:0]	fifo_train_din;

	wire	[383:0]	data_par_trained;
	wire				lvals;
	wire				dvals;
	wire				fval_q;
	wire				lval_q;
	
	// mapping register and parameter	
	wire				gclk;
	wire				reset;
	wire				clk_rxg_x2_b1;
	wire				clk_rxio_b1;
	wire				rxstrobe_b1;
	
	wire				clk_rxg_x2_b2;
	wire				clk_rxio_b2;
	wire				rxstrobe_b2;
	
	wire				clk_rxg_x2_b3;
	wire				clk_rxio_b3;
	wire				rxstrobe_b3;
	
	wire [11:0]		datapar_out0;
	wire [11:0]		datapar_out1;
	wire [11:0]		datapar_out2;
	wire [11:0]		datapar_out3;
	wire [11:0]		datapar_out4;
	wire [11:0]		datapar_out5;
	wire [11:0]		datapar_out6;
	wire [11:0]		datapar_out7;

	reg				lval_qq;
	reg				fval_qq;
	reg [11:0]		data_trained0;
	reg [11:0]		data_trained1;
	reg [11:0]		data_trained2;
	reg [11:0]		data_trained3;
	reg [11:0]		data_trained4;
	reg [11:0]		data_trained5;
	reg [11:0]		data_trained6;
	reg [11:0]		data_trained7;
	
always @(posedge clk_rxg)begin
	if(window_column_sel == 2'd0)begin
		data_trained0	<=	data_par_trained[11:0];			//top0
		data_trained1	<=	data_par_trained[23:12];		//top1
		data_trained2	<=	data_par_trained[35:24];		//top2
		data_trained3	<=	data_par_trained[47:36];		//top3
		data_trained4	<=	data_par_trained[203:192];		//bot0
		data_trained5	<=	data_par_trained[215:204];		//bot1
		data_trained6	<=	data_par_trained[227:216];		//bot2
		data_trained7	<=	data_par_trained[239:228];		//bot3
		fval_qq			<=	fval_q;
		lval_qq			<= lval_q;
	end
	if(window_column_sel == 2'd1)begin
		data_trained0	<=	data_par_trained[59:48];		//top4
		data_trained1	<=	data_par_trained[71:60];		//top5
		data_trained2	<=	data_par_trained[83:72];		//top6
		data_trained3	<=	data_par_trained[95:84];		//top7
		data_trained4	<=	data_par_trained[251:240];		//bot4
		data_trained5	<=	data_par_trained[263:252];		//bot5
		data_trained6	<=	data_par_trained[275:264];		//bot6
		data_trained7	<=	data_par_trained[287:276];		//bot7
		fval_qq			<=	fval_q;
		lval_qq			<= lval_q;
	end
	if(window_column_sel == 2'd2)begin
		data_trained0	<=	data_par_trained[107:96];		//top8
		data_trained1	<=	data_par_trained[119:108];		//top9
		data_trained2	<=	data_par_trained[131:120];		//top10
		data_trained3	<=	data_par_trained[143:132];		//top11
		data_trained4	<=	data_par_trained[299:288];		//bot8
		data_trained5	<=	data_par_trained[311:300];		//bot9
		data_trained6	<=	data_par_trained[323:312];		//bot10
		data_trained7	<=	data_par_trained[335:324];		//bot11
		fval_qq			<=	fval_q;
		lval_qq			<= lval_q;
	end
	if(window_column_sel == 2'd3)begin
		data_trained0	<=	data_par_trained[155:144];		//top12
		data_trained1	<=	data_par_trained[167:156];		//top13
		data_trained2	<=	data_par_trained[179:168];		//top14
		data_trained3	<=	data_par_trained[191:180];		//top15
		data_trained4	<=	data_par_trained[347:336];		//bot12
		data_trained5	<=	data_par_trained[359:348];		//bot13
		data_trained6	<=	data_par_trained[371:360];		//bot14
		data_trained7	<=	data_par_trained[383:372];		//bot15
		fval_qq			<=	fval_q;
		lval_qq			<= lval_q;
	end
end

	
	
	/**** clock generator ****/
	clock_generator_pll_b1 clock_generator_b1 (
		.clk_in(clk_rxg), 
		.rst_n(rst_rx_n), 
		.gclk(gclk),
      .gclk2(clk_rxg_x2_b1),		
		.rxioclk(clk_rxio_b1), 
		.reset(reset), 
		.rxserdesstrobe(rxstrobe_b1)
	);
	
	/**** training ****/
	training training(
		.clk_rxg						(gclk), 
		.clk_rxg_x2_b1       	(clk_rxg_x2_b1),
		.clk_rxio_b1				(clk_rxio_b1),
      .rxserdesstrobe_b1		(rxstrobe_b1),
		.rst_rx_n					(~reset), 
		.training_word				(training_word), 
		.cmd_start_training		(cmd_start_training),  
		.training_done				(training_done), 
		.fifo_train_wen			(fifo_train_wen), 
		.fifo_train_din			(fifo_train_din), 
		.data_ser_p					(sensor_data_ser_p), 
		.data_ser_n					(sensor_data_ser_n), 
		.data_par_trained			(data_par_trained)
	);

	/**** image buffer ****/
	image_buffer image_buffer(
		.clk_rxg						(clk_rxg),
		.rst_rx_n					(~reset),
		.clk_txg						(clk_txg),
		.rst_tx_n					(~reset),
		.fvals						(fval_qq),
		.lvals						(lval_qq),
		.datapar_out0				(data_trained0),
		.datapar_out1				(data_trained1),
		.datapar_out2				(data_trained2),
		.datapar_out3				(data_trained3),
		.datapar_out4				(data_trained4),
		.datapar_out5				(data_trained5),	
		.datapar_out6				(data_trained6),
		.datapar_out7				(data_trained7),
		.chan_0						(chan_0),
		.chan_1						(chan_1),
		.chan_2						(chan_2),
		.chan_3						(chan_3),
		.chan_4						(chan_4),
		.chan_5						(chan_5),
		.chan_6						(chan_6),
		.chan_7						(chan_7),
		.fval							(fval),
		.lval							(lval)
	);

	/**** generate image val info ****/
	gen_image_val gen_image_val(
		.clk_rxg						(clk_rxg), 
		.rst_rx_n					(rst_rx_n), 
		.sync_x						(sync_x),
		.reg_cnt_timing_cycle	(reg_cnt_timing_cycle), 
		.window_row_length		(window_row_length), 
		.fval							(fval_q), 
		.lval							(lval_q)
	);
endmodule
