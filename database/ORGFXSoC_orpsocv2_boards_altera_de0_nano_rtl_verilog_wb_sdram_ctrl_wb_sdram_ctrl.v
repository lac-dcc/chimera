/*
 * Copyright (c) 2011, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
 * All rights reserved.
 *
 * Redistribution and use in source and non-source forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in non-source form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *
 * THIS WORK IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * WORK, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

module wb_sdram_ctrl #(
	parameter CLK_FREQ_MHZ	= 100,	// sdram_clk freq in MHZ
	parameter POWERUP_DELAY	= 200,	// power up delay in us
	parameter BURST_LENGTH	= 8,	// 0, 1, 2, 4 or 8 (0 = full page)
	parameter WB_PORTS	= 3,	// Number of wishbone ports
	parameter BUF_WIDTH	= 3,	// Buffer size = 2^BUF_WIDTH
	parameter ROW_WIDTH	= 13,	// Row width
	parameter COL_WIDTH	= 9,	// Column width
	parameter BA_WIDTH	= 2,	// Ba width
	parameter tCAC		= 2,	// CAS Latency
	parameter tRAC		= 5,	// RAS Latency
	parameter tRP		= 2,	// Command Period (PRE to ACT)
	parameter tRC		= 7,	// Command Period (REF to REF / ACT to ACT)
	parameter tMRD		= 2	// Mode Register Set To Command Delay time
)
(
	// SDRAM interface
	input				sdram_rst,
	input				sdram_clk,
	output [BA_WIDTH-1:0]		ba_pad_o,
	output [12:0]			a_pad_o,
	output				cs_n_pad_o,
	output				ras_pad_o,
	output				cas_pad_o,
	output				we_pad_o,
	output [15:0]			dq_o,
	output [1:0]			dqm_pad_o,
	input  [15:0]			dq_i,
	output				dq_oe,
	output				cke_pad_o,

	// Wishbone interface
	input				wb_clk,
	input				wb_rst,
	input  [WB_PORTS*32-1:0]	wb_adr_i,
	input  [WB_PORTS-1:0]		wb_stb_i,
	input  [WB_PORTS-1:0]		wb_cyc_i,
	input  [WB_PORTS*3-1:0]		wb_cti_i,
	input  [WB_PORTS*2-1:0]		wb_bte_i,
	input  [WB_PORTS-1:0]		wb_we_i,
	input  [WB_PORTS*4-1:0]		wb_sel_i,
	input  [WB_PORTS*32-1:0]	wb_dat_i,
	output [WB_PORTS*32-1:0]	wb_dat_o,
	output [WB_PORTS-1:0]		wb_ack_o
);

	wire			sdram_if_idle;
	wire [31:0]		sdram_if_adr_i;
	wire [31:0]		sdram_if_adr_o;
	wire [15:0]		sdram_if_dat_i;
	wire [15:0]		sdram_if_dat_o;
	wire [1:0]		sdram_if_sel_i;
	wire			sdram_if_acc;
	wire			sdram_if_we;
	wire			sdram_if_ack;

	sdram_ctrl #(
		.CLK_FREQ_MHZ	(CLK_FREQ_MHZ),
		.POWERUP_DELAY	(POWERUP_DELAY),
		.BURST_LENGTH	(BURST_LENGTH),
		.ROW_WIDTH	(ROW_WIDTH),
		.COL_WIDTH	(COL_WIDTH),
		.BA_WIDTH	(BA_WIDTH),
		.tCAC		(tCAC),
		.tRAC		(tRAC),
		.tRP		(tRP),
		.tRC		(tRC),
		.tMRD		(tMRD)
	)
	sdram_ctrl (
		// SDRAM interface
		.sdram_rst	(sdram_rst),
		.sdram_clk	(sdram_clk),
		.ba_o		(ba_pad_o),
		.a_o		(a_pad_o),
		.cs_n_o		(cs_n_pad_o),
		.ras_o		(ras_pad_o),
		.cas_o		(cas_pad_o),
		.we_o		(we_pad_o),
		.dq_o		(dq_o),
		.dqm_o		(dqm_pad_o),
		.dq_i		(dq_i),
		.dq_oe_o	(dq_oe),
		.cke_o		(cke_pad_o),
		// Internal interface
		.idle_o		(sdram_if_idle),
		.adr_i		(sdram_if_adr_i),
		.adr_o		(sdram_if_adr_o),
		.dat_i		(sdram_if_dat_i),
		.dat_o		(sdram_if_dat_o),
		.sel_i		(sdram_if_sel_i),
		.acc_i		(sdram_if_acc),
		.ack_o		(sdram_if_ack),
		.we_i		(sdram_if_we)
	);

	arbiter #(
		.WB_PORTS	(WB_PORTS),
		.BUF_WIDTH	(BUF_WIDTH)
	)
	arbiter (
		.wb_clk		(wb_clk),
		.wb_rst		(wb_rst),

		.wb_adr_i	(wb_adr_i),
		.wb_stb_i	(wb_stb_i),
		.wb_cyc_i	(wb_cyc_i),
		.wb_cti_i	(wb_cti_i),
		.wb_bte_i	(wb_bte_i),
		.wb_we_i	(wb_we_i),
		.wb_sel_i	(wb_sel_i),
		.wb_dat_i	(wb_dat_i),
		.wb_dat_o	(wb_dat_o),
		.wb_ack_o	(wb_ack_o),

		// Internal interface
		.sdram_rst	(sdram_rst),
		.sdram_clk	(sdram_clk),
		.sdram_idle_i	(sdram_if_idle),
		.adr_i		(sdram_if_adr_o),
		.adr_o		(sdram_if_adr_i),
		.dat_i		(sdram_if_dat_o),
		.dat_o		(sdram_if_dat_i),
		.sel_o		(sdram_if_sel_i),
		.acc_o		(sdram_if_acc),
		.ack_i		(sdram_if_ack),
		.we_o		(sdram_if_we)
	);
endmodule
