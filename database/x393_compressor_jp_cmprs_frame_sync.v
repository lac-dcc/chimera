// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmprs_frame_sync
 * @file cmprs_frame_sync.v
 * @date 2015-06-23  
 * @author Andrey Filippov     
 *
 * @brief Synchronizes memory channels (sensor and compressor)
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmprs_frame_sync.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmprs_frame_sync.v is distributed in the hope that it will be useful,
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

module  cmprs_frame_sync#(
    parameter FRAME_HEIGHT_BITS=               16,    // Maximal frame height 
    parameter LAST_FRAME_BITS=                 16,     // number of bits in frame counter (before rolls over)
    parameter CMPRS_TIMEOUT_BITS=              12,
    parameter CMPRS_TIMEOUT=                   1000   // mclk cycles

)(
    input                         xclk,               // global clock input, compressor single clock rate
    input                         mclk,               // global system/memory clock
    input                         mrst,               // @posedge mclk, sync reset
    input                         xrst,               // @posedge xclk, sync reset
    
    input                         cmprs_en,           // @mclk 0 resets immediately
    output                        cmprs_en_extend,    // @mclk keep compressor enabled for graceful shutdown

// TODO: delay vsync_late if still compressing previous frame in multi-frame buffer mode
     
    input                         cmprs_run,          // @mclk enable propagation of vsync_late to frame_start_dst in bonded(sync to src) mode
    input                         cmprs_standalone,   // @mclk single-cycle: generate a single frame_start_dst in unbonded (not synchronized) mode.
                                                      // cmprs_run should be off
    input                         sigle_frame_buf,    // memory controller uses a single frame buffer (frame_number_* == 0), use other sync                                                      
    input                         vsync_late,         // @mclk delayed start of frame, @xclk. In 353 it was 16 lines after VACT active
                                                      // source channel should already start, some delay give time for sequencer commands
                                                      // that should arrive before it
    input                         frame_started,      // @xclk started first macroblock (checking for broken frames)
                                                      
    output                        frame_start_dst,    // @mclk - trigger receive (tiled) memory channel (it will take care of single/repetitive
                                                      // this output either follows vsync_late (reclocks it) or generated in non-bonded mode
                                                      // (compress from memory)
    input                         frame_start_conf,   // memory controller confirmed frame_start_dst - normally delayed by 1 clock,
                                                      // or more if there were outstanding memory transactions.                                                           
                                                      
    input [FRAME_HEIGHT_BITS-1:0] line_unfinished_src,// number of the current (unfinished ) line, in the source (sensor) channel (RELATIVE TO FRAME, NOT WINDOW?)
    input   [LAST_FRAME_BITS-1:0] frame_number_src,   // current frame number (for multi-frame ranges) in the source (sensor) channel
    input                         frame_done_src,     // single-cycle pulse when the full frame (window) was transferred to/from DDR3 memory 
                                                      // frame_done_src is later than line_unfinished_src/ frame_number_src changes
                                                      // Used withe a single-frame buffers
     
    input [FRAME_HEIGHT_BITS-1:0] line_unfinished,    // number of the current (unfinished ) line in this (compressor) channel
    input   [LAST_FRAME_BITS-1:0] frame_number,       // current frame number (for multi-frame ranges) in this (compressor channel
    input                         frames_in_sync,     // frame number in destination memory channel is valid for bonded mode
    input                         frame_done,         // input - single-cycle pulse when the full frame (window) was transferred to/from DDR3 memory\
    input                         last_mb_started,    // @ xclk - last mb started running, safe to assume memory channel is done 
    output reg                    suspend,            // suspend reading data for this channel - waiting for the source data

    input                         stuffer_running,    // @xclk2x stuffer is running/flushing
    output reg                    force_flush_long,    // force flush (abort frame), can be any clock and may last until stuffer_done_mclk
                                                      // stuffer will re-clock and extract 0->1 transition
    output                        stuffer_running_mclk,
    output                        reading_frame,      // @mclk
    output                        frame_started_mclk  // use to store frame number
);
/*
 Abort frame (force flush) if:
 a) "broken frame" - attempted to start a new frame before previous one was completely read from the memory
 b) turned off enable while frame was being compressed
 Abort frame lasts until flush end or timeout expire
 
 
 TODO: Simplify logic: instead of frame_start_pend_r - copy frame_number_srtc @ vsync_late, and start frame if it is not reading,
 in "run" mode, and frame_number_differ (in multi-frame mode)
*/
    reg        bonded_mode;
    reg  [5:0] frame_start_dst_r;
    reg        frame_start_pend_r; // postpone frame_start_dst if previous frame was still being read during vsync_late 
    reg        frames_differ;  // src and dest point to different frames (single-frame buffer mode), disregard line_unfinished_*
    reg        frames_numbers_differ;  // src and dest point to different frames (multi-frame buffer mode), disregard line_unfinished_*
    reg        line_numbers_sync;      // src unfinished line number is > this unfinished line number
    
    reg        reading_frame_r;         // compressor is reading frame data (make sure input is done before starting next frame, otherwise make it a broken frame
    reg        aborted_frame;
    reg        stuffer_running_mclk_r;
    reg [CMPRS_TIMEOUT_BITS-1:0] timeout;
    reg        cmprs_en_extend_r=0;
    reg        cmprs_en_d;
    reg        suspend_end; // suspend at the end of the current frame until frame number changes
    wire      last_mb_started_mclk;
    assign frame_start_dst = frame_start_dst_r[0];
    assign cmprs_en_extend = cmprs_en_extend_r;
    
    assign stuffer_running_mclk = stuffer_running_mclk_r;
    assign reading_frame =        reading_frame_r;
    
    always @ (posedge mclk) begin
        if       (mrst)                                       cmprs_en_extend_r <= 0;
        else if  (cmprs_en)                                   cmprs_en_extend_r <= 1;
        else if  ((timeout == 0) || !stuffer_running_mclk_r)  cmprs_en_extend_r <= 0;
        
    end
    
    always @ (posedge mclk) begin
        stuffer_running_mclk_r <= stuffer_running; // re-clock from negedge xclk2x
        
        if      (cmprs_en)           timeout <= CMPRS_TIMEOUT;
        else if (!cmprs_en_extend_r) timeout <= 0;
        else                         timeout <= timeout - 1;
        
        cmprs_en_d <= cmprs_en;

        aborted_frame <= cmprs_en_d && !cmprs_en && stuffer_running_mclk_r;
        
        if      (!stuffer_running_mclk_r ||!cmprs_en_extend_r) force_flush_long <= 0;
        else if (aborted_frame)                                force_flush_long <= 1;

// TODO: Consider the opposite - frame_done, but not got the last MB?
        if (!cmprs_en || frame_done || last_mb_started_mclk)      reading_frame_r <= 0;
        else if (frame_started_mclk)                              reading_frame_r <= 1;

        if      (!cmprs_run || frame_start_conf)                                 frame_start_pend_r <= 0;
        else if ((cmprs_run && vsync_late && reading_frame_r) ||
                 (frame_start_dst_r[5] && bonded_mode && frames_numbers_differ)) frame_start_pend_r <= 1;
        if      (!cmprs_run)           suspend_end <= 0;
        else if (frame_done)           suspend_end <= 1;
        else if (frame_start_dst_r[3]) suspend_end <= 0;
        
        frame_start_dst_r[0] <= cmprs_en && (cmprs_run ? 
                                            ((vsync_late && !reading_frame_r) || (frame_start_pend_r  && frame_done)):
                                             cmprs_standalone);
        // modified - now bit 0 is disconnected from 1..5, 1 gets from memory channel controller, may be delayed                                             
        if      (!cmprs_en)   frame_start_dst_r[5:1] <=0;
        else                  frame_start_dst_r[5:1] <= {frame_start_dst_r[4:1],frame_start_conf};                                             
        
        if      (!cmprs_en)        bonded_mode <= 0;
        else if (cmprs_run)        bonded_mode <= 1;
        else if (cmprs_standalone) bonded_mode <= 0;
        
        if (!cmprs_en || !cmprs_run || vsync_late) frames_differ <= 0;
        else if (frame_done_src)                   frames_differ <= 1'b1;
        
        frames_numbers_differ <= !suspend_end && (frame_number_src != frame_number); // during end of frame, before frame number is incremented
        
        line_numbers_sync <= (line_unfinished_src >= line_unfinished);
        
        suspend <= bonded_mode && (!frames_in_sync || !((sigle_frame_buf ? frames_differ : frames_numbers_differ) || line_numbers_sync));

    end
    
    pulse_cross_clock frame_started_i   (.rst(xrst), .src_clk(xclk), .dst_clk(mclk), .in_pulse(frame_started), .out_pulse(frame_started_mclk),.busy());
    pulse_cross_clock last_mb_started_i (.rst(xrst), .src_clk(xclk), .dst_clk(mclk), .in_pulse(last_mb_started), .out_pulse(last_mb_started_mclk),.busy());


endmodule

