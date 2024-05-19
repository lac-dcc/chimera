// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>mcntrl_1kx32r
 * @file mcntrl_1kx32r.v
 * @date 2015-02-03  
 * @author Andrey Filippov     
 *
 * @brief Paged buffer for ddr3 controller read channel
 * with address autoincrement. 32 bit external data.
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * mcntrl_1kx32r.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  mcntrl_1kx32r.v is distributed in the hope that it will be useful,
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

module  mcntrl_1kx32r(
      input         ext_clk,
      input  [ 9:0] ext_raddr,    // read address
      input         ext_rd,       // read port enable
      input         ext_regen,    // output register enable
      output [31:0] ext_data_out, // data out
      
      input         wclk,         // !mclk (inverted)
      input   [1:0] wpage_in,     // will register to wclk, input OK with mclk
      input         wpage_set,    // set internal read page to rpage_in 
      input         page_next,    // advance to next page (and reset lower bits to 0)
      output  [1:0] page,         // current inernal page   
      input         we,           // write port enable (also increment write buffer address)
      input  [63:0] data_in       // data in
);
    reg  [1:0] page_r;
    reg  [6:0] waddr;
    assign page=page_r;
    always @ (posedge wclk) begin
    
        if      (wpage_set) page_r <= wpage_in;
        else if (page_next) page_r <= page_r+1;

        if      (page_next || wpage_set) waddr <= 0;
        else if (we)                     waddr <= waddr+1;
    end
    ram_512x64w_1kx32r #(
        .REGISTERS(1)
    ) ram_512x64w_1kx32r_i (
        .rclk     (ext_clk),              // input
        .raddr    (ext_raddr),            // input[9:0] 
        .ren      (ext_rd),               // input
        .regen    (ext_regen),            // input
        .data_out (ext_data_out),         // output[31:0] 
        .wclk     (wclk),                 // input - OK, negedge mclk
        .waddr    ({page,waddr}),   // input[8:0] @negedge mclk
        .we       (we),                   // input @negedge mclk
        .web      (8'hff),                // input[7:0]
        .data_in  (data_in)        // input[63:0]  @negedge mclk
    );
endmodule

