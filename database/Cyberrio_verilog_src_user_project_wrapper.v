// This program was cloned from: https://github.com/hello-eternity/Cyberrio
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
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

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

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

core my_core (
`ifdef USE_POWER_PINS
    .vccd1(vccd1), // User area 1 1.8V power
    .vssd1(vssd1), // User area 1 digital ground
`endif

    .clk(wb_clk_i),
    .reset(wb_rst_i),
    .meip(user_irq[0]), // Assuming user_irq[0] is MEIP (Machine External Interrupt Pending)

    // Memory interface (connected to Wishbone)
    .ext_valid(wbs_cyc_i & wbs_stb_i),  // External Valid signal asserted when Wishbone cycle and strobe are high
    .ext_instruction(wbs_we_i),  // Assuming ext_instruction is equivalent to Wishbone write-enable
    .ext_ready(wbs_ack_o),       // Assuming ext_ready is equivalent to Wishbone acknowledge
    .ext_address(wbs_adr_i),
    .ext_write_data(wbs_dat_i),
    .ext_write_strobe(wbs_sel_i),
    .ext_read_data(wbs_dat_o)
);

/*--------------------------------------*/
/* Unused signals are tied off here    */
/*--------------------------------------*/

// IOs
assign io_out = {`MPRJ_IO_PADS{1'b0}}; // Unused I/Os are tied off to ground
assign io_oeb = {`MPRJ_IO_PADS{1'b1}}; // Unused I/Os are tied off to ground

// IRQ
assign user_irq = 3'b000; // Unused

// LA
assign la_data_out = 128'h0; // Unused

endmodule