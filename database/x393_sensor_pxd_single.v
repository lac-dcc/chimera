// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>pxd_single
 * @file pxd_single.v
 * @date 2015-05-15  
 * @author Andrey Filippov     
 *
 * @brief pixel data line input
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * pxd_single.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  pxd_single.v is distributed in the hope that it will be useful,
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

module  pxd_single#(
    parameter IODELAY_GRP ="IODELAY_SENSOR", // may need different for different channels?
    parameter integer IDELAY_VALUE = 0,
    parameter integer PXD_DRIVE = 12,
    parameter PXD_IBUF_LOW_PWR = "TRUE",
    parameter PXD_IOSTANDARD = "DEFAULT",
    parameter PXD_SLEW = "SLOW",
    parameter real REFCLK_FREQUENCY = 300.0,
    parameter HIGH_PERFORMANCE_MODE = "FALSE"

)(
    inout        pxd,          // I/O pad
    input        pxd_out,      // data to be sent out through the pad (normally not used)
    input        pxd_en,       // enable data output (normally not used)
    output       pxd_async,    // direct ouptut from the pad (maybe change to delayed?), does not depend on clocks - use for TDI
    output       pxd_in,       // data output (@posedge ipclk?)
    input        ipclk,        // restored clock from the sensor, phase-shifted
    input        ipclk2x,      // restored clock from the sensor, phase-shifted, twice frequency
    input        mrst,         // reset @ posedge mclk
    input        irst,         // reset @ posedge iclk
    input        mclk,         // clock for setting delay values
    input  [7:0] dly_data,     // delay value (3 LSB - fine delay) - @posedge mclk
    input        set_idelay,   // mclk synchronous load idelay value
    input        ld_idelay,    // mclk synchronous set idealy value
    input  [1:0] quadrant       // select one of 4 90-degree shifts for the data (MT9P0xx) have VACT, HACT shifted from PXD
);
    wire pxd_iobuf;
    wire pxd_delayed;
    wire [3:0] dout;
    reg        pxd_r;
    
    assign pxd_in=pxd_r;
//    assign pxd_async = pxd_iobuf;
    always @ (posedge ipclk) begin
        if (irst) pxd_r <= 0;
        else      pxd_r <= quadrant[1]?(quadrant[0]? dout[3]: dout[2]) : (quadrant[0]? dout[1]: dout[0]);
    end
    
    iobuf #(
        .DRIVE        (PXD_DRIVE),
        .IBUF_LOW_PWR (PXD_IBUF_LOW_PWR),
        .IOSTANDARD   (PXD_IOSTANDARD),
        .SLEW         (PXD_SLEW)
    ) iobuf_pxd_i (
        .O     (pxd_iobuf), // output
        .IO    (pxd), // inout
        .I     (pxd_out), // input
        .T     (!pxd_en) // input
    );

//finedelay not supported by HR banks?
/*
    idelay_fine_pipe # (
        .IODELAY_GRP           (IODELAY_GRP),
        .DELAY_VALUE           (IDELAY_VALUE),
        .REFCLK_FREQUENCY      (REFCLK_FREQUENCY),
        .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE)
    ) pxd_dly_i(
        .clk          (mclk),
        .rst          (rst),
        .set          (set_idelay),
        .ld           (ld_idelay),
        .delay        (dly_data[7:0]),
        .data_in      (pxd_iobuf),
        .data_out     (pxd_delayed)
    );
    
 */
    idelay_nofine # (
        .IODELAY_GRP           (IODELAY_GRP),
        .DELAY_VALUE           (IDELAY_VALUE),
        .REFCLK_FREQUENCY      (REFCLK_FREQUENCY),
        .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE)
    ) pxd_dly_i(
        .clk          (mclk),
        .rst          (mrst),
        .set          (set_idelay),
        .ld           (ld_idelay),
        .delay        (dly_data[7:3]),
        .data_in      (pxd_iobuf),
        .data_out     (pxd_delayed)
    );
    
    iserdes_mem #(
        .DYN_CLKDIV_INV_EN("FALSE")
    ) iserdes_pxd_i (
        .iclk(ipclk2x),           // source-synchronous clock
        .oclk(ipclk2x),           // system clock, phase should allow iclk-to-oclk jitter with setup/hold margin
        .oclk_div(ipclk),         // oclk divided by 2, front aligned
        .inv_clk_div(1'b0),       // invert oclk_div (this clock is shared between iserdes and oserdes. Works only in MEMORY_DDR3 mode?
        .rst(irst),               // reset
        .d_direct(1'b0),          // direct input from IOB, normally not used, controlled by IOBDELAY parameter (set to "NONE")
        .ddly(pxd_delayed),       // serial input from idelay 
        .dout(dout[3:0]),         // parallel data out
        .comb_out(pxd_async)      // output
    );

endmodule

