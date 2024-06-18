// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>mcntrl_buf_wr
 * @file mcntrl_buf_wr.v
 * @date 2015-02-03  
 * @author Andrey Filippov     
 *
 * @brief Paged buffer for ddr3 controller write channel
 * with address autoincrement. 32 bit external data. Extends rd to regen
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * mcntrl_buf_wr.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  mcntrl_buf_wr.v is distributed in the hope that it will be useful,
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

module  mcntrl_buf_wr #(
    parameter integer LOG2WIDTH_WR = 5   // WIDTH= 1  << LOG2WIDTH
 ) (
      input                           ext_clk,
      input       [14-LOG2WIDTH_WR:0] ext_waddr,    // external write address
      input                           ext_we,       // external write enable
      input [(1 << LOG2WIDTH_WR)-1:0] ext_data_in,  // data input
      
      input                           rclk,         // mclk
      input                     [1:0] rpage_in,     // will register to wclk, input OK with mclk
      input                           rpage_set,    // set internal read page to rpage_in 
      input                           page_next,    // advance to next page (and reset lower bits to 0)
      output                    [1:0] page,         // current internal page   
      input                           rd,           // read buffer to memory, increment read address (regester enable will be delayed)
      output                   [63:0] data_out      // data out

);
    reg  [1:0] page_r;
    reg  [6:0] raddr;
    reg        regen;
    assign page=page_r;
    always @ (posedge rclk) begin
        regen <= rd;
        
        if      (rpage_set) page_r <= rpage_in;
        else if (page_next) page_r <= page_r+1;

        if      (page_next || rpage_set) raddr <= 0;
        else if (rd)                     raddr <= raddr+1;
    end

    ram_var_w_var_r #(
        .COMMENT("mcntrl_buf_wr"),
        .REGISTERS(1),
        .LOG2WIDTH_WR(LOG2WIDTH_WR),
        .LOG2WIDTH_RD(6)
    ) ram_var_w_var_r_i (
        .rclk     (rclk),           // input
        .raddr    ({page_r,raddr}), // input[8:0] 
        .ren      (rd),             // input
        .regen    (regen),          // input
        .data_out (data_out),       // output[63:0] 
        .wclk     (ext_clk),        // input
        .waddr    (ext_waddr),      // input[9:0] 
        .we       (ext_we),         // input
        .web      (8'hff),          // input[3:0] 
        .data_in  (ext_data_in)     // input[31:0] 
    );
endmodule

