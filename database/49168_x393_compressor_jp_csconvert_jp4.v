// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>csconvert_jp4
 * @file csconvert_jp4.v
 * @date 2015-06-10  
 * @author Andrey Filippov     
 *
 * @brief Color conversion for JP4 mode
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * csconvert_jp4.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  csconvert_jp4.v is distributed in the hope that it will be useful,
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

module csconvert_jp4  (en,
                       clk,
                       din,
                       pre_first_in,
                       y_out,
                       yaddr,
                       ywe,
                       pre_first_out);

    input        en;
    input        clk;         // clock
    input  [7:0] din; // input data in scanline sequence
    input        pre_first_in;      // marks the first input pixel
    output [7:0] y_out;  // output Y (16x16) in scanline sequence. Valid if ys active
    output [7:0] yaddr; // address for the external buffer memory to write 16x16x8bit Y data
    output       ywe;    // wrire enable of Y data
    output       pre_first_out;

    wire         pre_first_out= pre_first_in;
    wire   [7:0] y_out=         {~din[7],din[6:0]};
    reg    [7:0] yaddr_cntr;
    reg          ywe;
    wire   [7:0] yaddr= {yaddr_cntr[4],yaddr_cntr[7:5],yaddr_cntr[0],yaddr_cntr[3:1]};
    always @ (posedge clk) begin
      ywe <= en & (pre_first_in || (ywe && (yaddr[7:0] !=8'hff)));
      if (!en || pre_first_in) yaddr_cntr[7:0] <= 8'h0;
      else if (ywe)            yaddr_cntr[7:0] <= yaddr_cntr[7:0] + 1;
    end

endmodule


