// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>logger_arbiter393
 * @file logger_arbiter393.v
 * @date 2015-07-06  
 * @author Andrey Filippov     
 *
 * @brief arbiter for the event_logger
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * logger_arbiter393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  logger_arbiter393.v is distributed in the hope that it will be useful,
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

module  logger_arbiter393(
    input                         xclk,         // half frequency (80 MHz nominal)
    input                         rst,          // module reset (sync)
    input                   [3:0] ts_rq_in,     // in requests for timestamp (single-cycle - just leading edge )
    output                  [3:0] ts_rq,        // out request for timestamp, to timestmp module
    input                   [3:0] ts_grant,     // granted ts requests from timestamping module
    input                   [3:0] rdy,          // channels ready (leading edge - became ready, trailing - no more data, use zero)
    output reg              [3:0] nxt,          // pulses to modules to output next word
    output                  [1:0] channel,      // decoded channel number (2 bits)
    output                  [1:0] ts_sel,       // select timestamp word to be output (0..3)
    output                        ts_en,        // 1 - use timestamp, 0 - channel data (or 16'h0 if !ready)
    output reg                    dv,           // output data valid (from registered mux - 2 stage - first selects data and ready, second ts/data/zero)
    output                 [23:0] sample_counter);// number of 64-byte samples logged
/*
  input         xclk;  // half frequency (80 MHz nominal)
  input         rst;   // reset module
  input  [ 3:0] ts_rq_in; // in requests for timestamp (sinlgle-cycle)
  output [ 3:0] ts_rq;        // out request for timestamp, to timestmp module
  input  [ 3:0] ts_grant;     // granted ts requests from timestamping module
  input  [ 3:0] rdy;          // channels ready (leading edge - became ready, trailing - no more data, use zero)
  output [ 3:0] nxt;          // pulses to modules to output next word
  output [ 1:0] channel;      // decoded channel number (2 bits)
  output [ 1:0] ts_sel;       // select timestamp word to be output (0..3)
  output        ts_en;        // 1 - use timestamp, 0 - channel data (or 16'h0 if !ready)
  output        dv;           // output data valid (from registered mux - 2 stage - first selects data and ready, second ts/data/zero)
  output [23:0] sample_counter;// number of 64-byte samples logged
*/
    reg     [3:0] ts_rq_in_d;
    reg     [3:0] ts_rq_r;
    reg     [3:0] ts_valid;
//  reg     [3:0] ts_rq_reset;
    reg     [3:0] channels_ready;// channels granted and ready
    reg     [3:1] chn1hot;       // channels 1-hot - granted and ready, priority applied
    reg           rq_not_zero;   // at least one channel is ready for processing (same time as chn1hot[3:0])
    reg     [1:0] channel_r;
//  reg           start; Not used!
    reg           busy;
    wire          wstart;
    reg           ts_en_r;
    reg     [4:0] seq_cntr;
    reg           seq_cntr_last;
    reg     [1:0] ts_sel_r;
//  reg           dv;
    reg           inc_sample_counter;
    reg    [23:0] sample_counter_r;// number of 64-byte samples logged
//  reg    [ 3:0] nxt;
    reg           pre_nxt;
    reg    [ 3:0] chn_servicing; //1-hot channel being service
    wire    [3:0] wts_rq;
    
    assign wstart =         !busy && rq_not_zero;
    assign wts_rq[3:0] =    ts_rq_in[3:0] & ~ts_rq_in_d[3:0] & (~rdy[3:0] | chn_servicing[3:0]);
    assign sample_counter = sample_counter_r;
    assign ts_rq =          ts_rq_r;
    assign channel =        channel_r;
    assign ts_en =          ts_en_r;
    assign ts_sel =         ts_sel_r;
    
    always @ (posedge xclk) begin
        ts_rq_in_d[3:0] <= ts_rq_in[3:0];
        if (rst)    channel_r[1:0] <= 0;
        if (wstart) channel_r[1:0] <= {chn1hot[3] | chn1hot[2],chn1hot[3] | chn1hot[1]};
        
        if     (wstart) chn_servicing[3:0]  <= {chn1hot[3:1], ~|chn1hot[3:1]};
        else if (!busy) chn_servicing[3:0]  <= 4'h0;
    
    
        if (rst) ts_rq_r[3:0] <= 4'h0;
        else     ts_rq_r[3:0] <= ~ts_grant & ( wts_rq[3:0] | ts_rq_r[3:0]);
    
        if (rst) ts_valid[3:0] <= 4'h0;
        else     ts_valid[3:0] <= (ts_grant[3:0] | (ts_valid & ~wts_rq[3:0]));
    
        channels_ready[3:0] <= ts_valid[3:0] & rdy[3:0] & ~chn_servicing[3:0]; // ready should go down during servicing
    
        rq_not_zero <= channels_ready[3:0] != 4'h0;
    
        chn1hot[3:1] <= {channels_ready[3] & ~|channels_ready[2:0],
                         channels_ready[2] & ~|channels_ready[1:0],
                         channels_ready[1] &  ~channels_ready[0]};
    
    //    start <= wstart; Not used !
    
        if  ((seq_cntr[4:0]=='h1e) || rst) busy <= 1'b0;
        else if (rq_not_zero)              busy <= 1'b1;
    
        if (!busy) seq_cntr[4:0] <= 5'h0;
        else       seq_cntr[4:0] <= seq_cntr[4:0] + 1;
    
        seq_cntr_last <= (seq_cntr[4:0]=='h1e);
    
        if      (rst)                 ts_en_r <=1'b0;
        else if (wstart)              ts_en_r <=1'b1;
        else if (seq_cntr[1:0]==2'h3) ts_en_r <=1'b0;
        
        if (!ts_en_r) ts_sel_r[1:0] <= 2'h0;
        else        ts_sel_r[1:0] <=  ts_sel_r[1:0] + 1;
    
        if (!busy || (seq_cntr[4:0]=='h1d)) pre_nxt <= 1'b0;
        else if (seq_cntr[4:0]=='h01)       pre_nxt <= 1'b1;
        
        nxt [3:0]  <= pre_nxt? chn_servicing[3:0]:4'h0;
        
        dv <= busy || seq_cntr_last;
    
        inc_sample_counter <= seq_cntr_last;
    
        if (rst)                     sample_counter_r[23:0] <= 24'h0;
        else if (inc_sample_counter) sample_counter_r[23:0] <= sample_counter_r[23:0] +1;
    end
endmodule