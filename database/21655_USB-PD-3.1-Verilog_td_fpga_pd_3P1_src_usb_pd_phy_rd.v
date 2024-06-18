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

module usb_pd_phy_rd#(
	parameter system_khz = 200000
)(
	
	input				nrst,
	input				clock,
	input				enable,
	input				bmc_din,
	
	// 0 sink=user 1 source=delivery
	output				rd_role,
	output	[2 : 0]		msg_id,
	output	[2 : 0]		msg_num,
	output	[4 : 0]		msg_type,
	output				msg_pd3p1,
	
	output	[31 : 0]	msg_word0,
	output	[31 : 0]	msg_word1,
	output	[31 : 0]	msg_word2,
	output	[31 : 0]	msg_word3,
	output	[31 : 0]	msg_word4,
	output	[31 : 0]	msg_word5,
	output	[31 : 0]	msg_word6,
	
	output				crc_valid,
	output				pkg_valid,
	output				busy
);
	
	localparam	fsm_idle		= 0,
				fsm_preamble	= fsm_idle + 1,
				fsm_sop			= fsm_preamble + 1,
				fsm_ctrl_msg	= fsm_sop + 1,
				fsm_type_brn	= fsm_ctrl_msg + 1,
				fsm_msg_data	= fsm_type_brn + 1,
				fsm_crc32		= fsm_msg_data + 1,
				fsm_eop			= fsm_crc32 + 1,
				fsm_done		= fsm_eop + 1;
	// =================================
	
	reg		[31 : 0]	pd_msg		[0 : 6];
	
	reg		[3 : 0]		phy_fsm;
	reg		[7 : 0]		cnt;
	
	reg					bmc_en;
	wire				bmc_rdy;
	wire				bmc_bout;
	
	wire				packet_start;
	
	// =======================================
	wire				dec4b5b_kcode;
	reg					dec4b5b_kcode_r;
	
	wire	[3 : 0]		dec4b5b_dout;
	reg		[3 : 0]		dec4b5b_dout_r;
	reg		[4 : 0]		dec4b5b_data;
	// =======================================
	
	reg		[15 : 0]	ctrl_msg_r;
	
	reg					crc_nrst;
	reg					crc_en;
	reg		[7 : 0]		crc_data;
	
	wire	[31 : 0]	crc_out;
	reg		[31 : 0]	crc_out_r;
	
	reg					preamble_bit;
	
	reg					package_valid;
	reg					crc_good;
	
	// =======================================
	reg					rd_role_r;
	reg		[2 : 0]		msg_id_r;
	reg		[4 : 0]		msg_type_r;
	
	reg					pd3p1_hdr;
	reg		[2 : 0]		word_num;
	reg		[2 : 0]		word_idx;
	
	assign rd_role = rd_role_r;
	assign msg_id = msg_id_r;
	assign msg_type = msg_type_r;
	assign msg_num = word_num;
	assign msg_pd3p1 = pd3p1_hdr;
	
	assign msg_word0 = pd_msg[0];
	assign msg_word1 = pd_msg[1];
	assign msg_word2 = pd_msg[2];
	assign msg_word3 = pd_msg[3];
	assign msg_word4 = pd_msg[4];
	assign msg_word5 = pd_msg[5];
	assign msg_word6 = pd_msg[6];
	
	assign crc_valid = crc_good;
	assign pkg_valid = package_valid;
	assign busy = packet_start;
	
	always@(posedge clock)begin
		if(!nrst)begin
			
			phy_fsm <= fsm_idle;
			
			ctrl_msg_r <= 16'd0;
			
			cnt <= 8'd0;
			bmc_en <= 1'b0;
			
			crc_nrst <= 1'b0;
			crc_en <= 1'b0;
			crc_data <= 8'd0;
			
			dec4b5b_kcode_r <= 1'b0;
			dec4b5b_dout_r <= 4'd0;
			dec4b5b_data <= 5'd0;
			
			crc_out_r <= 32'hFFFF_FFFF;
			
			preamble_bit <= 1'b0;
			package_valid <= 1'b0;
			crc_good <= 1'b0;
			
			rd_role_r <= 1'b0;
			msg_id_r <= 3'd0;
			msg_type_r <= 5'd0;
			
			pd3p1_hdr <= 1'b0;
			word_num <= 3'd0;
			word_idx <= 3'd0;
			
			pd_msg[0] <= 32'd0;
			pd_msg[1] <= 32'd0;
			pd_msg[2] <= 32'd0;
			pd_msg[3] <= 32'd0;
			pd_msg[4] <= 32'd0;
			pd_msg[5] <= 32'd0;
			pd_msg[6] <= 32'd0;
			
		end else begin
			case(phy_fsm)
				fsm_idle: begin
					
					if(enable & packet_start)begin
						phy_fsm <= fsm_preamble;
					end
					
					bmc_en <= enable;
					crc_en <= 1'b0;
					cnt <= 8'd0;
					
					dec4b5b_kcode_r <= 1'b0;
					dec4b5b_dout_r <= 4'd0;
					dec4b5b_data <= 5'd0;
					crc_nrst <= 1'b0;
					package_valid <= 1'b0;
					crc_good <= 1'b0;
					
					word_idx <= 3'd0;
					preamble_bit <= 1'b0;
				end
				
				fsm_preamble: begin
					
					crc_nrst <= 1'b1;
					
					if(bmc_rdy)begin
						if(!(preamble_bit ^ bmc_bout))begin
							cnt <= cnt + 8'd1;
							preamble_bit <= ~preamble_bit;
						end else begin
							phy_fsm <= fsm_idle;
						end
					end
					
					if(cnt == 8'd64)begin
						phy_fsm <= fsm_sop;
						cnt <= 8'd0;
					end
					
					if(!packet_start)begin
						phy_fsm <= fsm_idle;
					end
				end
				
				fsm_sop: begin
					
					preamble_bit <= 1'b0;
					
					if(bmc_rdy)begin
						dec4b5b_data <= {bmc_bout, dec4b5b_data[1 +: 4]};
						cnt <= cnt + 8'd1;
					end
					
					if(bmc_rdy & (cnt == 8'd5 || cnt == 8'd10 || cnt == 8'd15) )begin
						if(!dec4b5b_kcode & dec4b5b_dout != 4'b0000)begin
							phy_fsm <= fsm_idle;
						end
					end else if(cnt == 8'd20)begin
						if(!dec4b5b_kcode & dec4b5b_dout != 4'b0001)begin
							phy_fsm <= fsm_idle;
						end else begin
							cnt <= 8'd0;
							phy_fsm <= fsm_ctrl_msg;
						end
					end
					
					if(!packet_start)begin
						phy_fsm <= fsm_idle;
					end
				end
				
				fsm_ctrl_msg: begin
					if(bmc_rdy)begin
						dec4b5b_data <= {bmc_bout, dec4b5b_data[1 +: 4]};
						cnt <= cnt + 8'd1;
					end
					
					if(bmc_rdy & (cnt == 8'd5 || cnt == 8'd10 || cnt == 8'd15) || cnt == 8'd20)begin
						crc_data <= {dec4b5b_dout, crc_data[4 +: 4]};
					end
					
					if( (bmc_rdy & cnt == 8'd10) || cnt == 8'd20)begin
						ctrl_msg_r <= {dec4b5b_dout, crc_data[4 +: 4], ctrl_msg_r[8+:8]};
						crc_en <= 1'b1;
					end else begin
						crc_en <= 1'b0;
					end
					
					if(cnt == 8'd20)begin
						cnt <= 8'd0;
						phy_fsm <= fsm_type_brn;
					end
					
					if(!packet_start)begin
						phy_fsm <= fsm_idle;
					end
				end
				
				fsm_type_brn: begin
					crc_en <= 1'b0;
					
					rd_role_r <= ctrl_msg_r[8];
					msg_id_r <= ctrl_msg_r[11 : 9];
					msg_type_r <= ctrl_msg_r[4 : 0];
					word_num <= ctrl_msg_r[14 : 12];
					pd3p1_hdr <= ctrl_msg_r[15];
					
					if(ctrl_msg_r[14 : 12] == 3'd0)begin
						phy_fsm <= fsm_crc32;
					end else begin
						phy_fsm <= fsm_msg_data;
					end
				end
				
				fsm_msg_data: begin
					
					if(bmc_rdy)begin
						dec4b5b_data <= {bmc_bout, dec4b5b_data[1 +: 4]};
						cnt <= cnt + 8'd1;
					end
					
					if(bmc_rdy & 
						(cnt == 8'd5 || cnt == 8'd10 || cnt == 8'd15 || cnt == 8'd20 ||
						cnt == 8'd25 || cnt == 8'd30 || cnt == 8'd35) || 
						cnt == 8'd40
					)begin
						crc_data <= {dec4b5b_dout, crc_data[4 +: 4]};
					end
					
					if( bmc_rdy & (cnt == 8'd10 || cnt == 8'd20 || cnt == 8'd30) || cnt == 8'd40)begin
						pd_msg[word_idx] <= {dec4b5b_dout, crc_data[4 +: 4], pd_msg[word_idx][8+:24]};
						crc_en <= 1'b1;
					end else begin
						crc_en <= 1'b0;
					end
					
					if(cnt == 8'd40)begin
						cnt <= 8'd0;
						word_idx <= word_idx + 3'd1;
					end
					
					if(word_idx >= word_num)begin
						phy_fsm <= fsm_crc32;
					end
					
					if(!packet_start)begin
						phy_fsm <= fsm_idle;
					end
				end
				
				fsm_crc32: begin
					
					if(bmc_rdy)begin
						dec4b5b_data <= {bmc_bout, dec4b5b_data[1 +: 4]};
						cnt <= cnt + 8'd1;
					end
					
					if(bmc_rdy & 
						(cnt == 8'd5 || cnt == 8'd10 || cnt == 8'd15 || cnt == 8'd20 ||
						cnt == 8'd25 || cnt == 8'd30 || cnt == 8'd35) || 
						cnt == 8'd40
					)begin
						crc_out_r <= {dec4b5b_dout, crc_out_r[4 +: 28]};
					end
					
					if(cnt == 8'd40)begin
						cnt <= 8'd0;
						phy_fsm <= fsm_eop;
					end
					
					if(!packet_start)begin
						phy_fsm <= fsm_idle;
					end
				end
				
				fsm_eop: begin
					if(crc_out_r == crc_out)begin
						crc_good <= 1'b1;
					end
					
					if(bmc_rdy)begin
						dec4b5b_data <= {bmc_bout, dec4b5b_data[1 +: 4]};
						cnt <= cnt + 8'd1;
					end
					
					if(cnt == 8'd5)begin
						if(!dec4b5b_kcode & dec4b5b_dout != 4'd4)begin
							phy_fsm <= fsm_idle;
						end else begin
							cnt <= 8'd0;
							package_valid <= 1'b1;
							phy_fsm <= fsm_done;
						end
					end
					
					if(!packet_start)begin
						phy_fsm <= fsm_idle;
					end
				end
				
				fsm_done: begin
					crc_nrst <= 1'b0;
					phy_fsm <= fsm_idle;
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
	
	dec_4b5b dec_4b5b_u0(
		.din		(dec4b5b_data),
		.kcode		(dec4b5b_kcode),
		.dout		(dec4b5b_dout)
	);
	
	bmc_decoder#(
		.system_khz(system_khz)
	)bmc_decoder_u0(
		.nrst	(nrst),
		.clock	(clock),
		.enable	(bmc_en),
		
		.bmc_in	(bmc_din),
		.rdy	(bmc_rdy),
		.ps		(packet_start),
		.bmc_q	(bmc_bout)
	);
	
endmodule
