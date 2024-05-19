// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>latch_g_ce
 * @file latch_g_ce.v
 * @date 2015-07-22  
 * @author Andrey Filippov    
 *
 * @brief Multi-bit wrapper for the transparent latch primitive
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * latch_g_ce.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  latch_g_ce.v is distributed in the hope that it will be useful,
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

module  latch_g_ce#(
  parameter WIDTH = 1,
  parameter INIT = 0,
  parameter [0:0] IS_CLR_INVERTED = 0,
  parameter [0:0] IS_G_INVERTED = 0

)(
    input                rst,
    input                g,
    input                ce,
    input  [WIDTH-1: 0 ] d_in,
    output [WIDTH-1: 0 ] q_out
);
    generate
        genvar i;
        for (i = 0; i < WIDTH; i = i+ 1) begin:ldce_block
            LDCE #(
                .INIT            ((INIT >> i) & 1),
                .IS_CLR_INVERTED (IS_CLR_INVERTED),
                .IS_G_INVERTED   (IS_G_INVERTED)
            ) ldce_i (
                .Q    (q_out[i]), // output
                .CLR  (rst),      // input
                .D    (d_in[i]),  // input
                .G    (g),        // input
                .GE   (ce)        // input
            );
        end
    endgenerate


endmodule

