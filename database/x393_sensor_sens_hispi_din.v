// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sens_hispi_din
 * @file sens_hispi_din.v
 * @date 2015-10-13  
 * @author Andrey Filippov     
 *
 * @brief Input differential receivers for HiSPi lanes
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * sens_hispi_din.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sens_hispi_din.v is distributed in the hope that it will be useful,
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

module  sens_hispi_din #(
    parameter IODELAY_GRP =             "IODELAY_SENSOR", // may need different for different channels?
    parameter integer IDELAY_VALUE =     0,
    parameter real REFCLK_FREQUENCY =    200.0,
    parameter HIGH_PERFORMANCE_MODE =   "FALSE",

    parameter HISPI_NUMLANES =            4,
    parameter HISPI_CAPACITANCE =        "DONT_CARE",
    parameter HISPI_DIFF_TERM =          "TRUE",
    parameter HISPI_UNTUNED_SPLIT =      "FALSE", // Very power-hungry
    parameter HISPI_DQS_BIAS =           "TRUE",
    parameter HISPI_IBUF_DELAY_VALUE =   "0",
    parameter HISPI_IBUF_LOW_PWR =       "TRUE",
    parameter HISPI_IFD_DELAY_VALUE =    "AUTO",
    parameter HISPI_IOSTANDARD =         "DIFF_SSTL18_I" //"DIFF_SSTL18_II" for high current (13.4mA vs 8mA)
)(
    input                           mclk,
    input                           mrst,
    input  [HISPI_NUMLANES * 8-1:0] dly_data,     // delay value (3 LSB - fine delay) - @posedge mclk
    input      [HISPI_NUMLANES-1:0] set_idelay,   // mclk synchronous load idelay value
    input                           ld_idelay,    // mclk synchronous set idealy value
    input                           ipclk,   // 165 MHz
    input                           ipclk2x, // 330 MHz
    input                           irst,    // reset @posedge iclk
    input      [HISPI_NUMLANES-1:0] din_p,
    input      [HISPI_NUMLANES-1:0] din_n,
    output [HISPI_NUMLANES * 4-1:0] dout

);
    wire   [HISPI_NUMLANES-1:0] din;
    wire   [HISPI_NUMLANES-1:0] din_dly;

    generate
        genvar i;
        for (i=0; i < HISPI_NUMLANES; i=i+1) begin: din_block
            if (HISPI_UNTUNED_SPLIT == "TRUE") begin
                ibufds_ibufgds_50 #(
                    .CAPACITANCE      (HISPI_CAPACITANCE),
                    .DIFF_TERM        (HISPI_DIFF_TERM),
                    .DQS_BIAS         (HISPI_DQS_BIAS),
                    .IBUF_DELAY_VALUE (HISPI_IBUF_DELAY_VALUE),
                    .IBUF_LOW_PWR     (HISPI_IBUF_LOW_PWR),
                    .IFD_DELAY_VALUE  (HISPI_IFD_DELAY_VALUE),
                    .IOSTANDARD       (HISPI_IOSTANDARD)
                ) ibufds_ibufgds0_i (
                    .O    (din[i]),   // output
                    .I    (din_p[i]), // input
                    .IB   (din_n[i])  // input
                );
            end else begin
                ibufds_ibufgds #(
                    .CAPACITANCE      (HISPI_CAPACITANCE),
                    .DIFF_TERM        (HISPI_DIFF_TERM),
                    .DQS_BIAS         (HISPI_DQS_BIAS),
                    .IBUF_DELAY_VALUE (HISPI_IBUF_DELAY_VALUE),
                    .IBUF_LOW_PWR     (HISPI_IBUF_LOW_PWR),
                    .IFD_DELAY_VALUE  (HISPI_IFD_DELAY_VALUE),
                    .IOSTANDARD       (HISPI_IOSTANDARD)
                ) ibufds_ibufgds0_i (
                    .O    (din[i]),   // output
                    .I    (din_p[i]), // input
                    .IB   (din_n[i])  // input
                );
            end

            idelay_nofine # (
                .IODELAY_GRP           (IODELAY_GRP),
                .DELAY_VALUE           (IDELAY_VALUE),
                .REFCLK_FREQUENCY      (REFCLK_FREQUENCY),
                .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE)
            ) pxd_dly_i(
                .clk          (mclk),
                .rst          (mrst),
                .set          (set_idelay[i]),
                .ld           (ld_idelay),
                .delay        (dly_data[3 + 8*i +: 5]),
                .data_in      (din[i]),
                .data_out     (din_dly[i])
            );
            
            iserdes_mem #(
                .DYN_CLKDIV_INV_EN ("FALSE"),
                .MSB_FIRST         (1)          // MSB is received first
            ) iserdes_pxd_i (
                .iclk         (ipclk2x),       // source-synchronous clock
                .oclk         (ipclk2x),       // system clock, phase should allow iclk-to-oclk jitter with setup/hold margin
                .oclk_div     (ipclk),         // oclk divided by 2, front aligned
                .inv_clk_div  (1'b0),          // invert oclk_div (this clock is shared between iserdes and oserdes. Works only in MEMORY_DDR3 mode?
                .rst          (irst),          // reset
                .d_direct     (1'b0),          // direct input from IOB, normally not used, controlled by IOBDELAY parameter (set to "NONE")
                .ddly         (din_dly[i]),    // serial input from idelay 
                .dout         (dout[4*i +:4]), // parallel data out
                .comb_out()                    // output
            );
        
        end
    endgenerate


endmodule

