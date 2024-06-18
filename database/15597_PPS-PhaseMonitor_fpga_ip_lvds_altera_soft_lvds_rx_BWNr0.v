// This program was cloned from: https://github.com/kingyoPiyo/PPS-PhaseMonitor
// License: MIT License

//altlvds_rx BUFFER_IMPLEMENTATION="RAM" CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" CBX_SINGLE_OUTPUT_FILE="ON" COMMON_RX_TX_PLL="OFF" CYCLONEII_M4K_COMPATIBILITY="ON" DATA_ALIGN_ROLLOVER=4 DATA_RATE="720.0 Mbps" DESERIALIZATION_FACTOR=4 DEVICE_FAMILY="MAX 10" DPA_INITIAL_PHASE_VALUE=0 DPLL_LOCK_COUNT=0 DPLL_LOCK_WINDOW=0 ENABLE_DPA_ALIGN_TO_RISING_EDGE_ONLY="OFF" ENABLE_DPA_CALIBRATION="ON" ENABLE_DPA_INITIAL_PHASE_SELECTION="OFF" ENABLE_DPA_MODE="OFF" ENABLE_DPA_PLL_CALIBRATION="OFF" ENABLE_SOFT_CDR_MODE="OFF" IMPLEMENT_IN_LES="ON" INCLOCK_BOOST=0 INCLOCK_DATA_ALIGNMENT="EDGE_ALIGNED" INCLOCK_PERIOD=10000 INCLOCK_PHASE_SHIFT=0 INPUT_DATA_RATE=720 LVDS_RX_REG_SETTING="OFF" NUMBER_OF_CHANNELS=5 OUTCLOCK_RESOURCE="AUTO" PLL_SELF_RESET_ON_LOSS_LOCK="OFF" PORT_RX_CHANNEL_DATA_ALIGN="PORT_UNUSED" PORT_RX_DATA_ALIGN="PORT_UNUSED" REGISTERED_DATA_ALIGN_INPUT="OFF" REGISTERED_OUTPUT="OFF" SIM_DPA_IS_NEGATIVE_PPM_DRIFT="OFF" SIM_DPA_NET_PPM_VARIATION=0 SIM_DPA_OUTPUT_CLOCK_PHASE_SHIFT=0 USE_CORECLOCK_INPUT="OFF" USE_DPLL_RAWPERROR="OFF" USE_EXTERNAL_PLL="ON" USE_NO_PHASE_SHIFT="ON" X_ON_BITSLIP="ON" rx_cda_reset rx_channel_data_align rx_data_align rx_data_align_reset rx_in rx_inclock rx_locked rx_out CARRY_CHAIN="MANUAL" CARRY_CHAIN_LENGTH=48 LOW_POWER_MODE="AUTO" ALTERA_INTERNAL_OPTIONS=AUTO_SHIFT_REGISTER_RECOGNITION=OFF
//VERSION_BEGIN 21.1 cbx_altaccumulate 2021:10:21:11:03:22:SJ cbx_altclkbuf 2021:10:21:11:03:22:SJ cbx_altddio_in 2021:10:21:11:03:22:SJ cbx_altddio_out 2021:10:21:11:03:22:SJ cbx_altera_syncram_nd_impl 2021:10:21:11:03:22:SJ cbx_altiobuf_bidir 2021:10:21:11:03:22:SJ cbx_altiobuf_in 2021:10:21:11:03:22:SJ cbx_altiobuf_out 2021:10:21:11:03:22:SJ cbx_altlvds_rx 2021:10:21:11:03:22:SJ cbx_altpll 2021:10:21:11:03:22:SJ cbx_altsyncram 2021:10:21:11:03:22:SJ cbx_arriav 2021:10:21:11:03:21:SJ cbx_cyclone 2021:10:21:11:03:22:SJ cbx_cycloneii 2021:10:21:11:03:22:SJ cbx_lpm_add_sub 2021:10:21:11:03:22:SJ cbx_lpm_compare 2021:10:21:11:03:21:SJ cbx_lpm_counter 2021:10:21:11:03:21:SJ cbx_lpm_decode 2021:10:21:11:03:21:SJ cbx_lpm_mux 2021:10:21:11:03:22:SJ cbx_lpm_shiftreg 2021:10:21:11:03:22:SJ cbx_maxii 2021:10:21:11:03:22:SJ cbx_mgl 2021:10:21:11:03:46:SJ cbx_nadder 2021:10:21:11:03:22:SJ cbx_stratix 2021:10:21:11:03:22:SJ cbx_stratixii 2021:10:21:11:03:22:SJ cbx_stratixiii 2021:10:21:11:03:22:SJ cbx_stratixv 2021:10:21:11:03:22:SJ cbx_util_mgl 2021:10:21:11:03:22:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 2021  Intel Corporation. All rights reserved.
//  Your use of Intel Corporation's design tools, logic functions 
//  and other software and tools, and any partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Intel Program License 
//  Subscription Agreement, the Intel Quartus Prime License Agreement,
//  the Intel FPGA IP License Agreement, or other applicable license
//  agreement, including, without limitation, that your use is for
//  the sole purpose of programming logic devices manufactured by
//  Intel and sold by Intel or its authorized distributors.  Please
//  refer to the applicable agreement for further details, at
//  https://fpgasoftware.intel.com/eula.




//alt_lvds_ddio_in ADD_LATENCY_REG="TRUE" CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" CBX_SINGLE_OUTPUT_FILE="ON" LVDS_RX_REG_SETTING="OFF" WIDTH=5 clock datain dataout_h dataout_l
//VERSION_BEGIN 21.1 cbx_altaccumulate 2021:10:21:11:03:22:SJ cbx_altclkbuf 2021:10:21:11:03:22:SJ cbx_altddio_in 2021:10:21:11:03:22:SJ cbx_altddio_out 2021:10:21:11:03:22:SJ cbx_altera_syncram_nd_impl 2021:10:21:11:03:22:SJ cbx_altiobuf_bidir 2021:10:21:11:03:22:SJ cbx_altiobuf_in 2021:10:21:11:03:22:SJ cbx_altiobuf_out 2021:10:21:11:03:22:SJ cbx_altlvds_rx 2021:10:21:11:03:22:SJ cbx_altpll 2021:10:21:11:03:22:SJ cbx_altsyncram 2021:10:21:11:03:22:SJ cbx_arriav 2021:10:21:11:03:21:SJ cbx_cyclone 2021:10:21:11:03:22:SJ cbx_cycloneii 2021:10:21:11:03:22:SJ cbx_lpm_add_sub 2021:10:21:11:03:22:SJ cbx_lpm_compare 2021:10:21:11:03:21:SJ cbx_lpm_counter 2021:10:21:11:03:21:SJ cbx_lpm_decode 2021:10:21:11:03:21:SJ cbx_lpm_mux 2021:10:21:11:03:22:SJ cbx_lpm_shiftreg 2021:10:21:11:03:22:SJ cbx_maxii 2021:10:21:11:03:22:SJ cbx_mgl 2021:10:21:11:03:46:SJ cbx_nadder 2021:10:21:11:03:22:SJ cbx_stratix 2021:10:21:11:03:22:SJ cbx_stratixii 2021:10:21:11:03:22:SJ cbx_stratixiii 2021:10:21:11:03:22:SJ cbx_stratixv 2021:10:21:11:03:22:SJ cbx_util_mgl 2021:10:21:11:03:22:SJ  VERSION_END

//synthesis_resources = reg 25 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"{-to ddio_h_reg*} PLL_COMPENSATE=ON;ADV_NETLIST_OPT_ALLOWED=\"NEVER_ALLOW\""} *)
module  altera_soft_lvds_rx_BWNr0_lvds_ddio_in_l9g
	( 
	clock,
	datain,
	dataout_h,
	dataout_l) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   [4:0]  datain;
	output   [4:0]  dataout_h;
	output   [4:0]  dataout_l;

	reg	[4:0]	dataout_h_reg;
	reg	[4:0]	dataout_l_latch;
	reg	[4:0]	dataout_l_reg;
	(* ALTERA_ATTRIBUTE = {"LVDS_RX_REGISTER=HIGH;PRESERVE_REGISTER=ON;PRESERVE_FANOUT_FREE_NODE=ON"} *)
	reg	[4:0]	ddio_h_reg;
	(* ALTERA_ATTRIBUTE = {"LVDS_RX_REGISTER=LOW;PRESERVE_REGISTER=ON;PRESERVE_FANOUT_FREE_NODE=ON"} *)
	reg	[4:0]	ddio_l_reg;

	// synopsys translate_off
	initial
		dataout_h_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  dataout_h_reg <= ddio_h_reg;
	// synopsys translate_off
	initial
		dataout_l_latch = 0;
	// synopsys translate_on
	always @ ( negedge clock)
		  dataout_l_latch <= ddio_l_reg;
	// synopsys translate_off
	initial
		dataout_l_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  dataout_l_reg <= dataout_l_latch;
	// synopsys translate_off
	initial
		ddio_h_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  ddio_h_reg <= datain;
	// synopsys translate_off
	initial
		ddio_l_reg = 0;
	// synopsys translate_on
	always @ ( negedge clock)
		  ddio_l_reg <= datain;
	assign
		dataout_h = dataout_l_reg,
		dataout_l = dataout_h_reg;
endmodule //altera_soft_lvds_rx_BWNr0_lvds_ddio_in_l9g


//dffpipe CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" CBX_SINGLE_OUTPUT_FILE="ON" DELAY=1 WIDTH=5 clock d q ALTERA_INTERNAL_OPTIONS=AUTO_SHIFT_REGISTER_RECOGNITION=OFF
//VERSION_BEGIN 21.1 cbx_mgl 2021:10:21:11:03:46:SJ cbx_stratixii 2021:10:21:11:03:22:SJ cbx_util_mgl 2021:10:21:11:03:22:SJ  VERSION_END

//synthesis_resources = reg 5 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"AUTO_SHIFT_REGISTER_RECOGNITION=OFF"} *)
module  altera_soft_lvds_rx_BWNr0_dffpipe_h8f
	( 
	clock,
	d,
	q) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   [4:0]  d;
	output   [4:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[4:0]	dffe11a;
	wire clrn;
	wire ena;
	wire prn;
	wire sclr;

	// synopsys translate_off
	initial
		dffe11a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge prn or  negedge clrn)
		if (prn == 1'b0) dffe11a <= {5{1'b1}};
		else if (clrn == 1'b0) dffe11a <= 5'b0;
		else if  (ena == 1'b1)   dffe11a <= (d & {5{(~ sclr)}});
	assign
		clrn = 1'b1,
		ena = 1'b1,
		prn = 1'b1,
		q = dffe11a,
		sclr = 1'b0;
endmodule //altera_soft_lvds_rx_BWNr0_dffpipe_h8f

//synthesis_resources = reg 55 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"AUTO_SHIFT_REGISTER_RECOGNITION=OFF"} *)
module  altera_soft_lvds_rx_BWNr0
	( 
	rx_cda_reset,
	rx_channel_data_align,
	rx_data_align,
	rx_data_align_reset,
	rx_in,
	rx_inclock,
	rx_locked,
	rx_out) /* synthesis synthesis_clearbox=1 */;
	input   [4:0]  rx_cda_reset;
	input   [4:0]  rx_channel_data_align;
	input   rx_data_align;
	input   rx_data_align_reset;
	input   [4:0]  rx_in;
	input   rx_inclock;
	output   rx_locked;
	output   [19:0]  rx_out;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [4:0]  rx_cda_reset;
	tri0   [4:0]  rx_channel_data_align;
	tri0   rx_data_align;
	tri0   rx_data_align_reset;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [4:0]   wire_ddio_in_dataout_h;
	wire  [4:0]   wire_ddio_in_dataout_l;
	reg	[1:0]	h_shiftreg10a;
	reg	[1:0]	h_shiftreg2a;
	reg	[1:0]	h_shiftreg4a;
	reg	[1:0]	h_shiftreg6a;
	reg	[1:0]	h_shiftreg8a;
	reg	[1:0]	l_shiftreg1a;
	reg	[1:0]	l_shiftreg3a;
	reg	[1:0]	l_shiftreg5a;
	reg	[1:0]	l_shiftreg7a;
	reg	[1:0]	l_shiftreg9a;
	wire  [4:0]   wire_h_dffpipe_q;
	wire  [4:0]   wire_l_dffpipe_q;
	wire  [4:0]  ddio_dataout_h;
	wire  [4:0]  ddio_dataout_h_int;
	wire  [4:0]  ddio_dataout_l;
	wire  [4:0]  ddio_dataout_l_int;
	wire  fast_clock;
	wire  [19:0]  rx_out_wire;

	altera_soft_lvds_rx_BWNr0_lvds_ddio_in_l9g   ddio_in
	( 
	.clock(fast_clock),
	.datain(rx_in),
	.dataout_h(wire_ddio_in_dataout_h),
	.dataout_l(wire_ddio_in_dataout_l));
	// synopsys translate_off
	initial
		h_shiftreg10a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg10a <= {h_shiftreg10a[0], ddio_dataout_l[4]};
	// synopsys translate_off
	initial
		h_shiftreg2a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg2a <= {h_shiftreg2a[0], ddio_dataout_l[0]};
	// synopsys translate_off
	initial
		h_shiftreg4a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg4a <= {h_shiftreg4a[0], ddio_dataout_l[1]};
	// synopsys translate_off
	initial
		h_shiftreg6a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg6a <= {h_shiftreg6a[0], ddio_dataout_l[2]};
	// synopsys translate_off
	initial
		h_shiftreg8a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg8a <= {h_shiftreg8a[0], ddio_dataout_l[3]};
	// synopsys translate_off
	initial
		l_shiftreg1a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg1a <= {l_shiftreg1a[0], ddio_dataout_h[0]};
	// synopsys translate_off
	initial
		l_shiftreg3a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg3a <= {l_shiftreg3a[0], ddio_dataout_h[1]};
	// synopsys translate_off
	initial
		l_shiftreg5a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg5a <= {l_shiftreg5a[0], ddio_dataout_h[2]};
	// synopsys translate_off
	initial
		l_shiftreg7a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg7a <= {l_shiftreg7a[0], ddio_dataout_h[3]};
	// synopsys translate_off
	initial
		l_shiftreg9a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg9a <= {l_shiftreg9a[0], ddio_dataout_h[4]};
	altera_soft_lvds_rx_BWNr0_dffpipe_h8f   h_dffpipe
	( 
	.clock(fast_clock),
	.d(ddio_dataout_h_int),
	.q(wire_h_dffpipe_q));
	altera_soft_lvds_rx_BWNr0_dffpipe_h8f   l_dffpipe
	( 
	.clock(fast_clock),
	.d(ddio_dataout_l_int),
	.q(wire_l_dffpipe_q));
	assign
		ddio_dataout_h = wire_h_dffpipe_q,
		ddio_dataout_h_int = wire_ddio_in_dataout_h,
		ddio_dataout_l = wire_l_dffpipe_q,
		ddio_dataout_l_int = wire_ddio_in_dataout_l,
		fast_clock = rx_inclock,
		rx_out = rx_out_wire,
		rx_out_wire = {l_shiftreg9a[1], h_shiftreg10a[1], l_shiftreg9a[0], h_shiftreg10a[0], l_shiftreg7a[1], h_shiftreg8a[1], l_shiftreg7a[0], h_shiftreg8a[0], l_shiftreg5a[1], h_shiftreg6a[1], l_shiftreg5a[0], h_shiftreg6a[0], l_shiftreg3a[1], h_shiftreg4a[1], l_shiftreg3a[0], h_shiftreg4a[0], l_shiftreg1a[1], h_shiftreg2a[1], l_shiftreg1a[0], h_shiftreg2a[0]};
endmodule //altera_soft_lvds_rx_BWNr0
//VALID FILE
