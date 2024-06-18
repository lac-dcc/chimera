// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>mcont_from_chnbuf_reg
 * @file mcont_from_chnbuf_reg.v
 * @date 2015-01-19  
 * @author Andrey Filippov     
 *
 * @brief Registering data from channel buffer to memory controller
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * mcont_from_chnbuf_reg.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  mcont_from_chnbuf_reg.v is distributed in the hope that it will be useful,
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

module  mcont_from_chnbuf_reg #(
    parameter CHN_NUMBER=0,
    parameter CHN_LATENCY=2 // 0 - no extra latency in extrenal BRAM - data available next cycle after regen (1 extra from ren)
)(
    input rst,
    input clk,
    input                       ext_buf_rd,
    input                 [3:0] ext_buf_rchn,  // ==run_chn_d valid 1 cycle ahead opf ext_buf_rd!, maybe not needed - will be generated externally
    input                       ext_buf_rrefresh,
    input                       ext_buf_rpage_nxt,
    output reg           [63:0] ext_buf_rdata, // Latency of ram_1kx32w_512x64r plus 2
    output reg                  buf_rd_chn,
    output reg                  rpage_nxt,
    input                [63:0] buf_rdata_chn
);
    reg                  [63:0] buf_rdata_chn_r; /// *** temporary register to delay buffer read data - may be used to implement multi-clock mux to ease timing
    reg                         buf_chn_sel;
    reg [CHN_LATENCY:0] latency_reg=0;
//    always @ (posedge rst or posedge clk) begin
    always @ (posedge clk) begin
        if (rst) buf_chn_sel <= 0;
        else     buf_chn_sel <= (ext_buf_rchn==CHN_NUMBER) && !ext_buf_rrefresh;
        
        if (rst) buf_rd_chn <= 0;
        else     buf_rd_chn <= buf_chn_sel && ext_buf_rd;
 
        if (rst) latency_reg<= 0;
        else     latency_reg <= {latency_reg[CHN_LATENCY-1:0], buf_rd_chn};
        
    end
    always @ (posedge clk)  buf_rdata_chn_r <= buf_rdata_chn; // THIS WILL BE REPLACED BY MULTI-CYCLE MUX
    always @ (posedge clk) if (latency_reg[CHN_LATENCY])  ext_buf_rdata <= buf_rdata_chn_r;
    always @ (posedge clk)  rpage_nxt <= ext_buf_rpage_nxt && (ext_buf_rchn==CHN_NUMBER) && !ext_buf_rrefresh;

    
endmodule

