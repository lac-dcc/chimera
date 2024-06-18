// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>masked_max_reg
 * @file masked_max_reg.v
 * @date 2015-01-09  
 * @author Andrey Filippov     
 *
 * @brief Finds maximal of two masked values, registers result
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * masked_max_reg.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  masked_max_reg.v is distributed in the hope that it will be useful,
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

module  masked_max_reg#(
    parameter width=16
    )(
    input              clk,
    input  [width-1:0] a,
    input              mask_a,
    input  [width-1:0] b,
    input              mask_b,
    output [width-1:0] max,
    output             s,
    output             valid // at least one of the inputs was valid (matches outputs)
);
    reg    [width-1:0] max_r;
    reg                s_r;
    reg                valid_r;
    assign s=s_r;
    assign max=max_r;
    assign valid=valid_r;
//    wire s_w= mask_b && ((mask_a && (b>a)) || !mask_a);
    wire s_w= mask_b && (!mask_a || (b>a));
    always @ (posedge clk) begin
        s_r <= s_w;
        max_r <= (mask_a || mask_b)? (s_w?b:a): {width{1'b0}};
        valid_r <= mask_a || mask_b;
    end 
endmodule

