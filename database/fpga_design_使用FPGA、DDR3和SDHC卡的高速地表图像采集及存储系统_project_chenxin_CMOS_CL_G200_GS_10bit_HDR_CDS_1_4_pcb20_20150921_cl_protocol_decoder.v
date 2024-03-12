`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 			Gpixel
// Engineer: 			HangWang
// 
// Create Date:    	16:28:29 11/25/2014 
// Module Name:    	cl_protocol_decoder 
// Project Name: 		GVISION200
// Target Devices: 	Spartan-6 xc6slx150-3fg900
// Tool versions: 	ISE13.1
// Description: 		decoder
// Revision: 
// 		V1.0-First created
//////////////////////////////////////////////////////////////////////////////////
module cl_protocol_decoder(clk_fix, rst_fix_n, clk_rxg,
	rb1_wen, rb2_wen, rb3_wen, rb4_wen, reg_addr, reg_data,
	reg_camera_control, cmd_wr_sensor_spi, cmd_rd_sensor_spi, reg_frames, 
	reg_test_image_enable, reg_test_image_chan_0, reg_test_image_chan_1, reg_test_image_chan_2, reg_test_image_chan_3, 
	training_word, reg_ctrl_led, window_column_sel,
	spi_register,window_column_sel, 
	reg_integration, reg_cnt_timing_cycle, hdr_enable, reg_window_row_start, reg_window_row_length, 
	timing_bram_rd_addr, timing_bram_dout, clk_col_out,
	pll_sel, pll_sel_0, pll_sel_1, pll_sel_2, pll_sel_3,
	fot_rst_rd_addr,	fot_rst_bram_dout, fot_rst_timing_cycle,
	fot_sig_rd_addr,	fot_sig_bram_dout, fot_sig_timing_cycle,
	cnt_t3
	);
	
	// clock & reset
	input					clk_fix;
	input					rst_fix_n;
	input					clk_rxg;
	// protocol input signal
	input					rb1_wen;
	input					rb2_wen;
	input					rb3_wen;
	input					rb4_wen;
	input  [7:0]		reg_addr;
	input  [7:0]		reg_data;
	
	output [7:0]		reg_camera_control;
	output 				cmd_wr_sensor_spi;
	output				cmd_rd_sensor_spi;
	output [7:0]		reg_frames;
		
	output 				reg_test_image_enable;
	output [11:0]		reg_test_image_chan_0;
	output [11:0]		reg_test_image_chan_1;
	output [11:0]		reg_test_image_chan_2;
	output [11:0]		reg_test_image_chan_3;
		
	output [11:0]		training_word;
	output				reg_ctrl_led;
	output [1:0]		window_column_sel;
		
	output [255:0] 	spi_register;
		
	output [23:0]		reg_integration;
	output [9:0]		reg_cnt_timing_cycle;
	output				hdr_enable;
	output [11:0]		reg_window_row_start;
	output [11:0]		reg_window_row_length;
		
	input  [9:0]		timing_bram_rd_addr;
	output [17:0]		timing_bram_dout;
	input					clk_col_out;
	
	output				pll_sel;
	output				pll_sel_0;
	output				pll_sel_1;
	output				pll_sel_2;
	output				pll_sel_3;
	
	output [4:0]		fot_sig_bram_dout;
	(*keep = "true"*) output [10:0]		fot_sig_timing_cycle;
	output [4:0]		fot_rst_bram_dout;
	output [10:0]		fot_rst_timing_cycle;
	input  [10:0]		fot_rst_rd_addr;
	input  [10:0]		fot_sig_rd_addr;
	output [7:0]		cnt_t3;
	
	
	reg  [7:0]			reg_camera_control;
	reg  					cmd_wr_sensor_spi;
	reg 					cmd_rd_sensor_spi;
	reg  [7:0]			reg_frames;
			
	reg  					reg_test_image_enable;
	reg  [11:0]			reg_test_image_chan_0;
	reg  [11:0]			reg_test_image_chan_1;
	reg  [11:0]			reg_test_image_chan_2;
	reg  [11:0]			reg_test_image_chan_3;
			
	reg  [11:0]			training_word;
	reg					reg_ctrl_led;
	reg	[1:0]			window_column_sel;

	reg  [255:0] 		spi_register;
	
	reg  [23:0]			reg_integration;
	reg  [9:0]			reg_cnt_timing_cycle;
	reg 					hdr_enable;
	reg  [11:0]			reg_window_row_start;
	reg  [11:0]			reg_window_row_length;
	reg  [15:0]			reg_tx2;
	
	// signal for block ram of timing
	reg  [9:0]			reg_timing_addr;
	reg  [9:0]			timing_bram_wr_addr;
	reg  [17:0]			timing_bram_din;
	reg					rolling_enable;
	
	reg					pll_sel;
	reg					pll_sel_0;
	reg					pll_sel_1;
	reg					pll_sel_2;
	reg					pll_sel_3;
	
	reg	[10:0]		fot_sig_bram_wr_addr;	
	reg	[4:0]			fot_sig_bram_din;				
	reg	[10:0]		reg_fot_sig_wr_addr;
	reg	[10:0]		fot_sig_timing_cycle;
						
	reg	[10:0]			fot_rst_bram_wr_addr;
	reg	[4:0]				fot_rst_bram_din;
	reg	[10:0]			reg_fot_rst_wr_addr;
	reg	[10:0]			fot_rst_timing_cycle;
	
	reg	[7:0]				cnt_t3;
	// mapping for RB1
	always @(posedge clk_fix)begin
		if (!rst_fix_n) begin
			reg_camera_control      <= 8'd0;
			cmd_wr_sensor_spi			<= 1'b0;
			cmd_rd_sensor_spi			<= 1'b0;
			reg_frames              <= 8'd0;
			reg_test_image_enable   <= 1'b0;
			reg_test_image_chan_0   <= 12'd0;
			reg_test_image_chan_1   <= 12'd0;
			reg_test_image_chan_2   <= 12'd0;
			reg_test_image_chan_3   <= 12'd0;
			training_word           <= 12'd0; 
			reg_ctrl_led				<= 1'b0;
			window_column_sel			<= 2'b00;
		end
		else begin
			if (rb1_wen == 1) begin
				case (reg_addr)
					8'd0:		begin
									reg_camera_control         <= {reg_data[7:2],1'b0,1'b0};
									cmd_wr_sensor_spi				<= reg_data[0];
									cmd_rd_sensor_spi				<= reg_data[1];
								end
					8'd26:	reg_frames              		<= reg_data;
					8'd28:	reg_test_image_enable       	<= reg_data[0];
					8'd29:	reg_test_image_chan_0[7:0] 	<= reg_data;
					8'd30:	reg_test_image_chan_0[11:8] 	<= reg_data[3:0];
					8'd31:	reg_test_image_chan_1[7:0] 	<= reg_data;
					8'd32:	reg_test_image_chan_1[11:8] 	<= reg_data[3:0];
					8'd33:	reg_test_image_chan_2[7:0] 	<= reg_data;
					8'd34:	reg_test_image_chan_2[11:8] 	<= reg_data[3:0];
					8'd35:	reg_test_image_chan_3[7:0] 	<= reg_data;
					8'd36:	reg_test_image_chan_3[11:8] 	<= reg_data[3:0];  
					8'd37:	training_word[7:0]				<= reg_data;
					8'd38:	training_word[11:8]				<= reg_data[3:0];
					8'd39:	begin
									pll_sel							<= 1'b1;//reg_data[0];
									pll_sel_0						<= 1'b1;//reg_data[1];
									pll_sel_1						<= 1'b1;//reg_data[2]
									pll_sel_2						<= 1'b0;//reg_data[3];
									pll_sel_3						<=	1'b1;//reg_data[4];
								end
					8'd40:	reg_ctrl_led						<= reg_data[0];
					8'd41:	window_column_sel[1:0]			<= reg_data[1:0];
				endcase
			end
		end
	end

	// mapping for RB2
	always @(posedge clk_fix)begin
		if (!rst_fix_n) begin
			spi_register		<= 256'd0;
		end
		else begin
			if (rb2_wen == 1) begin
				case (reg_addr)
					8'd0:		spi_register[7:0]					<= reg_data;
					8'd1:		spi_register[15:8]				<= reg_data;
					8'd2:		spi_register[23:16]				<= reg_data;
					8'd3:		spi_register[31:24]				<= reg_data;
					8'd4:		spi_register[39:32]				<= reg_data;
					8'd5:		spi_register[47:40]				<= reg_data;
					8'd6:		spi_register[55:48]				<= reg_data;
					8'd7:		spi_register[63:56]				<= reg_data;
					8'd8:		spi_register[71:64]				<= reg_data;
					8'd9:		spi_register[79:72]				<= reg_data;
					8'd10:	spi_register[87:80]				<= reg_data;
					8'd11:	spi_register[95:88]				<= reg_data;
					8'd12:	spi_register[103:96]				<= reg_data;
					8'd13:	spi_register[111:104]			<= reg_data;
					8'd14:	spi_register[119:112]			<= reg_data;
					8'd15:	spi_register[127:120]			<= reg_data;
					8'd16:	spi_register[135:128]			<= reg_data;
					8'd17:	spi_register[143:136]			<= reg_data;
					8'd18:	spi_register[151:144]			<= reg_data;
					8'd19:	spi_register[159:152]			<= reg_data;
					8'd20:	spi_register[167:160]			<= reg_data;
					8'd21:	spi_register[175:168]			<= reg_data;
					8'd22:	spi_register[183:176]			<= reg_data;
					8'd23:	spi_register[191:184]			<= reg_data;
					8'd24:	spi_register[199:192]			<= reg_data;
					8'd25:	spi_register[207:200]			<= reg_data;
					8'd26:	spi_register[215:208]			<= reg_data;
					8'd27:	spi_register[223:216]			<= reg_data;
					8'd28:	spi_register[231:224]			<= reg_data;
					8'd29:	spi_register[239:232]			<= reg_data;
					8'd30:	spi_register[247:240]			<= reg_data;
					8'd31:	spi_register[255:248]			<= reg_data;
				endcase
			end
		end
	end
	
	// mapping for RB3
	always @(posedge clk_fix)begin
		if (!rst_fix_n) begin
			reg_integration			<= 24'd0;
			reg_cnt_timing_cycle		<= 10'd0;
			hdr_enable					<= 1'b0;
			reg_timing_addr 			<= 10'd0;
			reg_window_row_start 	<= 12'd0;
			reg_window_row_length 	<= 12'd0;
		end
		else begin
			if (rb3_wen == 1) begin
				case (reg_addr)
					8'd0:		reg_integration[7:0]					<= reg_data;
					8'd1:		reg_integration[15:8]				<= reg_data;
					8'd2:		reg_integration[23:16]				<= reg_data;
					8'd4:		reg_cnt_timing_cycle[7:0]			<= reg_data;
					8'd5:		reg_cnt_timing_cycle[9:8]			<= reg_data[1:0];
					8'd6:		reg_tx2[7:0]							<= reg_data;
					8'd7:		reg_tx2[15:8]							<= reg_data;
					8'd8:		hdr_enable								<= reg_data[0];
					8'd9:		rolling_enable							<= reg_data[0];
					8'd10:	reg_timing_addr[7:0]					<= reg_data;
					8'd11:	reg_timing_addr[9:8]					<= reg_data[1:0];
					8'd12:	begin
									timing_bram_wr_addr				<= reg_timing_addr;
									timing_bram_din[17:16]			<= reg_data[1:0];
								end
					8'd13:	begin
									timing_bram_wr_addr				<= reg_timing_addr;
									timing_bram_din[7:0]				<= reg_data;
								end
					8'd14:	begin
									timing_bram_wr_addr				<= reg_timing_addr;
									timing_bram_din[15:8]			<= reg_data;
								end
					8'd18:	reg_window_row_start[7:0]			<= reg_data;
					8'd19:	reg_window_row_start[11:8]			<= reg_data[3:0];
					8'd20:	reg_window_row_length[7:0]			<= reg_data;
					8'd21:	reg_window_row_length[11:8]		<= reg_data[3:0];
				endcase
			end
		end
	end	
	
	//mapping for RB4
	always @(posedge clk_fix)begin
		if (!rst_fix_n) begin
			fot_sig_bram_wr_addr		<= 11'd0;
			fot_sig_bram_din			<= 5'd0;	
			reg_fot_sig_wr_addr		<= 11'd0;
			fot_sig_timing_cycle		<= 11'd0;
			
			fot_rst_bram_wr_addr		<= 11'd0;
			fot_rst_bram_din			<= 4'd0;
			reg_fot_rst_wr_addr		<= 11'd0;
			fot_rst_timing_cycle		<= 11'd0;
			cnt_t3						<=	8'd0;
		end
		else begin
			if (rb4_wen == 1) begin
				case (reg_addr)
					8'd0:		fot_sig_timing_cycle[7:0]						<=	reg_data;
					8'd1:		fot_sig_timing_cycle[10:8]						<= reg_data[2:0];
					8'd2:		reg_fot_sig_wr_addr[7:0]						<= reg_data;
					8'd3:		reg_fot_sig_wr_addr[10:8]						<= reg_data[2:0];
					8'd4:		begin
									fot_sig_bram_din[4:0]						<= reg_data[4:0];
									fot_sig_bram_wr_addr							<= reg_fot_sig_wr_addr;
								end
					8'd5:		fot_rst_timing_cycle[7:0]						<=	reg_data;
					8'd6:		fot_rst_timing_cycle[10:8]						<= reg_data[2:0];
					8'd7:		reg_fot_rst_wr_addr[7:0]						<= reg_data;
					8'd8:		reg_fot_rst_wr_addr[10:8]						<= reg_data[2:0];
					8'd9:		begin
									fot_rst_bram_din[4:0]						<= reg_data[4:0];
									fot_rst_bram_wr_addr							<= reg_fot_rst_wr_addr;
								end
					8'd10:	begin
									cnt_t3[7:0]										<=	reg_data;
								end
				endcase
			end
		end
	end

	bram_28_1024 timing_bram(
		.clka				(clk_fix),
		.wea				(1'b1),
		.addra			(timing_bram_wr_addr),
		.dina				(timing_bram_din),
		.clkb				(clk_col_out),
		.rstb				(~ rst_fix_n),
		.addrb			(timing_bram_rd_addr),
		.doutb			(timing_bram_dout)
	);	
	
	fot_sig_bram 	fot_sig_timing (
		.clka				(clk_fix),
		.wea				(1'b1),
		.addra			(fot_sig_bram_wr_addr),
		.dina				(fot_sig_bram_din),
		.clkb				(clk_col_out),
		.addrb			(fot_sig_rd_addr),
		.doutb			(fot_sig_bram_dout)
	);
	
	fot_rst_bram 	fot_rst_timing (
		.clka				(clk_fix),
		.wea				(1'b1),
		.addra			(fot_rst_bram_wr_addr),
		.dina				(fot_rst_bram_din),
		.clkb				(clk_col_out),
		.addrb			(fot_rst_rd_addr),
		.doutb			(fot_rst_bram_dout)
	);
endmodule
