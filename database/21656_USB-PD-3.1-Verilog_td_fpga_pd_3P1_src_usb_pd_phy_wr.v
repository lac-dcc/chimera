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

module usb_pd_phy_wr#(
	parameter system_khz = 200000
)(
	
	input				nrst,
	input				clock,
	
	input				start,
	output				busy,
	
	// send #
	input				hdr_sop_hrst,
	
	input				send_3p1hdr,
	input	[2 : 0]		send_id,
	input	[2 : 0]		send_num,
	input	[4 : 0]		send_type,
	input	[31 : 0]	send_word0,
	input	[31 : 0]	send_word1,
	input	[31 : 0]	send_word2,
	input	[31 : 0]	send_word3,
	input	[31 : 0]	send_word4,
	input	[31 : 0]	send_word5,
	input	[31 : 0]	send_word6,
	
	output				bmc_dout
);
	
	localparam integer low_pulse = (system_khz * 106) - 1;
	
	localparam	fsm_idle		= 0,
				fsm_preamble	= fsm_idle + 1,
				fsm_hdr0		= fsm_preamble + 1,
				fsm_hdr1		= fsm_hdr0 + 1,
				fsm_ctrl_msg	= fsm_hdr1 + 1,
				fsm_data		= fsm_ctrl_msg + 1,
				fsm_crc32		= fsm_data + 1,
				fsm_eop			= fsm_crc32 + 1,
				fsm_done		= fsm_eop + 1,
				fsm_ovr_low		= fsm_done + 1;
	// =================================
	
	reg		[3 : 0]		phy_fsm;
	reg		[7 : 0]		cnt;
	
	reg					bmc_en;
	reg					bmc_data;
	wire				bmc_rdy;
	
	reg					enc4b5b_sel;
	reg		[3 : 0]		enc4b5b_data;
	wire	[4 : 0]		enc4b5b_dout;
	reg		[4 : 0]		enc4b5b_dout_r;
	reg		[15 : 0]	ctrl_msg_r;
	
	reg					crc_en;
	reg					crc_nrst;
	reg		[7 : 0]		crc_data;
	
	wire	[31 : 0]	crc_out;
	reg		[31 : 0]	crc_out_r;
	
	reg					flush_r;
	
	// 0 = sop 1 = hardware reset
	reg					sop_hrst;
	
	reg					busy_r;
	
	reg		[2 : 0]		send_idx;
	reg		[31 : 0]	send_word_r		[0 : 6];
	
	assign busy = busy_r;
	
	always@(posedge clock)begin
		if(!nrst)begin
			phy_fsm <= 4'd0;
			cnt <= 8'd0;
			bmc_data <= 1'b0;
			bmc_en <= 1'b0;
			
			flush_r <= 1'b0;
			
			busy_r <= 1'b0;
			
			sop_hrst <= 1'b0;
			
			crc_en <= 1'b0;
			crc_nrst <= 1'b0;
			crc_data <= 8'd0;
			
			enc4b5b_sel <= 1'b0;
			enc4b5b_data <= 4'd0;
			enc4b5b_dout_r <= 5'd0;
			
			crc_out_r <= 32'hFFFF_FFFF;
			
			// soft-reset
			ctrl_msg_r <= 16'd0;
			// msg_id <= 3'd0;
			
			send_idx <= 3'd0;
			send_word_r[0] <= 32'd0;
			send_word_r[1] <= 32'd0;
			send_word_r[2] <= 32'd0;
			send_word_r[3] <= 32'd0;
			send_word_r[4] <= 32'd0;
			send_word_r[5] <= 32'd0;
			send_word_r[6] <= 32'd0;
			
		end else begin
			case(phy_fsm)
				
				fsm_idle: begin
					
					if(start)begin
						phy_fsm <= fsm_preamble;
						// ctrl_msg_r <= {1'b0,send_num,msg_id,1'b1, 2'b10,2'b10,send_type};
						ctrl_msg_r <= {send_3p1hdr, send_num, send_id, 1'b0, 2'b10, 1'b0, send_type};
						send_word_r[0] <= send_word0;
						send_word_r[1] <= send_word1;
						send_word_r[2] <= send_word2;
						send_word_r[3] <= send_word3;
						send_word_r[4] <= send_word4;
						send_word_r[5] <= send_word5;
						send_word_r[6] <= send_word6;
						busy_r <= 1'b1;
						sop_hrst <= hdr_sop_hrst;
					end else begin
						phy_fsm <= fsm_idle;
						busy_r <= 1'b0;
					end
					
					crc_nrst <= 1'b0;
					cnt <= 8'd0;
					bmc_en <= 1'b0;
					crc_en <= 1'b0;
					bmc_data <= 1'b1;
					flush_r <= 1'b0;
					send_idx <= 3'd0;
				end
				
				fsm_preamble: begin
					
					enc4b5b_sel <= 1'b1;
					crc_nrst <= 1'b1;
					
					if(!sop_hrst)begin
						enc4b5b_data <= 4'd0;
					end else begin
						enc4b5b_data <= 4'd2;
					end
					
					bmc_en <= 1'b1;
					
					if(bmc_rdy)begin
						bmc_data <= ~bmc_data;
						cnt <= cnt + 8'd1;
					end
					
					if(cnt == 8'd62 & bmc_rdy)begin
						phy_fsm <= fsm_hdr0;
						enc4b5b_dout_r <= {enc4b5b_dout[0], enc4b5b_dout[1 +: 4]};
						bmc_data <= enc4b5b_dout[0];
						cnt <= 8'd0;
					end
				end
				
				fsm_hdr0: begin
					
					enc4b5b_sel <= 1'b1;
					
					if(!sop_hrst)begin
						enc4b5b_data <= 4'd1;
					end else begin
						enc4b5b_data <= 4'd3;
					end
					
					if(bmc_rdy)begin
						bmc_data <= enc4b5b_dout_r[0];
						cnt <= cnt + 8'd1;
						enc4b5b_dout_r <= {enc4b5b_dout_r[0], enc4b5b_dout_r[1 +: 4]};
					end
					
					if(cnt == 8'd14 & bmc_rdy)begin
						phy_fsm <= fsm_hdr1;
						enc4b5b_dout_r <= {enc4b5b_dout[0], enc4b5b_dout[1 +: 4]};
						bmc_data <= enc4b5b_dout[0];
						cnt <= 8'd0;
					end
				end
				
				fsm_hdr1: begin
					
					enc4b5b_sel <= 1'b0;
					enc4b5b_data <= ctrl_msg_r[0 +: 4];
					
					if(bmc_rdy)begin
						bmc_data <= enc4b5b_dout_r[0];
						cnt <= cnt + 8'd1;
						enc4b5b_dout_r <= {enc4b5b_dout_r[0], enc4b5b_dout_r[1 +: 4]};
					end
					
					if(cnt == 8'd4 & bmc_rdy)begin
						if(sop_hrst)begin
							phy_fsm <= fsm_done;
						end else begin
							phy_fsm <= fsm_ctrl_msg;
						end
						cnt <= 8'd0;
						ctrl_msg_r <= {ctrl_msg_r[0 +: 4], ctrl_msg_r[4 +: 12]};
						enc4b5b_dout_r <= {enc4b5b_dout[0], enc4b5b_dout[1 +: 4]};
						bmc_data <= enc4b5b_dout[0];
					end
					
					if(cnt == 8'd4 & bmc_rdy & !sop_hrst)begin
						crc_en <= 1'b1;
						crc_data <= ctrl_msg_r[0 +: 8];
					end else begin
						crc_en <= 1'b0;
					end
				end
				
				fsm_ctrl_msg: begin
					
					enc4b5b_sel <= 1'b0;
					
					if(cnt <= 8'd14)begin
						enc4b5b_data <= ctrl_msg_r[0 +: 4];
					end else if(ctrl_msg_r[14 : 12] != 3'd0)begin
						enc4b5b_data <= send_word_r[send_idx][0 +: 4];
					end else begin
						enc4b5b_data <= crc_out[0 +: 4];
					end
					
					if(bmc_rdy)begin
						bmc_data <= enc4b5b_dout_r[0];
						cnt <= cnt + 8'd1;
						enc4b5b_dout_r <= {enc4b5b_dout_r[0], enc4b5b_dout_r[1 +: 4]};
					end
					
					if( (cnt == 8'd4 || cnt == 8'd9 || cnt == 8'd14) & bmc_rdy)begin
						ctrl_msg_r <= {ctrl_msg_r[0 +: 4], ctrl_msg_r[4 +: 12]};
						enc4b5b_dout_r <= {enc4b5b_dout[0], enc4b5b_dout[1 +: 4]};
						bmc_data <= enc4b5b_dout[0];
					end else if(cnt == 8'd19 & bmc_rdy)begin
						enc4b5b_dout_r <= {enc4b5b_dout[0], enc4b5b_dout[1 +: 4]};
						bmc_data <= enc4b5b_dout[0];
					end
					
					if(cnt == 8'd19 & bmc_rdy)begin
						if(ctrl_msg_r[14 : 12] != 3'd0)begin
							phy_fsm <= fsm_data;
							send_word_r[send_idx] <= {send_word_r[send_idx][0 +: 4], send_word_r[send_idx][4 +: 28]};
						end else begin
							phy_fsm <= fsm_crc32;
							crc_out_r <= {crc_out[0 +: 4], crc_out[4 +: 28]};
						end
						
						cnt <= 8'd0;
					end
					
					if(cnt == 8'd9 & bmc_rdy)begin
						crc_en <= 1'b1;
						crc_data <= ctrl_msg_r[0 +: 8];
					end else if(cnt == 8'd19 & ctrl_msg_r[14 : 12] != 3'd0 & bmc_rdy)begin
						crc_en <= 1'b1;
						crc_data <= send_word_r[send_idx][0 +: 8];
					end else begin
						crc_en <= 1'b0;
					end
				end
				
				fsm_data: begin
					
					enc4b5b_sel <= 1'b0;
					
					if(cnt <= 8'd34 & send_idx < send_num)begin
						enc4b5b_data <= send_word_r[send_idx][0 +: 4];
					end else if(cnt <= 8'd39 & (send_idx + 3'd1) < send_num)begin
						enc4b5b_data <= send_word_r[send_idx + 3'd1][0 +: 4];
					end else begin
						enc4b5b_data <= crc_out[0 +: 4];
					end
					
					if(bmc_rdy)begin
						bmc_data <= enc4b5b_dout_r[0];
						cnt <= cnt + 8'd1;
						enc4b5b_dout_r <= {enc4b5b_dout_r[0], enc4b5b_dout_r[1 +: 4]};
					end
					
					if( (cnt == 8'd4 || cnt == 8'd9 || 
						cnt == 8'd14 || cnt == 8'd19 || 
						cnt == 8'd24 || cnt == 8'd29 || 
						cnt == 8'd34
						) & bmc_rdy
					)begin
						send_word_r[send_idx] <= {send_word_r[send_idx][0 +: 4], send_word_r[send_idx][4 +: 28]};
						enc4b5b_dout_r <= {enc4b5b_dout[0], enc4b5b_dout[1 +: 4]};
						bmc_data <= enc4b5b_dout[0];
					end else if(cnt == 8'd39 & bmc_rdy)begin
						enc4b5b_dout_r <= {enc4b5b_dout[0], enc4b5b_dout[1 +: 4]};
						bmc_data <= enc4b5b_dout[0];
					end
					
					if(cnt == 8'd39 & bmc_rdy)begin
						send_idx <= send_idx + 3'd1;
						send_word_r[send_idx + 3'd1] <= {
							send_word_r[send_idx + 3'd1][0 +: 4], send_word_r[send_idx + 3'd1][4 +: 28]
						};
						cnt <= 8'd0;
						
						if((send_idx + 3'd1) == send_num)begin
							phy_fsm <= fsm_crc32;
							crc_out_r <= {crc_out[0 +: 4], crc_out[4 +: 28]};
						end
					end
					
					if( (cnt == 8'd9 || cnt == 8'd19 || cnt == 8'd29) & bmc_rdy)begin
						crc_en <= 1'b1;
						crc_data <= send_word_r[send_idx][0 +: 8];
					end else if(cnt == 8'd39 & bmc_rdy)begin
						crc_en <= 1'b1;
						crc_data <= send_word_r[send_idx + 3'd1][0 +: 8];
					end else begin
						crc_en <= 1'b0;
					end
				end
				
				fsm_crc32: begin
					
					if(cnt <= 8'd34)begin
						enc4b5b_sel <= 1'b0;
						enc4b5b_data <= crc_out_r[0 +: 4];
					end else begin
						enc4b5b_sel <= 1'b1;
						enc4b5b_data <= 4'd4;
					end
					
					if(bmc_rdy)begin
						bmc_data <= enc4b5b_dout_r[0];
						cnt <= cnt + 8'd1;
						enc4b5b_dout_r <= {enc4b5b_dout_r[0], enc4b5b_dout_r[1 +: 4]};
					end
					
					if(
						(cnt == 8'd4 || cnt == 8'd9 || cnt == 8'd14 || cnt == 8'd19 || 
						cnt == 8'd24 || cnt == 8'd29 || cnt == 8'd34) & 
						bmc_rdy & bmc_rdy
					)begin
						crc_out_r <= {crc_out_r[0 +: 4], crc_out_r[4 +: 28]};
						enc4b5b_dout_r <= {enc4b5b_dout[0], enc4b5b_dout[1 +: 4]};
						bmc_data <= enc4b5b_dout[0];
					end else if(cnt == 8'd39 & bmc_rdy)begin
						phy_fsm <= fsm_eop;
						cnt <= 8'd0;
						enc4b5b_dout_r <= {enc4b5b_dout[0], enc4b5b_dout[1 +: 4]};
						bmc_data <= enc4b5b_dout[0];
					end
				end
				
				fsm_eop: begin
					
					enc4b5b_sel <= 1'b1;
					enc4b5b_data <= 4'd4;
					
					if(bmc_rdy)begin
						bmc_data <= enc4b5b_dout_r[0];
						cnt <= cnt + 8'd1;
						enc4b5b_dout_r <= {enc4b5b_dout_r[0], enc4b5b_dout_r[1 +: 4]};
					end
					
					if(cnt == 8'd4 & bmc_rdy)begin
						phy_fsm <= fsm_done;
						bmc_data <= 1'b0;
						enc4b5b_dout_r <= {enc4b5b_dout[0], enc4b5b_dout[1 +: 4]};
						bmc_data <= enc4b5b_dout[0];
						cnt <= 8'd0;
					end
				end
				
				fsm_done: begin
					
					bmc_data <= 1'b0;
					
					if(bmc_rdy)begin
						cnt <= cnt + 8'd1;
					end
					
					if(cnt == 8'd2 & bmc_rdy)begin
						flush_r <= 1'b1;
					end
					
					if(cnt == 8'd3 & bmc_rdy)begin
						cnt <= 8'd0;
						flush_r <= 1'b0;
						bmc_en <= 1'b0;
						phy_fsm <= fsm_idle;
					end
				end
				
			endcase
		end
	end
	
	crc32 crc32_u0(
		.nrst	(crc_nrst),
		.clock	(clock),
		
		.enable	(crc_en),
		.din	(crc_data),
		
		.crc_o	(crc_out)
	);
	
	enc_4b5b enc_enc4b5b_u0(
		.din		(enc4b5b_data),
		.ext_sel	(enc4b5b_sel),
		.dout		(enc4b5b_dout)
	);
	
	bmc_encoder#(
		.system_khz(system_khz)
	)bmc_encoder_u0(
		.nrst	(nrst),
		.clock	(clock),
		.enable	(bmc_en),
		.flush	(flush_r),
		.data	(bmc_data),
		.rdy	(bmc_rdy),
		.bmc_q	(bmc_dout)
	);
	
endmodule
