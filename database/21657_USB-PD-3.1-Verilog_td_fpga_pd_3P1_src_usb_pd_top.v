// This program was cloned from: https://github.com/briansune/USB-PD-3.1-Verilog
// License: MIT License

// ============================================================
//  ____         _                ____                      
// | __ )  _ __ (_)  __ _  _ __  / ___|  _   _  _ __    ___ 
// |  _ \ | '__|| | / _` || '_ \ \___ \ | | | || '_ \  / _ \
// | |_) || |   | || (_| || | | | ___) || |_| || | | ||  __/
// |____/ |_|   |_| \__,_||_| |_||____/  \__,_||_| |_| \___|
//                                                          
// ============================================================
// Programed By: BrianSune
// Contact: briansune@gmail.com
// 
// ============================================================

`timescale 1ns/1ps

module usb_pd_top#(
	parameter	[9 : 0]	volt_sel_50mv_a = 100,
	parameter	[9 : 0]	volt_sel_50mv_b = 560
)(
	
	input	sys_clk,
	input	sys_nrst,
	
	// Differential capture for input
	// Biased @ VUSB_CC * 40%
	input	cc1_in,
	input	cc2_in,
	
	output	cc_oen,
	output	cc1_out,
	output	cc2_out,
	
	output	cc1_debug,
	output	cc2_debug
);
	
	localparam integer	mmcm_freq	= 30000;
	localparam integer	pon_wait_ms	= 220;
	localparam integer	hrtbeat_ms	= 300;
	localparam integer	ready_ms	= 400;
	
	localparam integer pon_wait			= (mmcm_freq * pon_wait_ms) - 1;
	localparam integer oh_us_delay		= (mmcm_freq / 10) - 1;
	localparam integer delay_0p8us		= (mmcm_freq * 0.8) - 1;
	localparam integer heartbe_wait		= (mmcm_freq * hrtbeat_ms) - 1;
	localparam integer ready_wait		= (mmcm_freq * ready_ms) - 1;
	
	wire				glb_clk;
	wire				glb_nrst;
	
	wire	[31 : 0]	rd_words	[0 : 6];
	reg		[31 : 0]	wr_words	[0 : 6];
	reg		[31 : 0]	wr_words2	[0 : 5];
	
	wire				rd_role;
	wire	[2 : 0]		rd_id;
	wire	[2 : 0]		rd_num;
	wire	[4 : 0]		rd_type;
	wire				rd_pd3p1;
	
	// first power on
	// this consider this need to hrst
	reg					fpon;
	
	wire				phy_discon;
	
	reg		[5 : 0]		main_fsm;
	
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
		.phy_in_cc2		(cc2_in),
		
		.phy_discon		(phy_discon),
		
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
		.msg_pd3p1	(rd_pd3p1),
		
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
	reg		[4 : 0]		wr_type;
	reg					wr_hrst;
	reg					wr_pd3p1_hdr;
	
	reg		[31 : 0]	wr_word;
	reg		[31 : 0]	wr_word1;
	
	usb_pd_phy_wr#(
		.system_khz(mmcm_freq)
	)usb_pd_phy_wr_u0(
		.nrst			(glb_nrst),
		.clock			(glb_clk),
		
		.hdr_sop_hrst	(wr_hrst),
		.start			(bmc_wen),
		.busy			(cc_io_ctrl),
		
		.send_3p1hdr	(wr_pd3p1_hdr),
		.send_id		(rd_id),
		.send_num		(wr_num),
		.send_type		(wr_type),
		
		.send_word0		(wr_word),
		.send_word1		(wr_word1),
		.send_word2		(32'd0),
		.send_word3		(32'd0),
		.send_word4		(32'd0),
		.send_word5		(32'd0),
		.send_word6		(32'd0),
		
		.bmc_dout		(cc_dout)
	);
	
	localparam	fsm_fpon				= 0,
				fsm_ck_cc				= fsm_fpon + 1,
				
				fsm_wait_pre_msg		= fsm_ck_cc + 1,
				
				fsm_wait_pd_cap			= fsm_wait_pre_msg + 1,
				fsm_crc_good0			= fsm_wait_pd_cap + 1,
				fsm_crc0_done			= fsm_crc_good0 + 1,
				
				fsm_snk_req_cap_go		= fsm_crc0_done + 1,
				fsm_snk_req_caplg		= fsm_snk_req_cap_go + 1,
				fsm_snk_caplg_crc		= fsm_snk_req_caplg + 1,
				
				fsm_wait_pd_cap2		= fsm_snk_caplg_crc + 1,
				fsm_req_pwr2			= fsm_wait_pd_cap2 + 1,
				
				fsm_req_pwr				= fsm_req_pwr2 + 1,
				fsm_req_preq			= fsm_req_pwr + 1,
				fsm_wait_crc_ret		= fsm_req_preq + 1,
				fsm_ck_crc_good1		= fsm_wait_crc_ret + 1,
				
				fsm_wait_accept			= fsm_ck_crc_good1 + 1,
				fsm_crc_good2			= fsm_wait_accept + 1,
				
				fsm_wait_ps_rdy			= fsm_crc_good2 + 1,
				fsm_crc_good3			= fsm_wait_ps_rdy + 1,
				
				fsm_wait_crc3_done		= fsm_crc_good3 + 1,
				
				fsm_epr_hrtb			= fsm_wait_crc3_done + 1,
				fsm_epr_hrtb_crc		= fsm_epr_hrtb + 1,
				fsm_epr_hrtb_crcgd		= fsm_epr_hrtb_crc + 1,
				fsm_epr_hrtb_ret		= fsm_epr_hrtb_crcgd + 1,
				fsm_epr_hrtb_crc2		= fsm_epr_hrtb_ret + 1,
				fsm_epr_hrtb_crc2_done	= fsm_epr_hrtb_crc2 + 1,
				
				// ------------------------------------------------
				// EPR mode is very tedious and complex
				// ------------------------------------------------
				fsm_epr_enter			= fsm_epr_hrtb_crc2_done + 1,
				fsm_wait_crc_epr		= fsm_epr_enter + 1,
				fsm_ck_crc_good_epr		= fsm_wait_crc_epr + 1,
				fsm_src_epr_resp		= fsm_ck_crc_good_epr + 1,
				fsm_src_epr_gdcrc		= fsm_src_epr_resp + 1,
				fsm_src_epr_gdcrc_w		= fsm_src_epr_gdcrc + 1,
				
				fsm_src_epr_resp2		= fsm_src_epr_gdcrc_w + 1,
				fsm_src_epr_gdcrc2		= fsm_src_epr_resp2 + 1,
				fsm_src_epr_gdcrc2_w	= fsm_src_epr_gdcrc2 + 1,
				
				fsm_snk_efail_srst		= fsm_src_epr_gdcrc2_w + 1,
				fsm_src_efsrst_w		= fsm_snk_efail_srst + 1,
				fsm_ck_crc_good2		= fsm_src_efsrst_w + 1,
				fsm_ck_src_srst_acp		= fsm_ck_crc_good2 + 1,
				fsm_ssrst_acp_crc		= fsm_ck_src_srst_acp + 1,
				
				fsm_idle				= fsm_ssrst_acp_crc + 1,
				fsm_error				= fsm_idle + 1;
	// =================================
	
	reg		[27 : 0]		delay_abit;
	
	reg						epr_enter_flag;
	reg						epr_pass_flag;
	reg						epr_pdo_lst_rdy;
	reg						epr_pdo_2nd_rdy;
	
	reg		[1 : 0]			first_try;
	
	always@(posedge glb_clk)begin
		if(!glb_nrst)begin
			
			fpon <= 1'b1;
			first_try <= 2'd0;
			
			bmc_wen <= 1'b0;
			wr_pd3p1_hdr <= 1'b0;
			
			epr_enter_flag <= 1'b0;
			epr_pass_flag <= 1'b0;
			epr_pdo_lst_rdy <= 1'b0;
			epr_pdo_2nd_rdy <= 1'b0;
			
			cc_check <= 1'b0;
			main_fsm <= fsm_fpon;
			
			wr_words[0] <= 32'd0;
			wr_words[1] <= 32'd0;
			wr_words[2] <= 32'd0;
			wr_words[3] <= 32'd0;
			wr_words[4] <= 32'd0;
			wr_words[5] <= 32'd0;
			wr_words[6] <= 32'd0;
			
			wr_words2[0] <= 32'd0;
			wr_words2[1] <= 32'd0;
			wr_words2[2] <= 32'd0;
			wr_words2[3] <= 32'd0;
			wr_words2[4] <= 32'd0;
			wr_words2[5] <= 32'd0;
			
			delay_abit <= 28'd0;
			
			wr_hrst <= 1'b0;
			wr_num <= 3'd0;
			wr_type <= 5'd0;
			
			wr_word <= 32'd0;
			wr_word1 <= 32'd0;
			
		end else begin
			case(main_fsm)
				
				fsm_fpon: begin
					fpon <= 1'b0;
					main_fsm <= fsm_ck_cc;
					cc_check <= 1'b0;
					bmc_wen <= 1'b0;
					delay_abit <= 28'd0;
					epr_enter_flag <= 1'b0;
					epr_pass_flag <= 1'b0;
					wr_pd3p1_hdr <= 1'b0;
					epr_pdo_lst_rdy <= 1'b0;
					epr_pdo_2nd_rdy <= 1'b0;
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
					
					bmc_wen <= 1'b0;
					
					if(delay_abit >= pon_wait)begin
						main_fsm <= fsm_wait_pd_cap;
						delay_abit <= 28'd0;
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				fsm_wait_pd_cap: begin
					
					cc_check <= 1'b0;
					bmc_wen <= 1'b0;
					delay_abit <= 28'd0;
					
					if(
						bmc_rd_busy & crc_valid & pkg_valid &
						( (rd_type == 5'b10001) | (rd_type == 5'b0_0001) ) &
						(rd_num >= 3'd1)
					)begin
						if(rd_pd3p1)begin
							wr_words[0] <= {rd_words[1][0+:16], rd_words[0][16+:16]};
							wr_words[1] <= {rd_words[2][0+:16], rd_words[1][16+:16]};
							wr_words[2] <= {rd_words[3][0+:16], rd_words[2][16+:16]};
							wr_words[3] <= {rd_words[4][0+:16], rd_words[3][16+:16]};
							wr_words[4] <= {rd_words[5][0+:16], rd_words[4][16+:16]};
							wr_words[5] <= {rd_words[6][0+:16], rd_words[5][16+:16]};
							wr_words[6] <= {			 8'h00, rd_words[6][16+:16]};
						end else begin
							wr_words[0] <= rd_words[0];
							wr_words[1] <= rd_words[1];
							wr_words[2] <= rd_words[2];
							wr_words[3] <= rd_words[3];
							wr_words[4] <= rd_words[4];
							wr_words[5] <= rd_words[5];
							wr_words[6] <= rd_words[6];
						end
						
						main_fsm <= fsm_crc_good0;
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
							wr_type <= 5'd1;
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
					
					if(delay_abit >= (oh_us_delay * 2) )begin
						delay_abit <= 28'd0;
						
						if(epr_pass_flag & !epr_pdo_lst_rdy & !epr_pdo_2nd_rdy)begin
							main_fsm <= fsm_snk_req_cap_go;
							
							wr_pd3p1_hdr <= 1'b1;
							wr_num <= 3'd1;
							wr_type <= 5'b1_0001;
							
							// to simplify the TX engine, the second word is split to 2x16bit
							wr_word[31 : 16] <= 16'h00;
							wr_word[15 :  0] <= 16'b1_0001_1_0_000000000;
							
						end else if(epr_pass_flag & epr_pdo_lst_rdy & !epr_pdo_2nd_rdy)begin
							main_fsm <= fsm_wait_pd_cap2;
							
							wr_pd3p1_hdr <= 1'b0;
						
						end else if(epr_pass_flag & epr_pdo_lst_rdy & epr_pdo_2nd_rdy)begin
							
							main_fsm <= fsm_req_pwr2;
							wr_pd3p1_hdr <= 1'b0;
							
						end else begin
							main_fsm <= fsm_req_pwr;
							wr_pd3p1_hdr <= 1'b0;
						end
					end
				end
				
				fsm_snk_req_cap_go:begin
					if(!bmc_rd_busy)begin
						if(delay_abit >= oh_us_delay)begin
							if(cc_io_ctrl)
								main_fsm <= fsm_snk_req_caplg;
							bmc_wen <= 1'b1;
							delay_abit <= 28'd0;
						end else begin
							delay_abit <= delay_abit + 1'b1;
						end
					end
				end
				
				fsm_snk_req_caplg: begin
					bmc_wen <= 1'b0;
					
					if(!cc_io_ctrl & bmc_rd_busy)begin
						main_fsm <= fsm_snk_caplg_crc;
					end
					
					delay_abit <= 28'd0;
				end
				
				fsm_snk_caplg_crc: begin
					if(
						bmc_rd_busy & crc_valid & pkg_valid &
						rd_type == 5'd1 &
						rd_num >= 3'd0
					)begin
						main_fsm <= fsm_crc0_done;
						epr_pdo_lst_rdy <= 1'b1;
					end
					
					if(delay_abit >= heartbe_wait)begin
						delay_abit <= 28'd0;
						main_fsm <= fsm_idle;
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				fsm_wait_pd_cap2: begin
					
					bmc_wen <= 1'b0;
					delay_abit <= 28'd0;
					
					if(
						bmc_rd_busy & crc_valid & pkg_valid &
						rd_type == 5'h11 &
						rd_num >= 3'd1 &
						rd_pd3p1
					)begin
						
						epr_pdo_2nd_rdy <= 1'b1;
						
						wr_words[6][16+:16] <= rd_words[0][16+:16];
						
						wr_words2[0] <= rd_words[1];
						wr_words2[1] <= rd_words[2];
						wr_words2[2] <= rd_words[3];
						wr_words2[3] <= rd_words[4];
						wr_words2[4] <= rd_words[5];
						wr_words2[5] <= rd_words[6];
						
						main_fsm <= fsm_crc_good0;
					end
					
					if(delay_abit >= heartbe_wait)begin
						delay_abit <= 28'd0;
						main_fsm <= fsm_idle;
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				fsm_req_pwr2: begin
					
					wr_hrst <= 1'b0;
					wr_num <= 3'd2;		// RDO, PDO
					wr_type <= 5'd9;	// extended EPR REQUEST
					
					wr_word[27 : 25]	<= 3'd0;
					wr_word[24]			<= 1'b0;	// No USB subspend
					wr_word[23]			<= 1'b0;
					wr_word[22]			<= 1'b1;	// EPR CAP
					wr_word[21:20]		<= 2'b00;
					
					if(wr_words2[0][10+:10] == volt_sel_50mv_b)begin
						wr_word[31 : 28] <= 4'd8;
						wr_word[0 +: 10] <= wr_words2[0][0+:10];
						wr_word[10 +: 10] <= wr_words2[0][0+:10];
						wr_word1 <= wr_words2[0];
					end else if(wr_words2[1][10+:10] == volt_sel_50mv_b)begin
						wr_word[31 : 28] <= 4'd9;
						wr_word[0 +: 10] <= wr_words2[1][0+:10];
						wr_word[10 +: 10] <= wr_words2[1][0+:10];
						wr_word1 <= wr_words2[1];
					end else if(wr_words2[2][10+:10] == volt_sel_50mv_b)begin
						wr_word[31 : 28] <= 4'd10;
						wr_word[0 +: 10] <= wr_words2[2][0+:10];
						wr_word[10 +: 10] <= wr_words2[2][0+:10];
						wr_word1 <= wr_words2[2];
					end else if(wr_words2[3][10+:10] == volt_sel_50mv_b)begin
						wr_word[31 : 28] <= 4'd11;
						wr_word[0 +: 10] <= wr_words2[3][0+:10];
						wr_word[10 +: 10] <= wr_words2[3][0+:10];
						wr_word1 <= wr_words2[3];
					end else if(wr_words2[4][10+:10] == volt_sel_50mv_b)begin
						wr_word[31 : 28] <= 4'd12;
						wr_word[0 +: 10] <= wr_words2[4][0+:10];
						wr_word[10 +: 10] <= wr_words2[4][0+:10];
						wr_word1 <= wr_words2[4];
					end else if(wr_words2[5][10+:10] == volt_sel_50mv_b)begin
						wr_word[31 : 28] <= 4'd13;
						wr_word[0 +: 10] <= wr_words2[5][0+:10];
						wr_word[10 +: 10] <= wr_words2[5][0+:10];
						wr_word1 <= wr_words2[5];
					end
					
					main_fsm <= fsm_req_preq;
				end
				
				fsm_req_pwr: begin
					
					wr_hrst <= 1'b0;
					wr_num <= 3'd1;
					wr_type <= 5'd2;
					
					wr_word[31]			<= 1'b0;
					wr_word[30 : 28]	<= 3'd0;
					wr_word[27 : 25]	<= 3'd0;
					wr_word[24]			<= 1'b0;	// No USB subspend
					wr_word[23]			<= 1'b0;
					wr_word[22]			<= 1'b1;	// EPR CAP
					wr_word[21:20]		<= 2'b00;
					
					if(wr_words[0][10+:10] == volt_sel_50mv_a)begin
						wr_word[30 : 28] <= 3'd1;
						wr_word[0 +: 10] <= wr_words[0][0+:10];
						wr_word[10 +: 10] <= wr_words[0][0+:10];
					end else if(wr_words[1][10+:10] == volt_sel_50mv_a)begin
						wr_word[30 : 28] <= 3'd2;
						wr_word[0 +: 10] <= wr_words[1][0+:10];
						wr_word[10 +: 10] <= wr_words[1][0+:10];
					end else if(wr_words[2][10+:10] == volt_sel_50mv_a)begin
						wr_word[30 : 28] <= 3'd3;
						wr_word[0 +: 10] <= wr_words[2][0+:10];
						wr_word[10 +: 10] <= wr_words[2][0+:10];
					end else if(wr_words[3][10+:10] == volt_sel_50mv_a)begin
						wr_word[30 : 28] <= 3'd4;
						wr_word[0 +: 10] <= wr_words[3][0+:10];
						wr_word[10 +: 10] <= wr_words[3][0+:10];
					end else if(wr_words[4][10+:10] == volt_sel_50mv_a)begin
						wr_word[30 : 28] <= 3'd5;
						wr_word[0 +: 10] <= wr_words[4][0+:10];
						wr_word[10 +: 10] <= wr_words[4][0+:10];
					end else if(wr_words[5][10+:10] == volt_sel_50mv_a)begin
						wr_word[30 : 28] <= 3'd6;
						wr_word[0 +: 10] <= wr_words[5][0+:10];
						wr_word[10 +: 10] <= wr_words[5][0+:10];
					end else if(wr_words[6][10+:10] == volt_sel_50mv_a)begin
						wr_word[30 : 28] <= 3'd7;
						wr_word[0 +: 10] <= wr_words[6][0+:10];
						wr_word[10 +: 10] <= wr_words[6][0+:10];
					end
					
					main_fsm <= fsm_req_preq;
				end
				
				fsm_req_preq: begin
					if(
						wr_word[0 +: 10] == 10'd0 || 
						wr_word[10 +: 10] == 10'd0 || 
						wr_word[31 : 28] == 4'd0
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
						bmc_rd_busy & crc_valid & pkg_valid &
						rd_type == 5'd1 &
						rd_num == 3'd0
					)begin
						main_fsm <= fsm_wait_accept;
					end
					
					if(delay_abit >= heartbe_wait)begin
						delay_abit <= 28'd0;
						main_fsm <= fsm_idle;
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				fsm_wait_accept: begin
					if(
						bmc_rd_busy & crc_valid & pkg_valid &
						rd_type == 5'd3 & rd_num == 3'd0
					)begin
						main_fsm <= fsm_crc_good2;
					end
					
					if(delay_abit >= heartbe_wait)begin
						delay_abit <= 28'd0;
						main_fsm <= fsm_idle;
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				fsm_crc_good2: begin
					if(!bmc_rd_busy)begin
						wr_hrst <= 1'b0;
						wr_num <= 3'd0;
						wr_type <= 5'd1;
						
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
						rd_type == 5'd6 & rd_num == 3'd0
					)begin
						main_fsm <= fsm_crc_good3;
					end
					
					if(delay_abit >= ready_wait)begin
						delay_abit <= 28'd0;
						main_fsm <= fsm_idle;
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				fsm_crc_good3: begin
					
					if(delay_abit >= oh_us_delay)begin
						
						if(!bmc_rd_busy)begin
							delay_abit <= 28'd0;
							bmc_wen <= 1'b1;
							
							wr_hrst <= 1'b0;
							wr_num <= 3'd0;
							wr_type <= 5'd1;
							
							main_fsm <= fsm_wait_crc3_done;
						end
						
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				fsm_wait_crc3_done: begin
					
					bmc_wen <= 1'b0;
					
					if(
						((delay_abit >= (mmcm_freq * 1500) ) && (first_try == 2'd1)) |
						(delay_abit >= delay_0p8us & ~(epr_pass_flag & epr_pdo_lst_rdy & epr_pdo_2nd_rdy) ) | 
						(delay_abit >= heartbe_wait)
					)begin
						delay_abit <= 28'd0;
						
						if(first_try == 2'd1)begin
							main_fsm <= fsm_wait_pd_cap;
							first_try <= first_try + 1'b1;
						end else begin
							
							if(epr_pass_flag & epr_pdo_lst_rdy & epr_pdo_2nd_rdy)begin
								main_fsm <= fsm_epr_hrtb;
								
								wr_pd3p1_hdr <= 1'b1;
								wr_hrst <= 1'b0;
								wr_num <= 3'd1;
								wr_type <= 5'h10;
								
								// 8002 is the extended header
								// 0003 is keepalive
								wr_word <= 32'h0003_8002;
								
							end else begin
								main_fsm <= fsm_epr_enter;
								
								wr_pd3p1_hdr <= 1'b0;
								wr_hrst <= 1'b0;
								wr_num <= 3'd1;
								wr_type <= 4'hA;
								
								wr_word[31 : 24] <= 8'h01;
								wr_word[23 : 0] <= 24'd0;
							end
						end
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				// ==================================================
				
				fsm_epr_hrtb: begin
					if(!bmc_rd_busy)begin
						if(delay_abit >= oh_us_delay)begin
							if(cc_io_ctrl)
								main_fsm <= fsm_epr_hrtb_crc;
							bmc_wen <= 1'b1;
							delay_abit <= 28'd0;
						end else begin
							delay_abit <= delay_abit + 1'b1;
						end
					end
				end
				
				fsm_epr_hrtb_crc: begin
					
					bmc_wen <= 1'b0;
					
					if(!cc_io_ctrl)begin
						main_fsm <= fsm_epr_hrtb_crcgd;
					end
					
					delay_abit <= 28'd0;
				end
				
				fsm_epr_hrtb_crcgd: begin
					if(
						bmc_rd_busy & crc_valid & pkg_valid &
						rd_type == 5'd1 &
						rd_num == 3'd0
					)begin
						main_fsm <= fsm_epr_hrtb_ret;
					end
					
					if(delay_abit >= heartbe_wait)begin
						delay_abit <= 28'd0;
						main_fsm <= fsm_idle;
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				fsm_epr_hrtb_ret: begin
					if(
						bmc_rd_busy & crc_valid & pkg_valid &
						rd_type == 5'h10 &
						rd_num == 3'd1 &
						rd_pd3p1
					)begin
						if(rd_words[0][16+:16] == 8'h4)begin
							main_fsm <= fsm_epr_hrtb_crc2;
							wr_pd3p1_hdr <= 1'b0;
							wr_hrst <= 1'b0;
							wr_num <= 3'd0;
							wr_type <= 4'h1;
						end
					end
					
					if(delay_abit >= heartbe_wait)begin
						delay_abit <= 28'd0;
						main_fsm <= fsm_idle;
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				fsm_epr_hrtb_crc2: begin
					if(!bmc_rd_busy)begin
						if(delay_abit >= oh_us_delay)begin
							if(cc_io_ctrl)
								main_fsm <= fsm_epr_hrtb_crc2_done;
							bmc_wen <= 1'b1;
							delay_abit <= 28'd0;
						end else begin
							delay_abit <= delay_abit + 1'b1;
						end
					end
				end
				
				fsm_epr_hrtb_crc2_done: begin
					bmc_wen <= 1'b0;
					
					if(!cc_io_ctrl)begin
						main_fsm <= fsm_wait_crc3_done;
					end
					
					delay_abit <= 28'd0;
				end
				
				// ==================================================
				
				fsm_epr_enter: begin
					if(!bmc_rd_busy)begin
						bmc_wen <= 1'b1;
						
						if(cc_io_ctrl)begin
							main_fsm <= fsm_wait_crc_epr;
						end
					end
				end
				
				fsm_wait_crc_epr: begin
					bmc_wen <= 1'b0;
					
					if(!cc_io_ctrl & bmc_rd_busy)begin
						main_fsm <= fsm_ck_crc_good_epr;
					end
					
					delay_abit <= 28'd0;
				end
				
				fsm_ck_crc_good_epr: begin
					if(
						bmc_rd_busy & crc_valid & pkg_valid &
						rd_type == 5'd1 &
						rd_num == 3'd0
					)begin
						main_fsm <= fsm_src_epr_resp;
					end
					
					if(delay_abit >= heartbe_wait)begin
						delay_abit <= 28'd0;
						main_fsm <= fsm_idle;
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				fsm_src_epr_resp: begin
					if(
						bmc_rd_busy & crc_valid & pkg_valid &
						rd_type == 5'hA & rd_num == 3'd1
					)begin
						// EPR enter success, otherwise redo
						if(rd_words[0][24+:8] == 8'h2)begin
							epr_enter_flag <= 1'b1;
						end else begin
							epr_enter_flag <= 1'b0;
						end
						
						main_fsm <= fsm_src_epr_gdcrc;
					end
					
					if(delay_abit >= heartbe_wait)begin
						delay_abit <= 28'd0;
						main_fsm <= fsm_idle;
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				fsm_src_epr_gdcrc: begin
					if(!bmc_rd_busy)begin
						wr_hrst <= 1'b0;
						wr_num <= 3'd0;
						wr_type <= 5'd1;
						
						if(delay_abit >= oh_us_delay)begin
							if(cc_io_ctrl)
								main_fsm <= fsm_src_epr_gdcrc_w;
							bmc_wen <= 1'b1;
							delay_abit <= 28'd0;
						end else begin
							delay_abit <= delay_abit + 1'b1;
						end
					end
				end
				
				fsm_src_epr_gdcrc_w: begin
					bmc_wen <= 1'b0;
					
					if(!cc_io_ctrl)begin
						delay_abit <= delay_abit + 1'b1;
					end
					
					if(delay_abit >= oh_us_delay)begin
						delay_abit <= 28'd0;
						
						if(epr_enter_flag)
							main_fsm <= fsm_src_epr_resp2;
						else
							main_fsm <= fsm_snk_efail_srst;
					end
				end
				
				fsm_src_epr_resp2: begin
					if(
						bmc_rd_busy & crc_valid & pkg_valid &
						rd_type == 5'hA & rd_num == 3'd1
					)begin
						// EPR enter success, otherwise redo
						if(rd_words[0][24+:8] == 8'h3)begin
							epr_pass_flag <= 1'b1;
						end else begin
							epr_pass_flag <= 1'b0;
						end
						
						main_fsm <= fsm_src_epr_gdcrc2;
					end
					
					if(delay_abit >= heartbe_wait)begin
						delay_abit <= 28'd0;
						main_fsm <= fsm_idle;
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				fsm_src_epr_gdcrc2: begin
					if(!bmc_rd_busy)begin
						wr_hrst <= 1'b0;
						wr_num <= 3'd0;
						wr_type <= 5'd1;
						
						if(delay_abit >= oh_us_delay)begin
							if(cc_io_ctrl)
								main_fsm <= fsm_src_epr_gdcrc2_w;
							bmc_wen <= 1'b1;
							delay_abit <= 28'd0;
						end else begin
							delay_abit <= delay_abit + 1'b1;
						end
					end
				end
				
				fsm_src_epr_gdcrc2_w: begin
					bmc_wen <= 1'b0;
					
					if(!cc_io_ctrl)begin
						delay_abit <= delay_abit + 1'b1;
					end
					
					if(delay_abit >= oh_us_delay)begin
						delay_abit <= 28'd0;
						
						if(epr_pass_flag)
							main_fsm <= fsm_wait_pd_cap;
						else
							main_fsm <= fsm_snk_efail_srst;
					end
				end
				
				// ====================================================
				// Here select the next action
				// to soft reset or cont'd the request and see
				// ====================================================
				fsm_snk_efail_srst: begin
					if(!bmc_rd_busy)begin
						wr_hrst <= 1'b0;
						wr_num <= 3'd0;
						
						wr_type <= 4'hD;
						
						if(delay_abit >= oh_us_delay)begin
							if(cc_io_ctrl)
								main_fsm <= fsm_src_efsrst_w;
							bmc_wen <= 1'b1;
						end else begin
							delay_abit <= delay_abit + 1'b1;
						end
					end
				end
				
				fsm_src_efsrst_w: begin
					bmc_wen <= 1'b0;
					
					if(!cc_io_ctrl & bmc_rd_busy)begin
						main_fsm <= fsm_ck_crc_good2;
					end
					
					delay_abit <= 28'd0;
				end
				
				
				fsm_ck_crc_good2: begin
					
					if(
						bmc_rd_busy & crc_valid & pkg_valid &
						rd_type == 5'd1 &
						rd_num == 3'd0
					)begin
						main_fsm <= fsm_ck_src_srst_acp;
					end
					
					if(delay_abit >= heartbe_wait)begin
						delay_abit <= 28'd0;
						main_fsm <= fsm_idle;
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				fsm_ck_src_srst_acp: begin
					if(
						bmc_rd_busy & crc_valid & pkg_valid &
						rd_type == 5'd3 &
						rd_num == 3'd0
					)begin
						main_fsm <= fsm_ssrst_acp_crc;
					end
					
					if(delay_abit >= heartbe_wait)begin
						delay_abit <= 28'd0;
						main_fsm <= fsm_idle;
					end else begin
						delay_abit <= delay_abit + 1'b1;
					end
				end
				
				fsm_ssrst_acp_crc: begin
					if(!bmc_rd_busy)begin
						wr_hrst <= 1'b0;
						wr_num <= 3'd0;
						wr_type <= 5'd1;
						
						if(delay_abit >= oh_us_delay)begin
							if(cc_io_ctrl)begin
								main_fsm <= fsm_wait_pd_cap;
								first_try <= first_try + 1'b1;
							end
							bmc_wen <= 1'b1;
						end else begin
							delay_abit <= delay_abit + 1'b1;
						end
					end
				end
				
				fsm_idle: begin
					bmc_wen <= 1'b0;
					epr_enter_flag <= 1'b0;
					delay_abit <= 28'd0;
					
					if(phy_discon)begin
						fpon <= 1'b1;
						main_fsm <= fsm_fpon;
					end
				end
				
				// do nothing stuck @ ERROR
				fsm_error: begin
					bmc_wen <= 1'b0;
				end
				
				default: begin
					main_fsm <= fsm_idle;
					bmc_wen <= 1'b0;
					epr_enter_flag <= 1'b0;
					delay_abit <= 28'd0;
				end
				
			endcase
		end
	end
	
endmodule
