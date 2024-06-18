// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>scheduler16
 * @file scheduler16.v
 * @date 2015-01-09  
 * @author Andrey Filippov     
 *
 * @brief 16-channel programmable DDR memory access scheduler
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * scheduler16.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  scheduler16.v is distributed in the hope that it will be useful,
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

module  scheduler16 #(
    parameter width=16, // counter number of bits
    parameter n_chn=16  // number of channels
)(
    input             mrst,
    input             clk,
    input [n_chn-1:0] chn_en,    // channel enable mask  
    input [n_chn-1:0] want_rq,   // both want_rq and need_rq should go inactive after being granted  
    input [n_chn-1:0] need_rq,
    input             en_schedul,    // needs to be disabled before next access can be scheduled
    output            need,      // granted access is "needed" one, not just "wanted"
    output            grant,     // single-cycle granted channel access
    output      [3:0] grant_chn, // granted  channel number, valid with grant, stays valid until en_schedul is deasserted
    input       [3:0] pgm_addr,  // channel address to program priority
    input [width-1:0] pgm_data,  // priority data for the channel
    input             pgm_en     // enable programming priority data (use different clock?)
);
    reg [width*n_chn-1:0] pri_reg; // priorities for each channel (start values for priority counters)
    reg       [n_chn-1:0] want_conf, need_conf,need_want_conf,need_want_conf_d;
    wire      [n_chn-1:0] want_set,need_set;
//    reg       [n_chn-1:0] want_set_r,need_set_r;
    reg       [n_chn-1:0] want_need_set_r;
    reg                   need_r, need_r2;
    reg [width*n_chn-1:0] sched_state; // priority counters for each channel
    wire                  need_some=|(need_rq & chn_en);
    wire      [n_chn-1:0] next_want_conf,next_need_conf;
    wire      [n_chn-1:0] need_want_conf_w;
    wire            [3:0] index; // channel index to select
    wire                  index_valid; // selected index valid ("needed" or "wanted")
    reg                   grant_r;      // 1 cycle long
    reg                   grant_sent; // turns on after grant, until en_schedul is de-asserted
    reg             [3:0] grant_chn_r;
    wire                  grant_w;
    assign grant=grant_r;
    assign grant_chn=grant_chn_r;
    assign grant_w=en_schedul && index_valid && !grant_sent && !grant;
// Setting priority for each channel    
    generate
        genvar i;
        for (i=0;i<n_chn;i=i+1) begin: pri_reg_block
            always @ (posedge clk) begin
                if      (mrst)                    pri_reg[width*i +: width] <= 0;
                else if (pgm_en && (pgm_addr==i)) pri_reg[width*i +: width] <= pgm_data; 
            end
        end
    endgenerate        

// priority 1-hot encoders to make sure only one want/need request is "confirmed" in each clock cycle
// TODO: Make pri1hot16 parameter-configurable to be able to change priorities later
    pri1hot16 i_pri1hot16_want( // priority encoder, 1-hot output (lowest bit has highest priority)
        .in(want_rq & ~want_conf & chn_en),
        .out(want_set),
        .some());
    pri1hot16 i_pri1hot16_need(
        .in(need_rq & ~need_conf & chn_en),
        .out(need_set),
        .some());
        
    assign next_want_conf=  (want_conf &  want_rq & chn_en) | want_set;
    assign next_need_conf=  (need_conf &  need_rq & chn_en) | need_set;
    assign need_want_conf_w=need_some? next_need_conf: next_want_conf;
    always @(posedge clk) begin
        if (mrst) begin
            want_conf <= 0;
            need_conf <= 0;
        end else begin
            want_conf <= next_want_conf;
            need_conf <= next_need_conf;
            need_want_conf  <= need_want_conf_w; // need_some? next_need_conf: next_want_conf; 
            need_want_conf_d <= need_want_conf &  need_want_conf_w; // delay for on, no delay for off
        end
    end
    always @ (posedge clk) begin
//        want_set_r<=want_set;
//        need_set_r<=need_set;
        want_need_set_r <= want_set | need_set;
        need_r  <= need_some;
        need_r2 <= need_r;
    end
    // TODO: want remains, need is removed (both need and want should be deactivated on grant!)
    // Block that sets initial process state and increments it on every change of the requests
    generate
        genvar i1;
        for (i1=0;i1<16;i1=i1+1) begin: sched_state_block
//            always @ (posedge rst or posedge clk) begin
            always @ (posedge clk) begin
//                if (rst) sched_state[width*i1 +: width] <= 0; // not needed?
//                else
                begin
//                    if (want_set_r[i1] || need_set_r[i1])          sched_state[width*i1 +: width] <= pri_reg[width*i1 +: width];
                    if (want_need_set_r[i1])          sched_state[width*i1 +: width] <= pri_reg[width*i1 +: width];
                    // increment, but do not roll over
                    else if (&sched_state[width*i1 +: width] == 0) sched_state[width*i1 +: width] <= sched_state[width*i1 +: width]+1; 
                end 
            end
        end
    endgenerate
    // Select the process to run
    index_max_16 #(width) i_index_max_16(
        .clk      (clk),
        .values   (sched_state),
        .mask     (need_want_conf_d),
        .need_in  (need_r2),
        .index    (index[3:0]),
        .valid    (index_valid),
        .need_out (need));
    always @(posedge clk) begin
        if (mrst) begin
            grant_r <=0;
            grant_sent <=0;
            grant_chn_r <=0;
        end else begin
            grant_r    <= grant_w; // en_schedul && index_valid && !grant_sent;
            grant_sent <= (grant_sent && en_schedul) || grant_r;
            if (grant_w) grant_chn_r <= index[3:0];   
        end
    end

endmodule

