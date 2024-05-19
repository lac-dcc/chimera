// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>dct1d_chen_reorder_in
 * @file dct1d_chen_reorder_in.v
 * @date 2016-06-08  
 * @author  Andrey Filippov
 *     
 * @brief Reorder scan-line pixel stream for dct1d_chen module
 *
 * @copyright Copyright (c) 2016 Elphel, Inc.
 *
 * <b>License:</b>
 *
 *dct1d_chen_reorder_in.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  dct1d_chen_reorder_in.v is distributed in the hope that it will be useful,
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

module  dct1d_chen_reorder_in#(
    parameter WIDTH = 24
 )(
    input                  clk,
    input                  rst,
    input                  en,  // to be sampled when start is expected (start time slot)
    input  [WIDTH -1:0]    din,
    input                  start, // with first pixel 
    output [2*WIDTH -1:0]  dout_10_32_76_54, // Concatenated/reordered output data {x[1],x[0]}/{x[3],x[2]}/ {x[7],x[6]}/{x[5],x[4]}
    output reg             start_out,
    output                 en_out // to be sampled when start_out is expected
);
    reg                    last_r;
    reg              [2:0] cntr_in;
    reg              [1:0] raddr;
    wire                   restart = !rst && en && (start || last_r);
//    wire             [1:0] we = ((|cntr_in) || en)? {~cntr_in[0]^cntr_in[2],cntr_in[0]^cntr_in[2]}:2'b0;
    wire             [1:0] we = ((|cntr_in) || en)? {cntr_in[0]^cntr_in[2], ~cntr_in[0]^cntr_in[2]}:2'b0;
    wire             [1:0] waddr = {cntr_in[2],cntr_in[2]^cntr_in[1]};
    reg        [WIDTH-1:0] bufl_ram[0:3];
    reg        [WIDTH-1:0] bufh_ram[0:3];
    reg     [2*WIDTH -1:0] dout_10_32_76_54_r;
    reg                    first_period;
    reg                    en_out_r;
    reg                    last_out;
    reg                    re_r;
    assign dout_10_32_76_54 = dout_10_32_76_54_r;
    assign en_out =           en_out_r;
    
    always @(posedge clk) begin
        if (rst) last_r <= 0;
        else     last_r <= &cntr_in;

        last_out <= raddr == 2;
        
        if      (rst)          re_r <= 0;
        else if (cntr_in == 5) re_r <= 1;
        else if (last_out)     re_r <= 0;
        
        if      (rst)                   cntr_in <= 0;
        else if (restart || (|cntr_in)) cntr_in <= cntr_in + 1;
        
        if (we[0]) bufl_ram[waddr] <= din;
        if (we[1]) bufh_ram[waddr] <= din;

        if      (rst )         raddr <= ~0;
        else if (cntr_in == 5) raddr <= 0;
        else if (!(&raddr))    raddr <= raddr + 1;
        
        if      (rst)          first_period <= 0;
        else if (start && en)  first_period <= 1;
        else if (last_r)       first_period <= 0;
        
        if (re_r) dout_10_32_76_54_r <= {bufh_ram[raddr],bufl_ram[raddr]};
        
        start_out <= first_period && (cntr_in == 5);
        
        if      (rst)                 en_out_r <= 0;
        else if (cntr_in == 5)        en_out_r <= 1;
        else if ((raddr == 2) && !en) en_out_r <= 0;

    end
endmodule

