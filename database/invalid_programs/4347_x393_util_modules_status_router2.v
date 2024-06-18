// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>status_router2
 * @file status_router2.v
 * @date 2015-01-13  
 * @author Andrey Filippov     
 *
 * @brief 2:1 status data router/mux
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * status_router2.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  status_router2.v is distributed in the hope that it will be useful,
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
 //TODO: make a 4-input mux too?
`timescale 1ns/1ps
`include "system_defines.vh" 
//`define DEBUG_FIFO 1
module  status_router2 #(
    parameter FIFO_TYPE = "ONE_CYCLE" // "TWO_CYCLE"
)(
    input        rst,
    input        clk,
    input        srst,      // sync reset
    // 2 input channels 
    input [7:0]  db_in0,
    input        rq_in0,
    output       start_in0, // only for the first cycle, combinatorial
    input [7:0]  db_in1,
    input        rq_in1,
    output       start_in1, // only for the first cycle, combinatorial
    // output (multiplexed) channel
    output [7:0] db_out,
    output       rq_out,
    input        start_out  // only for the first cycle, combinatorial
);
    wire           [1:0] rq_in={rq_in1,rq_in0};
    wire           [1:0] start_rcv;
    reg            [1:0] rcv_rest_r; // receiving remaining (after first) bytes
    wire           [1:0] fifo_half_full;
    
    assign         start_in0=start_rcv[0];
    assign         start_in1=start_rcv[1];

    assign start_rcv=~fifo_half_full & ~rcv_rest_r & rq_in;
    wire   [7:0] fifo0_out;
    wire   [7:0] fifo1_out;
    wire   [1:0] fifo_last_byte; 
    wire   [1:0] fifo_nempty_pre; // pure fifo output
    wire   [1:0] fifo_nempty;  // safe version, zeroed for last byte
    wire   [1:0] fifo_re;
    reg          next_chn;
    reg          current_chn_r;
    reg          snd_rest_r;
    wire         snd_pre_start; 
    wire         snd_last_byte;
    wire         chn_sel_w;
    wire         early_chn;
    wire         set_other_only_w; // window to initiate other channel only, same channel must wait

    assign       chn_sel_w=(&fifo_nempty)?next_chn : fifo_nempty[1];
    assign       fifo_re=start_out?{chn_sel_w,~chn_sel_w}:(snd_rest_r?{current_chn_r,~current_chn_r}:2'b0);
    
//    assign snd_last_byte=current_chn_r?fifo_last_byte[1]:fifo_last_byte[0];
    assign snd_last_byte=current_chn_r?(fifo_nempty_pre[1] && fifo_last_byte[1]):(fifo_nempty_pre[0] && fifo_last_byte[0]);
    assign set_other_only_w=snd_last_byte && (current_chn_r? fifo_nempty[0]:fifo_nempty[1]);
    assign snd_pre_start=|fifo_nempty && (!snd_rest_r || snd_last_byte);
///    assign snd_pre_start=|fifo_nempty && !snd_rest_r && !start_out; // no channel change after 
//    assign rq_out=(snd_rest_r && !snd_last_byte) || |fifo_nempty;
    assign rq_out=(snd_rest_r || |fifo_nempty) && !snd_last_byte ;
//    assign early_chn= (snd_rest_r & ~snd_last_byte)?current_chn_r:chn_sel_w;
    assign early_chn= snd_rest_r? current_chn_r: chn_sel_w;
    assign db_out=early_chn?fifo1_out:fifo0_out;
    assign fifo_nempty=fifo_nempty_pre & ~fifo_last_byte;
    
    always @ (posedge rst or posedge clk) begin
        if      (rst)  rcv_rest_r<= 0;
        else if (srst) rcv_rest_r<= 0;
        else           rcv_rest_r <= (rcv_rest_r & rq_in) | start_rcv;
    
        if      (rst)      next_chn<= 0;
        else if (srst)     next_chn<= 0;
        else if (|fifo_re) next_chn <= fifo_re[0]; // just to be fair
        
        if      (rst)                         current_chn_r <= 0;
        else if (srst)                        current_chn_r <= 0;
        else if (set_other_only_w)            current_chn_r <= ~current_chn_r;
        else if (snd_pre_start)               current_chn_r <= chn_sel_w;
///        else if (|fifo_nempty && !snd_rest_r) current_chn_r <= chn_sel_w;
        //|fifo_nempty && (!snd_rest_r

        if (rst)       snd_rest_r<= 0;
        else if (srst) snd_rest_r<= 0;
        else           snd_rest_r <= (snd_rest_r & ~snd_last_byte) | start_out;
    end
    
/* fifo_same_clock has currently latency of 2 cycles, use smth. faster here? - fifo_1cycle (but it has unregistered data output) */
    generate
        if (FIFO_TYPE == "ONE_CYCLE") begin
            fifo_1cycle #(
                .DATA_WIDTH(9),
                .DATA_DEPTH(4) // 16
            ) fifo_in0_i (
                .rst       (1'b0),                                // rst), // input
                .clk       (clk),                                 // input
                .sync_rst  (srst),                                // input
                .we        (start_rcv[0] || rcv_rest_r[0]),       // input
                .re        (fifo_re[0]),                          // input
                .data_in   ({rcv_rest_r[0] & ~rq_in[0], db_in0}), // input[8:0] MSB marks last byte
                .data_out  ({fifo_last_byte[0],fifo0_out}),       // output[8:0]
                .nempty    (fifo_nempty_pre[0]),                  // output reg
                .half_full (fifo_half_full[0])                    // output reg 
        `ifdef DEBUG_FIFO
                ,.under(),     // output reg 
                .over(),       // output reg 
                .wcount(),     // output[3:0] reg 
                .rcount(),     // output[3:0] reg 
                .num_in_fifo() // output[3:0]
        `endif         
            );
        
            fifo_1cycle #(
                .DATA_WIDTH(9),
                .DATA_DEPTH(4) // 16
            ) fifo_in1_i (
                .rst       (1'b0),                                // rst), // input
                .clk       (clk),                                 // input
                .sync_rst  (srst),                                // input
                .we        (start_rcv[1] || rcv_rest_r[1]),       // input
                .re        (fifo_re[1]),                          // input
                .data_in   ({rcv_rest_r[1] & ~rq_in[1], db_in1}), // input[8:0] MSB marks last byte
                .data_out  ({fifo_last_byte[1],fifo1_out}),       // output[8:0]
                .nempty    (fifo_nempty_pre[1]),                  // output reg
                .half_full (fifo_half_full[1])                    // output reg 
        `ifdef DEBUG_FIFO
                ,.under(),     // output reg 
                .over(),       // output reg 
                .wcount(),     // output[3:0] reg 
                .rcount(),     // output[3:0] reg 
                .num_in_fifo() // output[3:0]
        `endif         
            );
        end else begin
            fifo_same_clock #(
                .DATA_WIDTH(9),
                .DATA_DEPTH(4) // 16
            ) fifo_in0_i (
                .rst       (1'b0),                                // rst), // input
                .clk       (clk),                                 // input
                .sync_rst  (srst),                                // input
                .we        (start_rcv[0] || rcv_rest_r[0]),       // input
                .re        (fifo_re[0]),                          // input
                .data_in   ({rcv_rest_r[0] & ~rq_in[0], db_in0}), // input[8:0] MSB marks last byte
                .data_out  ({fifo_last_byte[0],fifo0_out}),       // output[8:0]
                .nempty    (fifo_nempty_pre[0]),                  // output reg
                .half_full (fifo_half_full[0])                    // output reg 
        `ifdef DEBUG_FIFO
                ,.under(),     // output reg 
                .over(),       // output reg 
                .wcount(),     // output[3:0] reg 
                .rcount(),     // output[3:0] reg 
                .num_in_fifo() // output[3:0]
        `endif         
            );
        
            fifo_same_clock #(
                .DATA_WIDTH(9),
                .DATA_DEPTH(4) // 16
            ) fifo_in1_i (
                .rst       (1'b0),                                // rst), // input
                .clk       (clk),                                 // input
                .sync_rst  (srst),                                // input
                .we        (start_rcv[1] || rcv_rest_r[1]),       // input
                .re        (fifo_re[1]),                          // input
                .data_in   ({rcv_rest_r[1] & ~rq_in[1], db_in1}), // input[8:0] MSB marks last byte
                .data_out  ({fifo_last_byte[1],fifo1_out}),       // output[8:0]
                .nempty    (fifo_nempty_pre[1]),                  // output reg
                .half_full (fifo_half_full[1])                    // output reg 
        `ifdef DEBUG_FIFO
                ,.under(),     // output reg 
                .over(),       // output reg 
                .wcount(),     // output[3:0] reg 
                .rcount(),     // output[3:0] reg 
                .num_in_fifo() // output[3:0]
        `endif         
            );
        end
    endgenerate
    
// one car per green (round robin priority)
// start sending out with  with one cycle latency - now 2 cycles because of the FIFO

endmodule

