// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sens_histogram_mux
 * @file sens_histogram_mux.v
 * @date 2015-06-01  
 * @author Andrey Filippov     
 *
 * @brief Readout multiplexer for 4 histogram modules
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * sens_histogram_mux.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sens_histogram_mux.v is distributed in the hope that it will be useful,
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

module  sens_histogram_mux#(
    parameter NUM_FRAME_BITS =  4 // number of bits use for frame number 
)(
    input                       mclk,
    input                       en,

    input                       rq0,
    input  [NUM_FRAME_BITS-1:0] hist_frame0, // frame number matching histogram output
    
    output                      grant0,
    input                       dav0,
    input                [31:0] din0,

    input                       rq1,
    input  [NUM_FRAME_BITS-1:0] hist_frame1, // frame number matching histogram output
    output                      grant1,
    input                       dav1,
    input                [31:0] din1,

    input                       rq2,
    input  [NUM_FRAME_BITS-1:0] hist_frame2, // frame number matching histogram output
    output                      grant2,
    input                       dav2,
    input                [31:0] din2,

    input                       rq3,
    input  [NUM_FRAME_BITS-1:0] hist_frame3, // frame number matching histogram output
    output                      grant3,
    input                       dav3,
    input                [31:0] din3,

    output                      rq,
    output [NUM_FRAME_BITS-1:0] hist_frame, // frame number matching histogram output
    input                       grant, // grant may stay longer, not masked by rq?
    output                [1:0] chn,
    output                      dv,
    output               [31:0] dout
);

    reg   [2:0] burst0;
    reg   [2:0] burst1;
    reg   [2:0] burst2;
    reg   [2:0] burst3;
    
    wire  [3:0] pri_rq;
    reg   [2:0] enc_rq;
    wire        busy_w;
    reg         busy_r;
    reg   [1:0] mux_sel;
    wire        start_w;
//    reg         start_r;
    reg         started;
    wire        dav_in;
    reg         dav_out;
    wire [31:0] din;
    reg  [31:0] dout_r;
    wire        burst_done_w;
    wire  [3:0] chn_sel;
    wire  [3:0] chn_start;
    wire  [3:0] burst_next;
    reg   [3:0] chn_grant;
    wire        rq_in;
    reg         rq_out;
    
    assign pri_rq = {rq3 & ~rq2 & ~rq1 & ~rq0, rq2 & ~rq1 & ~ rq0, rq1 & ~ rq0, rq0};
    assign busy_w = |burst0 || (|burst1) || (|burst2) || (|burst3);
    assign start_w = enc_rq[2] && !busy_r && !started;
    assign dav_in =     mux_sel[1] ? (mux_sel[0] ? dav3 :         dav2) :         (mux_sel[0] ? dav1 :         dav0); 
    assign din =        mux_sel[1] ? (mux_sel[0] ? din3 :         din2) :         (mux_sel[0] ? din1 :         din0);
    assign rq_in =      mux_sel[1] ? (mux_sel[0] ? rq3 :          rq2)  :         (mux_sel[0] ? rq1 :          rq0);
    assign hist_frame = mux_sel[1] ? (mux_sel[0] ? hist_frame3 :  hist_frame2)  : (mux_sel[0] ? hist_frame1 :  hist_frame0);
     
    assign burst_done_w = dav_out && !dav_in;
    assign chn_start =  {4{start_w}} & {enc_rq[1] & enc_rq[0], enc_rq[1] & ~enc_rq[0], ~enc_rq[1] & enc_rq[0], ~enc_rq[1] & ~enc_rq[0]};
    assign chn_sel =    {mux_sel[1] & mux_sel[0], mux_sel[1] & ~mux_sel[0], ~mux_sel[1] & mux_sel[0], ~mux_sel[1] & ~mux_sel[0]};
    assign burst_next = {4{burst_done_w}} & chn_sel;
    
    assign dout =   dout_r;
    assign grant0 = chn_grant[0];
    assign grant1 = chn_grant[1];
    assign grant2 = chn_grant[2];
    assign grant3 = chn_grant[3];
    assign rq =     rq_out;
    assign dv =     dav_out;
    assign chn =    mux_sel;
    
    always @(posedge mclk) begin
        enc_rq <= {|pri_rq, pri_rq[3] | pri_rq[2], pri_rq[3] | pri_rq[1]};
        busy_r <= busy_w;
        if  (!en || busy_r) started <= 0;
        else if (enc_rq[2]) started <= 1;
        if (start_w)        mux_sel <= enc_rq[1:0];
        dav_out <= dav_in;
        dout_r <= din;
        
        if      (!en)           burst0 <= 0;
        else if (chn_start[0])  burst0 <= 4;
        else if (burst_next[0]) burst0 <= burst0 + 1;
        
        if      (!en)           burst1 <= 0;
        else if (chn_start[1])  burst1 <= 4;
        else if (burst_next[1]) burst1 <= burst1 + 1;
        
        if      (!en)           burst2 <= 0;
        else if (chn_start[2])  burst2 <= 4;
        else if (burst_next[2]) burst2 <= burst2 + 1;
        
        if      (!en)           burst3 <= 0;
        else if (chn_start[3])  burst3 <= 4;
        else if (burst_next[3]) burst3 <= burst3 + 1;
        
        if (!en) chn_grant <= 0;
        else     chn_grant <= {4{grant & rq}} & chn_sel;
//        else     chn_grant <= {4{grant & rq}} & chn_sel;
//        start_r <= en & start_w;
        if (!en )         rq_out <= 0;
        else if (started) rq_out <= 1;
        else if (rq_out)  rq_out <= rq_in;
//        rq_out <= en && rq_in;
    end

endmodule

