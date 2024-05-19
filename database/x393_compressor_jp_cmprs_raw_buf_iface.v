// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmprs_raw_buf_iface
 * @file cmprs_raw_buf_iface.v
 * @date 2015-06-11  
 * @author Andrey Filippov     
 *
 * @brief Communicates with compressor memory buffer in raw (uncompressed) mode
 *
 * @copyright Copyright (c) 2019 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmprs_raw_buf_iface.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmprs_raw_buf_iface.v is distributed in the hope that it will be useful,
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

module  cmprs_raw_buf_iface #(
//    parameter DCT_PIPELINE_PAUSE = 48, // TODO: find really required value (minimal), adjust counter bits (now 6)
//                                      // 48 seems to be OK (may be less)
    parameter FRAME_QUEUE_WIDTH = 2
)(
    input         xclk,               // global clock input, compressor single clock rate
    input         mclk,               // global clock for commands (posedge) and write side of the memory buffer (negedge)
    input         mrst,      // @posedge mclk, sync reset
    input         xrst,      // @posedge xclk, sync reset

// Page is limited by 1kB or end of line
    // buffer interface, DDR3 memory read
    input         xfer_reset_page_rd, // @ negedge mclk - reset ddr3 memory buffer. Use it to reset the read buffer too
    input         page_ready_chn,     // single mclk (posedge)
    output        next_page_chn,      // single mclk (posedge): Done with the page in the  buffer, memory controller may read more data 
     
// will be externally combined with "uncompressed"  
    input         frame_en,           // if 0 - will reset logic immediately (but not the page number)
    input         frame_start_xclk,   // frame parameters are valid after this pulse (re-clocked from the memory controller)
    input         frame_go,           // start frame: if idle, will start reading data (if available),
                                      // if running - will not restart a new frame if 0.
    input         cmprs_run_mclk,     // 0 - off or stopping, reset frame_pre_run
//    input  [ 4:0] left_marg,          // left margin (for not-yet-implemented) mono JPEG (8 lines tile row) can need 7 bits (mod 32 - tile)
    input  [12:0] n_blocks_in_row_m1, // number of macroblocks in a macroblock row minus 1
    input  [12:0] n_block_rows_m1,    // number of macroblock rows in a frame minus 1
    input             stuffer_running, // @xclk, active while bit stuffer or trailer are running
    input             raw_be16,           // 0: bytes 0-1-2-3-4-5..., 1: bytes 1-0-3-2-5-4...
    output     [11:0] buf_ra,             // buffer read address (2 MSB - page number)
    output     [ 1:0] buf_rd,             // buf {regen, re}
    output            raw_start,          // was color_first leading edge
    output            raw_prefb,   // input
    output            raw_ts_copy, // input
    output            raw_flush   // input
);

// TODO:

    wire          reset_page_rd; // xfer_reset_page_rd @ xclk
    wire          page_ready;    // page_ready_chn @ xclk

    wire          frame_en_w;
    reg           frame_en_r;
    wire          frame_pre_start_w; // start sequence for a new frame
    reg           frame_pre_start_r; 
    reg           frame_start_xclk_r; // next cycle after frame_start_xclk
    reg           cmprs_run_xclk;
    reg           frame_pre_run;
    reg [FRAME_QUEUE_WIDTH:0] frame_que_cntr; // width+1
    reg     [3:0] frame_finish_r; // active after last macroblock in a frame

    reg    [ 2:0] next_valid;     // number of next valid page (only 2 LSB are actual page number)
    reg    [ 2:0] needed_page;    // calculate at MB start
    wire   [ 2:0] buf_diff;       // difference between page needed and next valid - should be negative to have it ready
    wire          buf_ready_w;    // External memory buffer has all the pages needed
    
    reg    [14:0] quads_left;  // number of quad bytes left in a row (after this)    
    reg    [16:0] rows_left;   // number of rows left (after this)
    reg     [1:0] rows_last;
    reg           page_run; // on after page_start, off after quad_r[2], so during last quad_r[3] shold be off
    reg     [3:0] quad_r;
    reg           quad_last;   // last quad byte in a row should be valid @quad_r[2]
    wire          page_start;
    wire          page_end_w;
    
    wire          release_buf;     // send required "next_page" pulses to buffer. Having rather long minimal latency in the memory
    wire          frame_finish_w;
    wire          frames_pending;
    reg           starting; // from frame_start_r to first page start
    reg           mode_valid;//  after parameters are valid, invalid whe mode is reset
    reg           page_end_r;
    reg           frame_done;
    
    assign frame_en_w = frame_en && frame_go; // both are inputs
    // one extra at the end of frame is needed (sequence will be short)  ???
////    assign mb_pre_start_w =     mb_pre_end_in ||              (frame_start_xclk_r && !frame_pre_run); //  && !starting);
// repeated start (if some are pending) and for the first frame     
    assign frame_pre_start_w =  (frames_pending && frame_finish_w) || (frame_start_xclk_r && !frame_pre_run && !starting);

    assign buf_diff = needed_page - next_valid;
    assign buf_ready_w = buf_diff[2];

//    assign page_start = !page_run && buf_ready_w && ((frame_pre_run && starting && stuffer_running) || !frame_done);  // frame_pre_run should deassert  in time with frame end
    assign page_start = !page_run && buf_ready_w && frame_pre_run && ((starting && stuffer_running) || !frame_done);  // frame_pre_run should deassert  in time with frame end
   
//    reg page_restart_r;
     
    assign raw_start = frame_pre_start_r; // for JP - leading edge of color_first
//  assign page_end_w = frame_en && quad_r[2] && (&bufa_r[9:2] || quad_last);
    assign page_end_w = frame_en && quad_r[1] && (&bufa_r[9:2] || quad_last);
    
//    assign release_buf = page_end_w;
    assign release_buf = page_end_r;
    
    assign frame_finish_w = frame_finish_r[1]  && !frame_finish_r[0]; // now just single-cycle, no need for frame_finish_r[0]
    assign frames_pending = !frame_que_cntr[FRAME_QUEUE_WIDTH] && (|frame_que_cntr[FRAME_QUEUE_WIDTH-1:0]);
    
    assign frame_en_w = frame_en && frame_go;
    
//    assign raw_prefb = buf_rd_r[0]; // delay if memory registered more. TODO Add parameter if it already used    
    assign raw_prefb = quad_r[1]; // delay if memory registered more. TODO Add parameter if it already used    
    
    assign raw_ts_copy = frame_en_r && rows_last[0] && !rows_last[1];

    reg    [11:0]   bufa_r;             // buffer read address (2 MSB - page number)
    reg     [1:0] buf_rd_r;

    assign raw_flush = frame_finish_r[3]; // frame_finish_w;
    
    assign buf_ra = bufa_r;
    
    assign buf_rd = buf_rd_r[1:0];
    always @(posedge xclk) begin
        // pages read from the external memory, previous one is the last in the buffer
        if   (reset_page_rd) next_valid <= 0;
        else if (page_ready) next_valid <=  next_valid + 1;
    
        if      (!frame_en)         mode_valid <= 0;
//        else if (frame_start_xclk) mode_valid <= frame_start_xclk;
        else if (frame_pre_start_r) mode_valid <= 1; // frame_pre_start_r sets remaining quads, rows
        
   
    
    
        cmprs_run_xclk <=     cmprs_run_mclk;
            
        frame_pre_start_r <= frame_pre_start_w; // same time as mb_pre_start
    
        if (!frame_en) frame_start_xclk_r <= 0;
        else           frame_start_xclk_r <= frame_start_xclk;
        
        if      (!frame_en)         starting <= 1'b0;
        else if (frame_pre_start_w) starting <= 1'b1;
        else if (page_start)        starting <= 1'b0;
    
        if (!frame_en) frame_en_r <= 0;
        else           frame_en_r <= frame_en_w; // stays on?

        if      (!cmprs_run_xclk)                           frame_que_cntr <= 0;
        else if ( frame_start_xclk_r && !frame_pre_start_r) frame_que_cntr <= frame_que_cntr + 1;
        else if (!frame_start_xclk_r && frame_pre_start_r)  frame_que_cntr <= frame_que_cntr - 1;
        
        if (reset_page_rd) needed_page[2:0] <=  0; // together with next_valid, next_invalid
        else if (release_buf) begin
            needed_page <= needed_page + 1;
        end
        
        page_end_r <= page_end_w; // quad_r[2] && (&bufa_r[9:2] || quad_last);
        
        // page_run
        if      (!frame_pre_run)          page_run <= 0;
        else if (page_start)              page_run <= 1;
//        else if (quad_r[2] && page_end_r) page_run <= 0;        
        else if (page_end_r)              page_run <= 0;        
        
        if      (!frame_pre_run)          quad_r <=    0;
        else                              quad_r <= {quad_r[2:0], page_start | (quad_r[3] & page_run)}; 
        
        buf_rd_r <= {buf_rd_r[0], page_start | (|quad_r[2:0] | (quad_r[3] & page_run))}; 

        if   (!frame_en) frame_finish_r <= 0;
        else             frame_finish_r <= {frame_finish_r[2:0], quad_r[2] & quad_last & rows_last[0]};

//quads_left        
        if      (frame_pre_start_r || (quad_r[2] && quad_last)) quads_left <= {n_blocks_in_row_m1, 2'b11};
        else if (quad_r[2])                                     quads_left <= quads_left - 1;
        
        quad_last <= mode_valid && !(|quads_left); // valid from 2 after frame_pre_start_r or after quad_r[3]

        if      (frame_pre_start_r)                             rows_left <=  {n_block_rows_m1, 4'b1111};
        else if ((quad_r[2] && quad_last))                      rows_left <=  rows_left - 1;
        
        rows_last <= {rows_last[0], mode_valid & ~(|rows_left)};
        
//        if (frame_pre_start_r) bufa_r[11:10] <= needed_page[1:0];
        if (page_start) bufa_r[11:10] <= needed_page[1:0];
        
        
//        if (frame_pre_start_r)           bufa_r[9:1] <= 0;
        if      (page_start)             bufa_r[9:1] <= 0;
        else if (quad_r[1] | quad_r[3])  bufa_r[9:1] <= bufa_r[9:1] + 1;
        
        if (frame_pre_start_r) bufa_r[0] <=  raw_be16;
        else if (buf_rd_r[0])  bufa_r[0] <= ~bufa_r[0];

        if      (!frame_en || (!frames_pending && frame_finish_w)) frame_pre_run <= 0;
        else if (frame_pre_start_w)                                frame_pre_run <= 1;
        
        if      (!frame_en || frame_pre_start_r)      frame_done <= 0;
        else if (quad_r[2] && quad_last && rows_last) frame_done <= 1; // valid @ quad_r[3], when page_run is already == 0 
        
    end
    
    reg nmrst;
    always @(negedge mclk) nmrst <= mrst;
    // synchronization between mclk and xclk clock domains
    // negedge mclk -> xclk (verify clock inversion is absorbed)
    pulse_cross_clock  reset_page_rd_i (.rst(nmrst), .src_clk(~mclk),.dst_clk(xclk), .in_pulse(xfer_reset_page_rd), .out_pulse(reset_page_rd), .busy());
    // mclk -> xclk
    pulse_cross_clock page_ready_i     (.rst(mrst), .src_clk(mclk),  .dst_clk(xclk), .in_pulse(page_ready_chn),     .out_pulse(page_ready),    .busy());
    // xclk -> mclk
    pulse_cross_clock next_page_chn_i  (.rst(xrst), .src_clk(xclk),  .dst_clk(mclk), .in_pulse(page_end_r),         .out_pulse(next_page_chn), .busy());

endmodule

