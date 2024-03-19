/*
 * Test bench for VPI JTAG Interface
 *
 * SPDX-FileCopyrightText: 2012 Franck Jullien <franck.jullien@gmail.com>
 * SPDX-License-Identifier: BSD-3-Clause
 */

module jtag_soc
(
	input	sys_clock,
	input	sys_reset,
	output	tdo_pad_o,
	input	tck_pad_i,
	input	tms_pad_i,
	input	tdi_pad_i
);

wire		jtag_tap_tdo;
wire		jtag_tap_shift_dr;
wire		jtag_tap_pause_dr;
wire		jtag_tap_update_dr;
wire		jtag_tap_capture_dr;
wire		dbg_if_tdo;
wire		dbg_if_select;

wire	[31:0]	wb_adr;
wire	[31:0]	wb_dat;
wire	[3:0]	wb_sel;
wire		wb_we;
wire	[1:0]	wb_bte;
wire	[2:0]	wb_cti;
wire		wb_cyc;
wire		wb_stb;
wire		wb_ack;
wire		wb_err;
wire	[31:0]	wb_sdt;

jtag_tap jtag_tap0
(
	.tdo_pad_o			(tdo_pad_o),
	.tms_pad_i			(tms_pad_i),
	.tck_pad_i			(tck_pad_i),
	.trst_pad_i			(1'b0),
	.tdi_pad_i			(tdi_pad_i),

	.tdo_padoe_o			(),

	.tdo_o				(jtag_tap_tdo),

	.shift_dr_o			(jtag_tap_shift_dr),
	.pause_dr_o			(jtag_tap_pause_dr),
	.update_dr_o			(jtag_tap_update_dr),
	.capture_dr_o			(jtag_tap_capture_dr),

	.extest_select_o		(),
	.sample_preload_select_o	(),
	.mbist_select_o			(),
	.debug_select_o			(dbg_if_select),

	.bs_chain_tdi_i			(1'b0),
	.mbist_tdi_i			(1'b0),
	.debug_tdi_i			(dbg_if_tdo)
);

adv_dbg_if dbg_if0
(
	// OR1200 interface
	.cpu0_clk_i			(sys_clock),
	.cpu0_rst_o			(),
	.cpu0_addr_o			(),
	.cpu0_data_o			(),
	.cpu0_stb_o			(),
	.cpu0_we_o			(),
	.cpu0_data_i			(32'b0),
	.cpu0_ack_i			(1'b1),
	.cpu0_stall_o			(),
	.cpu0_bp_i			(),

	// TAP interface
	.tck_i				(tck_pad_i),
	.tdi_i				(jtag_tap_tdo),
	.tdo_o				(dbg_if_tdo),
	.rst_i				(sys_reset),
	.capture_dr_i 			(jtag_tap_capture_dr),
	.shift_dr_i			(jtag_tap_shift_dr),
	.pause_dr_i			(jtag_tap_pause_dr),
	.update_dr_i			(jtag_tap_update_dr),
	.debug_select_i			(dbg_if_select),

	// Wishbone debug master
	.wb_clk_i			(sys_clock),
	.wb_rst_i			(sys_reset),
	.wb_dat_i			(wb_sdt),
	.wb_ack_i			(wb_ack),
	.wb_err_i			(wb_err),
	.wb_adr_o			(wb_adr),
	.wb_dat_o			(wb_dat),
	.wb_cyc_o			(wb_cyc),
	.wb_stb_o			(wb_stb),
	.wb_sel_o			(wb_sel),
	.wb_we_o			(wb_we),
	.wb_cti_o			(wb_cti),
	.wb_bte_o			(wb_bte)
);

ram_wb_b3 ram
(
	.wb_clk_i			(sys_clock),
	.wb_rst_i			(sys_reset),

	.wb_adr_i			(wb_adr),
	.wb_dat_i			(wb_dat),
	.wb_sel_i			(wb_sel),
	.wb_we_i			(wb_we),
	.wb_bte_i			(wb_bte),
	.wb_cti_i			(wb_cti),
	.wb_cyc_i			(wb_cyc),
	.wb_stb_i			(wb_stb),

	.wb_ack_o			(wb_ack),
	.wb_err_o			(wb_err),
	.wb_rty_o			(),
	.wb_dat_o			(wb_sdt)
);

endmodule
