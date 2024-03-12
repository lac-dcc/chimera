`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 			Gpixel
// Engineer: 			HangWang
// 
// Create Date:    	16:28:29 11/25/2014 
// Module Name:    	image_buffer
// Project Name: 		GVISION200
// Target Devices: 	Spartan-6 xc6slx150-3fg900
// Tool versions: 	ISE13.1
// Description: 		generate fval, lval,dval and send the 4 channel to image_tx
// Revision: 
// 		V1.0-First created
//////////////////////////////////////////////////////////////////////////////////
module training(
   clk_rxg, rst_rx_n,
	clk_rxg_x2_b1,clk_rxio_b1,rxserdesstrobe_b1,
/*	clk_rxg_x2_b2,clk_rxio_b2,rxserdesstrobe_b2,
	clk_rxg_x2_b3,clk_rxio_b3,rxserdesstrobe_b3,*/
	training_word, cmd_start_training,
	training_done, fifo_train_wen, fifo_train_din,
	data_ser_p, data_ser_n, data_par_trained
	);

	// clock & reset
	input				clk_rxg;
	input				rst_rx_n;
	
	//bank1 to bank3 clock and trigger signal
	input          clk_rxg_x2_b1;
	input          clk_rxio_b1;
	input          rxserdesstrobe_b1;
	
/*	input          clk_rxg_x2_b2;
	input          clk_rxio_b2;
	input          rxserdesstrobe_b2;
	
	input          clk_rxg_x2_b3;
	input          clk_rxio_b3;
	input          rxserdesstrobe_b3;*/
	
	// register & command
	input  [11:0]	training_word;
	input				cmd_start_training;
	
	// interface
	output			training_done;
	output			fifo_train_wen;
	output [7:0]	fifo_train_din;
	
	// data
	input  [31:0]	data_ser_p;
	input  [31:0]	data_ser_n;
	output [383:0]	data_par_trained;
	
	
	
	// train result
	reg				train;
	reg				training_done;
	reg				fifo_train_wen;
	reg [7:0]		fifo_train_din;
	reg [3:0] 		loc_word;
	reg [3:0]		loc_chan;
	reg 	 		 	loc_ok;
	reg				loc_nok;
	
	// train control signal
	reg [31:0]		bitslip;
	reg [3:0]		shifter_addr [31:0];
	(*keep = "true"*) wire [11:0]		data_par_2D	[31:0];
	
	reg				start_align;
	reg [11:0]		data_curr;
	reg [4:0]		chan_sel;
	reg				align_done;
	reg [4:0] 		cnt_align;
	reg [31:0]     reset;
	
	(*keep = "true"*) reg [3:0] 		fsm_align;
	parameter		s_IDLE			= 4'd0,
						s_BIT_ALIGN		= 4'd1,
						s_WORD_ALIGN 	= 4'd2,
						s_STATIC			= 4'd3,
						//s_CHAN_ALIGN	= 4'd4,
						s_WRITE_START	= 4'd5,
						s_WRITE_MID		= 4'd6,
						s_WRITE_END	   = 4'd7,
						s_WRITE_WORD	= 4'd8,
						s_WRITE_CHAN	= 4'd9,
						s_WRITE_OK		= 4'd10,
						s_WRITE_ZERO	= 4'd11,
						s_FINISH 		= 4'd12;
				
	(*keep = "true"*) reg [2:0]		fsm_align_ctrl;
	parameter		s_CTRL_IDLE		= 3'b001,
						s_START_ALIGN	= 3'b010,
						s_ALIGN			= 3'b100;
						
	genvar			i;
	
	reg				cmd_start_training_q;
	reg            cmd_start_training_qq;
	
	reg [15:0]		cnt_bitalign;
	reg [31:0]		align_en;
	reg [15:0]		cnt_static;
	reg [15:0]		cnt_static_err;
	
	reg [2:0]		cnt_timeout1;
	reg [2:0]		cnt_timeout2;

	
	/**** Instantiate bank1 iserdes_1_to_12_data_diff ****/
	generate
		for(i = 0; i<32; i = i+1) begin:loop1
			iserdes_1_to_12_data_diff receiver_iserdes_bank1 (
				.clk_rxg_x1				(clk_rxg), 
				.clk_rxg_x2				(clk_rxg_x2_b1), 
				.clk_rxio				(clk_rxio_b1), 
				.reset					(reset[i]), 
				.rxserdesstrobe		(rxserdesstrobe_b1), 
				.bitslip					(bitslip[i]), 
				.shifter_addr			(shifter_addr[i]), 
				.datain_p				(data_ser_p[i]), 
				.datain_n				(data_ser_n[i]), 
				.data_out				(data_par_2D[i]),
				.align_en				(align_en[i])
			);
			assign	data_par_trained [i*12+11:i*12]	= data_par_2D[i];
		end
	endgenerate
	
	/**** Instantiate bank2 iserdes_1_to_12_data_diff ****/
/*	generate
		for(i = 8; i<24; i = i+1) begin:loop2
			iserdes_1_to_12_data_diff receiver_iserdes_bank2 (
				.clk_rxg_x1				(clk_rxg), 
				.clk_rxg_x2				(clk_rxg_x2_b2), 
				.clk_rxio				(clk_rxio_b2), 
				.reset					(reset[i]), 
				.rxserdesstrobe		(rxserdesstrobe_b2), 
				.bitslip					(bitslip[i]), 
				.shifter_addr			(shifter_addr[i]), 
				.datain_p				(data_ser_p[i]), 
				.datain_n				(data_ser_n[i]), 
				.data_out				(data_par_2D[i]),
				.align_en				(align_en[i])
			);
			assign	data_par_trained [i*12+11:i*12]	= data_par_2D[i];
		end
	endgenerate*/
	
	/**** Instantiate bank3 iserdes_1_to_12_data_diff ****/
/*	generate
		for(i = 24; i<32; i = i+1) begin:loop3
			iserdes_1_to_12_data_diff receiver_iserdes_bank3 (
				.clk_rxg_x1				(clk_rxg), 
				.clk_rxg_x2				(clk_rxg_x2_b3), 
				.clk_rxio				(clk_rxio_b3), 
				.reset					(reset[i]), 
				.rxserdesstrobe		(rxserdesstrobe_b3), 
				.bitslip					(bitslip[i]), 
				.shifter_addr			(shifter_addr[i]), 
				.datain_p				(data_ser_p[i]), 
				.datain_n				(data_ser_n[i]), 
				.data_out				(data_par_2D[i]),
				.align_en				(align_en[i])
			);
			assign	data_par_trained [i*12+11:i*12]	= data_par_2D[i];
		end
	endgenerate*/
	
	/**** ALIGNMENT CONTROLLER ****/
	// To reduce the amount of resources used, there is only one alignment machine
	// that is used by all input channels
	// The alignment algorithm is run for every channel sequenctially
	// The alignment controller select the correct channel and start training
	always @(posedge clk_rxg) begin
		if (!rst_rx_n) begin
			start_align			<= 1'b0;
			training_done		<= 1'b0;
			reset             <= 32'hff_ff_ff_ff;
			data_curr			<= 12'd0;
			chan_sel				<= 5'd0;
			fsm_align_ctrl		<= s_CTRL_IDLE;
			
			cmd_start_training_q	   <= 0;
			cmd_start_training_qq	<= 0;
		end
		else begin
			start_align			<= 1'b0;
			data_curr			<= data_par_2D[chan_sel];
			
			cmd_start_training_q	   <= cmd_start_training;
			cmd_start_training_qq	<= cmd_start_training_q;
			// FSM
			case (fsm_align_ctrl) 
				s_CTRL_IDLE:		begin
											if (cmd_start_training_qq == 1'b1) begin
											   reset             <= 32'hff_ff_ff_ff;
												fsm_align_ctrl		<= s_START_ALIGN;
												chan_sel				<= 5'd0;
												training_done		<= 1'b0;
												
											end
										end
				s_START_ALIGN:		begin
											start_align				<= 1'b1;
											reset                <= 32'd0;
											fsm_align_ctrl			<= s_ALIGN;
										end
				s_ALIGN:				begin
											if (align_done == 1'b1) begin
												if (chan_sel == 5'b11111) begin
													fsm_align_ctrl	<= s_CTRL_IDLE;
													training_done	<= 1'b1;
												end
												else begin
													chan_sel			<= chan_sel + 5'd1;
													fsm_align_ctrl	<= s_START_ALIGN;
												end
											end
										end
			endcase
		end
	end


	/**** BIT & WORD & CHAN ALIGNMENT ****/
	// Runs the training algorithm on 1 channel
	// (first bit alignment, second word alignment)
	//
	// Bit alignment: 
	//  Continuously sample data (data_curr) and compare for 'n' samples to
	//  the data from the previous iteration (data_prev).
	//  After comparing, the IDELAY parameter is increment to go to the next
	//  delay step.
	//  A complete stable region is found between the points loc_eye_start and
	//  loc_eye_end.
	//  The mid point between these two is found (loc_eye_mid) and the IDELAY
	//  of the channel is set to that value.
	//
	// Word alignment: 
	//  the bitslip module of the ISERDES is asserted until the
	//  data output matches the training word.

	
	always @(posedge clk_rxg) begin
		if (!rst_rx_n) begin
			fsm_align 			<= s_IDLE;
			cnt_align			<= 5'd0;
			align_done			<= 1'b0;
			
			shifter_addr[0]		<= 4'd0;
			shifter_addr[1]		<= 4'd0;
			shifter_addr[2]		<= 4'd0;
			shifter_addr[3]		<= 4'd0;
			shifter_addr[4]		<= 4'd0;
			shifter_addr[5]		<= 4'd0;
			shifter_addr[6]		<= 4'd0;
			shifter_addr[7]		<= 4'd0;
			shifter_addr[8]		<= 4'd0;
			shifter_addr[9]		<= 4'd0;
			shifter_addr[10]		<= 4'd0;
			shifter_addr[11]		<= 4'd0;
			shifter_addr[12]		<= 4'd0;
			shifter_addr[13]		<= 4'd0;
			shifter_addr[14]		<= 4'd0;
			shifter_addr[15]		<= 4'd0;
			
			shifter_addr[16]		<= 4'd0;
			shifter_addr[17]		<= 4'd0;
			shifter_addr[18]		<= 4'd0;
			shifter_addr[19]		<= 4'd0;
			shifter_addr[20]		<= 4'd0;
			shifter_addr[21]		<= 4'd0;
			shifter_addr[22]		<= 4'd0;
			shifter_addr[23]		<= 4'd0;
			shifter_addr[24]		<= 4'd0;
			shifter_addr[25]		<= 4'd0;
			shifter_addr[26]		<= 4'd0;
			shifter_addr[27]		<= 4'd0;
			shifter_addr[28]		<= 4'd0;
			shifter_addr[29]		<= 4'd0;
			shifter_addr[30]		<= 4'd0;
			shifter_addr[31]		<= 4'd0;
								
			bitslip				<= 32'd0;
			loc_word				<= 4'd0;
			loc_chan				<= 4'd0;
			loc_ok				<= 1'b0;
			loc_nok				<= 1'b0;
			
			fifo_train_wen		<= 1'b0;
			fifo_train_din		<= 8'd0;
			
			cnt_bitalign		<= 16'd0;
			align_en				<= 32'd0;
			cnt_static			<= 16'd0;
			cnt_static_err		<= 16'd0;
			cnt_timeout1		<= 3'd0;
			cnt_timeout2		<= 3'd0;
						
		end
		else begin
			bitslip[chan_sel]		<= 1'b0;
			align_done			<= 1'b0;
			fifo_train_wen		<= 1'b0;
			fifo_train_din		<= 8'd0;
			
			// FSM
			case (fsm_align)
				s_IDLE:			begin
										if (start_align == 1'b1) begin
											fsm_align				   <= s_BIT_ALIGN;
											loc_word					   <= 4'd0;
											loc_chan					   <= 4'd0;
											loc_ok					   <= 1'b0;
											loc_nok					   <= 1'b0;
											shifter_addr[chan_sel]	<= 4'd0;
											
											cnt_bitalign				<= 16'd8192;
											align_en[chan_sel]		<= 1'b1;
											cnt_timeout1				<= 3'd0;
											cnt_timeout2				<= 3'd0;
										end
									end
				s_BIT_ALIGN:	begin
										if (cnt_bitalign == 16'd0) begin
											fsm_align				   <= s_WORD_ALIGN;
											cnt_align				   <= 5'd0;
											align_en[chan_sel]		<= 1'b0;
											bitslip[chan_sel]	      <= 1'b1;
										end
										else begin
											cnt_bitalign				<= cnt_bitalign - 16'd1;
										end
									end
				s_WORD_ALIGN:	begin		// Match training word
										if (cnt_align == 5'd31) begin
											cnt_align		<= 5'd0;
											
											if (data_curr == training_word) begin
												fsm_align			   <= s_STATIC;
												loc_nok					<= 1'b0;
												loc_ok					<= 1'b1;
												cnt_static				<= 16'd0;
												cnt_static_err			<= 16'd0;
											end
											else begin
												if (loc_word == 4'd12) begin
													if (cnt_timeout1 == 3'd7) begin
														fsm_align			   <= s_STATIC;
														loc_nok					<= 1'b1;
														loc_ok					<= 1'b0;
														cnt_static				<= 16'd0;
														cnt_static_err			<= 16'd0;
													end
													else begin
														fsm_align		   <= s_BIT_ALIGN;
														cnt_bitalign		<= 16'd8192;
														align_en[chan_sel]<= 1'b1;
														loc_word				<= 4'd0;
														loc_nok				<= 1'b1;
														loc_ok				<= 1'b0;
														cnt_timeout1		<= cnt_timeout1 + 3'd1;
													end
												end
												else begin
													bitslip[chan_sel]	<= 1'b1;
													loc_word				<= loc_word +  4'd1;
												end
											end
										end
										else begin
											cnt_align		   <= cnt_align + 5'd1;
										end
									end
				s_STATIC:		begin
										if (cnt_static == 16'd1024) begin
											if (cnt_static_err == 16'd0) begin
												fsm_align			   <= s_WRITE_START;
												loc_nok					<= 1'b0;
												loc_ok					<= 1'b1;
											end
											else begin
												if (cnt_timeout2 == 3'd7) begin
													fsm_align			<= s_WRITE_START;
													loc_nok				<= 1'b1;
													loc_ok				<= 1'b0;
												end
												else begin
													fsm_align		   <= s_BIT_ALIGN;
													cnt_bitalign		<= 16'd8192;
													align_en[chan_sel]<= 1'b1;
													
													loc_nok				<= 1'b1;
													loc_ok				<= 1'b0;
													cnt_timeout2		<= cnt_timeout2 + 3'd1;
												end
											end
										end
										else begin
											cnt_static		<= cnt_static + 16'd1;
										end
										
										if (data_curr != training_word) begin
											cnt_static_err		<= cnt_static_err + 16'd1;
										end
									end
				s_WRITE_START:	begin
										fifo_train_din  		<= 8'd0;
										fifo_train_wen  		<= 1'b1;
										fsm_align 				<= s_WRITE_MID;
									end
				s_WRITE_MID:	begin
										fifo_train_din  		<= {5'd0, cnt_timeout1};
										fifo_train_wen  		<= 1'b1;
										fsm_align 				<= s_WRITE_END;
									end
				s_WRITE_END:	begin
										fifo_train_din  		<= {5'd0, cnt_timeout2};
										fifo_train_wen  		<= 1'b1;
										fsm_align 				<= s_WRITE_WORD;
									end
				s_WRITE_WORD:	begin
										fifo_train_din  		<= {4'b0000,loc_word};
										fifo_train_wen  		<= 1'b1;
										fsm_align 				<= s_WRITE_CHAN;
									end
				s_WRITE_CHAN:	begin
										fifo_train_din  		<= {4'b1111,loc_chan};
										fifo_train_wen  		<= 1'b1;
										fsm_align 				<= s_WRITE_OK;
									end
				s_WRITE_OK:		begin
										fifo_train_din  		<= {7'b0000000, loc_ok};
										fifo_train_wen  		<= 1'b1;
										fsm_align 				<= s_WRITE_ZERO;
									end
				s_WRITE_ZERO:		begin
										fifo_train_din  		<= 8'd0;
										fifo_train_wen  		<= 1'b1;
										fsm_align 				<= s_FINISH;
									end
				s_FINISH:		begin
										fsm_align				<= s_IDLE;
										align_done				<= 1'b1;
									end
			endcase
		end
	end

endmodule
