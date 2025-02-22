// This program was cloned from: https://github.com/QingXia-Ela/gdou-curriculum-design-collect
// License: MIT License

// megafunction wizard: %LPM_COUNTER%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: lpm_counter 

// ============================================================
// File Name: sec_min6.v
// Megafunction Name(s):
// 			lpm_counter
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 9.1 Build 222 10/21/2009 SJ Web Edition
// ************************************************************


//Copyright (C) 1991-2009 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


//lpm_counter DEVICE_FAMILY="Stratix II" lpm_direction="UP" lpm_modulus=6 lpm_port_updown="PORT_UNUSED" lpm_width=4 clock cnt_en cout q
//VERSION_BEGIN 9.1 cbx_cycloneii 2009:10:21:21:22:16:SJ cbx_lpm_add_sub 2009:10:21:21:22:16:SJ cbx_lpm_compare 2009:10:21:21:22:16:SJ cbx_lpm_counter 2009:10:21:21:22:16:SJ cbx_lpm_decode 2009:10:21:21:22:16:SJ cbx_mgl 2009:10:21:21:37:49:SJ cbx_stratix 2009:10:21:21:22:16:SJ cbx_stratixii 2009:10:21:21:22:16:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



//lpm_compare DEVICE_FAMILY="Stratix II" LPM_WIDTH=4 ONE_INPUT_IS_CONSTANT="YES" aeb dataa datab
//VERSION_BEGIN 9.1 cbx_cycloneii 2009:10:21:21:22:16:SJ cbx_lpm_add_sub 2009:10:21:21:22:16:SJ cbx_lpm_compare 2009:10:21:21:22:16:SJ cbx_mgl 2009:10:21:21:37:49:SJ cbx_stratix 2009:10:21:21:22:16:SJ cbx_stratixii 2009:10:21:21:22:16:SJ  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  sec_min6_cmpr
	( 
	aeb,
	dataa,
	datab) /* synthesis synthesis_clearbox=1 */;
	output   aeb;
	input   [3:0]  dataa;
	input   [3:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [3:0]  dataa;
	tri0   [3:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]  aeb_result_wire;
	wire  [0:0]  aneb_result_wire;
	wire  [9:0]  data_wire;
	wire  eq_wire;

	assign
		aeb = eq_wire,
		aeb_result_wire = (~ aneb_result_wire),
		aneb_result_wire = (data_wire[0] | data_wire[1]),
		data_wire = {datab[3], dataa[3], datab[2], dataa[2], datab[1], dataa[1], datab[0], dataa[0], ((data_wire[6] ^ data_wire[7]) | (data_wire[8] ^ data_wire[9])), ((data_wire[2] ^ data_wire[3]) | (data_wire[4] ^ data_wire[5]))},
		eq_wire = aeb_result_wire;
endmodule //sec_min6_cmpr

//synthesis_resources = lut 4 reg 4 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  sec_min6_cntr
	( 
	clock,
	cnt_en,
	cout,
	q) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   cnt_en;
	output   cout;
	output   [3:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   cnt_en;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_cmpr2_aeb;
	wire  [0:0]   wire_counter_comb_bita_0cout;
	wire  [0:0]   wire_counter_comb_bita_1cout;
	wire  [0:0]   wire_counter_comb_bita_2cout;
	wire  [0:0]   wire_counter_comb_bita_3cout;
	wire  [0:0]   wire_counter_comb_bita_0sumout;
	wire  [0:0]   wire_counter_comb_bita_1sumout;
	wire  [0:0]   wire_counter_comb_bita_2sumout;
	wire  [0:0]   wire_counter_comb_bita_3sumout;
	wire  [3:0]   wire_counter_reg_bit1a_adatasdata;
	wire  [3:0]   wire_counter_reg_bit1a_regout;
	wire  aclr_actual;
	wire clk_en;
	wire  compare_result;
	wire  cout_actual;
	wire [3:0]  data;
	wire  external_cin;
	wire  lsb_cin;
	wire  [3:0]  modulus_bus;
	wire  modulus_trigger;
	wire  [3:0]  s_val;
	wire  [3:0]  safe_q;
	wire sclr;
	wire sload;
	wire sset;
	wire  time_to_clear;
	wire  updown_dir;
	wire  updown_lsb;
	wire  updown_other_bits;

	sec_min6_cmpr   cmpr2
	( 
	.aeb(wire_cmpr2_aeb),
	.dataa(safe_q),
	.datab(modulus_bus));
	stratixii_lcell_comb   counter_comb_bita_0
	( 
	.cin(lsb_cin),
	.combout(),
	.cout(wire_counter_comb_bita_0cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[0:0]),
	.dataf(updown_lsb),
	.shareout(),
	.sumout(wire_counter_comb_bita_0sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_0.extended_lut = "off",
		counter_comb_bita_0.lut_mask = 64'h000000000000FF00,
		counter_comb_bita_0.shared_arith = "off",
		counter_comb_bita_0.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_1
	( 
	.cin(wire_counter_comb_bita_0cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_1cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[1:1]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_1sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_1.extended_lut = "off",
		counter_comb_bita_1.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_1.shared_arith = "off",
		counter_comb_bita_1.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_2
	( 
	.cin(wire_counter_comb_bita_1cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_2cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[2:2]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_2sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_2.extended_lut = "off",
		counter_comb_bita_2.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_2.shared_arith = "off",
		counter_comb_bita_2.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_comb   counter_comb_bita_3
	( 
	.cin(wire_counter_comb_bita_2cout[0:0]),
	.combout(),
	.cout(wire_counter_comb_bita_3cout[0:0]),
	.datad(wire_counter_reg_bit1a_regout[3:3]),
	.dataf(updown_other_bits),
	.shareout(),
	.sumout(wire_counter_comb_bita_3sumout[0:0]),
	.dataa(1'b0),
	.datab(1'b0),
	.datac(1'b0),
	.datae(1'b0),
	.datag(1'b0),
	.sharein(1'b0)
	);
	defparam
		counter_comb_bita_3.extended_lut = "off",
		counter_comb_bita_3.lut_mask = 64'h0000FF000000FF00,
		counter_comb_bita_3.shared_arith = "off",
		counter_comb_bita_3.lpm_type = "stratixii_lcell_comb";
	stratixii_lcell_ff   counter_reg_bit1a_0
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[0:0]),
	.clk(clock),
	.datain(wire_counter_comb_bita_0sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[0:0]),
	.sclr(sclr),
	.sload(((sset | sload) | modulus_trigger)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_1
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[1:1]),
	.clk(clock),
	.datain(wire_counter_comb_bita_1sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[1:1]),
	.sclr(sclr),
	.sload(((sset | sload) | modulus_trigger)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_2
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[2:2]),
	.clk(clock),
	.datain(wire_counter_comb_bita_2sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[2:2]),
	.sclr(sclr),
	.sload(((sset | sload) | modulus_trigger)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixii_lcell_ff   counter_reg_bit1a_3
	( 
	.aclr(aclr_actual),
	.adatasdata(wire_counter_reg_bit1a_adatasdata[3:3]),
	.clk(clock),
	.datain(wire_counter_comb_bita_3sumout[0:0]),
	.ena((clk_en & (((cnt_en | sclr) | sset) | sload))),
	.regout(wire_counter_reg_bit1a_regout[3:3]),
	.sclr(sclr),
	.sload(((sset | sload) | modulus_trigger)),
	.aload(1'b0)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	assign
		wire_counter_reg_bit1a_adatasdata = (({4{sset}} & s_val) | ({4{(~ sset)}} & (({4{sload}} & data) | (({4{(~ sload)}} & modulus_bus) & {4{(~ updown_dir)}}))));
	assign
		aclr_actual = 1'b0,
		clk_en = 1'b1,
		compare_result = wire_cmpr2_aeb,
		cout = cout_actual,
		cout_actual = (((~ wire_counter_comb_bita_3cout[0:0]) ^ updown_other_bits) | (time_to_clear & updown_dir)),
		data = {4{1'b0}},
		external_cin = 1'b1,
		lsb_cin = 1'b0,
		modulus_bus = 4'b0101,
		modulus_trigger = cout_actual,
		q = safe_q,
		s_val = {4{1'b1}},
		safe_q = wire_counter_reg_bit1a_regout,
		sclr = 1'b0,
		sload = 1'b0,
		sset = 1'b0,
		time_to_clear = compare_result,
		updown_dir = 1'b1,
		updown_lsb = updown_dir,
		updown_other_bits = ((~ external_cin) | updown_dir);
endmodule //sec_min6_cntr
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module sec_min6 (
	clock,
	cnt_en,
	cout,
	q)/* synthesis synthesis_clearbox = 1 */;

	input	  clock;
	input	  cnt_en;
	output	  cout;
	output	[3:0]  q;

	wire  sub_wire0;
	wire [3:0] sub_wire1;
	wire  cout = sub_wire0;
	wire [3:0] q = sub_wire1[3:0];

	sec_min6_cntr	sec_min6_cntr_component (
				.clock (clock),
				.cnt_en (cnt_en),
				.cout (sub_wire0),
				.q (sub_wire1));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ACLR NUMERIC "0"
// Retrieval info: PRIVATE: ALOAD NUMERIC "0"
// Retrieval info: PRIVATE: ASET NUMERIC "0"
// Retrieval info: PRIVATE: ASET_ALL1 NUMERIC "1"
// Retrieval info: PRIVATE: CLK_EN NUMERIC "0"
// Retrieval info: PRIVATE: CNT_EN NUMERIC "1"
// Retrieval info: PRIVATE: CarryIn NUMERIC "0"
// Retrieval info: PRIVATE: CarryOut NUMERIC "1"
// Retrieval info: PRIVATE: Direction NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix II"
// Retrieval info: PRIVATE: ModulusCounter NUMERIC "1"
// Retrieval info: PRIVATE: ModulusValue NUMERIC "6"
// Retrieval info: PRIVATE: SCLR NUMERIC "0"
// Retrieval info: PRIVATE: SLOAD NUMERIC "0"
// Retrieval info: PRIVATE: SSET NUMERIC "0"
// Retrieval info: PRIVATE: SSET_ALL1 NUMERIC "1"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "1"
// Retrieval info: PRIVATE: nBit NUMERIC "4"
// Retrieval info: CONSTANT: LPM_DIRECTION STRING "UP"
// Retrieval info: CONSTANT: LPM_MODULUS NUMERIC "6"
// Retrieval info: CONSTANT: LPM_PORT_UPDOWN STRING "PORT_UNUSED"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_COUNTER"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "4"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL clock
// Retrieval info: USED_PORT: cnt_en 0 0 0 0 INPUT NODEFVAL cnt_en
// Retrieval info: USED_PORT: cout 0 0 0 0 OUTPUT NODEFVAL cout
// Retrieval info: USED_PORT: q 0 0 4 0 OUTPUT NODEFVAL q[3..0]
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: q 0 0 4 0 @q 0 0 4 0
// Retrieval info: CONNECT: @cnt_en 0 0 0 0 cnt_en 0 0 0 0
// Retrieval info: CONNECT: cout 0 0 0 0 @cout 0 0 0 0
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL sec_min6.vhd TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL sec_min6.inc TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL sec_min6.cmp TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL sec_min6.bsf TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL sec_min6_inst.vhd TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL sec_min6_waveforms.html TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL sec_min6_wave*.jpg FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL sec_min6_syn.v TRUE
// Retrieval info: LIB_FILE: lpm
