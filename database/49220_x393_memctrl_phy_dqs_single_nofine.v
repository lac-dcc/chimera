// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>dqs_single_nofine
 * @file dqs_single_nofine.v
 * @date 2014-04-26  
 * @author Andrey Filippov
 *
 * @brief Single-bit DDR3 DQS I/O
 *
 * @copyright Copyright (c) 2014 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * dqs_single_nofine.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  dqs_single_nofine.v is distributed in the hope that it will be useful,
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
module  dqs_single_nofine #(
    parameter IODELAY_GRP ="IODELAY_MEMORY",
    parameter integer IDELAY_VALUE = 0, // same scale as for fine delay
    parameter integer ODELAY_VALUE = 0,
    parameter IBUF_LOW_PWR ="TRUE",
    parameter IOSTANDARD = "DIFF_SSTL15_T_DCI",
    parameter SLEW = "SLOW",
    parameter real REFCLK_FREQUENCY = 300.0,
    parameter HIGH_PERFORMANCE_MODE = "FALSE"
    
)(
    inout       dqs,
    inout       ndqs,
    input       clk,
    input       clk_div,
    input       rst,
    output      dqs_received_dly,
//    output      dqs_di, // debugging:
     //Input buffer ddrc_sequencer_i/phy_cmd_i/phy_top_i/byte_lane0_i/dqs_i/iobufs_dqs_i/IBUFDS/IBUFDS_S (in ddrc_sequencer_i/phy_cmd_i/phy_top_i/byte_lane0_i/dqs_i/iobufs_dqs_i macro) has no loads. An input buffer must drive an internal load.
     
    input       dci_disable,  // disable DCI termination during writes and idle
    input [7:0] dly_data,
    input [3:0] din,
    input [3:0] tin,
    input       set_odelay,
    input       ld_odelay,
    input       set_idelay,
    input       ld_idelay
);
wire d_ser;
wire dqs_tri;
wire dqs_data_dly;
wire dqs_di;


oserdes_mem oserdes_i (
    .clk(clk),          // serial output clock
    .clk_div(clk_div),  // oclk divided by 2, front aligned
    .rst(rst),          // reset
    .din(din[3:0]),     // parallel data in
    .tin(tin[3:0]),     // parallel tri-state in
    .dout_dly(d_ser),   // data out to be connected to odelay input
    .dout_iob(),        // data out to be connected directly to the output buffer
    .tout_dly(),        // tristate out to be connected to odelay input
    .tout_iob(dqs_tri)  // tristate out to be connected directly to the tristate control of the output buffer
);
odelay_fine_pipe # (
    .IODELAY_GRP(IODELAY_GRP),
    .DELAY_VALUE(ODELAY_VALUE),
    .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
    .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE)
) dqs_out_dly_i(
    .clk(clk_div),
    .rst(rst),
    .set(set_odelay),
    .ld(ld_odelay),
    .delay(dly_data[7:0]),
    .data_in(d_ser),
    .data_out(dqs_data_dly)
);

IOBUFDS_DCIEN #(
    .DIFF_TERM("FALSE"),
    .DQS_BIAS("TRUE"),     // outputs 1'b0 when IOB is floating
    .IBUF_LOW_PWR(IBUF_LOW_PWR), //
    .IOSTANDARD(IOSTANDARD),
    .SLEW(SLEW),
    .USE_IBUFDISABLE("FALSE")
) iobufs_dqs_i (
    .O(dqs_di),
    .IO(dqs),
    .IOB(ndqs),
    .DCITERMDISABLE(dci_disable),
    .IBUFDISABLE(1'b0),
    .I(dqs_data_dly), //dqs_data),
    .T(dqs_tri));
idelay_nofine # (
    .IODELAY_GRP(IODELAY_GRP),
    .DELAY_VALUE(IDELAY_VALUE>>3),
    .REFCLK_FREQUENCY(REFCLK_FREQUENCY),
    .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE)
) dqs_in_dly_i(
    .clk(clk_div),
    .rst(rst),
    .set(set_idelay),
    .ld(ld_idelay),
    .delay(dly_data[7:3]),
    .data_in(dqs_di),
    .data_out(dqs_received_dly)
);
endmodule

