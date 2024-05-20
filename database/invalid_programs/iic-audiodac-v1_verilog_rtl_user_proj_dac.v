// This program was cloned from: https://github.com/iic-jku/iic-audiodac-v1
// License: Apache License 2.0

// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *-------------------------------------------------------------
 */


`ifndef MPRJ_IO_PADS
`define MPRJ_IO_PADS 38
`endif

module user_proj_dac #(
    parameter BITS = 32
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    /* verilator lint_off UNUSED */
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    /* verilator lint_on UNUSED */
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    output [2:0] irq,

    // Clock
    input user_clock2,

    // Analog IO
    inout [`MPRJ_IO_PADS-10:0] analog_io
);

// Assign unused outputs
assign 		irq = 3'b000;
assign 		wbs_dat_o = 0;
assign 		wbs_ack_o = 0;
assign 		la_data_out[127:0] = 0;
assign 		io_out[2:0] = 0;
assign 		io_out[37:13] = 0;

// Switch IO outputs into correct direction
assign 		io_oeb = ~({`MPRJ_IO_PADS{1'b0}} |1<<12|1<<11|1<<10|1<<9|1<<8|1<<7|1<<6|1<<5|1<<4|1<<3);

// Assign dummies for linting
/* verilator lint_off UNUSED */
wire [127:30] 	dummy1 = la_data_in[127:30];
wire [127:0]	dummy2 = la_oenb[127:0];
wire [37:37]	dummy3 = io_in[37];
wire [12:0]	dummy4 = io_in[12:0];
wire		dummy5 = io_in[13]; // spare
wire [3:0]	used_for_driver = io_in[17:14];
wire [28:0]	dummy6 = analog_io[28:0];
/* verilator lint_on UNUSED */

// Assign GPIO inputs (14-17 reserved for DRV)
wire	[15:0]	fifo_dat_i = io_in[33:18];
wire 		fifo_rdy_i = io_in[34];
wire		reset_n_i = io_in[35];
wire		fifo_rdy2_i = io_in[36];

// Assign GPIO outputs (14-17 reserved for DRV)
wire		fifo_ack_o, fifo_full_o, fifo_empty_o, ds_o, ds_n_o;
wire		fifo_ack2_o, fifo_full2_o, fifo_empty2_o, ds2_o, ds2_n_o;
assign		io_out[3] = fifo_ack2_o;
assign		io_out[4] = fifo_full2_o;
assign		io_out[5] = fifo_empty2_o;
assign		io_out[6] = ds2_o;
assign		io_out[7] = ds2_n_o;
assign		io_out[8] = fifo_ack_o;
assign		io_out[9] = fifo_full_o;
assign		io_out[10] = fifo_empty_o;
assign		io_out[11] = ds_o;
assign		io_out[12] = ds_n_o;

// Assign LA inputs
wire		cfg_mode_i = la_data_in[0];
wire [3:0]	cfg_volume_i = la_data_in[4:1];
wire [1:0]	cfg_osr_i = la_data_in[6:5];
wire		tst_sinegen_en_i = la_data_in[7];
wire [3:0]	tst_sinegen_step_i = la_data_in[11:8];
wire		tst_fifo_loop_i = la_data_in[12];
wire [3:0]	tst_sine_psc_i = la_data_in[16:13];
wire		tst_mode_i = la_data_in[17];
wire [7:0]	cfg_volume2_i = la_data_in[25:18];
wire		cfg_mute_i = la_data_in[26];
wire		cfg_mode2_i = la_data_in[27];
wire [1:0]	cfg_osr2_i = la_data_in[29:28];


// Assign LA outputs


// Connect ds-modulator

audiodac dac0 (
`ifdef USE_POWER_PINS
	.vccd1(vccd1),
	.vssd1(vssd1),
`endif
	.fifo_i(fifo_dat_i),
	.fifo_rdy_i(fifo_rdy_i),
	.fifo_ack_o(fifo_ack_o),
	.fifo_full_o(fifo_full_o),
	.fifo_empty_o(fifo_empty_o),
	.rst_n_i(reset_n_i),
	.clk_i(user_clock2),
	.mode_i(cfg_mode_i),
	.volume_i(cfg_volume_i),
	.osr_i(cfg_osr_i),
	.ds_o(ds_o),
	.ds_n_o(ds_n_o),
	.tst_sinegen_en_i(tst_sinegen_en_i),
	.tst_sinegen_step_i(tst_sinegen_step_i),
	.tst_fifo_loop_i(tst_fifo_loop_i)
);

stud_dac_dsmod dac1 (
`ifdef USE_POWER_PINS
	.vccd1(vccd1),
	.vssd1(vssd1),
`endif
	.fifo_i(fifo_dat_i),
    	.fifo_rdy_i(fifo_rdy2_i),
    	.fifo_ack_o(fifo_ack2_o),
    	.fifo_full_o(fifo_full2_o),
    	.fifo_empty_o(fifo_empty2_o),
	.ds_o(ds2_o),
	.ds_n_o(ds2_n_o),
    	.rst_n_i(reset_n_i),
    	.clk_i(user_clock2),
    	.volume_i(cfg_volume2_i),
    	.mute_i(cfg_mute_i),
    	.mode_i(cfg_mode2_i),
    	.osr_i(cfg_osr2_i),
    	.test_mode_i(tst_mode_i),
    	.test_sine_psc_i(tst_sine_psc_i)
);

endmodule // user_proj_dac

`default_nettype wire
