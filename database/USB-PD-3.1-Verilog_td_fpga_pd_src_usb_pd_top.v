// This program was cloned from: https://github.com/briansune/USB-PD-3.1-Verilog
// License: MIT License

//  ____         _                ____                      
// | __ )  _ __ (_)  __ _  _ __  / ___|  _   _  _ __    ___ 
// |  _ \ | '__|| | / _` || '_ \ \___ \ | | | || '_ \  / _ \
// | |_) || |   | || (_| || | | | ___) || |_| || | | ||  __/
// |____/ |_|   |_| \__,_||_| |_||____/  \__,_||_| |_| \___|
//                                                          
// Programed By: BrianSune
// Contact: briansune@gmail.com
// 


`timescale 1ns/1ps

module usb_pd_top#(
	parameter	[9 : 0]	volt_sel_50mv = 240
)(
	
	input	sys_clk,
	input	sys_nrst,
	
	// Differential capture for input
	// Biased @ VUSB_CC * 40%
	input	cc1_in,
	// input	cc1_in_p,
	// input	cc1_in_n,
	input	cc2_in,
	// input	cc2_in_p,
	// input	cc2_in_n,
	
	output	cc_oen,
	output	cc1_out,
	output	cc2_out,
	
	output	cc1_debug,
	output	cc2_debug
);
	
	localparam integer mmcm_freq	= 30000;
	localparam integer pon_wait_ms	= 2200;
	
	localparam	[27 : 0] pon_wait		= (mmcm_freq * pon_wait_ms) - 1;
	localparam	[27 : 0] oh_us_delay	= (mmcm_freq / 10) - 1;
	
	wire				glb_clk;
	wire				glb_nrst;
	
	wire	[31 : 0]	rd_words	[0 : 6];
	reg		[31 : 0]	wr_words	[0 : 6];
	
	wire				rd_role;
	wire	[2 : 0]		rd_id;
	wire	[2 : 0]		rd_num;
	wire	[3 : 0]		rd_type;
	
	// first power on
	// this consider this need to hrst
	reg					fpon;
	
	initial begin
		fpon <= 1'b1;
	end
	
	reg		[3 : 0]		main_fsm;
	
	usb_pd_pll usb_pd_pll_u0(
		.clk0_out	(glb_clk),
		.extlock	(glb_nrst),
		
		.reset		(~sys_nrst),
		.refclk		(sys_clk)
	);
	
	wire			cc_din;
	wire			cc_dout;
	wire			cc_io_ctrl;
	reg				cc_check;
	
	reg				bmc_wen;
	
	wire			bmc_rd_busy;
	wire			cc_lock;
	
	cc_line #(
		.system_khz(mmcm_freq)
	)cc_line_u0(
		.nrst			(glb_nrst),
		.clock			(glb_clk),
		
		.cc_lock		(cc_lock),
		.cc_check		(cc_check),
		.cc_io_ctrl		(cc_io_ctrl),
		
		.cc_din			(cc_din),
		.cc_dout		(cc_dout),
		
		.phy_in_cc1		(cc1_in),
		// .phy_in_cc1_p	(cc1_in_p),
		// .phy_in_cc1_n	(cc1_in_n),
		.phy_in_cc2		(cc2_in),
		// .phy_in_cc2_p	(cc2_in_p),
		// .phy_in_cc2_n	(cc2_in_n),
		
		.phy_out_en		(cc_oen),
		.phy_out_cc1	(cc1_out),
		.phy_out_cc2	(cc2_out),
		
		.phy_debug_cc1	(cc1_debug),
		.phy_debug_cc2	(cc2_debug)
	);
	
	usb_pd_phy_rd#(
		.system_khz(mmcm_freq)
	)usb_pd_phy_rd_u0(
		.nrst		(glb_nrst),
		.clock		(glb_clk),
		.enable		(1'b1),
		
		.rd_role	(rd_role),
		.msg_id		(rd_id),
		.msg_type	(rd_type),
		.msg_num	(rd_num),
		
		.msg_word0	(rd_words[0]),
		.msg_word1	(rd_words[1]),
		.msg_word2	(rd_words[2]),
		.msg_word3	(rd_words[3]),
		.msg_word4	(rd_words[4]),
		.msg_word5	(rd_words[5]),
		.msg_word6	(rd_words[6]),
		
		.crc_valid	(crc_valid),
		.pkg_valid	(pkg_valid),
		
		.bmc_din	(cc_din),
		
		.busy		(bmc_rd_busy)
	);
	
	reg		[2 : 0]		wr_num;
	reg		[3 : 0]		wr_type;
	reg					wr_hrst;
	
	reg		[31 : 0]	wr_word;
	
	usb_pd_phy_wr#(
		.system_khz(mmcm_freq)
	)usb_pd_phy_wr_u0(
		.nrst			(glb_nrst),
		.clock			(glb_clk),
		
		.hdr_sop_hrst	(wr_hrst),
		.start			(bmc_wen),
		.busy			(cc_io_ctrl),
		
		.send_id		(rd_id),
		.send_num		(wr_num),
		.send_type		(wr_type),
		
		.send_word0		(wr_word),
		.send_word1		(32'd0),
		.send_word2		(32'd0),
		.send_word3		(32'd0),
		.send_word4		(32'd0),
		.send_word5		(32'd0),
		.send_word6		(32'd0),
		
		.bmc_dout		(cc_dout)
	);
	
	localparam	fsm_fpon			= 0,
				fsm_ck_cc			= fsm_fpon + 1,
				fsm_wait_pre_msg	= fsm_ck_cc + 1,
				fsm_wait_pd_cap		= fsm_wait_pre_msg + 1,
				fsm_crc_good0		= fsm_wait_pd_cap + 1,
				fsm_crc0_done		= fsm_crc_good0 + 1,
				fsm_req_pwr			= fsm_crc0_done + 1,
				fsm_req_preq		= fsm_req_pwr + 1,
				fsm_wait_crc_ret	= fsm_req_preq + 1,
				fsm_ck_crc_good1	= fsm_wait_crc_ret + 1,
				fsm_wait_accept		= fsm_ck_crc_good1 + 1,
				fsm_crc_good2		= fsm_wait_accept + 1,
				fsm_wait_ps_rdy		= fsm_crc_good2 + 1,
				fsm_crc_good3		= fsm_wait_ps_rdy + 1,
				fsm_idle			= fsm_crc_good3 + 1,
				fsm_error			= fsm_idle + 1;
	// =================================
	
	reg		[27 : 0]		delay_abit;
	
	// ila_0 dut_ila (
		// .clk		(glb_clk),
		// .probe0		(cc_din),
		// .probe1		(cc_lock),
		
		// .probe2		(main_fsm),
		// .probe3		(crc_valid),
		// .probe4		(pkg_valid)
	// );
	
	always@(posedge glb_clk)begin
		if(!glb_nrst)begin
			
			bmc_wen <= 1'b0;
			
			cc_check <= 1'b0;
			main_fsm <= fsm_fpon;
			
			wr_words[0] <= 32'd0;
			wr_words[1] <= 32'd0;
			wr_words[2] <= 32'd0;
			wr_words[3] <= 32'd0;
			wr_words[4] <= 32'd0;
			wr_words[5] <= 32'd0;
			wr_words[6] <= 32'd0;
			
			delay_abit <= 28'd0;
			
			wr_hrst <= 1'b0;
			wr_num <= 3'd0;
			wr_type <= 4'd0;
			
			wr_word <= 32'd0;
			
		end else begin
			case(main_fsm)
				
				fsm_fpon: begin
					fpon <= 1'b0;
					main_fsm <= fsm_ck_cc;
					cc_check <= 1'b0;
					bmc_wen <= 1'b0;
					delay_abit <= 28'd0;
				end
				
				fsm_ck_cc: begin
					if(!bmc_rd_busy)begin
						cc_check <= 1'b1;
					end
					
					if(cc_lock)begin
						main_fsm <= fsm_wait_pre_msg;
					end
				end
				
				fsm_wait_pre_msg: begin
					if(delay_abit >= pon_wait)begin
						main_fsm <= fsm_wait_pd_cap;
						delay_abit <= 28'd0;
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				fsm_wait_pd_cap: begin
					
					cc_check <= 1'b0;
					
					if(
						crc_valid & pkg_valid &
						rd_type == 4'd1 &
						rd_num >= 3'd1
						// rd_role
					)begin
						wr_words[0] <= rd_words[0];
						wr_words[1] <= rd_words[1];
						wr_words[2] <= rd_words[2];
						wr_words[3] <= rd_words[3];
						wr_words[4] <= rd_words[4];
						wr_words[5] <= rd_words[5];
						wr_words[6] <= rd_words[6];
						
						main_fsm <= fsm_crc_good0;
					end else if(
						crc_valid & pkg_valid &
						rd_type != 4'd1
					)begin
						
					end
				end
				
				fsm_crc_good0: begin
					
					if(delay_abit >= oh_us_delay)begin
						
						if(!bmc_rd_busy)begin
							delay_abit <= 28'd0;
							bmc_wen <= 1'b1;
							
							main_fsm <= fsm_crc0_done;
							wr_hrst <= 1'b0;
							wr_num <= 3'd0;
							wr_type <= 4'd1;
						end
						
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				fsm_crc0_done: begin
					
					bmc_wen <= 1'b0;
					
					if(!cc_io_ctrl)begin
						delay_abit <= delay_abit + 1'b1;
					end
					
					if(delay_abit >= (oh_us_delay / 2))begin
						delay_abit <= 28'd0;
						main_fsm <= fsm_req_pwr;
					end
					
					wr_word[30 : 28] <= 3'd0;
				end
				
				fsm_req_pwr: begin
					
					wr_hrst <= 1'b0;
					wr_num <= 3'd1;
					wr_type <= 4'd2;
					
					wr_word[31] <= 1'b0;
					
					if(wr_words[0][10+:10] == volt_sel_50mv)begin
						wr_word[30 : 28] <= 3'd1;
						wr_word[0 +: 10] <= wr_words[0][0+:10];
						wr_word[10 +: 10] <= wr_words[0][0+:10];
					end else if(wr_words[1][10+:10] == volt_sel_50mv)begin
						wr_word[30 : 28] <= 3'd2;
						wr_word[0 +: 10] <= wr_words[1][0+:10];
						wr_word[10 +: 10] <= wr_words[1][0+:10];
					end else if(wr_words[2][10+:10] == volt_sel_50mv)begin
						wr_word[30 : 28] <= 3'd3;
						wr_word[0 +: 10] <= wr_words[2][0+:10];
						wr_word[10 +: 10] <= wr_words[2][0+:10];
					end else if(wr_words[3][10+:10] == volt_sel_50mv)begin
						wr_word[30 : 28] <= 3'd4;
						wr_word[0 +: 10] <= wr_words[3][0+:10];
						wr_word[10 +: 10] <= wr_words[3][0+:10];
					end else if(wr_words[4][10+:10] == volt_sel_50mv)begin
						wr_word[30 : 28] <= 3'd5;
						wr_word[0 +: 10] <= wr_words[4][0+:10];
						wr_word[10 +: 10] <= wr_words[4][0+:10];
					end else if(wr_words[5][10+:10] == volt_sel_50mv)begin
						wr_word[30 : 28] <= 3'd6;
						wr_word[0 +: 10] <= wr_words[5][0+:10];
						wr_word[10 +: 10] <= wr_words[5][0+:10];
					end else if(wr_words[6][10+:10] == volt_sel_50mv)begin
						wr_word[30 : 28] <= 3'd7;
						wr_word[0 +: 10] <= wr_words[6][0+:10];
						wr_word[10 +: 10] <= wr_words[6][0+:10];
					end
					
					wr_word[27 : 25] <= 3'd0;
					wr_word[24] <= 1'b1;
					wr_word[23:20] <= 4'd0;
					
					main_fsm <= fsm_req_preq;
				end
				
				fsm_req_preq: begin
					if(
						wr_word[0 +: 10] == 10'd0 || 
						wr_word[10 +: 10] == 10'd0 || 
						wr_word[30 : 28] == 3'd0
					)begin
						main_fsm <= fsm_error;
					end
					
					if(!bmc_rd_busy)begin
						bmc_wen <= 1'b1;
						
						if(cc_io_ctrl)begin
							main_fsm <= fsm_wait_crc_ret;
						end
					end
				end
				
				fsm_wait_crc_ret: begin
					bmc_wen <= 1'b0;
					
					if(!cc_io_ctrl & bmc_rd_busy)begin
						main_fsm <= fsm_ck_crc_good1;
					end
					
					delay_abit <= 28'd0;
				end
				
				fsm_ck_crc_good1: begin
					if(
						crc_valid & pkg_valid &
						rd_type == 4'd1 &
						rd_num == 3'd0
						// rd_role
					)begin
						main_fsm <= fsm_wait_accept;
					end
					
					if(delay_abit >= {20{1'b1}})begin
						main_fsm <= fsm_fpon;
						delay_abit <= 28'd0;
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				fsm_wait_accept: begin
					if(
						bmc_rd_busy & crc_valid & pkg_valid &
						rd_type == 4'd3 & rd_num == 3'd0
					)begin
						main_fsm <= fsm_crc_good2;
					end
					
					delay_abit <= 28'd0;
				end
				
				fsm_crc_good2: begin
					if(!bmc_rd_busy)begin
						wr_hrst <= 1'b0;
						wr_num <= 3'd0;
						wr_type <= 4'd1;
						
						if(delay_abit >= oh_us_delay)begin
							if(cc_io_ctrl)
								main_fsm <= fsm_wait_ps_rdy;
							bmc_wen <= 1'b1;
						end else begin
							delay_abit <= delay_abit + 1'b1;
						end
					end
				end
				
				fsm_wait_ps_rdy: begin
					
					bmc_wen <= 1'b0;
					
					if(
						bmc_rd_busy & crc_valid & pkg_valid &
						rd_type == 4'd6 & rd_num == 3'd0
					)begin
						main_fsm <= fsm_crc_good3;
					end
					
					delay_abit <= 28'd0;
				end
				
				fsm_crc_good3: begin
					
					if(delay_abit >= oh_us_delay)begin
						
						if(!bmc_rd_busy)begin
							delay_abit <= 28'd0;
							bmc_wen <= 1'b1;
							
							main_fsm <= fsm_idle;
							wr_hrst <= 1'b0;
							wr_num <= 3'd0;
							wr_type <= 4'd1;
						end
						
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				fsm_idle: begin
					bmc_wen <= 1'b0;
				end
				
				fsm_error: begin
				end
				
			endcase
		end
	end
	
endmodule
