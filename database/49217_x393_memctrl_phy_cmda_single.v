// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmda_single
 * @file cmda_single.v
 * @date 2014-04-26  
 * @author Andrey Filippov
 *
 * @brief Single-bit CMD/address output
 *
 * @copyright Copyright (c) 2014 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmda_single.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmda_single.v is distributed in the hope that it will be useful,
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

module  cmda_single #(
    parameter IODELAY_GRP ="IODELAY_MEMORY",
    parameter integer ODELAY_VALUE = 0,
    parameter IOSTANDARD = "SSTL15",
    parameter SLEW = "SLOW",
    parameter real REFCLK_FREQUENCY = 300.0,
    parameter HIGH_PERFORMANCE_MODE = "FALSE"
)(
    output       dq,           // I/O pad (appears on the output 1/2 clk_div earlier, than DDR data)
    input        clk,          // free-running system clock, same frequency as iclk (shared for R/W)
    input        clk_div,      // free-running half clk frequency, front aligned to clk (shared for R/W)
    input        rst,
    input  [7:0] dly_data,     // delay value (3 LSB - fine delay)
    input  [1:0] din,          // parallel data to be sent out
//    input  [1:0] tin,          // tristate for data out (sent out earlier than data!) 
    input        tin,          // tristate for data out (sent out earlier than data!) 
    input        set_delay,    // clk_div synchronous load odelay value from dly_data
    input        ld_delay      // clk_div synchronous set odealy value from loaded
);
wire d_ser;
wire dq_tri;
wire dq_data_dly;

oserdes_mem#(
    .MODE_DDR("FALSE")
)  oserdes_i (
    .clk(clk),          // serial output clock
    .clk_div(clk_div),  // oclk divided by 2, front aligned
    .rst(rst),          // reset
    .din(din[1:0]),     // parallel data in
//    .tin(tin[1:0]),     // parallel tri-state in
    .tin(tin),          // parallel tri-state in
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
) dqs_out_dly_i(
    .clk(clk_div),
    .rst(rst),
    .set(set_delay),
    .ld(ld_delay),
    .delay(dly_data[7:0]),
    .data_in(d_ser),
    .data_out(dq_data_dly)
);

OBUFT #(
    .IOSTANDARD(IOSTANDARD),
    .SLEW(SLEW)
) iobufs_dqs_i (
    .O(dq),
    .I(dq_data_dly),
    .T(dq_tri));

endmodule

