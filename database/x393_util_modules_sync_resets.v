// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sync_resets
 * @file sync_resets.v
 * @date 2015-07-20  
 * @author Aandrey Filippov     
 *
 * @brief Generate synchronous resets for several clocks, leaving room
 * for generous register duplication 
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * sync_resets.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sync_resets.v is distributed in the hope that it will be useful,
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

module  sync_resets#(
    parameter WIDTH    =    1,
    parameter REGISTER =    4 // number of registers used at crossing clocks >1
    )(
    input              arst,    // async reset
    input  [WIDTH-1:0] locked,  // clk[i] MMCM/PLL is locked
    input  [WIDTH-1:0] clk,     // clk[0] - master clock generation should not depend on resets)
    output [WIDTH-1:0] rst       // resets matching input clocks
);
    reg                 en_locked=0; // mostly for simulation, locked[0] is 1'bx until the first clock[0] pulse
    wire    [WIDTH-1:0] rst_w;  // resets matching input clocks
    wire                rst_early_master_w;
    reg                 rst_early_master;
    assign rst = rst_w;
    reg                mrst = 1;
    always @ (posedge arst or posedge clk[0]) begin
    
        if (arst) en_locked <= 0;
        else      en_locked <= 1;
    
        if (arst) mrst <= 1;
        else      mrst <=  ~(locked[0] && en_locked);
    end
    always @(posedge clk[0]) begin
        rst_early_master <= rst_early_master_w | mrst;
    end
    level_cross_clocks #(
        .WIDTH      (1),
        .REGISTER   (REGISTER)
    ) level_cross_clocks_mrst_i (
        .clk   (clk[0]),  // input
        .d_in  (mrst),    // input[0:0] 
        .d_out (rst_early_master_w) // output[0:0] 
    );
    
    generate
        genvar i;
        for (i = 1; i < WIDTH; i = i + 1) begin: rst_block
            level_cross_clocks #(
                .WIDTH      (1),
              .REGISTER   ((i==5) ? 1: REGISTER), // disable for aclk
//                .REGISTER   (REGISTER), // disable for aclk - aclk is now (0)
                .FAST1      (1) // Switch to next cycle, to 0 - regeisterd
            ) level_cross_clocks_rst_i (
                .clk   (clk[i]),                                  // input
                .d_in  (mrst || rst_early_master || ~locked[i] ), // input[0:0] 
                .d_out (rst_w[i])                                 // output[0:0] 
            );
        end
    endgenerate

    assign rst_w[0]= rst_early_master;

endmodule

