// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>iserdes_mem
 * @file iserdes_mem.v
 * @date 2014-04-26  
 * @author Andrey Filippov
 *
 * @brief ISERDESE2/ISERDESE1 wrapper to use for DDR3 memory w/o phasers
 *
 * @copyright Copyright (c) 2014 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * iserdes_mem.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  iserdes_mem.v is distributed in the hope that it will be useful,
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
//`define IVERILOG // uncomment just to chenck syntax (by the editor) in the corresponding branch
module  iserdes_mem #
(
    parameter DYN_CLKDIV_INV_EN="FALSE",
    parameter IOBDELAY = "IFD",  // "NONE", "IBUF", "IFD", "BOTH"
    parameter MSB_FIRST = 0      // 0 - lowest bit is received first, 1 - highest is received first
) (
    input        iclk,     // source-synchronous clock
    input        oclk,     // system clock, phase should allow iclk-to-oclk jitter with setup/hold margin
    input        oclk_div, // oclk divided by 2, front aligned
    input        inv_clk_div, // invert oclk_div (this clock is shared between iserdes and oserdes
    input        rst,      // reset
    input        d_direct, // direct input from IOB, normally not used, controlled by IOBDELAY parameter (set to "NONE")
    input        ddly,     // serial input from idelay 
    output [3:0] dout,
    output       comb_out  // combinatorial output copies selected input to be used in the fabric     
);
    wire   [3:0] dout_le;
    assign dout = MSB_FIRST ? {dout_le[0], dout_le[1], dout_le[2], dout_le[3]} : dout_le;
`ifndef OPEN_SOURCE_ONLY  // Not using simulator - instantiate actual ISERDESE2 (can not be simulated because of encrypted )           
     ISERDESE2 #(
         .DATA_RATE                  ("DDR"),
         .DATA_WIDTH                 (4),
         .DYN_CLKDIV_INV_EN          (DYN_CLKDIV_INV_EN),
         .DYN_CLK_INV_EN             ("FALSE"),
         .INIT_Q1                    (1'b0),
         .INIT_Q2                    (1'b0),
         .INIT_Q3                    (1'b0),
         .INIT_Q4                    (1'b0),
         .INTERFACE_TYPE             ("MEMORY"),
         .NUM_CE                     (1),
         .IOBDELAY                   (IOBDELAY),
         
         .OFB_USED                   ("FALSE"),
         .SERDES_MODE                ("MASTER"),
         .SRVAL_Q1                   (1'b0),
         .SRVAL_Q2                   (1'b0),
         .SRVAL_Q3                   (1'b0),
         .SRVAL_Q4                   (1'b0)
         )
         iserdes_i
         (
         .O                          (comb_out),
         .Q1                         (dout_le[3]),
         .Q2                         (dout_le[2]),
         .Q3                         (dout_le[1]),
         .Q4                         (dout_le[0]),
         .Q5                         (),
         .Q6                         (),
         .Q7                         (),
         .Q8                         (),
         .SHIFTOUT1                  (),
         .SHIFTOUT2                  (),
         .BITSLIP                    (1'b0),
         .CE1                        (1'b1),
         .CE2                        (1'b1),
         .CLK                        (iclk),
         .CLKB                       (!iclk),
         .CLKDIVP                    (), // used with phasers, source-sync
         .CLKDIV                     (oclk_div),
         .DDLY                       (ddly),
         .D                          (d_direct), // direct connection to IOB bypassing idelay
         .DYNCLKDIVSEL               (inv_clk_div),
         .DYNCLKSEL                  (1'b0),
         .OCLK                       (oclk),
         .OCLKB                      (!oclk),
         .OFB                        (),
         .RST                        (rst),
         .SHIFTIN1                   (1'b0),
         .SHIFTIN2                   (1'b0)
         );
`else //  OPEN_SOURCE_ONLY : Simulating, use Virtex 6 module that does not have encrypted functionality
     ISERDESE1 #(
         .DATA_RATE                  ("DDR"),
         .DATA_WIDTH                 (4),
         .DYN_CLKDIV_INV_EN          (DYN_CLKDIV_INV_EN),
         .DYN_CLK_INV_EN             ("FALSE"),
         .INIT_Q1                    (1'b0),
         .INIT_Q2                    (1'b0),
         .INIT_Q3                    (1'b0),
         .INIT_Q4                    (1'b0),
         .INTERFACE_TYPE             ("MEMORY"),
         .NUM_CE                     (1),
         .IOBDELAY                   (IOBDELAY),
         .OFB_USED                   ("FALSE"),
         .SERDES_MODE                ("MASTER"),
         .SRVAL_Q1                   (1'b0),
         .SRVAL_Q2                   (1'b0),
         .SRVAL_Q3                   (1'b0),
         .SRVAL_Q4                   (1'b0)
         )
         iserdes_i
         (
         .O                          (comb_out),
         .Q1                         (dout_le[3]),
         .Q2                         (dout_le[2]),
         .Q3                         (dout_le[1]),
         .Q4                         (dout_le[0]),
         .Q5                         (),
         .Q6                         (),
         .SHIFTOUT1                  (),
         .SHIFTOUT2                  (),
     
         .BITSLIP                    (1'b0),
         .CE1                        (1'b1),
         .CE2                        (1'b1),
         .CLK                        (iclk),
         .CLKB                       (!iclk),
         .CLKDIV                     (oclk_div),
         .DDLY                       (ddly),
         .D                          (d_direct), // direct connection to IOB bypassing idelay
         .DYNCLKDIVSEL               (inv_clk_div),
         .DYNCLKSEL                  (1'b0),
         .OCLK                       (oclk),
         .OFB                        (),
         .RST                        (rst),
         .SHIFTIN1                   (1'b0),
         .SHIFTIN2                   (1'b0)
         );
`endif
endmodule

