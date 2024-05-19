// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>dq_single
 * @file dq_single.v
 * @date 2014-04-26  
 * @author Andrey Filippov
 *
 * @brief Single-bit DDR3 DQ I/O, same used for DM
 *
 * @copyright Copyright (c) 2014 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * dq_single.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  dq_single.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 */
`timescale 1ns/1ps

module  dq_single #(
    parameter IODELAY_GRP ="IODELAY_MEMORY",
    parameter integer IDELAY_VALUE = 0,
    parameter integer ODELAY_VALUE = 0,
    parameter IBUF_LOW_PWR ="TRUE",
    parameter IOSTANDARD = "SSTL15_T_DCI",
    parameter SLEW = "SLOW",
    parameter real REFCLK_FREQUENCY = 300.0,
    parameter HIGH_PERFORMANCE_MODE = "FALSE"
)(
    inout        dq,           // I/O pad
    input        iclk,         // source-synchronous clock (BUFR from DQS)
    input        clk,          // free-running system clock, same frequency as iclk (shared for R/W)
    input        clk_div,      // free-running half clk frequency, front aligned to clk (shared for R/W)
    input        inv_clk_div,  // invert clk_div for R channel (clk_div is shared between R and W)
    input        rst,
    input        dci_disable,  // disable DCI termination during writes and idle
    input  [7:0] dly_data,     // delay value (3 LSB - fine delay)
    input  [3:0] din,          // parallel data to be sent out
    input  [3:0] tin,          // tristate for data out (sent out earlier than data!) 
    output [3:0] dout,         // parallel data received from DDR3 memory
    input        set_odelay,   // clk_div synchronous load odelay value from dly_data
    input        ld_odelay,    // clk_div synchronous set odealy value from loaded
    input        set_idelay,   // clk_div synchronous load idelay value from dly_data
    input        ld_idelay     // clk_div synchronous set idealy value from loaded
);
wire d_ser;
wire dq_tri;
wire dq_data_dly;
wire dq_dly;
// keep IOBUF_DCIEN.O to user as output only (UDM/LDM), so the rest of tyhe read channel will be optimized out, but I/O will stay the same
wire dq_di;


oserdes_mem#(
    .MODE_DDR("TRUE")
)  oserdes_i (
    .clk(clk),          // serial output clock
    .clk_div(clk_div),  // oclk divided by 2, front aligned
    .rst(rst),          // reset
    .din(din[3:0]),     // parallel data in
    .tin(tin[3:0]),     // parallel tri-state in
    .dout_dly(d_ser),   // data out to be connected to odelay input
    .dout_iob(),        // data out to be connected directly to the output buffer
    .tout_dly(),        // tristate out to be connected to odelay input
    .tout_iob(dq_tri)  // tristate out to be connected directly to the tristate control of the output buffer
);
odelay_fine_pipe # (
    .IODELAY_GRP(IODELAY_GRP),
    .DELAY_VALUE(ODELAY_VALUE),
    .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
    .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE)
) dq_out_dly_i(
    .clk(clk_div),
    .rst(rst),
    .set(set_odelay),
    .ld(ld_odelay),
    .delay(dly_data[7:0]),
    .data_in(d_ser),
    .data_out(dq_data_dly)
);

IOBUF_DCIEN #(
    .IBUF_LOW_PWR(IBUF_LOW_PWR), //
    .IOSTANDARD(IOSTANDARD),
    .SLEW(SLEW),
    .USE_IBUFDISABLE("FALSE")
) iobufs_dq_i (
    .O(dq_di),
    .IO(dq),
    .DCITERMDISABLE(dci_disable),
    .IBUFDISABLE(1'b0),
    .I(dq_data_dly), //dqs_data),
    .T(dq_tri));
    
idelay_fine_pipe # (
    .IODELAY_GRP(IODELAY_GRP),
    .DELAY_VALUE(IDELAY_VALUE),
    .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
    .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE)
) dq_in_dly_i(
    .clk(clk_div),
    .rst(rst),
    .set(set_idelay),
    .ld(ld_idelay),
    .delay(dly_data[7:0]),
    .data_in(dq_di),
    .data_out(dq_dly)
);

iserdes_mem #(
    .DYN_CLKDIV_INV_EN("FALSE")
) iserdes_mem_i (
    .iclk(iclk),              // source-synchronous clock
    .oclk(clk),               // system clock, phase should allow iclk-to-oclk jitter with setup/hold margin
    .oclk_div(clk_div),       // oclk divided by 2, front aligned
    .inv_clk_div(inv_clk_div),       // invert oclk_div (this clock is shared between iserdes and oserdes. Works only in MEMORY_DDR3 mode?
    .rst(rst),                // reset
    .d_direct(1'b0),          // direct input from IOB, normally not used, controlled by IOBDELAY parameter (set to "NONE")
    .ddly(dq_dly),            // serial input from idelay 
    .dout(dout[3:0]),          // parallel data out
    .comb_out()      // output
);

endmodule

