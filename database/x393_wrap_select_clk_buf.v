// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>select_clk_buf
 * @file select_clk_buf.v
 * @date 2015-11-07  
 * @author Andrey Filippov     
 *
 * @brief Select one of the clock buffers primitives by parameter
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * select_clk_buf.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  select_clk_buf.v is distributed in the hope that it will be useful,
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

module  select_clk_buf #(
    parameter BUFFER_TYPE = "BUFR" // to use clr
    )(
        output o,
        input  i,
        input  clr // for BUFR_only
);
     generate
        if      (BUFFER_TYPE == "BUFG")  BUFG  clk1x_i (.O(o), .I(i));
        else if (BUFFER_TYPE == "BUFH")  BUFH  clk1x_i (.O(o), .I(i));
        else if (BUFFER_TYPE == "BUFR")  BUFR  clk1x_i (.O(o), .I(i), .CE(1'b1), .CLR(clr));
        else if (BUFFER_TYPE == "BUFMR") BUFMR clk1x_i (.O(o), .I(i));
        else if (BUFFER_TYPE == "BUFIO") BUFIO clk1x_i (.O(o), .I(i));
        else assign o = i;
    endgenerate

endmodule

