// This program was cloned from: https://github.com/myriadrf/LimeSDR-PCIe_GW
// License: Apache License 2.0

//altpll bandwidth_type="AUTO" CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" clk0_divide_by=1 clk0_duty_cycle=50 clk0_multiply_by=1 clk0_phase_shift="0" clk1_divide_by=1 clk1_duty_cycle=50 clk1_multiply_by=1 clk1_phase_shift="0" compensate_clock="CLK1" device_family="Cyclone IV GX" inclk0_input_frequency=5000 intended_device_family="Cyclone IV GX" lpm_hint="CBX_MODULE_PREFIX=pll" operation_mode="source_synchronous" pll_type="AUTO" port_clk0="PORT_USED" port_clk1="PORT_USED" port_clk2="PORT_UNUSED" port_clk3="PORT_UNUSED" port_clk4="PORT_UNUSED" port_clk5="PORT_UNUSED" port_extclk0="PORT_UNUSED" port_extclk1="PORT_UNUSED" port_extclk2="PORT_UNUSED" port_extclk3="PORT_UNUSED" port_inclk1="PORT_UNUSED" port_phasecounterselect="PORT_USED" port_phasedone="PORT_USED" port_scandata="PORT_USED" port_scandataout="PORT_USED" scan_chain_mif_file="61p44_zero_deg.mif" self_reset_on_loss_lock="OFF" width_clock=5 width_phasecounterselect=3 areset clk configupdate inclk locked pfdena phasecounterselect phasedone phasestep phaseupdown scanclk scanclkena scandata scandataout scandone CARRY_CHAIN="MANUAL" CARRY_CHAIN_LENGTH=48
//VERSION_BEGIN 15.1 cbx_altclkbuf 2016:02:01:19:04:59:SJ cbx_altiobuf_bidir 2016:02:01:19:04:59:SJ cbx_altiobuf_in 2016:02:01:19:04:59:SJ cbx_altiobuf_out 2016:02:01:19:04:59:SJ cbx_altpll 2016:02:01:19:04:59:SJ cbx_cycloneii 2016:02:01:19:04:59:SJ cbx_lpm_add_sub 2016:02:01:19:04:59:SJ cbx_lpm_compare 2016:02:01:19:04:59:SJ cbx_lpm_counter 2016:02:01:19:04:59:SJ cbx_lpm_decode 2016:02:01:19:04:59:SJ cbx_lpm_mux 2016:02:01:19:04:59:SJ cbx_mgl 2016:02:01:19:07:00:SJ cbx_nadder 2016:02:01:19:04:59:SJ cbx_stratix 2016:02:01:19:05:00:SJ cbx_stratixii 2016:02:01:19:05:00:SJ cbx_stratixiii 2016:02:01:19:05:00:SJ cbx_stratixv 2016:02:01:19:05:00:SJ cbx_util_mgl 2016:02:01:19:04:59:SJ  VERSION_END
//CBXI_INSTANCE_NAME="lms7_trx_top_pll_block_inst18_pll_inst35_altpll_altpll_component"
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
//  Your use of Altera Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Altera Program License 
//  Subscription Agreement, the Altera Quartus Prime License Agreement,
//  the Altera MegaCore Function License Agreement, or other 
//  applicable license agreement, including, without limitation, 
//  that your use is for the sole purpose of programming logic 
//  devices manufactured by Altera and sold by Altera or its 
//  authorized distributors.  Please refer to the applicable 
//  agreement for further details.




//altpll_dynamic_phase_lcell CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Cyclone IV GX" INDEX=0 combout dataa datab datac datad ALTERA_INTERNAL_OPTIONS=ADV_NETLIST_OPT_ALLOWED = NEVER_ALLOW;REMOVE_REDUNDANT_LOGIC_CELLS = OFF;IGNORE_LCELL_BUFFERS = OFF
//VERSION_BEGIN 15.1 cbx_altclkbuf 2016:02:01:19:04:59:SJ cbx_altiobuf_bidir 2016:02:01:19:04:59:SJ cbx_altiobuf_in 2016:02:01:19:04:59:SJ cbx_altiobuf_out 2016:02:01:19:04:59:SJ cbx_altpll 2016:02:01:19:04:59:SJ cbx_cycloneii 2016:02:01:19:04:59:SJ cbx_lpm_add_sub 2016:02:01:19:04:59:SJ cbx_lpm_compare 2016:02:01:19:04:59:SJ cbx_lpm_counter 2016:02:01:19:04:59:SJ cbx_lpm_decode 2016:02:01:19:04:59:SJ cbx_lpm_mux 2016:02:01:19:04:59:SJ cbx_mgl 2016:02:01:19:07:00:SJ cbx_nadder 2016:02:01:19:04:59:SJ cbx_stratix 2016:02:01:19:05:00:SJ cbx_stratixii 2016:02:01:19:05:00:SJ cbx_stratixiii 2016:02:01:19:05:00:SJ cbx_stratixv 2016:02:01:19:05:00:SJ cbx_util_mgl 2016:02:01:19:04:59:SJ  VERSION_END

//synthesis_resources = lut 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"ADV_NETLIST_OPT_ALLOWED = NEVER_ALLOW;REMOVE_REDUNDANT_LOGIC_CELLS = OFF;IGNORE_LCELL_BUFFERS = OFF;PLL_PHASE_RECONFIG_COUNTER_REMAP_LCELL = 0"} *)
module  pll_altpll_dyn_phase_le
	( 
	combout,
	dataa,
	datab,
	datac,
	datad) /* synthesis synthesis_clearbox=1 */;
	output   combout;
	input   dataa;
	input   datab;
	input   datac;
	input   datad;

	wire  wire_le_comb8_combout;

	cycloneiv_lcell_comb   le_comb8
	( 
	.combout(wire_le_comb8_combout),
	.cout(),
	.dataa(dataa),
	.datab(datab),
	.datac(datac),
	.cin(1'b0),
	.datad(1'b0)
	);
	defparam
		le_comb8.dont_touch = "on",
		le_comb8.lut_mask = 16'hAAAA,
		le_comb8.sum_lutc_input = "datac",
		le_comb8.lpm_type = "cycloneiv_lcell_comb";
	assign
		combout = wire_le_comb8_combout;
endmodule //pll_altpll_dyn_phase_le


//altpll_dynamic_phase_lcell CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Cyclone IV GX" INDEX=1 combout dataa datab datac datad ALTERA_INTERNAL_OPTIONS=ADV_NETLIST_OPT_ALLOWED = NEVER_ALLOW;REMOVE_REDUNDANT_LOGIC_CELLS = OFF;IGNORE_LCELL_BUFFERS = OFF
//VERSION_BEGIN 15.1 cbx_altclkbuf 2016:02:01:19:04:59:SJ cbx_altiobuf_bidir 2016:02:01:19:04:59:SJ cbx_altiobuf_in 2016:02:01:19:04:59:SJ cbx_altiobuf_out 2016:02:01:19:04:59:SJ cbx_altpll 2016:02:01:19:04:59:SJ cbx_cycloneii 2016:02:01:19:04:59:SJ cbx_lpm_add_sub 2016:02:01:19:04:59:SJ cbx_lpm_compare 2016:02:01:19:04:59:SJ cbx_lpm_counter 2016:02:01:19:04:59:SJ cbx_lpm_decode 2016:02:01:19:04:59:SJ cbx_lpm_mux 2016:02:01:19:04:59:SJ cbx_mgl 2016:02:01:19:07:00:SJ cbx_nadder 2016:02:01:19:04:59:SJ cbx_stratix 2016:02:01:19:05:00:SJ cbx_stratixii 2016:02:01:19:05:00:SJ cbx_stratixiii 2016:02:01:19:05:00:SJ cbx_stratixv 2016:02:01:19:05:00:SJ cbx_util_mgl 2016:02:01:19:04:59:SJ  VERSION_END

//synthesis_resources = lut 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"ADV_NETLIST_OPT_ALLOWED = NEVER_ALLOW;REMOVE_REDUNDANT_LOGIC_CELLS = OFF;IGNORE_LCELL_BUFFERS = OFF;PLL_PHASE_RECONFIG_COUNTER_REMAP_LCELL = 1"} *)
module  pll_altpll_dyn_phase_le1
	( 
	combout,
	dataa,
	datab,
	datac,
	datad) /* synthesis synthesis_clearbox=1 */;
	output   combout;
	input   dataa;
	input   datab;
	input   datac;
	input   datad;

	wire  wire_le_comb9_combout;

	cycloneiv_lcell_comb   le_comb9
	( 
	.combout(wire_le_comb9_combout),
	.cout(),
	.dataa(dataa),
	.datab(datab),
	.datac(datac),
	.cin(1'b0),
	.datad(1'b0)
	);
	defparam
		le_comb9.dont_touch = "on",
		le_comb9.lut_mask = 16'hCCCC,
		le_comb9.sum_lutc_input = "datac",
		le_comb9.lpm_type = "cycloneiv_lcell_comb";
	assign
		combout = wire_le_comb9_combout;
endmodule //pll_altpll_dyn_phase_le1


//altpll_dynamic_phase_lcell CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Cyclone IV GX" INDEX=2 combout dataa datab datac datad ALTERA_INTERNAL_OPTIONS=ADV_NETLIST_OPT_ALLOWED = NEVER_ALLOW;REMOVE_REDUNDANT_LOGIC_CELLS = OFF;IGNORE_LCELL_BUFFERS = OFF
//VERSION_BEGIN 15.1 cbx_altclkbuf 2016:02:01:19:04:59:SJ cbx_altiobuf_bidir 2016:02:01:19:04:59:SJ cbx_altiobuf_in 2016:02:01:19:04:59:SJ cbx_altiobuf_out 2016:02:01:19:04:59:SJ cbx_altpll 2016:02:01:19:04:59:SJ cbx_cycloneii 2016:02:01:19:04:59:SJ cbx_lpm_add_sub 2016:02:01:19:04:59:SJ cbx_lpm_compare 2016:02:01:19:04:59:SJ cbx_lpm_counter 2016:02:01:19:04:59:SJ cbx_lpm_decode 2016:02:01:19:04:59:SJ cbx_lpm_mux 2016:02:01:19:04:59:SJ cbx_mgl 2016:02:01:19:07:00:SJ cbx_nadder 2016:02:01:19:04:59:SJ cbx_stratix 2016:02:01:19:05:00:SJ cbx_stratixii 2016:02:01:19:05:00:SJ cbx_stratixiii 2016:02:01:19:05:00:SJ cbx_stratixv 2016:02:01:19:05:00:SJ cbx_util_mgl 2016:02:01:19:04:59:SJ  VERSION_END

//synthesis_resources = lut 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"ADV_NETLIST_OPT_ALLOWED = NEVER_ALLOW;REMOVE_REDUNDANT_LOGIC_CELLS = OFF;IGNORE_LCELL_BUFFERS = OFF;PLL_PHASE_RECONFIG_COUNTER_REMAP_LCELL = 2"} *)
module  pll_altpll_dyn_phase_le12
	( 
	combout,
	dataa,
	datab,
	datac,
	datad) /* synthesis synthesis_clearbox=1 */;
	output   combout;
	input   dataa;
	input   datab;
	input   datac;
	input   datad;

	wire  wire_le_comb10_combout;

	cycloneiv_lcell_comb   le_comb10
	( 
	.combout(wire_le_comb10_combout),
	.cout(),
	.dataa(dataa),
	.datab(datab),
	.datac(datac),
	.cin(1'b0),
	.datad(1'b0)
	);
	defparam
		le_comb10.dont_touch = "on",
		le_comb10.lut_mask = 16'hF0F0,
		le_comb10.sum_lutc_input = "datac",
		le_comb10.lpm_type = "cycloneiv_lcell_comb";
	assign
		combout = wire_le_comb10_combout;
endmodule //pll_altpll_dyn_phase_le12


//lpm_counter CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Cyclone IV GX" lpm_modulus=3 lpm_port_updown="PORT_UNUSED" lpm_width=2 clock cnt_en q
//VERSION_BEGIN 15.1 cbx_cycloneii 2016:02:01:19:04:59:SJ cbx_lpm_add_sub 2016:02:01:19:04:59:SJ cbx_lpm_compare 2016:02:01:19:04:59:SJ cbx_lpm_counter 2016:02:01:19:04:59:SJ cbx_lpm_decode 2016:02:01:19:04:59:SJ cbx_mgl 2016:02:01:19:07:00:SJ cbx_nadder 2016:02:01:19:04:59:SJ cbx_stratix 2016:02:01:19:05:00:SJ cbx_stratixii 2016:02:01:19:05:00:SJ  VERSION_END


//lpm_add_sub CARRY_CHAIN="MANUAL" CARRY_CHAIN_LENGTH=48 CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Cyclone IV GX" LPM_DIRECTION="ADD" LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=2 ONE_INPUT_IS_CONSTANT="YES" USE_WYS="OPERATORS" cout dataa datab result
//VERSION_BEGIN 15.1 cbx_cycloneii 2016:02:01:19:04:59:SJ cbx_lpm_add_sub 2016:02:01:19:04:59:SJ cbx_mgl 2016:02:01:19:07:00:SJ cbx_nadder 2016:02:01:19:04:59:SJ cbx_stratix 2016:02:01:19:05:00:SJ cbx_stratixii 2016:02:01:19:05:00:SJ  VERSION_END


//lpm_compare CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Cyclone IV GX" LPM_WIDTH=2 ONE_INPUT_IS_CONSTANT="YES" aeb dataa datab
//VERSION_BEGIN 15.1 cbx_cycloneii 2016:02:01:19:04:59:SJ cbx_lpm_add_sub 2016:02:01:19:04:59:SJ cbx_lpm_compare 2016:02:01:19:04:59:SJ cbx_mgl 2016:02:01:19:07:00:SJ cbx_nadder 2016:02:01:19:04:59:SJ cbx_stratix 2016:02:01:19:05:00:SJ cbx_stratixii 2016:02:01:19:05:00:SJ  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  pll_cmpr
	( 
	aeb,
	dataa,
	datab) /* synthesis synthesis_clearbox=1 */;
	output   aeb;
	input   [1:0]  dataa;
	input   [1:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [1:0]  dataa;
	tri0   [1:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]  aeb_result_wire;
	wire  [0:0]  aneb_result_wire;
	wire  [3:0]  data_wire;
	wire  eq_wire;

	assign
		aeb = eq_wire,
		aeb_result_wire = (~ aneb_result_wire),
		aneb_result_wire = ((data_wire[0] ^ data_wire[1]) | (data_wire[2] ^ data_wire[3])),
		data_wire = {datab[1], dataa[1], datab[0], dataa[0]},
		eq_wire = aeb_result_wire;
endmodule //pll_cmpr

//synthesis_resources = lut 2 reg 2 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  pll_cntr
	( 
	clock,
	cnt_en,
	q) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   cnt_en;
	output   [1:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   cnt_en;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[1:0]	counter_reg_bit;
	wire	[1:0]	wire_counter_reg_bit_ena;
	wire	[2:0]	wire_add_sub11_result_int;
	wire	wire_add_sub11_cout;
	wire	[1:0]	wire_add_sub11_dataa;
	wire	[1:0]	wire_add_sub11_datab;
	wire	[1:0]	wire_add_sub11_result;
	wire  wire_cmpr12_aeb;
	wire  aclr_actual;
	wire  [1:0]  add_sub_one_w;
	wire  [1:0]  add_value_w;
	wire clk_en;
	wire  compare_result;
	wire  cout_actual;
	wire  [1:0]  current_reg_q_w;
	wire  custom_cout_w;
	wire  [1:0]  modulus_bus;
	wire  modulus_trigger;
	wire  [1:0]  modulus_trigger_value_w;
	wire  [1:0]  safe_q;
	wire  time_to_clear;
	wire  [1:0]  trigger_mux_w;
	wire  updown_dir;

	// synopsys translate_off
	initial
		counter_reg_bit[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[0:0] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[0:0] == 1'b1)   counter_reg_bit[0:0] <= trigger_mux_w[0:0];
	// synopsys translate_off
	initial
		counter_reg_bit[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[1:1] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[1:1] == 1'b1)   counter_reg_bit[1:1] <= trigger_mux_w[1:1];
	assign
		wire_counter_reg_bit_ena = {2{(clk_en & cnt_en)}};
	assign
		wire_add_sub11_result_int = wire_add_sub11_dataa + wire_add_sub11_datab;
	assign
		wire_add_sub11_result = wire_add_sub11_result_int[1:0],
		wire_add_sub11_cout = wire_add_sub11_result_int[2:2];
	assign
		wire_add_sub11_dataa = current_reg_q_w,
		wire_add_sub11_datab = add_value_w;
	pll_cmpr   cmpr12
	( 
	.aeb(wire_cmpr12_aeb),
	.dataa(safe_q),
	.datab(modulus_bus));
	assign
		aclr_actual = 1'b0,
		add_sub_one_w = wire_add_sub11_result,
		add_value_w = 2'b01,
		clk_en = 1'b1,
		compare_result = wire_cmpr12_aeb,
		cout_actual = (custom_cout_w | (time_to_clear & updown_dir)),
		current_reg_q_w = counter_reg_bit,
		custom_cout_w = (wire_add_sub11_cout & add_value_w[0]),
		modulus_bus = 2'b10,
		modulus_trigger = cout_actual,
		modulus_trigger_value_w = ({2{(~ updown_dir)}} & modulus_bus),
		q = safe_q,
		safe_q = counter_reg_bit,
		time_to_clear = compare_result,
		trigger_mux_w = (({2{(~ modulus_trigger)}} & add_sub_one_w) | ({2{modulus_trigger}} & modulus_trigger_value_w)),
		updown_dir = 1'b1;
endmodule //pll_cntr


//lpm_counter CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Cyclone IV GX" lpm_modulus=6 lpm_port_updown="PORT_UNUSED" lpm_width=3 aclr clock cnt_en q
//VERSION_BEGIN 15.1 cbx_cycloneii 2016:02:01:19:04:59:SJ cbx_lpm_add_sub 2016:02:01:19:04:59:SJ cbx_lpm_compare 2016:02:01:19:04:59:SJ cbx_lpm_counter 2016:02:01:19:04:59:SJ cbx_lpm_decode 2016:02:01:19:04:59:SJ cbx_mgl 2016:02:01:19:07:00:SJ cbx_nadder 2016:02:01:19:04:59:SJ cbx_stratix 2016:02:01:19:05:00:SJ cbx_stratixii 2016:02:01:19:05:00:SJ  VERSION_END


//lpm_add_sub CARRY_CHAIN="MANUAL" CARRY_CHAIN_LENGTH=48 CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Cyclone IV GX" LPM_DIRECTION="ADD" LPM_REPRESENTATION="UNSIGNED" LPM_WIDTH=3 ONE_INPUT_IS_CONSTANT="YES" USE_WYS="OPERATORS" cout dataa datab result
//VERSION_BEGIN 15.1 cbx_cycloneii 2016:02:01:19:04:59:SJ cbx_lpm_add_sub 2016:02:01:19:04:59:SJ cbx_mgl 2016:02:01:19:07:00:SJ cbx_nadder 2016:02:01:19:04:59:SJ cbx_stratix 2016:02:01:19:05:00:SJ cbx_stratixii 2016:02:01:19:05:00:SJ  VERSION_END


//lpm_compare CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Cyclone IV GX" LPM_WIDTH=3 ONE_INPUT_IS_CONSTANT="YES" aeb dataa datab
//VERSION_BEGIN 15.1 cbx_cycloneii 2016:02:01:19:04:59:SJ cbx_lpm_add_sub 2016:02:01:19:04:59:SJ cbx_lpm_compare 2016:02:01:19:04:59:SJ cbx_mgl 2016:02:01:19:07:00:SJ cbx_nadder 2016:02:01:19:04:59:SJ cbx_stratix 2016:02:01:19:05:00:SJ cbx_stratixii 2016:02:01:19:05:00:SJ  VERSION_END

//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  pll_cmpr1
	( 
	aeb,
	dataa,
	datab) /* synthesis synthesis_clearbox=1 */;
	output   aeb;
	input   [2:0]  dataa;
	input   [2:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [2:0]  dataa;
	tri0   [2:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]  aeb_result_wire;
	wire  [0:0]  aneb_result_wire;
	wire  [7:0]  data_wire;
	wire  eq_wire;

	assign
		aeb = eq_wire,
		aeb_result_wire = (~ aneb_result_wire),
		aneb_result_wire = (data_wire[0] | data_wire[1]),
		data_wire = {datab[2], dataa[2], datab[1], dataa[1], datab[0], dataa[0], (data_wire[6] ^ data_wire[7]), ((data_wire[2] ^ data_wire[3]) | (data_wire[4] ^ data_wire[5]))},
		eq_wire = aeb_result_wire;
endmodule //pll_cmpr1

//synthesis_resources = lut 3 reg 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  pll_cntr1
	( 
	aclr,
	clock,
	cnt_en,
	q) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clock;
	input   cnt_en;
	output   [2:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   cnt_en;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[2:0]	counter_reg_bit;
	wire	[2:0]	wire_counter_reg_bit_ena;
	wire	[3:0]	wire_add_sub13_result_int;
	wire	wire_add_sub13_cout;
	wire	[2:0]	wire_add_sub13_dataa;
	wire	[2:0]	wire_add_sub13_datab;
	wire	[2:0]	wire_add_sub13_result;
	wire  wire_cmpr14_aeb;
	wire  aclr_actual;
	wire  [2:0]  add_sub_one_w;
	wire  [2:0]  add_value_w;
	wire clk_en;
	wire  compare_result;
	wire  cout_actual;
	wire  [2:0]  current_reg_q_w;
	wire  custom_cout_w;
	wire  [2:0]  modulus_bus;
	wire  modulus_trigger;
	wire  [2:0]  modulus_trigger_value_w;
	wire  [2:0]  safe_q;
	wire  time_to_clear;
	wire  [2:0]  trigger_mux_w;
	wire  updown_dir;

	// synopsys translate_off
	initial
		counter_reg_bit[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[0:0] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[0:0] == 1'b1)   counter_reg_bit[0:0] <= trigger_mux_w[0:0];
	// synopsys translate_off
	initial
		counter_reg_bit[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[1:1] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[1:1] == 1'b1)   counter_reg_bit[1:1] <= trigger_mux_w[1:1];
	// synopsys translate_off
	initial
		counter_reg_bit[2:2] = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr_actual)
		if (aclr_actual == 1'b1) counter_reg_bit[2:2] <= 1'b0;
		else if  (wire_counter_reg_bit_ena[2:2] == 1'b1)   counter_reg_bit[2:2] <= trigger_mux_w[2:2];
	assign
		wire_counter_reg_bit_ena = {3{(clk_en & cnt_en)}};
	assign
		wire_add_sub13_result_int = wire_add_sub13_dataa + wire_add_sub13_datab;
	assign
		wire_add_sub13_result = wire_add_sub13_result_int[2:0],
		wire_add_sub13_cout = wire_add_sub13_result_int[3:3];
	assign
		wire_add_sub13_dataa = current_reg_q_w,
		wire_add_sub13_datab = add_value_w;
	pll_cmpr1   cmpr14
	( 
	.aeb(wire_cmpr14_aeb),
	.dataa(safe_q),
	.datab(modulus_bus));
	assign
		aclr_actual = aclr,
		add_sub_one_w = wire_add_sub13_result,
		add_value_w = 3'b001,
		clk_en = 1'b1,
		compare_result = wire_cmpr14_aeb,
		cout_actual = (custom_cout_w | (time_to_clear & updown_dir)),
		current_reg_q_w = counter_reg_bit,
		custom_cout_w = (wire_add_sub13_cout & add_value_w[0]),
		modulus_bus = 3'b101,
		modulus_trigger = cout_actual,
		modulus_trigger_value_w = ({3{(~ updown_dir)}} & modulus_bus),
		q = safe_q,
		safe_q = counter_reg_bit,
		time_to_clear = compare_result,
		trigger_mux_w = (({3{(~ modulus_trigger)}} & add_sub_one_w) | ({3{modulus_trigger}} & modulus_trigger_value_w)),
		updown_dir = 1'b1;
endmodule //pll_cntr1

//synthesis_resources = cycloneiv_pll 1 lut 11 reg 8 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"SUPPRESS_DA_RULE_INTERNAL=R101;{-to remap_decoy_le3a_0} ADV_NETLIST_OPT_ALLOWED = NEVER_ALLOW;{-to remap_decoy_le3a_1} ADV_NETLIST_OPT_ALLOWED = NEVER_ALLOW;{-to remap_decoy_le3a_2} ADV_NETLIST_OPT_ALLOWED = NEVER_ALLOW;{-to remap_decoy_le3a_0} IGNORE_LCELL_BUFFERS = OFF;{-to remap_decoy_le3a_1} IGNORE_LCELL_BUFFERS = OFF;{-to remap_decoy_le3a_2} IGNORE_LCELL_BUFFERS = OFF;{-to remap_decoy_le3a_0} REMOVE_REDUNDANT_LOGIC_CELLS = OFF;{-to remap_decoy_le3a_1} REMOVE_REDUNDANT_LOGIC_CELLS = OFF;{-to remap_decoy_le3a_2} REMOVE_REDUNDANT_LOGIC_CELLS = OFF;-name SDC_STATEMENT \"set_false_path -from ** -to *phasedone_state* \";-name SDC_STATEMENT \"set_false_path -from ** -to *internal_phasestep* \""} *)
module  pll_altpll
	( 
	areset,
	clk,
	configupdate,
	inclk,
	locked,
	pfdena,
	phasecounterselect,
	phasedone,
	phasestep,
	phaseupdown,
	scanclk,
	scanclkena,
	scandata,
	scandataout,
	scandone) /* synthesis synthesis_clearbox=1 */;
	input   areset;
	output   [4:0]  clk;
	input   configupdate;
	input   [1:0]  inclk;
	output   locked;
	input   pfdena;
	input   [2:0]  phasecounterselect;
	output   phasedone;
	input   phasestep;
	input   phaseupdown;
	input   scanclk;
	input   scanclkena;
	input   scandata;
	output   scandataout;
	output   scandone;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   areset;
	tri0   configupdate;
	tri0   [1:0]  inclk;
	tri1   pfdena;
	tri1   [2:0]  phasecounterselect;
	tri1   phasestep;
	tri1   phaseupdown;
	tri0   scanclk;
	tri1   scanclkena;
	tri0   scandata;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_altpll_dyn_phase_le2_combout;
	wire  wire_altpll_dyn_phase_le4_combout;
	wire  wire_altpll_dyn_phase_le5_combout;
	reg	internal_phasestep;
	reg	phasedone_state;
	reg	pll_internal_phasestep_reg;
	wire  [0:0]   wire_remap_decoy_le3a_0out;
	wire  [0:0]   wire_remap_decoy_le3a_1out;
	wire  [0:0]   wire_remap_decoy_le3a_2out;
	wire  [1:0]   wire_phasestep_counter_q;
	wire  [2:0]   wire_pll_internal_phasestep_q;
	wire  [4:0]   wire_pll1_clk;
	wire  wire_pll1_fbout;
	wire  wire_pll1_locked;
	wire  wire_pll1_phasedone;
	wire  wire_pll1_scandataout;
	wire  wire_pll1_scandone;
	wire  internal_phasestep_reg_wire;
	wire  [2:0]  phasedone_low_counter;
	wire  phasedone_state_reg_wire;
	wire  [1:0]  phasestep_counter_wire;
	wire  [1:0]  w14w;
	wire  [2:0]  w20w;
	wire  [2:0]  w29w;

	pll_altpll_dyn_phase_le   altpll_dyn_phase_le2
	( 
	.combout(wire_altpll_dyn_phase_le2_combout),
	.dataa(wire_remap_decoy_le3a_0out[0:0]),
	.datab(wire_remap_decoy_le3a_1out[0:0]),
	.datac(wire_remap_decoy_le3a_2out[0:0]),
	.datad(1'b0));
	pll_altpll_dyn_phase_le1   altpll_dyn_phase_le4
	( 
	.combout(wire_altpll_dyn_phase_le4_combout),
	.dataa(wire_remap_decoy_le3a_0out[0:0]),
	.datab(wire_remap_decoy_le3a_1out[0:0]),
	.datac(wire_remap_decoy_le3a_2out[0:0]),
	.datad(1'b0));
	pll_altpll_dyn_phase_le12   altpll_dyn_phase_le5
	( 
	.combout(wire_altpll_dyn_phase_le5_combout),
	.dataa(wire_remap_decoy_le3a_0out[0:0]),
	.datab(wire_remap_decoy_le3a_1out[0:0]),
	.datac(wire_remap_decoy_le3a_2out[0:0]),
	.datad(1'b0));
	// synopsys translate_off
	initial
		internal_phasestep = 0;
	// synopsys translate_on
	always @ ( posedge scanclk or  posedge areset)
		if (areset == 1'b1) internal_phasestep <= 1'b0;
		else  internal_phasestep <= (phasedone_state_reg_wire | ((((~ phasedone_state_reg_wire) & phasedone_low_counter[2]) & w29w[1]) & phasedone_low_counter[0]));
	// synopsys translate_off
	initial
		phasedone_state = 0;
	// synopsys translate_on
	always @ ( posedge scanclk or  posedge areset)
		if (areset == 1'b1) phasedone_state <= 1'b0;
		else  phasedone_state <= (((~ phasedone_state_reg_wire) & ((phasedone_low_counter[0] & w20w[1]) & phasedone_low_counter[2])) | (phasedone_state_reg_wire & (w14w[0] | (phasestep_counter_wire[0] & phasestep_counter_wire[1]))));
	// synopsys translate_off
	initial
		pll_internal_phasestep_reg = 0;
	// synopsys translate_on
	always @ ( posedge scanclk)
		  pll_internal_phasestep_reg <= wire_pll1_phasedone;
	lcell   remap_decoy_le3a_0
	( 
	.in(phasecounterselect[0]),
	.out(wire_remap_decoy_le3a_0out[0:0]));
	lcell   remap_decoy_le3a_1
	( 
	.in(phasecounterselect[1]),
	.out(wire_remap_decoy_le3a_1out[0:0]));
	lcell   remap_decoy_le3a_2
	( 
	.in(phasecounterselect[2]),
	.out(wire_remap_decoy_le3a_2out[0:0]));
	pll_cntr   phasestep_counter
	( 
	.clock(scanclk),
	.cnt_en(phasedone_state_reg_wire),
	.q(wire_phasestep_counter_q));
	pll_cntr1   pll_internal_phasestep
	( 
	.aclr((areset | wire_pll1_phasedone)),
	.clock(scanclk),
	.cnt_en((~ pll_internal_phasestep_reg)),
	.q(wire_pll_internal_phasestep_q));
	cycloneiv_pll   pll1
	( 
	.activeclock(),
	.areset(areset),
	.clk(wire_pll1_clk),
	.clkbad(),
	.configupdate(configupdate),
	.fbin(wire_pll1_fbout),
	.fbout(wire_pll1_fbout),
	.fref(),
	.icdrclk(),
	.inclk(inclk),
	.locked(wire_pll1_locked),
	.pfdena(pfdena),
	.phasecounterselect({wire_altpll_dyn_phase_le5_combout, wire_altpll_dyn_phase_le4_combout, wire_altpll_dyn_phase_le2_combout}),
	.phasedone(wire_pll1_phasedone),
	.phasestep((phasestep | internal_phasestep_reg_wire)),
	.phaseupdown(phaseupdown),
	.scanclk(scanclk),
	.scanclkena(scanclkena),
	.scandata(scandata),
	.scandataout(wire_pll1_scandataout),
	.scandone(wire_pll1_scandone),
	.vcooverrange(),
	.vcounderrange()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clkswitch(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		pll1.bandwidth_type = "auto",
		pll1.clk0_divide_by = 1,
		pll1.clk0_duty_cycle = 50,
		pll1.clk0_multiply_by = 1,
		pll1.clk0_phase_shift = "0",
		pll1.clk1_divide_by = 1,
		pll1.clk1_duty_cycle = 50,
		pll1.clk1_multiply_by = 1,
		pll1.clk1_phase_shift = "0",
		pll1.compensate_clock = "clk1",
		pll1.inclk0_input_frequency = 5000,
		pll1.operation_mode = "source_synchronous",
		pll1.pll_type = "auto",
		pll1.scan_chain_mif_file = "61p44_zero_deg.mif",
		pll1.self_reset_on_loss_lock = "off",
		pll1.lpm_type = "cycloneiv_pll";
	assign
		clk = {wire_pll1_clk[4:0]},
		internal_phasestep_reg_wire = internal_phasestep,
		locked = wire_pll1_locked,
		phasedone = (wire_pll1_phasedone & (~ internal_phasestep_reg_wire)),
		phasedone_low_counter = wire_pll_internal_phasestep_q,
		phasedone_state_reg_wire = phasedone_state,
		phasestep_counter_wire = wire_phasestep_counter_q,
		scandataout = wire_pll1_scandataout,
		scandone = wire_pll1_scandone,
		w14w = (~ phasestep_counter_wire),
		w20w = (~ phasedone_low_counter),
		w29w = (~ phasedone_low_counter);
endmodule //pll_altpll
//VALID FILE
