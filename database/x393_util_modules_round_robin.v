// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>round_robin
 * @file round_robin.v
 * @date 2015-07-10  
 * @author Andrey Filippov     
 *
 * @brief Round-robin arbiter
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * round_robin.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  round_robin.v is distributed in the hope that it will be useful,
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

module  round_robin #(
    parameter FIXED_PRIORITY = 0, // 0 - round-robin, 1 - fixed channel priority (0 - highest)
    parameter BITS =           2  // number of bits to encode channel number (1 << BITS) - number of inputs
)(
    input                         clk,
    input                         srst, // sync. reset - needed to reset current channel
    input      [(1 << BITS) -1:0] rq,   // request vector
    input                         en,    // enable to grant highest priority request (should be reset by grant)
    output reg                    grant, // changed to 1-cycle long (was: stays on until reset by !en)
    output             [BITS-1:0] chn,
    output reg [(1 << BITS) -1:0] grant_chn);  // 1-hot grant output per-channel, single-clock pulse
    
    reg           [BITS-1:0] last_chn;
    wire                     valid;
    wire          [BITS-1:0] next_chn;
    wire                     pre_grant_w;
    reg                      grant_r;
    
    assign pre_grant_w = en && valid &&!grant_r;
//    assign grant = grant_r;
    assign chn =   last_chn;
    
    assign {valid, next_chn}= func_selrr (rq, FIXED_PRIORITY?((1 << BITS) -1):last_chn);
    always @ (posedge clk) begin
        if      (srst)        last_chn <= (1 << BITS) -1;
        else if (pre_grant_w) last_chn <= next_chn;
        
        if (srst || !en) grant_r <= 0;
        else if (valid)  grant_r <= 1; // grant will stay on until reset by !en
        
        grant_chn <= func_demux (!srst && pre_grant_w, next_chn);

        grant <= !srst && pre_grant_w;
        
    end
    
    // round-robin priority encode
    function [BITS : 0] func_selrr; // returns {valid, chn}
        input [(1 << BITS) -1:0] rq;       // request vector
        input         [BITS-1:0] cur_chn;  // current (last served) channel - lowest priority
        reg                      valid;    // at least one request
        reg         [BITS - 1:0] chn, sample_chn;
        integer                  i;
        begin
            valid = 0;
            chn   = 0;
            for (i = 0; i < (1 << BITS); i = i+1) begin
                sample_chn = (cur_chn - i) % (1 << BITS);
                if (rq[sample_chn]) begin
                    valid = 1;
                    chn = sample_chn;
                end    
            end
            func_selrr = {valid,chn};
        end
    endfunction
    
    function  [(1 << BITS) -1:0] func_demux;
        input              en;
        input [BITS - 1:0] sel;
        integer i;
        begin
            for (i=0; i < (1 << BITS); i = i + 1) begin
                func_demux[i] = en && (sel == i); 
            end
        end
    endfunction
    
endmodule    
