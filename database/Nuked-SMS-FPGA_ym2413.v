/*
 * Copyright (C) 2023 nukeykt
 *
 * This file is part of Nuked-SMS.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 *  Yamaha YM2413 emulator
 *  Thanks:
 *      John McMaster (siliconpr0n.org):
 *          VRC7 decap & die shot.
 *      Travis Goodspeed:
 *          YM2413 decap & die shot.
 *      org, andkorzh, HardWareMan (emu-russia):
 *          help & support.
 */

module ym2413
	(
	input MCLK,
	input XIN,
	input [7:0] DATA_i,
	input CS,
	input WE,
	input IC,
	input A0,
	output [1:0] DATA_o,
	output DATA_d,
	output [9:0] RO,
	output [9:0] MO
	);
	
	wire reset = ~IC;
	wire clk = ~XIN;
	
	wire mclk1 = clk;
	wire mclk2 = ~clk;
	wire ic_latch;
	wire [1:0] prescaler_cnt;
	wire prescaler_reset;
	wire prescaler_cnt0_cout;
	wire clk1_latch_1, clk1_latch;
	wire clk2_latch_1, clk2_latch;
	wire dac_clk;
	wire clk1;
	wire clk2;
	wire write;
	wire dbg_read;
	wire write0_sel;
	wire write1_sel;
	wire write0_rs;
	wire write1_rs;
	reg write0_rs_l1;
	reg write1_rs_l1;
	wire write0_rs_l2;
	wire write1_rs_l2;
	reg write0_rs_l3;
	reg write1_rs_l3;
	wire write0_rs_l4;
	wire write1_rs_l4;
	wire write0;
	wire write1;
	wire [7:0] data_reg;
	wire [2:0] fsm_cnt1;
	wire [1:0] fsm_cnt2;
	wire ic_latch2;
	wire fsm_reset;
	wire [1:0] fsm_cnt1_c;
	wire fsm_cnt2_c;
	wire fsm_reset1;
	wire fsm_reset2;
	wire fsm_cnt1_of;
	wire [4:0] fsm_cnt;
	wire fsm_cnt_l1;
	wire fsm_cnt_l2_1, fsm_cnt_l2;
	wire fsm_cnt_l3_1, fsm_cnt_l3;
	wire [13:0] fsm_out;
	wire rclk;
	wire rclk_latch;
	wire rclk1;
	wire rclk2;
	wire [9:0] reg_addr_decoder;
	wire [9:0] reg_addr_write;
	wire [7:0] regs_0_v;
	wire [7:0] regs_1_v;
	wire [7:0] regs_2_v;
	wire [1:0] regs_3h_v;
	wire [4:0] regs_3l_v;
	wire [7:0] regs_4_v;
	wire [7:0] regs_5_v;
	wire [7:0] regs_6_v;
	wire [7:0] regs_7_v;
	wire [5:0] regs_e_v;
	wire [3:0] regs_f_v;
	reg [4:0] multi;
	reg ksr;
	reg egtype;
	reg vibrato;
	reg tremolo;
	reg [5:0] tl;
	reg [1:0] ksl;
	reg [2:0] feedback;
	reg wf_mod;
	reg wf_car;
	reg [3:0] attack_rate;
	reg [3:0] decay_rate;
	reg [3:0] release_rate;
	reg [3:0] sustain_level;
	wire rhythm;
	wire bass_drum;
	wire snare_drum;
	wire tom_tom;
	wire top_cymbal;
	wire high_hat;
	wire test0;
	wire test1;
	wire test2;
	wire test3;
	wire rhy_sel0;
	wire rhy_bd0;
	wire rhy_hh;
	wire rhy_tom;
	wire rhy_bd1;
	wire rhy_sd;
	wire rhy_tc;
	wire is_rhy_op;
	wire [3:0] instr;
	wire key_on;
	wire inst_hh_tom_l;
	wire inst_kon_l;
	wire inst_mc_l;
	wire inst_cust_l;
	wire force_zerorate;
	wire mod_sel_custom;
	wire car_sel_custom;
	wire sel_rom1;
	wire sel_rom2;
	wire key_on_comb;
	wire ch_addr_valid;
	wire ch_addr_valid_l;
	wire [5:0] ch_reg_addr;
	wire [7:0] ch_reg_data;
	wire ch_data_valid;
	wire ch_data_enable_l;
	wire ch_data_enable;
	wire ch_data_enable2;
	wire [4:0] ch_idx;
	wire [3:0] ch_idx_c;
	wire ch_write10;
	wire ch_write20;
	wire ch_write30;
	wire [7:0] reg_10_0, reg_10_1, reg_10_2, reg_10_3, reg_10;
	wire [5:0] reg_20_0, reg_20_1, reg_20_2, reg_20_3, reg_20;
	wire [7:0] reg_30_0, reg_30_1, reg_30_2, reg_30_3, reg_30;
	wire [8:0] fnum;
	wire [2:0] blk;
	wire sus_on;
	wire [3:0] ch_vol, ch_volr;
	wire [8:0] fnum_l;
	wire [2:0] blk_l;
	wire [11:0] vib_c_out;
	wire [2:0] vib_cnt;
	wire vib_sh0;
	wire vib_sh1;
	wire vib_sgn;
	wire [9:0] vib_add;
	wire [10:0] vib_sum;
	wire [10:0] fnum_vib;
	wire vibrato_l;
	wire [13:0] fnum_sh0;
	wire [16:0] fnum_blk;
	wire [3:0] multi_l;
	wire [9:0] multi_ctrl;
	wire [12:0] multi_sel;
	wire [16:0] fnum_m1;
	wire [18:0] fnum_m2;
	wire [18:0] fnum_multi;
	wire [18:0] freq;
	wire [18:0] phase_mem;
	wire [18:0] phase_l;
	wire phase_reset2;
	wire phase_reset;
	wire phase_reset_l;
	wire modcar_sel_rhy;
	reg rh_hh_bit2;
	reg rh_hh_bit3;
	reg rh_hh_bit7;
	reg rh_hh_bit8;
	reg rh_tc_bit3;
	reg rh_tc_bit5;
	wire rh_sel_hh_l;
	wire rh_sel_tc_l;
	wire rh_sel_hh;
	wire rh_sel_tc;
	wire rh_sel_sd;
	wire [9:0] pg_out;
	wire rm_noise;
	wire rm_bit;
	wire rm_hh_val;
	wire [22:0] noise_lfsr;
	wire [9:0] pg_dbg;
	wire trem_sync_l;
	wire trem_clk;
	wire trem_dir;
	wire trem_car;
	wire [8:0] trem_val;
	wire trem_of;
	wire [1:0] trem_sum;
	wire [3:0] trem_out;
	wire trem_load_l;
	reg [6:0] ksl_table;
	wire [3:0] ksl_block_add;
	wire [5:0] ksl_block;
	wire [5:0] ksl_block_l;
	wire [6:0] ksl_shift;
	wire [7:0] ksl_tl;
	wire [7:0] ksl_tl_l;
	wire tremolo_l;
	wire [7:0] ksl_tl_trem;
	wire ksl_tl_trem_of;
	wire [17:0] eg_timer_1;
	wire [16:0] eg_timer_2;
	wire [1:0] eg_timer_sum;
	wire eg_timer_sync;
	wire eg_subcnt_sel1;
	wire eg_subcnt_sel2;
	wire eg_timer_carry;
	wire eg_timer_rst0, eg_timer_rst;
	wire eg_timer_bit0, eg_timer_bit1, eg_timer_bit;
	wire eg_timer_mask;
	wire [1:0] eg_subcnt;
	wire eg_subcnt_c;
	wire eg_subcnt_sel1_l;
	wire eg_subcnt_sel2_l;
	wire eg_timer_load;
	wire eg_timer_load_l;
	wire eg_timer_load2;
	wire [17:0] eg_timer_masked_1;
	wire [16:0] eg_timer_masked_2;
	wire [3:0] eg_timer_shift;
	wire [1:0] eg_timer_low;
	wire [1:0] rate_state;
	wire rate_suson;
	wire [3:0] rate;
	wire [3:0] ksr_value;
	wire [3:0] ksr_shift;
	wire eg_rate_dp;
	wire eg_rate_rrperc;
	wire eg_suson;
	wire eg_keyon_l0;
	wire eg_release_not_quiet;
	wire [3:0] eg_rate;
	wire eg_rate_zero, eg_rate_zero_l;
	wire [3:0] eg_rate_l;
	wire [1:0] eg_ksr_low, eg_ksr_low_l;
	wire [1:0] eg_ksr_hi;
	wire [4:0] eg_rate_ksr;
	wire [3:0] eg_rate_ksr_clamp;
	wire [3:0] eg_rate_clamp;
	wire eg_rate12;
	wire eg_rate13;
	wire eg_rate14;
	wire eg_rate15;
	wire eg_rate_less12;
	wire [3:0] eg_shift;
	wire [3:0] eg_rate_shift;
	wire eg_inclow;
	wire eg_rate_less12_l;
	wire eg_stephi;
	wire eg_stephi_l;
	wire eg_rate12_l;
	wire eg_rate13_l;
	wire eg_rate14_l;
	wire eg_rate15_l;
	wire eg_inc1;
	wire eg_inc2;
	wire eg_inc3;
	wire eg_inc4;
	wire [1:0] eg_state_mem, eg_state_mem2;
	wire [1:0] eg_state_next;
	wire eg_is_release;
	wire eg_start_attack;
	wire [1:0] rate_sel;
	wire eg_state_start;
	wire eg_state_start1;
	wire eg_state_keyon;
	wire eg_state_quiet;
	wire [8:0] eg_state_sel;
	wire eg_linear;
	wire eg_exp;
	wire eg_instantattack;
	wire eg_reset;
	wire [6:0] eg_level_mem, eg_level_mem1, eg_level_mem2;
	wire eg_zeroreach;
	wire eg_slreach;
	wire [3:0] sustain_l;
	wire [3:0] eg_sustain;
	wire [6:0] eg_add;
	wire [6:0] eg_add_exp1;
	wire [6:0] eg_add_exp2;
	wire [6:0] eg_add_exp3;
	wire [6:0] eg_add_exp4;
	wire [6:0] eg_level_next;
	wire eg_quiet;
	wire eg_silent;
	wire [7:0] eg_ksl_tl_trem;
	wire [6:0] eg_level_l;
	wire [7:0] eg_level_att;
	wire [6:0] eg_level_clamp;
	wire [6:0] eg_out;
	wire [6:0] eg_dbg;
	wire [9:0] op_phase_sum;
	wire [9:0] op_phase_mod;
	wire op_sign;
	wire [7:0] op_phase_quarter;
	wire [4:0] sin_lut_index;
	wire [3:0] sin_index_top_sel;
	reg [45:0] sine_lut_out;
	wire [18:0] sin_lut_mux;
	wire [18:0] sin_lut_l;
	wire sin_index_0_l;
	wire [10:0] sin_base;
	wire [7:0] sin_delta;
	wire [11:0] sin_sum;
	wire [11:0] sin_sum_l;
	wire [12:0] op_att_sum;
	wire [11:0] op_att_clamp;
	wire [3:0] op_shift;
	wire [7:0] pow_index;
	wire [4:0] pow_lut_index;
	reg [47:0] pow_lut_out;
	wire pow_index_top_sel[3:0];
	wire [12:0] pow_lut_mux;
	wire [12:0] pow_lut_l;
	wire pow_index_0_l;
	wire [9:0] pow_base;
	wire [2:0] pow_delta;
	wire [9:0] pow_sum;
	wire [9:0] pow_sum_l;
	wire op_sign2;
	wire op_mute;
	wire wf_mod_l;
	wire wf_car_l;
	wire op_wf_mod;
	wire op_wf_car;
	wire op_shift0;
	wire op_shift4;
	wire op_shift8;
	wire op_shiftc;
	wire [10:0] pow_shift1;
	wire [10:0] pow_shift2;
	wire [11:0] op_value;
	wire [11:0] op_fb1_mem1, op_fb1_mem2;
	wire [11:0] op_fb2_mem1, op_fb2_mem2;
	wire [8:0] op_fm;
	wire [12:0] op_fb_sum1;
	wire [11:0] op_fb_sum;
	wire [6:0] op_fb_sel;
	wire [2:0] feedback_l;
	wire op_mod_sel;
	wire [8:0] op_out;
	wire [8:0] ch_val;
	wire [8:0] ch_val_sign;
	wire [8:0] ch_val_rhy;
	wire [8:0] ch_val_l;
	wire ch_en_m;
	wire ch_en_r;
	wire [8:0] ch_dbg;
	wire [8:0] dac_value;
	wire dac_en_m;
	wire dac_en_r;
	
	
	ymn_sr_bit #(.SR_LENGTH(2)) l_ic_latch(.MCLK(MCLK), .c1(mclk1), .c2(mclk2), .inp(reset), .val(ic_latch));
	
	assign prescaler_reset = ~(~reset | ic_latch);
	
	cnt_bit_2 prescaler_cnt0(.MCLK(MCLK), .c_in(1'h1), .reset(prescaler_reset), .c1(mclk1), .c2(mclk2), .val(prescaler_cnt[0]), .c_out(prescaler_cnt0_cout));
	cnt_bit_2 prescaler_cnt1(.MCLK(MCLK), .c_in(prescaler_cnt0_cout), .reset(prescaler_reset), .c1(mclk1), .c2(mclk2), .val(prescaler_cnt[1]));

	ymn_sr_bit l_clk1_latch_1(.MCLK(MCLK), .c1(mclk1), .c2(mclk2), .inp(prescaler_cnt == 2'h2), .val(clk1_latch_1));
	ymn_dlatch l_clk1_latch(.MCLK(MCLK), .en(mclk1), .inp(clk1_latch_1), .val(clk1_latch));
	
	ymn_sr_bit l_clk2_latch_1(.MCLK(MCLK), .c1(mclk1), .c2(mclk2), .inp(prescaler_cnt == 2'h0), .val(clk2_latch_1));
	ymn_dlatch l_clk2_latch(.MCLK(MCLK), .en(mclk1), .inp(clk2_latch_1), .val(clk2_latch));

	ymn_sr_bit l_dac_clk(.MCLK(MCLK), .c1(mclk1), .c2(mclk2), .inp(prescaler_cnt == 2'h0), .nval(dac_clk));
	
	assign clk1 = clk1_latch_1 | clk1_latch;
	assign clk2 = clk2_latch_1 | clk2_latch;
	
	assign write = ~(CS | WE | reset);
	
	assign dbg_read = ~(CS | ~WE | A0 | reset);
	
	assign write0_sel = ~(CS | WE | reset | A0);
	assign write1_sel = ~(CS | WE | reset | ~A0);
	
	ymn_rs_trig rs_write0(.MCLK(MCLK), .set(~(~write0_sel | write0_rs_l4)), .rst(write0_rs_l4), .q(write0_rs));
	ymn_rs_trig rs_write1(.MCLK(MCLK), .set(~(~write1_sel | write1_rs_l4)), .rst(write1_rs_l4), .q(write1_rs));
	
	always @(posedge MCLK)
	begin
		if (mclk2)
		begin
			write0_rs_l1 <= write0_rs;
			write1_rs_l1 <= write1_rs;
		end
		if (clk2)
		begin
			write0_rs_l3 <= write0_rs_l2;
			write1_rs_l3 <= write1_rs_l2;
		end
	end
	
	ymn_sr_bit l_write0_rs_l2(.MCLK(MCLK), .c1(mclk1), .c2(mclk2), .inp(write0_rs_l1), .val(write0_rs_l2));
	ymn_sr_bit l_write1_rs_l2(.MCLK(MCLK), .c1(mclk1), .c2(mclk2), .inp(write1_rs_l1), .val(write1_rs_l2));
	
	ymn_sr_bit l_write0_rs_l4(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(write0_rs_l3), .val(write0_rs_l4));
	ymn_sr_bit l_write1_rs_l4(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(write1_rs_l3), .val(write1_rs_l4));
	
	assign write0 = ~write0_rs_l4;
	assign write1 = write1_rs_l4;
	
	ymn_slatch #(.DATA_WIDTH(8)) l_data_reg(.MCLK(MCLK), .en(write), .inp(DATA_i), .val(data_reg));
	
	ymn_sr_bit #(.SR_LENGTH(2)) l_ic_latch2(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(reset), .val(ic_latch2));
	
	assign fsm_reset = ~(reset & ~ic_latch2);
	
	cnt_bit cnt_fsm0(.MCLK(MCLK), .c_in(1'h1), .reset(fsm_reset1), .c1(clk1), .c2(clk2), .val(fsm_cnt1[0]), .c_out(fsm_cnt1_c[0]));
	cnt_bit cnt_fsm1(.MCLK(MCLK), .c_in(fsm_cnt1_c[0]), .reset(fsm_reset1), .c1(clk1), .c2(clk2), .val(fsm_cnt1[1]), .c_out(fsm_cnt1_c[1]));
	cnt_bit cnt_fsm2(.MCLK(MCLK), .c_in(fsm_cnt1_c[1]), .reset(fsm_reset1), .c1(clk1), .c2(clk2), .val(fsm_cnt1[2]));
	
	assign fsm_cnt1_of = ~(fsm_cnt1[0] & fsm_cnt1[2]);
	
	assign fsm_reset1 = ~(fsm_reset & fsm_cnt1_of);
	assign fsm_reset2 = ~(fsm_reset & ~(fsm_cnt2[1] & ~fsm_cnt1_of));
	
	cnt_bit cnt_fsm3(.MCLK(MCLK), .c_in(~fsm_cnt1_of), .reset(fsm_reset2), .c1(clk1), .c2(clk2), .val(fsm_cnt2[0]), .c_out(fsm_cnt2_c));
	cnt_bit cnt_fsm4(.MCLK(MCLK), .c_in(fsm_cnt2_c), .reset(fsm_reset2), .c1(clk1), .c2(clk2), .val(fsm_cnt2[1]));
	
	assign fsm_cnt = { fsm_cnt2, fsm_cnt1 };
	
	ymn_sr_bit #(.SR_LENGTH(2)) l_fsm_cnt_l1(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fsm_cnt[4]), .val(fsm_cnt_l1));
	ymn_sr_bit #(.SR_LENGTH(2)) l_fsm_cnt_l2_1(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fsm_cnt[3]), .val(fsm_cnt_l2_1));
	ymn_sr_bit l_fsm_cnt_l2(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fsm_cnt_l2_1), .val(fsm_cnt_l2));
	
	ymn_sr_bit l_fsm_cnt_l3_1(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fsm_out[4]), .val(fsm_cnt_l3_1));
	ymn_sr_bit l_fsm_cnt_l3(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fsm_cnt_l3_1), .val(fsm_cnt_l3));
	
	// 0 - dac_en
	// 1 -
	// 2 - dac_load
	// 3 - modcar_sel
	// 4 - sync16
	// 5 - sync13
	// 6 - sync10
	// 7 - chan_sel1
	// 8 - chan_sel2
	// 9 - tremolo_sync
	// 10 - sync17
	// 11 - sync0
	// 12 - can_sel0
	// 13 - dac_en_r
	assign fsm_out[0] = fsm_out[3] & ~(rhythm & fsm_cnt_l1);
	assign fsm_out[1] = fsm_out[3] & ~(rhythm & fsm_cnt[4:1] == 4'h8);
	assign fsm_out[2] = ~fsm_out[3] & ~(rhythm & fsm_cnt == 5'h14) & ~(rhythm & fsm_cnt == 5'h13);
	assign fsm_out[3] = ~((fsm_cnt & 5'h5) == 5'h4 | (fsm_cnt & 5'h6) == 5'h2);
	assign fsm_out[4] = fsm_cnt == 5'h14;
	assign fsm_out[5] = fsm_cnt == 5'h11;
	assign fsm_out[6] = fsm_cnt == 5'hc;
	assign fsm_out[7] = fsm_cnt_l2_1;
	assign fsm_out[8] = ~fsm_out[7] & ~fsm_out[12];
	assign fsm_out[9] = ~fsm_cnt_l2 & ~fsm_cnt[4];
	assign fsm_out[10] = fsm_cnt_l3_1;
	assign fsm_out[11] = fsm_cnt_l3;
	assign fsm_out[12] = fsm_cnt_l1;
	assign fsm_out[13] = rhythm & (~fsm_out[3] | fsm_cnt_l1) & fsm_cnt != 5'hc & fsm_cnt != 5'h12;
	
	assign rclk = ~rhythm | fsm_out[13];
	ymn_dlatch l_rclk(.MCLK(MCLK), .en(clk1), .inp(rclk), .val(rclk_latch));
	
	assign rclk1 = rclk & clk1;
	assign rclk2 = rclk_latch & clk2;
	
	ymn_sr_bit l_modcar_sel_rhy(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fsm_out[1]), .val(modcar_sel_rhy));
	
	
	assign reg_addr_decoder[0] = data_reg == 8'h0;
	assign reg_addr_decoder[1] = data_reg == 8'h1;
	assign reg_addr_decoder[2] = data_reg == 8'h2;
	assign reg_addr_decoder[3] = data_reg == 8'h3;
	assign reg_addr_decoder[4] = data_reg == 8'h4;
	assign reg_addr_decoder[5] = data_reg == 8'h5;
	assign reg_addr_decoder[6] = data_reg == 8'h6;
	assign reg_addr_decoder[7] = data_reg == 8'h7;
	assign reg_addr_decoder[8] = data_reg == 8'he;
	assign reg_addr_decoder[9] = data_reg == 8'hf;
	
	reg_handler rh0(.MCLK(MCLK), .sel(reg_addr_decoder[0]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[0]));
	reg_handler rh1(.MCLK(MCLK), .sel(reg_addr_decoder[1]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[1]));
	reg_handler rh2(.MCLK(MCLK), .sel(reg_addr_decoder[2]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[2]));
	reg_handler rh3(.MCLK(MCLK), .sel(reg_addr_decoder[3]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[3]));
	reg_handler rh4(.MCLK(MCLK), .sel(reg_addr_decoder[4]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[4]));
	reg_handler rh5(.MCLK(MCLK), .sel(reg_addr_decoder[5]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[5]));
	reg_handler rh6(.MCLK(MCLK), .sel(reg_addr_decoder[6]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[6]));
	reg_handler rh7(.MCLK(MCLK), .sel(reg_addr_decoder[7]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[7]));
	reg_handler rh8(.MCLK(MCLK), .sel(reg_addr_decoder[8]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[8]));
	reg_handler rh9(.MCLK(MCLK), .sel(reg_addr_decoder[9]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[9]));
	
	reg_bit2 #(.DATA_WIDTH(8)) regs_0(.MCLK(MCLK), .en(reg_addr_write[0]), .inp(data_reg), .rst(reset), .val(regs_0_v));
	reg_bit2 #(.DATA_WIDTH(8)) regs_1(.MCLK(MCLK), .en(reg_addr_write[1]), .inp(data_reg), .rst(reset), .val(regs_1_v));
	reg_bit2 #(.DATA_WIDTH(8)) regs_2(.MCLK(MCLK), .en(reg_addr_write[2]), .inp(data_reg), .rst(reset), .val(regs_2_v));
	reg_bit2 #(.DATA_WIDTH(2)) regs_3h(.MCLK(MCLK), .en(reg_addr_write[3]), .inp(data_reg[7:6]), .rst(reset), .val(regs_3h_v));
	reg_bit2 #(.DATA_WIDTH(5)) regs_3l(.MCLK(MCLK), .en(reg_addr_write[3]), .inp(data_reg[4:0]), .rst(reset), .val(regs_3l_v));
	reg_bit2 #(.DATA_WIDTH(8)) regs_4(.MCLK(MCLK), .en(reg_addr_write[4]), .inp(data_reg), .rst(reset), .val(regs_4_v));
	reg_bit2 #(.DATA_WIDTH(8)) regs_5(.MCLK(MCLK), .en(reg_addr_write[5]), .inp(data_reg), .rst(reset), .val(regs_5_v));
	reg_bit2 #(.DATA_WIDTH(8)) regs_6(.MCLK(MCLK), .en(reg_addr_write[6]), .inp(data_reg), .rst(reset), .val(regs_6_v));
	reg_bit2 #(.DATA_WIDTH(8)) regs_7(.MCLK(MCLK), .en(reg_addr_write[7]), .inp(data_reg), .rst(reset), .val(regs_7_v));
	
	ymn_slatch_r2 #(.DATA_WIDTH(6)) regs_e(.MCLK(MCLK), .en(reg_addr_write[8]), .inp(data_reg[5:0]), .rst(reset), .val(regs_e_v));
	ymn_slatch_r2 #(.DATA_WIDTH(4)) regs_f(.MCLK(MCLK), .en(reg_addr_write[9]), .inp(data_reg[3:0]), .rst(reset), .val(regs_f_v));
	
	assign rhythm = regs_e_v[5];
	assign bass_drum = regs_e_v[4];
	assign snare_drum = regs_e_v[3];
	assign tom_tom = regs_e_v[2];
	assign top_cymbal = regs_e_v[1];
	assign high_hat = regs_e_v[0];
	assign test0 = regs_f_v[0];
	assign test1 = regs_f_v[1];
	assign test2 = regs_f_v[2];
	assign test3 = regs_f_v[3];
	
	ymn_sr_bit l_rhy_sel0(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fsm_out[6]), .val(rhy_sel0));
	assign rhy_bd0 = rhy_sel0 & rhythm;
	ymn_sr_bit l_rhy_sel1(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(rhy_bd0), .val(rhy_hh));
	ymn_sr_bit l_rhy_sel2(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(rhy_hh), .val(rhy_tom));
	ymn_sr_bit l_rhy_sel3(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(rhy_tom), .val(rhy_bd1));
	ymn_sr_bit l_rhy_sel4(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(rhy_bd1), .val(rhy_sd));
	ymn_sr_bit l_rhy_sel5(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(rhy_sd), .val(rhy_tc));
	
	assign is_rhy_op = rhy_bd0 | rhy_hh | rhy_tom | rhy_bd1 | rhy_sd | rhy_tc;
	
	ymn_dlatch inst_hh_tom(.MCLK(MCLK), .en(clk1), .inp(rhy_hh | rhy_tom), .val(inst_hh_tom_l));
	ymn_dlatch inst_kon(.MCLK(MCLK), .en(clk1), .inp(key_on_comb), .val(inst_kon_l));
	ymn_dlatch inst_mc(.MCLK(MCLK), .en(clk1), .inp(fsm_out[3]), .val(inst_mc_l));
	ymn_dlatch inst_cust(.MCLK(MCLK), .en(clk1), .inp(instr == 4'h0 & ~is_rhy_op), .val(inst_cust_l));
	
	assign force_zerorate = ~inst_hh_tom_l & ~inst_kon_l & inst_mc_l;
	
	assign mod_sel_custom = inst_cust_l & inst_mc_l;
	assign car_sel_custom = inst_cust_l & ~inst_mc_l;
	
	assign sel_rom1 = ~inst_cust_l;
	assign sel_rom2 = ~mod_sel_custom & ~inst_hh_tom_l & inst_mc_l;
	
	reg [62:0] instr_data;
	wire [36:0] instr_data_m;
	wire [36:0] instr_data_c;
	reg [36:0] instr_data_l;
	reg [36:0] instr_data_l2;
	
	assign instr_data_m[36:26] = instr_data[62:52];
	assign instr_data_c[36:26] = instr_data[62:52];
	
	genvar i;
	generate
		for (i = 0; i < 26; i = i + 1)
		begin : l1
			assign instr_data_m[i] = instr_data[i*2+1];
			assign instr_data_c[i] = instr_data[i*2];
		end
	endgenerate
	
	always @(posedge MCLK)
	begin
		if (~clk2)
		begin
			if (rhy_bd0)
				instr_data <= 63'b011000011110000000000000010000010100010101010100010100010001000;
			else if (rhy_hh)
				instr_data <= 63'b000000000000000000000000010000010100000100000001000100000101010;
			else if (rhy_tom)
				instr_data <= 63'b000000000000000000000100010000010101010100000000010001010000010;
			else if (rhy_bd1)
				instr_data <= 63'b000000000000000000000000001000001010101010000000001010001010001;
			else if (rhy_sd)
				instr_data <= 63'b000000000000000000000000001000001010001010000000001000001000000;
			else if (rhy_tc)
				instr_data <= 63'b000000000000000000000000001000001000100010001000001000100010001;
			else
			begin
				case (instr)
					4'h1: instr_data <= 63'b011110101110011111000000011000010110111010000000000000100010101;
					4'h2: instr_data <= 63'b011010011010001001000001011000011110111100101010000100100001111;
					4'h3: instr_data <= 63'b011001000000000001000001011100011111010000110000000011000000111;
					4'h4: instr_data <= 63'b001110001110001111000000011000010011100100100000010111000010101;
					4'h5: instr_data <= 63'b011110001100000111000001001000010111101000101000000010001000000;
					4'h6: instr_data <= 63'b010110001010000111000000110000010111101000000010000000101000000;
					4'h7: instr_data <= 63'b011101001110001110000000011000011000000000010010000001000010101;
					4'h8: instr_data <= 63'b101101101000000110000001011000010011101000011000000000000010101;
					4'h9: instr_data <= 63'b011011001100011110000000011000000111100001100010000001100010101;
					4'ha: instr_data <= 63'b001011110000011010000000011000011010101001101110010101000010111;
					4'hb: instr_data <= 63'b000011100010000001000001011100011111110100110000000001000010000;
					4'hc: instr_data <= 63'b100100001110101001000101011000011111111110000000000100100001100;
					4'hd: instr_data <= 63'b001100001010011100100000010000011110101000110010001100000000100;
					4'he: instr_data <= 63'b010101000110000000000000011001011100001100100110000000000001110;
					4'hf: instr_data <= 63'b001001000110011100000000011100011111110000100100010000100000101;
					//4'h1: instr_data <= 63'b000101001100000010000001011000011101000100000010010010000011101;
					//4'h2: instr_data <= 63'b010100011010001001000001011000011110111100101000000100100001110;
					//4'h3: instr_data <= 63'b001000010000000001100000011000011101111100011000000100100000100;
					//4'h4: instr_data <= 63'b001100001110001111000000011000010011100100100000010110000010111;
					//4'h5: instr_data <= 63'b011110001100000111000001001000010111101000101100000010001000010;
					//4'h6: instr_data <= 63'b000110000000000000000001001000011011100000011101111111100110000;
					//4'h7: instr_data <= 63'b011101001110001110000000011000011000000000010010000001000010111;
					//4'h8: instr_data <= 63'b100010101110000110000001011000010011101000011000000000100010111;
					//4'h9: instr_data <= 63'b100101000000000101100100011000000110101000001010010101000001001;
					//4'ha: instr_data <= 63'b001111011111000101000100011000011001100100100010010001000000110;
					//4'hb: instr_data <= 63'b100100001110101001000101011000011111111110000000000100100001100;
					//4'hc: instr_data <= 63'b010001001100010111000000111000000111101001100100000001110010100;
					//4'hd: instr_data <= 63'b010011001010000000000000110101011100001100100110000000000001110;
					//4'he: instr_data <= 63'b001100000000011110000000111000011010010001000000101111100011110;
					//4'hf: instr_data <= 63'b001101000000001110100000110000011110001000100110010001000111100;
					default: instr_data <= 63'b000000000000000000000000000000000000000000000000000000000000000;
				endcase
			end
			instr_data_l2 <= fsm_out[3] ? instr_data_m : instr_data_c;
		end
		if (clk1)
		begin
			instr_data_l <= instr_data_l2;
		end
	end
	
	assign key_on_comb = key_on | (rhy_bd0 & bass_drum) | (rhy_hh & high_hat) | (rhy_tom & tom_tom)
							| (rhy_bd1 & bass_drum) | (rhy_sd & snare_drum) | (rhy_tc & top_cymbal);
	
	
	assign ch_addr_valid = data_reg[7:6] == 2'h0;
	
	assign ch_data_valid = ch_addr_valid_l & write1;
	
	ymn_slatch_r l_ch_addr_valid(.MCLK(MCLK), .en(~write0), .inp(ch_addr_valid), .rst(reset), .val(ch_addr_valid_l));
	
	ymn_slatch #(.DATA_WIDTH(6)) l_ch_reg_addr(.MCLK(MCLK), .en(~write0 & ch_addr_valid), .inp(data_reg[5:0]), .val(ch_reg_addr));
	
	ymn_slatch_r2 #(.DATA_WIDTH(8)) l_ch_reg_data(.MCLK(MCLK), .en(ch_data_valid), .inp(data_reg), .rst(reset), .val(ch_reg_data));
	
	ymn_sr_bit l_ch_data_enable(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(~(ch_data_valid | ch_data_enable)), .val(ch_data_enable_l));
	
	assign ch_data_enable = ~(ch_data_enable_l | reset | ~write0);
	
	cnt_bit_2 ch_idx0(.MCLK(MCLK), .c_in(1'h1), .reset(fsm_out[10]), .c1(clk1), .c2(clk2), .val(ch_idx[0]), .c_out(ch_idx_c[0]));
	cnt_bit_2 ch_idx1(.MCLK(MCLK), .c_in(ch_idx_c[0]), .reset(fsm_out[10]), .c1(clk1), .c2(clk2), .val(ch_idx[1]), .c_out(ch_idx_c[1]));
	cnt_bit_2 ch_idx2(.MCLK(MCLK), .c_in(ch_idx_c[1]), .reset(fsm_out[10]), .c1(clk1), .c2(clk2), .val(ch_idx[2]), .c_out(ch_idx_c[2]));
	cnt_bit_2 ch_idx3(.MCLK(MCLK), .c_in(ch_idx_c[2]), .reset(fsm_out[10]), .c1(clk1), .c2(clk2), .val(ch_idx[3]), .c_out(ch_idx_c[3]));
	cnt_bit_2 ch_idx4(.MCLK(MCLK), .c_in(ch_idx_c[3]), .reset(fsm_out[10]), .c1(clk1), .c2(clk2), .val(ch_idx[4]));
	
	assign ch_data_enable2 = ch_data_enable & (~ch_idx == { 1'h0, ch_reg_addr[3:0] });
	
	assign ch_write10 = (ch_data_enable2 & ch_reg_addr[5:4] == 2'h1) | reset;
	assign ch_write20 = (ch_data_enable2 & ch_reg_addr[5:4] == 2'h2) | reset;
	assign ch_write30 = (ch_data_enable2 & ch_reg_addr[5:4] == 2'h3) | reset;
	
	ymn_sr_bit_array #(.SR_LENGTH(2), .DATA_WIDTH(8)) l_reg_10_0(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(ch_write10 ? ch_reg_data : reg_10_3), .val(reg_10_0));
	ymn_sr_bit_array #(.SR_LENGTH(3), .DATA_WIDTH(8)) l_reg_10_1(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(reg_10_0), .val(reg_10_1));
	ymn_sr_bit_array #(.SR_LENGTH(3), .DATA_WIDTH(8)) l_reg_10_2(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(reg_10_1), .val(reg_10_2));
	ymn_sr_bit_array #(.DATA_WIDTH(8)) l_reg_10_3(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(reg_10_2), .val(reg_10_3));
	
	ymn_sr_bit_array #(.SR_LENGTH(2), .DATA_WIDTH(6)) l_reg_20_0(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(ch_write20 ? ch_reg_data[5:0] : reg_20_3), .val(reg_20_0));
	ymn_sr_bit_array #(.SR_LENGTH(3), .DATA_WIDTH(6)) l_reg_20_1(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(reg_20_0), .val(reg_20_1));
	ymn_sr_bit_array #(.SR_LENGTH(3), .DATA_WIDTH(6)) l_reg_20_2(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(reg_20_1), .val(reg_20_2));
	ymn_sr_bit_array #(.DATA_WIDTH(6)) l_reg_20_3(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(reg_20_2), .val(reg_20_3));
	
	ymn_sr_bit_array #(.SR_LENGTH(2), .DATA_WIDTH(8)) l_reg_30_0(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(ch_write30 ? ch_reg_data : reg_30_3), .val(reg_30_0));
	ymn_sr_bit_array #(.SR_LENGTH(3), .DATA_WIDTH(8)) l_reg_30_1(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(reg_30_0), .val(reg_30_1));
	ymn_sr_bit_array #(.SR_LENGTH(3), .DATA_WIDTH(8)) l_reg_30_2(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(reg_30_1), .val(reg_30_2));
	ymn_sr_bit_array #(.DATA_WIDTH(8)) l_reg_30_3(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(reg_30_2), .val(reg_30_3));
	
	assign reg_10 = (fsm_out[8] ? reg_10_0 : 8'h0) |
						 (fsm_out[7] ? reg_10_1 : 8'h0) |
						 (fsm_out[12] ? reg_10_2 : 8'h0);
	
	assign reg_20 = (fsm_out[8] ? reg_20_0 : 6'h0) |
						 (fsm_out[7] ? reg_20_1 : 6'h0) |
						 (fsm_out[12] ? reg_20_2 : 6'h0);
	
	assign reg_30 = (fsm_out[8] ? reg_30_0 : 8'h0) |
						 (fsm_out[7] ? reg_30_1 : 8'h0) |
						 (fsm_out[12] ? reg_30_2 : 8'h0);
	
	assign fnum = { reg_20[0], reg_10 };
	
	assign blk = reg_20[3:1];
	
	assign key_on = reg_20[4];
	assign sus_on = reg_20[5];
	
	assign instr = reg_30[7:4];
	
	ymn_dlatch #(.DATA_WIDTH(8)) l_ch_vol(.MCLK(MCLK), .en(clk1), .inp(reg_30[3:0]), .val(ch_vol));
	ymn_dlatch #(.DATA_WIDTH(8)) l_ch_volr(.MCLK(MCLK), .en(clk1), .inp(reg_30[7:4]), .val(ch_volr));
	
	always @(posedge MCLK)
	begin
		// mux operator parameters
		if (mod_sel_custom)
		begin
			multi <= regs_0_v[3:0];
			ksr <= regs_0_v[4];
			egtype <= regs_0_v[5];
			vibrato <= regs_0_v[6];
			tremolo <= regs_0_v[7];
			ksl <= regs_2_v[7:6];
			attack_rate <= regs_4_v[7:4];
			decay_rate <= regs_4_v[3:0];
			sustain_level <= regs_6_v[7:4];
			release_rate <= regs_6_v[3:0];
		end
		else if (car_sel_custom)
		begin
			multi <= regs_1_v[3:0];
			ksr <= regs_1_v[4];
			egtype <= regs_1_v[5];
			vibrato <= regs_1_v[6];
			tremolo <= regs_1_v[7];
			ksl <= regs_3h_v;
			attack_rate <= regs_5_v[7:4];
			decay_rate <= regs_5_v[3:0];
			sustain_level <= regs_7_v[7:4];
			release_rate <= regs_7_v[3:0];
		end
		else // if (sel_rom1)
		begin
			multi <= instr_data_l[21:18];
			ksr <= instr_data_l[22];
			egtype <= instr_data_l[23];
			vibrato <= instr_data_l[24];
			tremolo <= instr_data_l[25];
			ksl <= instr_data_l[17:16];
			attack_rate <= instr_data_l[15:12];
			decay_rate <= instr_data_l[11:8];
			sustain_level <= instr_data_l[7:4];
			release_rate <= instr_data_l[3:0];
		end
		
		if (mod_sel_custom)
			tl <= regs_2_v[5:0];
		else if (~inst_mc_l) // carrier
			tl <= { ch_vol, 2'h0 };
		else if (inst_hh_tom_l)
			tl <= { ch_volr, 2'h0 };
		else// if (sel_rom2)
			tl <= instr_data_l[36:31];
		
		if (inst_cust_l)
		begin
			feedback <= regs_3l_v[2:0];
			wf_mod <= regs_3l_v[3];
			wf_car <= regs_3l_v[4];
		end
		else
		begin
			feedback <= instr_data_l[28:26];
			wf_mod <= instr_data_l[29];
			wf_car <= instr_data_l[30];
		end
	end
	
	ymn_dlatch l_vibrato(.MCLK(MCLK), .en(clk2), .inp(vibrato), .val(vibrato_l));
	ymn_dlatch #(.DATA_WIDTH(4)) l_multi(.MCLK(MCLK), .en(clk2), .inp(multi), .val(multi_l));
	
	//
	// phase gen
	//
	
	ymn_sr_bit_array #(.DATA_WIDTH(9)) l_fnum(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fnum), .val(fnum_l));
	ymn_sr_bit_array #(.DATA_WIDTH(3)) l_blk(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(blk), .val(blk_l));
	
	// vibrato
	
	cnt_bit_2 vib_cnt0(.MCLK(MCLK), .c_in(fsm_out[10]), .reset(test1), .c1(clk1), .c2(clk2), .c_out(vib_c_out[0]));
	cnt_bit_2 vib_cnt1(.MCLK(MCLK), .c_in(vib_c_out[0]), .reset(test1), .c1(clk1), .c2(clk2), .c_out(vib_c_out[1]));
	cnt_bit_2 vib_cnt2(.MCLK(MCLK), .c_in(vib_c_out[1]), .reset(test1), .c1(clk1), .c2(clk2), .c_out(vib_c_out[2]));
	cnt_bit_2 vib_cnt3(.MCLK(MCLK), .c_in(vib_c_out[2]), .reset(test1), .c1(clk1), .c2(clk2), .c_out(vib_c_out[3]));
	cnt_bit_2 vib_cnt4(.MCLK(MCLK), .c_in(vib_c_out[3]), .reset(test1), .c1(clk1), .c2(clk2), .c_out(vib_c_out[4]));
	cnt_bit_2 vib_cnt5(.MCLK(MCLK), .c_in(vib_c_out[4]), .reset(test1), .c1(clk1), .c2(clk2), .c_out(vib_c_out[5]));
	cnt_bit_2 vib_cnt6(.MCLK(MCLK), .c_in(vib_c_out[5]), .reset(test1), .c1(clk1), .c2(clk2), .c_out(vib_c_out[6]));
	cnt_bit_2 vib_cnt7(.MCLK(MCLK), .c_in(vib_c_out[6]), .reset(test1), .c1(clk1), .c2(clk2), .c_out(vib_c_out[7]));
	cnt_bit_2 vib_cnt8(.MCLK(MCLK), .c_in(vib_c_out[7]), .reset(test1), .c1(clk1), .c2(clk2), .c_out(vib_c_out[8]));
	cnt_bit_2 vib_cnt9(.MCLK(MCLK), .c_in(vib_c_out[8]), .reset(test1), .c1(clk1), .c2(clk2), .c_out(vib_c_out[9]));
	
	cnt_bit_2 vib_cnt10(.MCLK(MCLK), .c_in(vib_c_out[9] | (test3 & fsm_out[10])), .reset(test1), .c1(clk1), .c2(clk2), .val(vib_cnt[0]), .c_out(vib_c_out[10]));
	cnt_bit_2 vib_cnt11(.MCLK(MCLK), .c_in(vib_c_out[10]), .reset(test1), .c1(clk1), .c2(clk2), .val(vib_cnt[1]), .c_out(vib_c_out[11]));
	cnt_bit_2 vib_cnt12(.MCLK(MCLK), .c_in(vib_c_out[11]), .reset(test1), .c1(clk1), .c2(clk2), .val(vib_cnt[2]));
	
	assign vib_sh0 = vibrato_l & ~vib_cnt[0];
	assign vib_sh1 = vibrato_l & vib_cnt[1:0] == 2'h1;
	assign vib_sgn = vibrato_l & ~vib_cnt[2];
	
	assign vib_add = { {7{vib_sgn}}, ((vib_sh0 ? { 1'h0, fnum_l[8:7] } : 3'h0) | (vib_sh1 ? fnum_l[8:6] : 3'h0)) ^ {3{vib_sgn}}};
	
	assign vib_sum = { 1'h0, fnum_l, 1'h0 } + { 1'h0, vib_add };
	
	assign fnum_vib[9:0] = vib_sum[9:0];
	assign fnum_vib[10] = vib_sum[10] & ~vib_sgn;
	
	// apply block
	
	assign fnum_sh0 = (blk_l[1:0] == 2'h0 ? { 3'h0, fnum_vib } : 14'h0) |
							(blk_l[1:0] == 2'h1 ? { 2'h0, fnum_vib, 1'h0 } : 14'h0) |
							(blk_l[1:0] == 2'h2 ? { 1'h0, fnum_vib, 2'h0 } : 14'h0) |
							(blk_l[1:0] == 2'h3 ? { fnum_vib, 3'h0 } : 14'h0);
	
	assign fnum_blk = blk_l[2] ? { fnum_sh0, 3'h0 } : { 4'h0, fnum_sh0[13:1] };
	
	// multi
	
	assign multi_sel[0] = multi_l == 4'h0;
	assign multi_sel[1] = multi_l == 4'h1;
	assign multi_sel[2] = multi_l == 4'h2;
	assign multi_sel[3] = multi_l == 4'h3;
	assign multi_sel[4] = multi_l == 4'h4;
	assign multi_sel[5] = multi_l == 4'h5;
	assign multi_sel[6] = multi_l == 4'h6;
	assign multi_sel[7] = multi_l == 4'h7;
	assign multi_sel[8] = multi_l == 4'h8;
	assign multi_sel[9] = multi_l == 4'h9;
	assign multi_sel[10] = multi_l[3:1] == 3'h5;
	assign multi_sel[11] = multi_l[3:1] == 3'h6;
	assign multi_sel[12] = multi_l[3:1] == 3'h7;
	
	assign multi_ctrl[0] = multi_sel[4] | multi_sel[8]; // 4, 8
	assign multi_ctrl[1] = multi_sel[11]; // 12, 13
	assign multi_ctrl[2] = multi_sel[1] | multi_sel[5] | multi_sel[9]; // 1, 5, 9
	assign multi_ctrl[3] = multi_sel[2] | multi_sel[6] | multi_sel[10]; // 2, 6, 10, 11
	assign multi_ctrl[4] = multi_sel[3] | multi_sel[7] | multi_sel[12]; // 3, 7, 14, 15
	assign multi_ctrl[5] = multi_sel[0]; // 0
	
	assign multi_ctrl[6] = multi_sel[0] | multi_sel[1] | multi_sel[2]; // 0, 1, 2
	assign multi_ctrl[7] = multi_sel[12]; // 14, 15
	assign multi_ctrl[8] = multi_sel[7] | multi_sel[8] | multi_sel[9] | multi_sel[10] | multi_sel[11];
	assign multi_ctrl[9] = multi_sel[3] | multi_sel[4] | multi_sel[5] | multi_sel[6];
	
	assign fnum_m1 = multi_ctrl[9] ? fnum_blk :
							(multi_ctrl[8] ? { fnum_blk[15:0], 1'h0 } :
								(multi_ctrl[7] ? { fnum_blk[14:0], 2'h0 } : 17'h0));
	
	assign fnum_m2 = multi_ctrl[5] ? { 3'h0, fnum_blk[16:1] } :
							(multi_ctrl[4] ? { 2'h3, ~fnum_blk } :
								(multi_ctrl[3] ? { 1'h0, fnum_blk, 1'h0 } :
									(multi_ctrl[2] ? { 2'h0, fnum_blk } :
										(multi_ctrl[1] ? { fnum_blk, 2'h0 } : 19'h0))));
	
	
	assign fnum_multi = { fnum_m1, 2'h0 } + fnum_m2 + { 18'h0, multi_ctrl[4] };
	
	ymn_sr_bit_array #(.DATA_WIDTH(19)) l_freq(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fnum_multi), .val(freq));
	ymn_sr_bit_array #(.DATA_WIDTH(19)) l_phase_l(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp((test2 | phase_reset2) ? 19'h0 : phase_mem), .val(phase_l));
	
	
	ymn_sr_bit_array #(.SR_LENGTH(17), .DATA_WIDTH(19)) l_phase_mem(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(freq + phase_l), .val(phase_mem));
	
	ymn_sr_bit #(.SR_LENGTH(15)) l_phase_reset(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(phase_reset), .val(phase_reset_l));
	
	assign phase_reset2 = modcar_sel_rhy ? phase_reset_l : phase_reset;
	
	// rhythm
	
	assign rh_sel_hh = rhythm & fsm_out[5];
	assign rh_sel_sd = rhythm & fsm_out[4];
	assign rh_sel_tc = rhythm & fsm_out[10];
	
	ymn_dlatch l_rh_sel_tc(.MCLK(MCLK), .en(clk1), .inp(rh_sel_tc), .val(rh_sel_tc_l));
	ymn_dlatch l_rh_sel_hh(.MCLK(MCLK), .en(clk1), .inp(fsm_out[5]), .val(rh_sel_hh_l));
	
	always @(posedge MCLK)
	begin
		if (fsm_out[5] & ~rh_sel_hh_l)
		begin
			rh_hh_bit2 = phase_mem[11];
			rh_hh_bit3 = phase_mem[12];
			rh_hh_bit7 = phase_mem[16];
			rh_hh_bit8 = phase_mem[17];
		end
		if (rh_sel_tc & ~rh_sel_tc_l)
		begin
			rh_tc_bit3 = phase_mem[12];
			rh_tc_bit5 = phase_mem[14];
		end
	end
	
	assign rm_bit = (rh_hh_bit2 ^ rh_hh_bit7) | (rh_tc_bit5 ^ rh_hh_bit3) | (rh_tc_bit5 ^ rh_tc_bit3);
	
	assign rm_hh_val = rm_bit ^ rm_noise;
	
	assign rm_noise = noise_lfsr[0];
	
	assign pg_out =
		(rh_sel_hh ? { rm_bit, 1'h0, rm_hh_val, rm_hh_val, ~rm_hh_val, rm_hh_val | ~rm_hh_val, 1'h0, ~rm_hh_val, 2'h0 } : 10'h0) |
		(rh_sel_sd ? { rh_hh_bit8, rh_hh_bit8 ^ rm_noise, 8'h0 } : 10'h0 ) |
		(rh_sel_tc ? { rm_bit, 9'h100 } : 10'h0) |
		(~(rh_sel_hh | rh_sel_sd | rh_sel_tc) ? phase_mem[18:9] : 10'h0);
	
	ymn_sr_bit_array #(.DATA_WIDTH(23)) l_noise_lfsr(.MCLK(MCLK), .c1(clk1), .c2(clk2),
		.inp({noise_lfsr == 23'h0 | (noise_lfsr[0] ^ noise_lfsr[14]) | test1, noise_lfsr[22:1]}), .val(noise_lfsr));
	
	ymn_sr_bit_array #(.DATA_WIDTH(9)) l_pg_dbg(.MCLK(MCLK), .c1(clk1), .c2(clk2),
		.inp({ eg_dbg[6], pg_dbg[9:1] } | (fsm_out[11] ? phase_mem[9:0] : 9'h0)), .val(pg_dbg));
	
	//
	// env gen
	//
	
	// tremolo
	
	ymn_dlatch l_trem_sync(.MCLK(MCLK), .en(clk1), .inp(fsm_out[10]), .val(trem_sync_l));
	
	ymn_dlatch l_trem_clk(.MCLK(MCLK), .en(fsm_out[10] & ~trem_sync_l), .inp(vib_c_out[5]), .val(trem_clk));
	
	cnt_bit _trem_dir(.MCLK(MCLK), .c1(clk1), .c2(clk2), .c_in(trem_clk & trem_of), .reset(reset | test1), .val(trem_dir));
	
	ymn_sr_bit l_trem_car(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(trem_sum[1]), .val(trem_car));
	
	ymn_sr_bit_array #(.DATA_WIDTH(9)) l_trem_val(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp({ (reset | test1) ? 1'h0 : trem_sum[0], trem_val[8:1] }), .val(trem_val));
	
	assign trem_of = (trem_val[6:0] == 7'h0 & fsm_out[11] & trem_dir) | ((trem_val[6:0] & 7'd105) == 7'd105 & fsm_out[11] & ~trem_dir);
	
	assign trem_sum = { 1'h0, trem_val[0] } + { 1'h0, trem_car & fsm_out[9] } + { 1'h0, (trem_clk | test3) & (trem_dir | fsm_out[11]) & fsm_out[9] };
	
	ymn_dlatch l_trem_load(.MCLK(MCLK), .en(clk1), .inp(fsm_out[11]), .val(trem_load_l));
	
	ymn_dlatch #(.DATA_WIDTH(4)) l_trem_out(.MCLK(MCLK), .en(fsm_out[11] & ~trem_load_l), .inp(trem_val[6:3]), .val(trem_out));
	
	always @(*)
	begin
		case (fnum[8:5])
			4'h0: ksl_table <= 7'd0;
			4'h1: ksl_table <= 7'd32;
			4'h2: ksl_table <= 7'd40;
			4'h3: ksl_table <= 7'd45;
			4'h4: ksl_table <= 7'd48;
			4'h5: ksl_table <= 7'd51;
			4'h6: ksl_table <= 7'd53;
			4'h7: ksl_table <= 7'd55;
			4'h8: ksl_table <= 7'd56;
			4'h9: ksl_table <= 7'd58;
			4'ha: ksl_table <= 7'd59;
			4'hb: ksl_table <= 7'd60;
			4'hc: ksl_table <= 7'd61;
			4'hd: ksl_table <= 7'd62;
			4'he: ksl_table <= 7'd63;
			4'hf: ksl_table <= 7'd64;
		endcase
	end
	
	assign ksl_block_add = { 1'h0, ksl_table[5:3] } + { 1'h0, blk };
	
	assign ksl_block = (ksl_block_add[3] | ksl_table[6]) ? { ksl_block_add[2:0], ksl_table[2:0] } : 6'h0;
	
	ymn_dlatch #(.DATA_WIDTH(6)) l_ksl_block(.MCLK(MCLK), .en(clk1), .inp(ksl_block), .val(ksl_block_l));
	
	assign ksl_shift = (ksl == 2'h1 ? { 2'h0, ksl_block_l[5:1] } : 6'h0) |
							 (ksl == 2'h2 ? { 1'h0, ksl_block_l } : 6'h0) |
							 (ksl == 2'h3 ? { ksl_block_l, 1'h0 } : 6'h0);
	
	assign ksl_tl = { 1'h0, tl, 1'h0 } + { 1'h0, ksl_shift };
	
	ymn_dlatch l_tremolo(.MCLK(MCLK), .en(clk2), .inp(tremolo), .val(tremolo_l));
	
	ymn_dlatch #(.DATA_WIDTH(8)) l_ksl_tl(.MCLK(MCLK), .en(clk2), .inp(ksl_tl), .val(ksl_tl_l));
	
	assign ksl_tl_trem = { 1'h0, ksl_tl_l[6:0] } + { 4'h0, tremolo_l ? trem_out : 4'h0 };
	
	assign ksl_tl_trem_of = ksl_tl_trem[7] | ksl_tl[7];
	
	
	// eg counter
	
	assign eg_timer_sum = { 1'h0, eg_timer_2[0] } + { 1'h0, (eg_timer_carry | eg_timer_sync) & eg_subcnt_sel1 };
	
	ymn_sr_bit l_eg_timer_sync(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fsm_out[10]), .val(eg_timer_sync));
	
	ymn_sr_bit l_eg_timer_carry(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(eg_timer_sum[1]), .val(eg_timer_carry));
	
	ymn_dlatch l_eg_timer_rst0(.MCLK(MCLK), .en(clk1), .inp(reset), .val(eg_timer_rst0));
	ymn_dlatch l_eg_timer_rst1(.MCLK(MCLK), .en(clk2), .inp(eg_timer_rst0), .val(eg_timer_rst));
	
	ymn_dlatch l_eg_timer_bit0(.MCLK(MCLK), .en(clk1), .inp(eg_timer_sum[0]), .val(eg_timer_bit0));
	ymn_dlatch l_eg_timer_bit1(.MCLK(MCLK), .en(clk2), .inp(eg_timer_bit0 & ~eg_timer_rst0), .val(eg_timer_bit1));
	
	assign eg_timer_bit = test3 ? data_reg[2] : eg_timer_bit1;
	
	ymn_sr_bit l_eg_timer_mask(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp((eg_timer_mask & ~eg_timer_bit) | eg_timer_rst | eg_timer_sync), .val(eg_timer_mask));
	
	cnt_bit_2 eg_subcnt0(.MCLK(MCLK), .c1(clk1), .c2(clk2), .c_in(fsm_out[10]), .reset(reset), .val(eg_subcnt[0]), .c_out(eg_subcnt_c));
	cnt_bit_2 eg_subcnt1(.MCLK(MCLK), .c1(clk1), .c2(clk2), .c_in(eg_subcnt_c), .reset(reset), .val(eg_subcnt[1]));
	
	assign eg_subcnt_sel1 = eg_subcnt == 2'h0;
	assign eg_subcnt_sel2 = ~eg_subcnt[0];
	
	ymn_sr_bit l_eg_subcnt_sel1(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(eg_subcnt_sel1), .val(eg_subcnt_sel1_l));
	ymn_sr_bit l_eg_subcnt_sel2(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(eg_subcnt_sel2), .val(eg_subcnt_sel2_l));
	
	assign eg_timer_load = eg_subcnt_sel2_l & eg_timer_sync;
	
	ymn_dlatch l_eg_timer_load(.MCLK(MCLK), .en(clk1), .inp(eg_timer_load), .val(eg_timer_load_l));
	
	assign eg_timer_load2 = eg_timer_load & eg_timer_load_l;
	
	ymn_dlatch #(.DATA_WIDTH(18)) l_eg_timer_1(.MCLK(MCLK), .en(clk1), .inp({ eg_timer_bit, eg_timer_2 }), .val(eg_timer_1));
	ymn_dlatch #(.DATA_WIDTH(17)) l_eg_timer_2(.MCLK(MCLK), .en(clk2), .inp(eg_timer_1[17:1]), .val(eg_timer_2));
	
	ymn_dlatch #(.DATA_WIDTH(18)) l_eg_timer_masked_1(.MCLK(MCLK), .en(clk1), .inp({ eg_timer_bit & eg_timer_mask, eg_timer_masked_2 }), .val(eg_timer_masked_1));
	ymn_dlatch #(.DATA_WIDTH(17)) l_eg_timer_masked_2(.MCLK(MCLK), .en(clk2), .inp(eg_timer_masked_1[17:1]), .val(eg_timer_masked_2));
	
	ymn_dlatch #(.DATA_WIDTH(2)) l_eg_timer_low(.MCLK(MCLK), .en(eg_timer_load2), .inp(eg_timer_1[1:0]), .val(eg_timer_low));
	ymn_dlatch #(.DATA_WIDTH(4)) l_eg_timer_shift(.MCLK(MCLK), .en(eg_timer_load2),
		.inp({ eg_timer_masked_1[7] | eg_timer_masked_1[8] | eg_timer_masked_1[9] | eg_timer_masked_1[10] | eg_timer_masked_1[11] | eg_timer_masked_1[12],
			eg_timer_masked_1[3] | eg_timer_masked_1[4] | eg_timer_masked_1[5] | eg_timer_masked_1[6] | eg_timer_masked_1[11] | eg_timer_masked_1[12],
			eg_timer_masked_1[1] | eg_timer_masked_1[2] | eg_timer_masked_1[5] | eg_timer_masked_1[6] | eg_timer_masked_1[9] | eg_timer_masked_1[10],
			eg_timer_masked_1[0] | eg_timer_masked_1[2] | eg_timer_masked_1[4] | eg_timer_masked_1[6] | eg_timer_masked_1[8] | eg_timer_masked_1[10] | eg_timer_masked_1[12]}),
		.val(eg_timer_shift));
	
	ymn_dlatch #(.DATA_WIDTH(2)) l_rate_state(.MCLK(MCLK), .en(clk1), .inp(rate_sel), .val(rate_state));
	ymn_dlatch l_rate_suson(.MCLK(MCLK), .en(clk1), .inp(sus_on), .val(rate_suson));
	
	assign rate = force_zerorate ? 4'h0 :
						((rate_state == 2'h0 ? attack_rate : 4'h0) |
						(rate_state == 2'h1 ? decay_rate : 4'h0) |
						(((rate_state == 2'h2 & ~egtype) | (rate_state == 2'h3 & ~rate_suson)) ? release_rate : 4'h0) |
						((rate_state == 2'h3 & rate_suson) ? 4'h5 : 4'h0));
	
	ymn_dlatch #(.DATA_WIDTH(4)) l_ksr_value(.MCLK(MCLK), .en(clk1), .inp({ blk, fnum[8] }), .val(ksr_value));
	
	assign ksr_shift = ksr ? ksr_value : { 2'h0, ksr_value[3:2] };
	
	ymn_dlatch l_eg_susson(.MCLK(MCLK), .en(clk1), .inp(sus_on), .val(eg_suson));
	
	ymn_dlatch l_eg_keyon_l0(.MCLK(MCLK), .en(clk1), .inp(key_on_comb), .val(eg_keyon_l0));
	
	ymn_dlatch l_eg_release_not_quiet(.MCLK(MCLK), .en(clk1), .inp(eg_is_release & ~eg_quiet), .val(eg_release_not_quiet));
	
	assign eg_rate_dp = eg_keyon_l0 & eg_release_not_quiet;
	
	assign eg_rate_rrperc = ~eg_suson & ~eg_keyon_l0 & ~egtype & ~inst_mc_l;
	
	assign eg_rate = eg_rate_dp ? 4'hc : (eg_rate_rrperc ? 4'h7 : rate);
	
	ymn_dlatch #(.DATA_WIDTH(4)) l_eg_rate(.MCLK(MCLK), .en(clk2), .inp(eg_rate), .val(eg_rate_l));
	
	ymn_sr_bit l_eg_zero_rate(.MCLK(MCLK), .c1(clk2), .c2(clk1), .inp(eg_rate == 4'h0), .val(eg_rate_zero));
	
	ymn_sr_bit_array #(.DATA_WIDTH(2)) l_eg_ksr_low(.MCLK(MCLK), .c1(clk2), .c2(clk1), .inp(ksr_shift[1:0]), .val(eg_ksr_low));
	
	ymn_dlatch #(.DATA_WIDTH(2)) l_eg_ksr_hi(.MCLK(MCLK), .en(clk2), .inp(ksr_shift[3:2]), .val(eg_ksr_hi));
	
	ymn_dlatch #(.DATA_WIDTH(5)) l_eg_rate_ksr(.MCLK(MCLK), .en(clk1), .inp({ 1'h0, eg_rate_l } + { 3'h0, eg_ksr_hi}), .val(eg_rate_ksr));
	
	assign eg_rate_ksr_clamp = eg_rate_ksr[4] ? 4'hf : eg_rate_ksr[3:0];
	
	assign eg_rate12 = eg_rate_ksr_clamp == 4'hc;
	assign eg_rate13 = eg_rate_ksr_clamp == 4'hd;
	assign eg_rate14 = eg_rate_ksr_clamp == 4'he;
	assign eg_rate15 = eg_rate_ksr_clamp == 4'hf;
	
	assign eg_rate_less12 = eg_rate_ksr_clamp[3:2] != 2'h3;
	
	ymn_dlatch #(.DATA_WIDTH(4)) l_eg_rate_clamp(.MCLK(MCLK), .en(clk2), .inp(eg_rate_ksr_clamp), .val(eg_rate_clamp));
	
	ymn_dlatch #(.DATA_WIDTH(4)) l_eg_shift(.MCLK(MCLK), .en(clk2), .inp(eg_timer_shift), .val(eg_shift));
	
	assign eg_rate_shift = eg_shift + eg_rate_clamp;
	
	ymn_dlatch l_eg_rate_zero2(.MCLK(MCLK), .en(clk2), .inp(eg_rate_zero), .val(eg_rate_zero_l));
	ymn_dlatch #(.DATA_WIDTH(2)) l_eg_ksr_low2(.MCLK(MCLK), .en(clk2), .inp(eg_ksr_low), .val(eg_ksr_low_l));
	ymn_dlatch l_eg_rate_less12(.MCLK(MCLK), .en(clk2), .inp(eg_rate_less12), .val(eg_rate_less12_l));
	
	assign eg_inclow = (eg_rate_shift == 4'hc & eg_rate_less12_l & ~eg_rate_zero_l) |
							 (eg_rate_shift == 4'hd & eg_rate_less12_l & ~eg_rate_zero_l & eg_ksr_low_l[1]) |
							 (eg_rate_shift == 4'he & eg_rate_less12_l & ~eg_rate_zero_l & eg_ksr_low_l[0]);
	
	assign eg_stephi = (eg_ksr_low[1] & ~eg_timer_low[0]) |
							 (eg_ksr_low[0] & eg_timer_low == 2'h0) |
							 (eg_ksr_low == 2'h3 & eg_timer_low == 2'h1);
	
	ymn_dlatch l_eg_rate12(.MCLK(MCLK), .en(clk2), .inp(eg_rate12), .val(eg_rate12_l));
	ymn_dlatch l_eg_rate13(.MCLK(MCLK), .en(clk2), .inp(eg_rate13), .val(eg_rate13_l));
	ymn_dlatch l_eg_rate14(.MCLK(MCLK), .en(clk2), .inp(eg_rate14), .val(eg_rate14_l));
	ymn_dlatch l_eg_rate15(.MCLK(MCLK), .en(clk2), .inp(eg_rate15), .val(eg_rate15_l));
	
	ymn_dlatch l_eg_stephi(.MCLK(MCLK), .en(clk2), .inp(eg_stephi), .val(eg_stephi_l));
	
	assign eg_inc1 = eg_inclow | (~eg_stephi_l & eg_rate12_l);
	assign eg_inc2 = (~eg_stephi_l & eg_rate13_l) | (eg_stephi_l & eg_rate12_l);
	assign eg_inc3 = (eg_inclow & eg_linear & eg_subcnt_sel1_l) |
						  (~eg_stephi_l & eg_linear & eg_subcnt_sel1_l & eg_rate12_l) |
						  (eg_stephi_l & eg_linear & eg_subcnt_sel2_l & eg_rate12_l) |
						  (~eg_stephi_l & eg_linear & eg_subcnt_sel2_l & eg_rate13_l) |
						  (~eg_stephi_l & eg_rate14_l) | (eg_stephi_l & eg_rate13_l);
	assign eg_inc4 = (eg_stephi_l & eg_rate14_l) | eg_rate15_l;
	
	
	
	ymn_sr_bit_array #(.DATA_WIDTH(2), .SR_LENGTH(16)) l_eg_state_mem(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(eg_state_next), .val(eg_state_mem));
	ymn_sr_bit_array #(.DATA_WIDTH(2), .SR_LENGTH(2)) l_eg_state_mem2(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(eg_state_mem), .val(eg_state_mem2));
	
	assign eg_is_release = eg_state_mem == 2'h3;
	
	assign eg_start_attack = eg_is_release & key_on_comb & eg_quiet;
	
	assign rate_sel = eg_start_attack ? 2'h0 : eg_state_mem;
	
	assign phase_reset = eg_state_start1;
	
	ymn_sr_bit l_eg_state_start1(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(eg_start_attack), .val(eg_state_start1));
	ymn_sr_bit l_eg_state_start(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(eg_state_start1), .val(eg_state_start));
	ymn_sr_bit #(.SR_LENGTH(2)) l_eg_state_keyon(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(key_on_comb), .val(eg_state_keyon));
	ymn_sr_bit #(.SR_LENGTH(2)) l_eg_state_quiet(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(eg_quiet), .val(eg_state_quiet));
	
	assign eg_state_sel[0] = eg_state_mem2 == 2'h0 & eg_state_keyon & ~eg_rate15_l & ~eg_zeroreach;
	assign eg_state_sel[1] = ~eg_state_start & eg_state_mem2[1] & ~eg_state_quiet;
	assign eg_state_sel[2] = ~eg_state_start & eg_state_mem2 == 2'h1 & ~eg_slreach & ~eg_state_quiet;
	assign eg_state_sel[3] = ~eg_state_start & ~eg_state_keyon;
	assign eg_state_sel[4] = ~eg_state_start & eg_state_mem2 == 2'h3;
	assign eg_state_sel[5] = ~eg_state_start & eg_state_mem2 == 2'h2;
	assign eg_state_sel[6] = ~eg_state_start & eg_state_mem2 == 2'h1 & eg_slreach;
	assign eg_state_sel[7] = ~eg_state_start & eg_state_mem2 == 2'h1 & ~eg_slreach;
	assign eg_state_sel[8] = ~eg_state_start & eg_state_mem2 == 2'h0 & eg_zeroreach;
	
	assign eg_state_next[0] = eg_state_sel[3] | eg_state_sel[4] | eg_state_sel[7] | eg_state_sel[8] | reset;
	assign eg_state_next[1] = eg_state_sel[3] | eg_state_sel[4] | eg_state_sel[5] | eg_state_sel[6] | reset;
	
	assign eg_exp = eg_state_sel[0];
	assign eg_linear = eg_state_sel[1] | eg_state_sel[2];
	assign eg_instantattack = eg_state_start & eg_rate15_l;
	assign eg_reset = reset | (eg_state_quiet & ~eg_state_start & eg_state_mem2 != 2'h0);
	
	
	ymn_sr_bit_array #(.DATA_WIDTH(7), .SR_LENGTH(16)) l_eg_level_mem(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(eg_level_next), .val(eg_level_mem));
	ymn_sr_bit_array #(.DATA_WIDTH(7)) l_eg_level_mem1(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(eg_level_mem), .val(eg_level_mem1));
	ymn_sr_bit_array #(.DATA_WIDTH(7)) l_eg_level_mem2(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(eg_level_mem1), .val(eg_level_mem2));
	
	assign eg_zeroreach = eg_level_mem2 == 7'h0;
	
	ymn_dlatch #(.DATA_WIDTH(4)) l_sustain(.MCLK(MCLK), .en(clk2), .inp(sustain_level), .val(sustain_l));
	ymn_sr_bit_array #(.DATA_WIDTH(4)) l_eg_sustain(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(sustain_l), .val(eg_sustain));
	
	assign eg_slreach = eg_level_mem2[6:3] == eg_sustain;
	
	assign eg_add_exp4 = eg_exp ? { 1'h1, ~eg_level_mem2[6:1] } : 7'h0;
	assign eg_add_exp3 = eg_exp ? { 2'h3, ~eg_level_mem2[6:2] } : 7'h0;
	assign eg_add_exp2 = eg_exp ? { 3'h7, ~eg_level_mem2[6:3] } : 7'h0;
	assign eg_add_exp1 = eg_exp ? { 4'hf, ~eg_level_mem2[6:4] } : 7'h0;
	
	assign eg_add = (eg_linear ? { 5'h0, eg_inc4, eg_inc3 } : 7'h0) |
						 (eg_inc1 ? eg_add_exp1 : 7'h0) |
						 (eg_inc2 ? eg_add_exp2 : 7'h0) |
						 (eg_inc3 ? { eg_add_exp3[6:1], eg_add_exp3[0] & ~eg_linear } : 7'h0) |
						 (eg_inc4 ? { eg_add_exp4[6:2], eg_add_exp4[1] & ~eg_linear, eg_add_exp4[0] } : 7'h0);
	
	assign eg_level_next = eg_reset ? 7'h7f : (eg_instantattack ? 7'h0 : (eg_level_mem2 + eg_add));
	
	assign eg_quiet = eg_level_mem[6:2] == 5'h1f;
	
	ymn_sr_bit l_eg_silent(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(eg_level_mem2 == 7'h7f), .val(eg_silent));
	
	ymn_dlatch #(.DATA_WIDTH(8)) l_eg_ksl_tl_trem(.MCLK(MCLK), .en(clk1), .inp({ksl_tl_trem_of, ksl_tl_trem[6:0]}), .val(eg_ksl_tl_trem));
	
	ymn_dlatch #(.DATA_WIDTH(7)) l_eg_level(.MCLK(MCLK), .en(clk1), .inp(eg_level_mem1), .val(eg_level_l));
	
	assign eg_level_att = { 1'h0, eg_level_l } + { 1'h0, eg_ksl_tl_trem[6:0] };
	
	assign eg_level_clamp = (eg_level_att[7] | eg_ksl_tl_trem[7]) ? 7'h7f : eg_level_att[6:0];
	
	ymn_dlatch #(.DATA_WIDTH(7)) l_eg_out(.MCLK(MCLK), .en(clk2), .inp(test0 ? 7'h0 : eg_level_clamp), .val(eg_out));
	//assign eg_out = 7'd30;
	
	ymn_sr_bit_array #(.DATA_WIDTH(7)) l_eg_dbg(.MCLK(MCLK), .c1(clk1), .c2(clk2),
		.inp({ eg_dbg[5:0], 1'h0 } | (fsm_out[11] ? eg_out : 7'h0)), .val(eg_dbg));
	
	//
	// operator unit
	//
	
	assign op_phase_sum = pg_out + op_phase_mod;
	
	ymn_sr_bit #(.SR_LENGTH(2)) l_op_sign(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(op_phase_sum[9]), .val(op_sign));
	
	assign op_phase_quarter = op_phase_sum[8] ? ~op_phase_sum[7:0] : op_phase_sum[7:0];
	
	assign sin_lut_index = op_phase_quarter[5:1];
	
	always @(*)
	begin
		case (sin_lut_index)
			5'h1f: sine_lut_out = 46'b0001100001000100100001000010101010101000100101;
			5'h1e: sine_lut_out = 46'b0001100001010100001000000001001001001100010100;
			5'h1d: sine_lut_out = 46'b0001100001010100001000110000101011001100000110;
			5'h1c: sine_lut_out = 46'b0001110000010000000000110011001001001100100111;
			5'h1b: sine_lut_out = 46'b0001110000010000011000000011101010001110010110;
			5'h1a: sine_lut_out = 46'b0001110000010100010001100000001000101110100111;
			5'h19: sine_lut_out = 46'b0001110000010100011001100001001011001110100101;
			5'h18: sine_lut_out = 46'b0001110000011100001001010011101000101111001111;
			5'h17: sine_lut_out = 46'b0001110001011000000001110010101110001101110111;
			5'h16: sine_lut_out = 46'b0001110001011000101000111001100101011001101010;
			5'h15: sine_lut_out = 46'b0001110001011100110000011011100100001010100111;
			5'h14: sine_lut_out = 46'b0001110001011100111000111110100011001001110111;
			5'h13: sine_lut_out = 46'b0100100010010000100001011100100000111001111011;
			5'h12: sine_lut_out = 46'b0100100010010100100001001111000001111110100010;
			5'h11: sine_lut_out = 46'b0100100010010100101001101111110110100101100100;
			5'h10: sine_lut_out = 46'b0100100111000000010000011101000110101110010111;
			5'h0f: sine_lut_out = 46'b0100100111000100010000101110001101001011111110;
			5'h0e: sine_lut_out = 46'b0100100111001100001011011000001001011000011011;
			5'h0d: sine_lut_out = 46'b0100110110001000001011101000001010111011111011;
			5'h0c: sine_lut_out = 46'b0100110110001100010011011010111110110100011000;
			5'h0b: sine_lut_out = 46'b0100110111001000110010111100101010001100010111;
			5'h0a: sine_lut_out = 46'b0100110111001100110110110111110001010111110000;
			5'h09: sine_lut_out = 46'b0111000100000000101111000101010101010101111001;
			5'h08: sine_lut_out = 46'b0111000100000100101111110111011101010010111011;
			5'h07: sine_lut_out = 46'b0111000101010101010100101000110000010010010001;
			5'h06: sine_lut_out = 46'b0111010100011001001100011010011100010000101001;
			5'h05: sine_lut_out = 46'b0111010101011011001001100100010000110100110010;
			5'h04: sine_lut_out = 46'b1010000100011011011001011110010001110010101001;
			5'h03: sine_lut_out = 46'b1010000101011111111100100101011100010010010011;
			5'h02: sine_lut_out = 46'b1010010111110101100010001011110001010100001010;
			5'h01: sine_lut_out = 46'b1011010110110011110111011000011100110000011010;
			5'h00: sine_lut_out = 46'b1110011111010001110111100110011001110101111010;
		endcase
	end
	
	assign sin_index_top_sel[0] = op_phase_quarter[7:6] == 2'h0;
	assign sin_index_top_sel[1] = op_phase_quarter[7:6] == 2'h1;
	assign sin_index_top_sel[2] = op_phase_quarter[7:6] == 2'h2;
	assign sin_index_top_sel[3] = op_phase_quarter[7:6] == 2'h3;
	
	assign sin_lut_mux[0] = (sine_lut_out[0] & sin_index_top_sel[0]) | (sine_lut_out[1] & sin_index_top_sel[1])
		| (sine_lut_out[2] & sin_index_top_sel[2]) | (sine_lut_out[3] & sin_index_top_sel[3]);
	assign sin_lut_mux[1] = (sine_lut_out[4] & sin_index_top_sel[0]) | (sine_lut_out[5] & sin_index_top_sel[1])
		| (sine_lut_out[6] & sin_index_top_sel[2]) | (sine_lut_out[7] & sin_index_top_sel[3]);
	assign sin_lut_mux[2] = (sine_lut_out[8] & sin_index_top_sel[0]) | (sine_lut_out[9] & sin_index_top_sel[1])
		| (sine_lut_out[10] & sin_index_top_sel[2]);
	assign sin_lut_mux[3] = (sine_lut_out[11] & sin_index_top_sel[0]) | (sine_lut_out[12] & sin_index_top_sel[1])
		| (sine_lut_out[13] & sin_index_top_sel[2]) | (sine_lut_out[14] & sin_index_top_sel[3]);
	assign sin_lut_mux[4] = (sine_lut_out[15] & sin_index_top_sel[0]) | (sine_lut_out[16] & sin_index_top_sel[1]);
	assign sin_lut_mux[5] = (sine_lut_out[17] & sin_index_top_sel[0]) | (sine_lut_out[18] & sin_index_top_sel[1])
		| (sine_lut_out[19] & sin_index_top_sel[2]) | (sine_lut_out[20] & sin_index_top_sel[3]);
	assign sin_lut_mux[6] = sine_lut_out[21] & sin_index_top_sel[0];
	assign sin_lut_mux[7] = (sine_lut_out[22] & sin_index_top_sel[0]) | (sine_lut_out[23] & sin_index_top_sel[1])
		| (sine_lut_out[24] & sin_index_top_sel[2]) | (sine_lut_out[25] & sin_index_top_sel[3]);
	assign sin_lut_mux[8] = sine_lut_out[26] & sin_index_top_sel[0];
	assign sin_lut_mux[9] = (sine_lut_out[27] & sin_index_top_sel[0]) | (sine_lut_out[28] & sin_index_top_sel[1])
		| (sine_lut_out[29] & sin_index_top_sel[2]) | (sine_lut_out[30] & sin_index_top_sel[3]);
	assign sin_lut_mux[10] = sine_lut_out[31] & sin_index_top_sel[0];
	assign sin_lut_mux[11] = (sine_lut_out[32] & sin_index_top_sel[0]) | (sine_lut_out[33] & sin_index_top_sel[1])
		| (sine_lut_out[34] & sin_index_top_sel[2]);
	assign sin_lut_mux[12] = sine_lut_out[35] & sin_index_top_sel[0];
	assign sin_lut_mux[13] = (sine_lut_out[36] & sin_index_top_sel[0]) | (sine_lut_out[37] & sin_index_top_sel[1])
		| (sine_lut_out[38] & sin_index_top_sel[2]);
	assign sin_lut_mux[14] = sine_lut_out[39] & sin_index_top_sel[0];
	assign sin_lut_mux[15] = (sine_lut_out[40] & sin_index_top_sel[0]) | (sine_lut_out[41] & sin_index_top_sel[1]);
	assign sin_lut_mux[16] = (sine_lut_out[42] & sin_index_top_sel[0]) | (sine_lut_out[43] & sin_index_top_sel[1]);
	assign sin_lut_mux[17] = sine_lut_out[44] & sin_index_top_sel[0];
	assign sin_lut_mux[18] = sine_lut_out[45] & sin_index_top_sel[0];
	
	ymn_dlatch #(.DATA_WIDTH(19)) l_sin_lut(.MCLK(MCLK), .en(clk1), .inp(sin_lut_mux), .val(sin_lut_l));
	
	ymn_dlatch l_sin_index_0(.MCLK(MCLK), .en(clk1), .inp(op_phase_quarter[0]), .val(sin_index_0_l));
	
	assign sin_base = { sin_lut_l[18:15], sin_lut_l[13], sin_lut_l[11], sin_lut_l[9], sin_lut_l[7], sin_lut_l[5], sin_lut_l[3], sin_lut_l[1] };
	
	assign sin_delta = sin_index_0_l ? 8'h0 : { sin_lut_l[14], sin_lut_l[12], sin_lut_l[10], sin_lut_l[8], sin_lut_l[6], sin_lut_l[4], sin_lut_l[2], sin_lut_l[0] };
	
	assign sin_sum = { 1'h0, sin_base } + { 3'h0, sin_delta[7], sin_delta };
	
	ymn_dlatch #(.DATA_WIDTH(12)) l_sin_sum(.MCLK(MCLK), .en(clk2), .inp(sin_sum), .val(sin_sum_l));
	
	assign op_att_sum = { 1'h0, sin_sum_l } + { 1'h0, eg_out, 4'h0 };
	
	assign op_att_clamp = ~(op_att_sum[12] ? 12'hfff : op_att_sum[11:0]);
	
	ymn_sr_bit_array #(.DATA_WIDTH(4)) l_op_shift(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(op_att_clamp[11:8]), .val(op_shift));
	
	assign pow_index = op_att_clamp[7:0];
	
	assign pow_lut_index = pow_index[5:1];
	
	always @(*)
	begin
		case (pow_lut_index)
			5'h1f: pow_lut_out = 48'b111011111100011111101000111101000001000110011101;
			5'h1e: pow_lut_out = 48'b111011111100011010011111011000001011100010110011;
			5'h1d: pow_lut_out = 48'b111011111100000011110110111101101001110111011010;
			5'h1c: pow_lut_out = 48'b111011111100000011100001111101100101000001010110;
			5'h1b: pow_lut_out = 48'b111011111100000010000110011100100101000001011011;
			5'h1a: pow_lut_out = 48'b111011101001010101011101111101000001111111011101;
			5'h19: pow_lut_out = 48'b111011001011011101111010011111001000011011000000;
			5'h18: pow_lut_out = 48'b111011001011011100100101111100001001001111011110;
			5'h17: pow_lut_out = 48'b111011001011001101000110111101000001101011011010;
			5'h16: pow_lut_out = 48'b111011001011000001110011011101110001010111010100;
			5'h15: pow_lut_out = 48'b111011000011100010111100111100110001110110010101;
			5'h14: pow_lut_out = 48'b111010000111110011001111011101111001110010011011;
			5'h13: pow_lut_out = 48'b111010000111110011000000111001111011001110111101;
			5'h12: pow_lut_out = 48'b111010000100111110110111111100110101101001010001;
			5'h11: pow_lut_out = 48'b111010000100111110110000011100110001001110010011;
			5'h10: pow_lut_out = 48'b111010000100101101011010111101001001110011010101;
			5'h0f: pow_lut_out = 48'b111010000100101100001101011001001011010110110111;
			5'h0e: pow_lut_out = 48'b111010000100100100101010011000000011111010110001;
			5'h0d: pow_lut_out = 48'b111010000000110001110101111000000011011110110011;
			5'h0c: pow_lut_out = 48'b111010000000110000010110011001011011100011110101;
			5'h0b: pow_lut_out = 48'b111010000000010010001001111101011001000110010101;
			5'h0a: pow_lut_out = 48'b101110100010001011101110111000010011101010110101;
			5'h09: pow_lut_out = 48'b101100110011001111111001011000010011001111110011;
			5'h08: pow_lut_out = 48'b101100110011001110010011111001001011100010110001;
			5'h07: pow_lut_out = 48'b100101110111011111010100111001000011000010101010;
			5'h06: pow_lut_out = 48'b100101110111010111100011011000000011101110111000;
			5'h05: pow_lut_out = 48'b100101110111010100101100111100001001001010011010;
			5'h04: pow_lut_out = 48'b100101110111010000011011011100011001000110010000;
			5'h03: pow_lut_out = 48'b100101110111000001011000011001010011101010110001;
			5'h02: pow_lut_out = 48'b100101110101001000100111111001010011001110111011;
			5'h01: pow_lut_out = 48'b100101110101001000100001011101001001000100000000;
			5'h00: pow_lut_out = 48'b100101110001011001000110011000000011101010110000;
		endcase
	end
	
	assign pow_index_top_sel[0] = pow_index[7:6] == 2'h0;
	assign pow_index_top_sel[1] = pow_index[7:6] == 2'h1;
	assign pow_index_top_sel[2] = pow_index[7:6] == 2'h2;
	assign pow_index_top_sel[3] = pow_index[7:6] == 2'h3;
	
	assign pow_lut_mux[0] = (pow_lut_out[0] & pow_index_top_sel[0]) | (pow_lut_out[1] & pow_index_top_sel[1])
		| (pow_lut_out[2] & pow_index_top_sel[2]) | (pow_lut_out[3] & pow_index_top_sel[3]);
	assign pow_lut_mux[1] = (pow_lut_out[4] & pow_index_top_sel[0]) | (pow_lut_out[5] & pow_index_top_sel[1])
		| (pow_lut_out[6] & pow_index_top_sel[2]) | (pow_lut_out[7] & pow_index_top_sel[3]);
	assign pow_lut_mux[2] = (pow_lut_out[8] & pow_index_top_sel[0]) | (pow_lut_out[9] & pow_index_top_sel[1])
		| (pow_lut_out[10] & pow_index_top_sel[2]) | (pow_lut_out[11] & pow_index_top_sel[3]);
	assign pow_lut_mux[3] = (pow_lut_out[12] & pow_index_top_sel[0]) | (pow_lut_out[13] & pow_index_top_sel[1])
		| (pow_lut_out[14] & pow_index_top_sel[3]);
	assign pow_lut_mux[4] = (pow_lut_out[15] & pow_index_top_sel[0]) | (pow_lut_out[16] & pow_index_top_sel[1])
		| (pow_lut_out[17] & pow_index_top_sel[2]) | (pow_lut_out[18] & pow_index_top_sel[3]);
	assign pow_lut_mux[5] = (pow_lut_out[19] & pow_index_top_sel[0]) | (pow_lut_out[20] & pow_index_top_sel[1])
		| (pow_lut_out[21] & pow_index_top_sel[2]) | (pow_lut_out[22] & pow_index_top_sel[3]);
	assign pow_lut_mux[6] = (pow_lut_out[23] & pow_index_top_sel[0]) | (pow_lut_out[24] & pow_index_top_sel[1])
		| (pow_lut_out[25] & pow_index_top_sel[2]) | (pow_lut_out[26] & pow_index_top_sel[3]);
	assign pow_lut_mux[7] = (pow_lut_out[27] & pow_index_top_sel[0]) | (pow_lut_out[28] & pow_index_top_sel[1])
		| (pow_lut_out[29] & pow_index_top_sel[2]) | (pow_lut_out[30] & pow_index_top_sel[3]);
	assign pow_lut_mux[8] = (pow_lut_out[31] & pow_index_top_sel[0]) | (pow_lut_out[32] & pow_index_top_sel[1])
		| (pow_lut_out[33] & pow_index_top_sel[2]) | (pow_lut_out[34] & pow_index_top_sel[3]);
	assign pow_lut_mux[9] = (pow_lut_out[35] & pow_index_top_sel[0]) | (pow_lut_out[36] & pow_index_top_sel[1])
		| (pow_lut_out[37] & pow_index_top_sel[2]) | (pow_lut_out[38] & pow_index_top_sel[3]);
	assign pow_lut_mux[10] = (pow_lut_out[39] & pow_index_top_sel[0]) | (pow_lut_out[40] & pow_index_top_sel[1])
		| (pow_lut_out[41] & pow_index_top_sel[2]) | (pow_lut_out[42] & pow_index_top_sel[3]);
	assign pow_lut_mux[11] = (pow_lut_out[43] & pow_index_top_sel[1])
		| (pow_lut_out[44] & pow_index_top_sel[2]) | (pow_lut_out[45] & pow_index_top_sel[3]);
	assign pow_lut_mux[12] = (pow_lut_out[46] & pow_index_top_sel[2]) | (pow_lut_out[47] & pow_index_top_sel[3]);
	
	ymn_dlatch #(.DATA_WIDTH(13)) l_pow_lut(.MCLK(MCLK), .en(clk1), .inp(pow_lut_mux), .val(pow_lut_l));
	
	ymn_dlatch l_pow_index_0(.MCLK(MCLK), .en(clk1), .inp(pow_index[0]), .val(pow_index_0_l));
	
	assign pow_base = { pow_lut_l[12:6], pow_lut_l[4], pow_lut_l[2], pow_lut_l[0] };
	assign pow_delta = pow_index_0_l ? { pow_lut_l[5], pow_lut_l[3], pow_lut_l[1] } : 3'h0;
	
	assign pow_sum = pow_base + { 7'h0, pow_delta };
	
	ymn_dlatch #(.DATA_WIDTH(10)) l_pow_sum(.MCLK(MCLK), .en(clk2), .inp(pow_sum), .val(pow_sum_l));
	
	assign op_sign2 = ~op_sign | eg_silent;
	
	ymn_dlatch l_wf_mod(.MCLK(MCLK), .en(clk2), .inp(wf_mod), .val(wf_mod_l));
	ymn_dlatch l_wf_car(.MCLK(MCLK), .en(clk2), .inp(wf_car), .val(wf_car_l));
	
	ymn_sr_bit #(.SR_LENGTH(2)) l_op_wf_mod(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(wf_mod_l), .val(op_wf_mod));
	ymn_sr_bit #(.SR_LENGTH(2)) l_op_wf_car(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(wf_car_l), .val(op_wf_car));
	
	assign op_mute = eg_silent | (fsm_out[2] & op_wf_mod & op_sign) | (~fsm_out[2] & op_wf_car & op_sign);
	
	assign op_shift0 = op_shift[3:2] == 2'h3 & ~op_mute;
	assign op_shift4 = op_shift[3:2] == 2'h2 & ~op_mute;
	assign op_shift8 = op_shift[3:2] == 2'h1 & ~op_mute;
	assign op_shiftc = ~(op_shift0 | op_shift4 | op_shift8);
	
	assign pow_shift1 = (op_shift[1:0] == 2'h3 ? { 1'h1, pow_sum_l } : 11'h0) |
							  (op_shift[1:0] == 2'h2 ? { 2'h1, pow_sum_l[9:1] } : 11'h0) |
							  (op_shift[1:0] == 2'h1 ? { 3'h1, pow_sum_l[9:2] } : 11'h0) |
							  (op_shift[1:0] == 2'h0 ? { 4'h1, pow_sum_l[9:3] } : 11'h0);
	
	assign pow_shift2 = (op_shift0 ? pow_shift1 : 11'h0) |
							  (op_shift4 ? { 4'h0, pow_shift1[10:4] } : 11'h0) |
							  (op_shift8 ? { 8'h0, pow_shift1[10:8] } : 11'h0) |
							  (op_shiftc ? 11'h0 : 11'h0);
	
	assign op_value = op_sign2 ? { 1'h0, pow_shift2 } : { 1'h1, ~pow_shift2 };
	
	ymn_sr_bit_array #(.DATA_WIDTH(12), .SR_LENGTH(6)) l_op_fb1_mem1(.MCLK(MCLK), .c1(clk1), .c2(clk2),
		.inp(fsm_out[2] ? op_value : op_fb1_mem2), .val(op_fb1_mem1));
	ymn_sr_bit_array #(.DATA_WIDTH(12), .SR_LENGTH(3)) l_op_fb1_mem2(.MCLK(MCLK), .c1(clk1), .c2(clk2),
		.inp(op_fb1_mem1), .val(op_fb1_mem2));
	
	ymn_sr_bit_array #(.DATA_WIDTH(12), .SR_LENGTH(6)) l_op_fb2_mem1(.MCLK(MCLK), .c1(clk1), .c2(clk2),
		.inp(fsm_out[2] ? op_fb1_mem2 : op_fb2_mem2), .val(op_fb2_mem1));
	ymn_sr_bit_array #(.DATA_WIDTH(12), .SR_LENGTH(3)) l_op_fb2_mem2(.MCLK(MCLK), .c1(clk1), .c2(clk2),
		.inp(op_fb2_mem1), .val(op_fb2_mem2));
	
	ymn_sr_bit_array #(.DATA_WIDTH(9)) l_op_fm(.MCLK(MCLK), .c1(clk1), .c2(clk2),
		.inp(op_value[8:0]), .val(op_fm));
	
	assign op_fb_sum1 = { op_fb1_mem1[11], op_fb1_mem1 } + { op_fb2_mem1[11], op_fb2_mem1 };
	
	ymn_sr_bit_array #(.DATA_WIDTH(12)) l_op_fb_sum(.MCLK(MCLK), .c1(clk1), .c2(clk2),
		.inp(op_fb_sum1[12:1]), .val(op_fb_sum));
	
	ymn_dlatch #(.DATA_WIDTH(3)) l_feedback(.MCLK(MCLK), .en(clk2), .inp(feedback), .val(feedback_l));
	
	ymn_sr_bit l_op_mod_sel(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fsm_out[2]), .val(op_mod_sel));
	
	assign op_fb_sel[0] = modcar_sel_rhy & feedback_l == 3'h1;
	assign op_fb_sel[1] = modcar_sel_rhy & feedback_l == 3'h2;
	assign op_fb_sel[2] = modcar_sel_rhy & feedback_l == 3'h3;
	assign op_fb_sel[3] = modcar_sel_rhy & feedback_l == 3'h4;
	assign op_fb_sel[4] = modcar_sel_rhy & feedback_l == 3'h5;
	assign op_fb_sel[5] = modcar_sel_rhy & feedback_l == 3'h6;
	assign op_fb_sel[6] = modcar_sel_rhy & feedback_l == 3'h7;
	
	assign op_phase_mod = (op_mod_sel ? { op_fm, 1'h0 } : 10'h0) |
								 (op_fb_sel[0] ? { {4{op_fb_sum[11]}}, op_fb_sum[11:6] } : 10'h0) |
								 (op_fb_sel[1] ? { {3{op_fb_sum[11]}}, op_fb_sum[11:5] } : 10'h0) |
								 (op_fb_sel[2] ? { {2{op_fb_sum[11]}}, op_fb_sum[11:4] } : 10'h0) |
								 (op_fb_sel[3] ? { {1{op_fb_sum[11]}}, op_fb_sum[11:3] } : 10'h0) |
								 (op_fb_sel[4] ? { op_fb_sum[11:2] } : 10'h0) |
								 (op_fb_sel[5] ? { op_fb_sum[10:1] } : 10'h0) |
								 (op_fb_sel[6] ? { op_fb_sum[9:0] } : 10'h0);
	
	assign op_out = op_value[11:3];
	
	//
	// channel
	//
	
	assign ch_val = fsm_out[2] ? (rhythm ? ch_val_rhy : 9'h0) : op_out;
	
	ymn_sr_bit_array #(.DATA_WIDTH(9), .SR_LENGTH(5)) l_ch_val_rhy(.MCLK(MCLK), .c1(rclk1), .c2(rclk2), .inp(ch_val), .val(ch_val_rhy));
	
	assign ch_val_sign[7:0] = ch_val[8] ? ~ch_val[7:0] : ch_val[7:0];
	assign ch_val_sign[8] = ch_val[8];
	
	ymn_sr_bit_array #(.DATA_WIDTH(9)) l_ch_val(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(ch_val_sign), .val(ch_val_l));
	
	ymn_sr_bit l_ch_en_m(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fsm_out[0]), .val(ch_en_m));
	ymn_sr_bit l_ch_en_r(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fsm_out[13]), .val(ch_en_r));
	
	ymn_sr_bit_array #(.DATA_WIDTH(9)) l_ch_dbg(.MCLK(MCLK), .c1(clk1), .c2(clk2),
		.inp(fsm_out[11] ? { ch_dbg[7:0], 1'h0 } : ch_dbg), .val(ch_dbg));
	
	assign dac_value = ch_val_l;
	assign dac_en_m = ch_en_m & dac_clk;
	assign dac_en_r = ch_en_r & dac_clk;
	
	wire DAC_sign = dac_value[8];
	wire [9:0] DAC_matrix_out = DAC_sign ? { 2'h3, ~dac_value[7:0] } : ({ 2'h0, dac_value[7:0] } + 10'h1);
	wire [9:0] DAC_silent = DAC_sign ? 10'h3ff : 10'h1;
	
	assign MO = dac_en_m ? DAC_matrix_out : DAC_silent;
	assign RO = dac_en_r ? DAC_matrix_out : DAC_silent;
	
	assign DATA_o = { ch_dbg[8], pg_dbg[0] };
	
	assign DATA_d = ~dbg_read;
	
endmodule

module reg_handler
	(
	input MCLK,
	input sel,
	input write0,
	input write1,
	input c1,
	input c2,
	output val
	);
	
	wire val1;
	
	ymn_sr_bit mem(.MCLK(MCLK), .c1(c1), .c2(c2), .inp(write0 ? val1 : sel), .val(val1));
	
	assign val = val1 & write1;
	
endmodule

module reg_bit2 #(parameter DATA_WIDTH = 1)
	(
	input MCLK,
	input en,
	input [DATA_WIDTH-1:0] inp,
	input rst,
	output [DATA_WIDTH-1:0] val
	);
	
	reg [DATA_WIDTH-1:0] mem;
	
	always @(posedge MCLK)
	begin
		mem <= en ? inp : (rst ? {DATA_WIDTH{1'h0}} : mem);
	end
	
	assign val = mem;

endmodule


module cnt_bit
	(
	input MCLK,
	input c_in,
	input reset,
	input c1,
	input c2,
	output val,
	output c_out
	);
	
	wire nval;
	
	wire c_in_n = ~c_in;
	
	assign c_out = ~(nval | c_in_n);
	
	wire sum = ~(reset | (nval & c_in_n) | c_out);
	
	ymn_sr_bit mem(.MCLK(MCLK), .c1(c1), .c2(c2), .inp(sum), .val(val), .nval(nval));

endmodule

module cnt_bit_2
	(
	input MCLK,
	input c_in,
	input reset,
	input c1,
	input c2,
	output val,
	output c_out
	);
	
	wire c_in_n = ~c_in;
	
	assign c_out = ~(val | c_in_n);
	
	wire sum = ~(reset | (val & c_in_n) | c_out);
	
	ymn_sr_bit mem(.MCLK(MCLK), .c1(c1), .c2(c2), .inp(sum), .nval(val));

endmodule
