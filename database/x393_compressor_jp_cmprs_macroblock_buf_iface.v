// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmprs_macroblock_buf_iface
 * @file cmprs_macroblock_buf_iface.v
 * @date 2015-06-11  
 * @author Andrey Filippov     
 *
 * @brief Communicates with compressor memory buffer, generates pixel
 * stream matching selected color mode, accommodates for the buffer latency,
 * acts as a pacemaker for the whole compressor (next stages are able to keep up).
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmprs_macroblock_buf_iface.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmprs_macroblock_buf_iface.v is distributed in the hope that it will be useful,
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

module  cmprs_macroblock_buf_iface #(
`ifdef USE_OLD_DCT
    parameter DCT_PIPELINE_PAUSE = 0, // No need to delay
`else    
    parameter DCT_PIPELINE_PAUSE = 48, // TODO: find really required value (minimal), adjust counter bits (now 6)
                                      // 48 seems to be OK (may be less)
`endif                                      
    parameter FRAME_QUEUE_WIDTH = 2
)(
//    input         rst,
    input         xclk,               // global clock input, compressor single clock rate
    
    input         mclk,               // global clock for commands (posedge) and write side of the memory buffer (negedge)
    input         mrst,      // @posedge mclk, sync reset
    input         xrst,      // @posedge xclk, sync reset
    
    // buffer interface, DDR3 memory read
    input         xfer_reset_page_rd, // @ negedge mclk - reset ddr3 memory buffer. Use it to reset the read buffer too
    input         page_ready_chn,     // single mclk (posedge)
    output        next_page_chn,      // single mclk (posedge): Done with the page in the  buffer, memory controller may read more data 
     
    input         frame_en,           // if 0 - will reset logic immediately (but not page number)
    input         frame_start_xclk,   // frame parameters are valid after this pulse
    input         frame_go,           // start frame: if idle, will start reading data (if available),
                                      // if running - will not restart a new frame if 0.
    input         cmprs_run_mclk,     // 0 - off or stopping, reset frame_pre_run
    input  [ 4:0] left_marg,          // left margin (for not-yet-implemented) mono JPEG (8 lines tile row) can need 7 bits (mod 32 - tile)
    input  [12:0] n_blocks_in_row_m1, // number of macroblocks in a macroblock row minus 1
    input  [12:0] n_block_rows_m1,    // number of macroblock rows in a frame minus 1
    input  [ 5:0] mb_w_m1,            // macroblock width minus 1 // 3 LSB not used
    input  [ 4:0] mb_hper,            // macroblock horizontal period (8/16) // 3 LSB not used
    input  [ 1:0] tile_width,        // memory tile width (can be 128 for monochrome JPEG)   Can be 32/64/128: 0 - 16, 1 - 32, 2 - 64, 3 - 128
    
    input         mb_pre_end_in,      // from cmprs_pixel_buf_iface - just in time to start a new macroblock w/o gaps
    input         mb_release_buf,     // send required "next_page" pulses to buffer. Having rather long minimal latency in the memory
                                      // controller this can just be the same as mb_pre_end_in        
    output        mb_pre_start_out,   // 1 clock cycle before stream of addresses to the buffer
    output [ 1:0] start_page,         // page to read next tile from (or first of several pages)
    output [ 6:0] macroblock_x,       // macroblock left pixel x relative to a tile (page) Maximal page - 128 bytes wide
    output reg    first_mb,           // during first macroblock (valid @mb_pre_start_out)
    output        last_mb             // during last macroblock (valid @mb_pre_start_out)
`ifdef DEBUG_RING
    ,output [ 1:0] dbg_add_invalid,
    output         dbg_mb_release_buf
`endif    
);

    wire          reset_page_rd;
    wire          page_ready;
    
    wire          frame_en_w;
    reg           frame_en_r;
    
    reg    [12:0] mb_cols_left;   // number of a macroblocks left in a row (after this)    
    reg    [12:0] mb_rows_left;   // number of a rows left in a row (after this)
    wire   [ 6:0] mbl_x;          // macroblock left pixel x relative to a tile (page) Maximal page - 128 bytes wide
    reg    [ 6:3] mbl_x_r;        // macroblock left pixel x relative to a tile (page) (3 low don't change)
    reg    [ 6:3] mbl_x_next_r;   // macroblock left pixel x relative to a tile (page), not valid for first column (3 low don't change)    
    reg    [ 7:3] mbl_x_inc_r;    // intermediate register for calculating mbl_x_next_r and add_invalid
    reg    [ 7:3] mbl_x_last_r;   // intermediate register for calculating needed_page

    reg    [1:0]  pre_advance_tiles; // advance tiles by this for same row of macroblocks

    wire          mb_pre_start_w; // start sequence for a macroblock
    wire          frame_pre_start_w; // start sequence for a new frame
    reg           frame_pre_start_r; 
    reg    [ 8:0] mb_pre_start;   // 1-hot macroblock pre start calcualtions - TODO: adjust width
    reg           mb_pre_start4_first; // first cycle after mb_pre_start[3]    
    wire   [ 2:0] buf_diff;       // difference between page needed and next valid - should be negative to have it ready
    wire          buf_ready_w;    // External memory buffer has all the pages needed
       
    reg           mb_first_in_row;
    reg           mb_last_in_row;
    reg           mb_last_row;
//    wire          last_mb;
    reg    [ 2:0] next_valid;     // number of next valid page (only 2 LSB are actual page number)
    reg    [ 2:0] next_invalid;   // oldest valid page
    reg    [ 1:0] add_invalid;    // advance next_invalid pointer by this value, send next_page pulses
//    reg    [ 2:0] used_pages;    // number of pages simultaneously used for the last macroblock
    reg    [ 1:0] used_pages;     // number of pages simultaneously used for the last macroblock - [2] was never used
    reg    [ 2:0] needed_page;    // calculate at MB start
    reg           pre_first_mb;   // from frame start to mb_pre_start[2]
//    reg           first_mb;       // from mb_pre_start[2]  to mb_pre_start[1]
    wire          starting;
    reg           frame_pre_run;
//    reg     [1:0] frame_may_start;
    reg           frame_start_xclk_r; // next cycle after frame_start_xclk
    reg           cmprs_run_xclk;
    
    reg     [5:0] dct_pipeline_delay_cntr;
    
    reg [FRAME_QUEUE_WIDTH:0] frame_que_cntr; // width+1
    reg     [1:0] frame_finish_r; // active after last macroblock in a frame
    wire          mb_done_w;
    wire          frame_finish_w;
    wire          frames_pending;
    
//    assign mb_done = mb_pre_start[1] && last_mb; // mb_pre_end_in && last_mb; 
    assign mb_done_w = mb_pre_start[1] && last_mb; // mb_pre_end_in && last_mb; 
//    assign mb_done_w = first_mb && (dct_pipeline_delay_cntr == 1);
    assign frame_finish_w = frame_finish_r[1] && !frame_finish_r[0];
    assign frames_pending = !frame_que_cntr[FRAME_QUEUE_WIDTH] && (|frame_que_cntr[FRAME_QUEUE_WIDTH-1:0]);
    
`ifdef DEBUG_RING
    assign  dbg_add_invalid = add_invalid;
    assign  dbg_mb_release_buf = mb_release_buf;
`endif
    assign frame_en_w = frame_en && frame_go;
    
    assign mbl_x={mbl_x_r[6:3], left_marg[2:0]};
    
    assign buf_diff = needed_page - next_valid;
    assign buf_ready_w = buf_diff[2];
    assign mb_pre_start_out=mb_pre_start[5]; // first after wait?
    assign macroblock_x = mbl_x;

    assign last_mb = mb_last_row && mb_last_in_row;
    assign starting = |mb_pre_start;

/*
    assign mb_pre_start_w =  (mb_pre_end_in && (!last_mb || frame_may_start)) ||
                             ((frame_may_start==2'b1) && !frame_pre_run && !starting);
    assign frame_pre_start_w =  frame_may_start[0] && ((mb_pre_end_in && last_mb) || (!frame_pre_run && !frame_may_start[1] && !starting));
*/   
    // one extra at the end of frame is needed (sequence will be short) 
    assign mb_pre_start_w =     mb_pre_end_in ||              (frame_start_xclk_r && !frame_pre_run && !starting);
//    assign frame_pre_start_w =  (mb_pre_end_in && last_mb) || (frame_start_xclk_r && !frame_pre_run && !starting);
    assign frame_pre_start_w =  (frames_pending && frame_finish_w) || (frame_start_xclk_r && !frame_pre_run && !starting);

 //frame_start_xclk_r   
    assign start_page = next_invalid[1:0]; // oldest page needed for this macroblock
    always @ (posedge xclk) begin
    
        if (!frame_en) frame_start_xclk_r <= 0;
        else           frame_start_xclk_r <= frame_start_xclk;
        
        
        if (!frame_en) frame_en_r <= 0;
        else           frame_en_r <= frame_en_w;
        
///     if (!frame_en_w || starting) frame_may_start[0] <= 0;
///     else if (frame_start_xclk)   frame_may_start[0] <= 1;
///     frame_may_start[1] <= frame_may_start[0];
        
        frame_pre_start_r <= frame_pre_start_w; // same time as mb_pre_start
        
        if      (!frame_en)         mb_first_in_row <= 0;
        else if (frame_pre_start_r) mb_first_in_row <= 1;
        else if (mb_pre_start[0])   mb_first_in_row <= mb_last_in_row;
        
        cmprs_run_xclk <=cmprs_run_mclk;
        
        if      (!frame_en || (!frames_pending && frame_finish_w)) frame_pre_run <= 0;
        else if (mb_pre_start_w)                                   frame_pre_run <= 1;
//        else if (mb_pre_end_in && last_mb)     frame_pre_run <= 0;
        
        if      (frame_pre_start_r)                                        mb_rows_left <= n_block_rows_m1;
        else if (mb_pre_start[0] && mb_last_in_row)                        mb_rows_left <= mb_rows_left - 1;        
        
        if      (frame_pre_start_r || (mb_pre_start[0] && mb_last_in_row)) mb_cols_left <= n_blocks_in_row_m1;
        else if (mb_pre_start[0])                                          mb_cols_left <= mb_cols_left - 1;
        
        if      (frame_pre_start_r)                                        mb_last_row <= 0;
        else if (mb_pre_start[1])                                          mb_last_row <= (mb_rows_left == 0);
        
        if      (frame_pre_start_r)                                        mb_last_in_row <= 0;
        else if (mb_pre_start[1])                                          mb_last_in_row <= (mb_cols_left == 0);
        
        if (!frame_en || mb_pre_start[1]) pre_first_mb <= 0;
        else if (frame_pre_start_r)       pre_first_mb <= 1;
        
        if (mb_pre_start[1]) first_mb <= pre_first_mb;
        
        // pages read from the external memory, previous one is the last in the buffer
        if   (reset_page_rd) next_valid <= 0;
        else if (page_ready) next_valid <=  next_valid + 1;
        
         
        // calculate before starting each macroblock (will wait if buffer is not ready) (TODO: align mb_pre_start[0] to mb_pre_end[2] - same)
        //mb_pre_start_w
        // TODO: Here enforce minimal pause (if not zero for the DCT pipeline to recover
        // will wait for buf_ready_w, but not less than DCT_PIPELINE_PAUSE (or no wait at all)
        mb_pre_start4_first <=mb_pre_start[3];
        if      (!frame_en)                    frame_finish_r[0] <= 0;
        else if (mb_done_w)                    frame_finish_r[0] <= 1;
        else if (dct_pipeline_delay_cntr == 0) frame_finish_r[0] <= 0;
        frame_finish_r[1] <=                   frame_finish_r[0];
        
        if      (xrst)                                 dct_pipeline_delay_cntr <= 0;
        else if ((mb_pre_start4_first && !buf_ready_w) ||
                  mb_done_w)                           dct_pipeline_delay_cntr <= DCT_PIPELINE_PAUSE -1;
        else if (|dct_pipeline_delay_cntr)             dct_pipeline_delay_cntr <= dct_pipeline_delay_cntr -1;
        
        
//      if      (!frame_en_r)                                                      mb_pre_start <= 0;
//        if      (!frame_en_r || (mb_pre_start[1] && last_mb))                      mb_pre_start <= 0;
        if      (!frame_en_r || (mb_pre_start[3] && frame_finish_r[0]))            mb_pre_start <= 0; // so needed page is updated
        else if (mb_pre_start_w)                                                   mb_pre_start <= 1;
//        if      (mb_pre_start_w && ! last_mb)                                      mb_pre_start <= 1;
        else if (!mb_pre_start[4] || (buf_ready_w && !(|dct_pipeline_delay_cntr))) mb_pre_start <= mb_pre_start << 1;
        
        if      (!cmprs_run_xclk)                           frame_que_cntr <= 0;
        else if ( frame_start_xclk_r && !frame_pre_start_r) frame_que_cntr <= frame_que_cntr + 1;
        else if (!frame_start_xclk_r && frame_pre_start_r)  frame_que_cntr <= frame_que_cntr - 1;
        
        
        
        if (mb_pre_start[1]) mbl_x_r[6:3] <=      mb_first_in_row? {2'b0,left_marg[4:3]} : mbl_x_next_r[6:3];
        if (mb_pre_start[2]) mbl_x_last_r[7:3] <= {1'b0,mbl_x_r[6:3]} + {2'b0,mb_w_m1[5:3]};
        
        if (reset_page_rd) needed_page[2:0] <=  0; // together with next_valid, next_invalid
        else if (mb_pre_start[3]) begin
            case (tile_width)
                2'b00: needed_page[2:0] <=  next_invalid[2:0]+{1'b0, mbl_x_last_r[5:4]}; 
                2'b01: needed_page[2:0] <=  next_invalid[2:0]+{1'b0, mbl_x_last_r[6:5]}; 
                2'b10: needed_page[2:0] <=  next_invalid[2:0]+{1'b0, mbl_x_last_r[7:6]}; 
                2'b11: needed_page[2:0] <=  next_invalid[2:0]+{2'b0, mbl_x_last_r[7]}; 
            endcase
        end

        // at the end of each macroblock - calculate start page increment (and after delay - advance invalidate_next)
        // changed to after started:
        
        // calculate next start X in page (regardless of end of macroblock row - selection will be at macroblock start)
        
        if (mb_pre_start[5]) mbl_x_inc_r[7:3] <= {1'b0,mbl_x_r[6:3]} + {3'b0,mb_hper[4:3]};
        if  (mb_pre_start[6]) begin
            case (tile_width)
                2'b00:  begin
                            mbl_x_next_r[6:3] <=       {3'b0,mbl_x_inc_r[3]};
                            pre_advance_tiles[1:0]  <= mbl_x_inc_r[5:4]; 
                        end
                2'b01:  begin
                            mbl_x_next_r[6:3] <=       {2'b0,mbl_x_inc_r[4:3]};
                            pre_advance_tiles[1:0]  <= mbl_x_inc_r[6:5]; 
                        end
                2'b10:  begin
                            mbl_x_next_r[6:3] <=       {1'b0,mbl_x_inc_r[5:3]};
                            pre_advance_tiles[1:0]  <= mbl_x_inc_r[7:6]; 
                        end
                2'b11:  begin
                            mbl_x_next_r[6:3] <=       {     mbl_x_inc_r[6:3]};
                            pre_advance_tiles[1:0]  <= {1'b0, mbl_x_inc_r[7]}; 
                        end
            endcase
//            used_pages <= needed_page - next_invalid +1;
            used_pages <= needed_page[1:0] - next_invalid[1:0] +1; // nit [2] not used
        end
        if  (mb_pre_start[7]) begin // TODO: apply after delay, regardless last or not
            if (mb_last_in_row) add_invalid <= used_pages[1:0];
            else                add_invalid <= pre_advance_tiles;
        end
        // pages already processed by compressor - they can be reused for reading new tiles
        if      (reset_page_rd) next_invalid <= 0;
        else if (mb_pre_start[8]) next_invalid <= next_invalid + {1'b0, add_invalid}; // TODO: Send next_page after delay
        // "next_page_ pulses will be sent near the end of the macroblock


        
    
    end     
    reg nmrst;
    always @(negedge mclk) nmrst <= mrst;
    // synchronization between mclk and xclk clock domains
    // negedge mclk -> xclk (verify clock inversion is absorbed)
    pulse_cross_clock  reset_page_rd_i (.rst(nmrst), .src_clk(~mclk),.dst_clk(xclk), .in_pulse(xfer_reset_page_rd), .out_pulse(reset_page_rd),.busy());
    // mclk -> xclk
    pulse_cross_clock page_ready_i     (.rst(mrst), .src_clk(mclk), .dst_clk(xclk), .in_pulse(page_ready_chn), .out_pulse(page_ready),.busy());

    multipulse_cross_clock #(
        .WIDTH(3),
        .EXTRA_DLY(0)
    ) multipulse_cross_clock_i (
        .rst        (xrst), // input
        .src_clk    (xclk), // input
        .dst_clk    (mclk), // input
        .num_pulses ({1'b0,add_invalid}), // input[0:0] 
        .we         (mb_release_buf), // input
        .out_pulse  (next_page_chn), // output
        .busy       () // output
    );

endmodule

