// This program was cloned from: https://github.com/zephray/RISu064
// License: MIT License

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
 *
 * user_analog_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user analog project.
 *
 *-------------------------------------------------------------
 */

module user_analog_project_wrapper (
//`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
//`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    /* GPIOs.  There are 27 GPIOs, on either side of the analog.
     * These have the following mapping to the GPIO padframe pins
     * and memory-mapped registers, since the numbering remains the
     * same as caravel but skips over the analog I/O:
     *
     * io_in/out/oeb/in_3v3 [26:14]  <--->  mprj_io[37:25]
     * io_in/out/oeb/in_3v3 [13:0]   <--->  mprj_io[13:0]	
     *
     * When the GPIOs are configured by the Management SoC for
     * user use, they have three basic bidirectional controls:
     * in, out, and oeb (output enable, sense inverted).  For
     * analog projects, a 3.3V copy of the signal input is
     * available.  out and oeb must be 1.8V signals.
     */

    input  [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_in,
    input  [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_in_3v3,
    output [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_oeb,

    /* Analog (direct connection to GPIO pad---not for high voltage or
     * high frequency use).  The management SoC must turn off both
     * input and output buffers on these GPIOs to allow analog access.
     * These signals may drive a voltage up to the value of VDDIO
     * (3.3V typical, 5.5V maximum).
     * 
     * Note that analog I/O is not available on the 7 lowest-numbered
     * GPIO pads, and so the analog_io indexing is offset from the
     * GPIO indexing by 7, as follows:
     *
     * gpio_analog/noesd [17:7]  <--->  mprj_io[35:25]
     * gpio_analog/noesd [6:0]   <--->  mprj_io[13:7]	
     *
     */
    
    inout [`MPRJ_IO_PADS-`ANALOG_PADS-10:0] gpio_analog,
    inout [`MPRJ_IO_PADS-`ANALOG_PADS-10:0] gpio_noesd,

    /* Analog signals, direct through to pad.  These have no ESD at all,
     * so ESD protection is the responsibility of the designer.
     *
     * user_analog[10:0]  <--->  mprj_io[24:14]
     *
     */
    inout [`ANALOG_PADS-1:0] io_analog,

    /* Additional power supply ESD clamps, one per analog pad.  The
     * high side should be connected to a 3.3-5.5V power supply.
     * The low side should be connected to ground.
     *
     * clamp_high[2:0]   <--->  mprj_io[20:18]
     * clamp_low[2:0]    <--->  mprj_io[20:18]
     *
     */
    inout [2:0] io_clamp_high,
    inout [2:0] io_clamp_low,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

    wire rst;
    reg rst_sync1;
    reg rst_sync2;
    assign rst = rst_sync2;
    always @(posedge user_clock2) begin
        rst_sync2 <= rst_sync1;
        rst_sync1 <= wb_rst_i;
    end

    // All external inputs are assumed to be synchronous
    wire ml_clk;
    wire ml_clkn;
    wire ml_abr;
    wire ml_bbr;
    wire [21:0] ml_data_o;
    wire [21:0] ml_data_i;
    wire ml_data_oe;
    wire ml_data_ie;
    wire extint_software;
    wire extint_timer;
    wire extint_external;

    asictop asictop (
        .clk(user_clock2),
        .rst(rst),
        .ml_clk(ml_clk),
        .ml_clkn(ml_clkn),
        .ml_abr(ml_abr),
        .ml_bbr(ml_bbr),
        .ml_data_o(ml_data_o),
        .ml_data_i(ml_data_i),
        .ml_data_oe(ml_data_oe),
        .ml_data_ie(ml_data_ie),
        .extint_software(extint_software),
        .extint_timer(extint_timer),
        .extint_external(extint_external)
    );

    wire [1:0] irq_in;

    assign extint_software = irq_in == 2'd1;
    assign extint_external = irq_in == 2'd2;
    assign extint_timer = irq_in == 2'd3;

    assign io_out[21:0] = ml_data_o;
    assign io_oeb[21:0] = {22{!ml_data_oe}};
    assign ml_data_i = io_in[21:0];
    assign io_out[22] = ml_abr;
    assign io_oeb[22] = 1'b0;
    assign io_out[23] = 1'b0;
    assign ml_bbr = io_in[23];
    assign io_oeb[23] = 1'b1;
    assign io_out[25:24] = 3'd0;
    assign irq_in = io_in[25:24];
    assign io_oeb[25:24] = 2'b11;
    assign io_out[26] = ml_clk;
    assign io_oeb[26] = 1'b0;

    // Analog part
    /*wire comp;
    wire [9:0] ctlp;
    wire [9:0] ctln;
    wire [4:0] trim;
    wire [4:0] trimb;
    wire clkc;

    wire en;
    wire cal;
    wire valid;
    wire [9:0] result;
    wire sample;*/

    /*wire [31:0] therm_in;
    wire therm_do;
    wire therm_fs;*/

    analog_area analog_area(
        .analog_la_in(la_data_in[29:0]),
        .analog_la_out(la_data_out[29:0])
        /*.comp(comp),
        .ctlp(ctlp),
        .ctln(ctln),
        .trim(trim),
        .trimb(trimb),
        .clkc(clkc)*/
        /*.clk(user_clock2),
        .rst(rst),
        .therm_in(therm_in),
        .therm_do(therm_do),
        .therm_fs(therm_fs)*/
    );

    /*sarlogic sarlogic(
        .clk(user_clock2),
        .rstn(!wb_rst_i),
        .en(en),
        .comp(comp),
        .cal(cal),
        .valid(valid),
        .result(result),
        .sample(sample),
        .ctlp(ctlp),
        .ctln(ctln),
        .trim(trim),
        .trimb(trimb),
        .clkc(clkc),
    );

    assign en = la_data_in[30];
    assign cal = la_data_in[31];
    assign la_data_out[30] = valid;
    assign la_data_out[31] = sample;
    assign la_data_out[41:32] = result;*/

    /*therm_out therm_out(
        .clk(user_clock2),
        .rst(rst),
        .therm_in(therm_in),
        .therm_do(therm_do),
        .therm_fs(therm_fs)
    );*/

    // TEST
    //assign io_out[26:0] = 27'b0;
    //assign io_oeb[26:0] = {27{1'b1}};

    // Tie-off unused signals
    assign la_data_out[127:30] = 98'd0;
    assign wbs_ack_o = 1'b0;
    assign wbs_dat_o = 32'd0;

    assign user_irq = 3'b0;

endmodule
