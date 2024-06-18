// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>dual_clock_source
 * @file dual_clock_source.v
 * @date 2015-07-17  
 * @author Andrey  Filippov   
 *
 * @brief generate clk and clk2x with configurable output buffers
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * dual_clock_source.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  dual_clock_source.v is distributed in the hope that it will be useful,
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

module  dual_clock_source #(
    parameter CLKIN_PERIOD =        20, //ns >1.25, 600<Fvco<1200
    // Fvco=Fclkin*CLKFBOUT_MULT_F/DIVCLK_DIVIDE, Fout=Fvco/CLKOUT#_DIVIDE

    parameter DIVCLK_DIVIDE =        1,   // Integer 1..106. Divides all outputs with respect to CLKIN
    parameter CLKFBOUT_MULT =       20,   // integer 2 to 64 . Together with CLKOUT#_DIVIDE and DIVCLK_DIVIDE
    parameter CLKOUT_DIV_CLK1X =    10,   //
    parameter CLKOUT_DIV_CLK2X =    5,   // 
    parameter PHASE_CLK2X =         0.000,  // degrees, relative to clk1x (3 significant digits, -360.000...+360.000)
    parameter BUF_CLK1X          =  "BUFG", // "BUFG", "BUFH", "BUFR", "NONE"
    parameter BUF_CLK2X          =  "BUFG" // "BUFG", "BUFH", "BUFR", "NONE"
)(
    input   rst,
    input   clk_in,
    input   pwrdwn,
    output  clk1x,
    output  clk2x,
    output  locked
);
    wire  clkfb, clk1x_pre, clk2x_pre;
    generate
        if      (BUF_CLK1X == "BUFG")  BUFG  clk1x_i (.O(clk1x), .I(clk1x_pre));
        else if (BUF_CLK1X == "BUFH")  BUFH  clk1x_i (.O(clk1x), .I(clk1x_pre));
        else if (BUF_CLK1X == "BUFR")  BUFR  clk1x_i (.O(clk1x), .I(clk1x_pre), .CE(1'b1), .CLR(rst));
        else if (BUF_CLK1X == "BUFMR") BUFMR clk1x_i (.O(clk1x), .I(clk1x_pre));
        else if (BUF_CLK1X == "BUFIO") BUFIO clk1x_i (.O(clk1x), .I(clk1x_pre));
        else assign clk1x = clk1x_pre;
    endgenerate

    generate
        if      (BUF_CLK2X == "BUFG")  BUFG  clk2x_i (.O(clk2x), .I(clk2x_pre));
        else if (BUF_CLK2X == "BUFH")  BUFH  clk2x_i (.O(clk2x), .I(clk2x_pre));
        else if (BUF_CLK2X == "BUFR")  BUFR  clk2x_i (.O(clk2x), .I(clk2x_pre), .CE(1'b1), .CLR(rst));
        else if (BUF_CLK2X == "BUFMR") BUFMR clk2x_i (.O(clk2x), .I(clk2x_pre));
        else if (BUF_CLK2X == "BUFIO") BUFIO clk2x_i (.O(clk2x), .I(clk2x_pre));
        else assign clk2x = clk2x_pre;
    endgenerate
    
    pll_base #(
        .CLKIN_PERIOD   (CLKIN_PERIOD), // 20
        .BANDWIDTH      ("OPTIMIZED"),
        .DIVCLK_DIVIDE  (DIVCLK_DIVIDE),
        .CLKFBOUT_MULT  (CLKFBOUT_MULT), // 2..64, // Fvco=Fclkin*CLKFBOUT_MULT_F/DIVCLK_DIVIDE, Fout=Fvco/CLKOUT#_DIVIDE
        .CLKOUT1_PHASE  (PHASE_CLK2X),
        .CLKOUT0_DIVIDE (CLKOUT_DIV_CLK1X),
        .CLKOUT1_DIVIDE (CLKOUT_DIV_CLK2X),
        .REF_JITTER1    (0.010),
        .STARTUP_WAIT("FALSE")
    ) pll_base_i (
        .clkin(clk_in), // input
        .clkfbin(clkfb), // input
//        .rst(rst), // input
        .rst(rst), // input
        .pwrdwn(pwrdwn), // input
        .clkout0(clk1x_pre), // output
        .clkout1(clk2x_pre), // output
        .clkout2(), // output
        .clkout3(), // output
        .clkout4(), // output
        .clkout5(), // output
        .clkfbout(clkfb), // output
        .locked(locked) // output
    );



endmodule

