// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>clk_to_clk2x
 * @file clk_to_clk2x.v
 * @date 2015-05-29  
 * @author Andrey Filippov     
 *
 * @brief move data between clk and clk2x (nominally posedge aligned)
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * clk_to_clk2x.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  clk_to_clk2x.v is distributed in the hope that it will be useful,
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

module  clk_to_clk2x(
    input  clk,     // single rate clock
    input  clk2x,   // double rate clock, approximately posedge aligned to clk
    output clk_sync // approximately repeating clk, clocked @posedge clk2x - use as CE to transfer data
);

    reg r_clk =    0;
    reg r_nclk2x = 0;
    reg r_clk2x;
   
    assign clk_sync=r_clk2x;
    
    always @(posedge r_nclk2x or posedge clk) begin
        if (r_nclk2x) r_clk <= 0;
        else          r_clk <= 1;
    end   

    always @(negedge clk2x) r_nclk2x <= r_clk;
    always @(posedge clk2x) r_clk2x <= !r_nclk2x;

endmodule

