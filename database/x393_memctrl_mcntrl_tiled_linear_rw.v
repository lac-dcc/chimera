// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>mcntrl_tiled_linear_rw
 * @file mcntrl_tiled_linear_rw.v
 * @date 2015-02-03  
 * @author Andrey Filippov     
 *
 * @brief Organize paged R/W from DDR3 memory in tiled order
 * with window support
 * Tiles spreading over two different frames is not yet supported (needed for
 * line-scan mode in JPEG (JP4 - OK)
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * mcntrl_tiled_linear_rw.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  mcntrl_tiled_linear_rw.v is distributed in the hope that it will be useful,
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
`define REPORT_FRAME_NUMBER 1
`undef DEBUG_MCNTRL_TILED_EXTRA_STATUS 
module  mcntrl_tiled_linear_rw#(
    parameter ADDRESS_NUMBER=                   15,
    parameter COLADDR_NUMBER=                   10,
    parameter NUM_XFER_BITS=                     6,    // number of bits to specify transfer length - linear mode
    parameter FRAME_WIDTH_BITS=                 13,    // Maximal frame width - 8-word (16 bytes) bursts 
    parameter FRAME_HEIGHT_BITS=                16,    // Maximal frame height 
    parameter MAX_TILE_WIDTH=                   6,     // number of bits to specify maximal tile (width-1) (6 -> 64). Used as NUM_XFER_BITS in LINEAR mode
    parameter MAX_TILE_HEIGHT=                  6,     // number of bits to specify maximal tile (height-1) (6 -> 64)
    parameter LAST_FRAME_BITS=                 16,     // number of bits in frame counter (before rolls over)
    parameter MCNTRL_TILED_ADDR=            'h120,
    parameter MCNTRL_TILED_MASK=            'h7f0, // both channels 0 and 1
    parameter MCNTRL_TILED_MODE=            'h0,   // set mode register: {byte32,keep_open,extra_pages[1:0],write_mode,enable,!reset}
    parameter MCNTRL_TILED_STATUS_CNTRL=    'h1,   // control status reporting
    parameter MCNTRL_TILED_STARTADDR=       'h2,   // 22-bit frame start address (3 CA LSBs==0. BA==0)
    parameter MCNTRL_TILED_FRAME_SIZE=      'h3,   // 22-bit frame start address increment (3 CA LSBs==0. BA==0)
    parameter MCNTRL_TILED_FRAME_LAST=      'h4,   // 16-bit last frame number in the buffer
    parameter MCNTRL_TILED_FRAME_FULL_WIDTH='h5,   // Padded line length (8-row increment), in 8-bursts (16 bytes)
    parameter MCNTRL_TILED_WINDOW_WH=       'h6,   // low word - 13-bit window width (0->'h4000), high word - 16-bit frame height (0->'h10000)
    parameter MCNTRL_TILED_WINDOW_X0Y0=     'h7,   // low word - 13-bit window left, high word - 16-bit window top
    parameter MCNTRL_TILED_WINDOW_STARTXY=  'h8,   // low word - 13-bit start X (relative to window), high word - 16-bit start y
                                                      // Start XY can be used when read command to start from the middle
                                                      // TODO: Add number of blocks to R/W? (blocks can be different) - total length?
                                                      // Read back current address (for debugging)?
    parameter MCNTRL_TILED_TILE_WHS=        'h9,   // low byte - 6-bit tile width in 8-bursts, second byte - tile height (0 - > 64),
                                                   // 3-rd byte - vertical step (to control tile vertical overlap)
    parameter MCNTRL_TILED_STATUS_REG_ADDR= 'h5,
    parameter MCNTRL_TILED_PENDING_CNTR_BITS=2,    // Number of bits to count pending trasfers, currently 2 is enough, but may increase
                                                   // if memory controller will allow programming several sequences in advance to
                                                   // spread long-programming (tiled) over fast-programming (linear) requests.
                                                   // But that should not be too big to maintain 2-level priorities
    parameter MCNTRL_TILED_FRAME_PAGE_RESET =1'b0, // reset internal page number to zero at the frame start (false - only when hard/soft reset)                                                     
    // bits in mode control word
    parameter MCONTR_LINTILE_NRESET =        0, // reset if 0
    parameter MCONTR_LINTILE_EN =            1, // enable requests 
    parameter MCONTR_LINTILE_WRITE =         2, // write to memory mode
    parameter MCONTR_LINTILE_EXTRAPG =       3, // extra pages (over 1) needed by the client simultaneously
    parameter MCONTR_LINTILE_EXTRAPG_BITS =  2, // number of bits to use for extra pages
    parameter MCONTR_LINTILE_KEEP_OPEN =     5, // keep banks open (will be used only if number of rows <= 8)
    parameter MCONTR_LINTILE_BYTE32 =        6, // use 32-byte wide columns in each tile (false - 16-byte)
    parameter MCONTR_LINTILE_LINEAR =        7, // Use linear mode instead of tiled
    parameter MCONTR_LINTILE_RST_FRAME =     8, // reset frame number 
    parameter MCONTR_LINTILE_SINGLE =        9, // read/write a single page 
    parameter MCONTR_LINTILE_REPEAT =       10, // read/write pages until disabled
    parameter MCONTR_LINTILE_DIS_NEED =     11, // disable 'need' request
//    parameter MCONTR_LINTILE_SKIP_LATE =    12, // skip actual R/W operation when it is too late, advance pointers NEW: Copied from LINEAR
    parameter MCONTR_LINTILE_COPY_FRAME =   13, // copy frame number from the master channel (single event, not a persistent mode)
    parameter MCONTR_LINTILE_ABORT_LATE =   14  // abort frame if not finished by the new frame sync (wait pending memory)
    
)(
    input                          mrst,
    input                          mclk,
// programming interface
    input                    [7:0] cmd_ad,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                          cmd_stb,     // strobe (with first byte) for the command a/d
    
    output                   [7:0] status_ad,     // byte-wide address/data
    output                         status_rq,     // request to send downstream (last byte with rq==0)
    input                          status_start,   // acknowledge of address (first byte) from downsteram   

    input                          frame_start,   // resets page, x,y, and initiates transfer requests (in write mode will wait for next_page)
    output                         frame_start_conf, // frame start modified by memory controller. Normally delayed by 1 cycle,
                                                     // or more if memory transactions are to be finished 
    input                          next_page,     // page was read/written from/to 4*1kB on-chip buffer
    output                         frame_done,    // single-cycle pulse when the full frame (window) was transferred to/from DDR3 memory
    output                         frame_finished,// turns on and stays on after frame_done
// optional I/O for channel synchronization
// after the last tile in a frame, before starting a new frame line_unfinished will point to non-existent (too high) line in the same frame
    output [FRAME_HEIGHT_BITS-1:0] line_unfinished, // number of the current (unfinished ) line, RELATIVE TO FRAME, NOT WINDOW. 
    input                          suspend,       // suspend transfers (from external line number comparator)
    output   [LAST_FRAME_BITS-1:0] frame_number,  // current frame number (for multi-frame ranges)
    output                         frames_in_sync, // frame number valid for bonded mode                          //LINEAR: frame_set,     // frame number is just set to a new value (can be used by slave to sync)
    input    [LAST_FRAME_BITS-1:0] master_frame,  // current frame number of a master channel                     // LINEAR: nothing
    input                          master_set,    // master frame number set (1-st cycle when new value is valid) // LINEAR: nothing
    output                         xfer_want,     // "want" data transfer
    output                         xfer_need,     // "need" - really need a transfer (only 1 page/ room for 1 page left in a buffer), want should still be set.
    input                          xfer_grant,    // sequencer programming access granted, deassert wait/need
     // LINEAR:     output                         xfer_reject,   // reject granted access (when skipping) (not used for compressor)
     //
    output                         xfer_start_lin_rd, // LINEAR: initiate a transfer (next cycle after xfer_grant), following signals (up to xfer_partial) are valid
    output                         xfer_start_lin_wr, // LINEAR: initiate a transfer (next cycle after xfer_grant), following signals (up to xfer_partial) are valid     
    output                         xfer_start_rd,    // initiate a transfer (next cycle after xfer_grant), following signals (up to xfer_partial) are valid // LINEAR: DNU 
    output                         xfer_start_wr,    // initiate a transfer (next cycle after xfer_grant), following signals (up to xfer_partial) are valid // LINEAR: DNU 
    output                         xfer_start32_rd,  // initiate a transfer to 32-byte wide colums scanning in each tile // LINEAR: DNU 
    output                         xfer_start32_wr,  // initiate a transfer to 32-byte wide colums scanning in each tile // LINEAR: DNU 
    output                   [2:0] xfer_bank,     // start bank address
    output    [ADDRESS_NUMBER-1:0] xfer_row,      // memory row
    output    [COLADDR_NUMBER-4:0] xfer_col,      // start memory column in 8-bursts
    output    [FRAME_WIDTH_BITS:0] rowcol_inc,    // increment row+col (after bank) for the new scan line in 8-bursts (externally pad with 0)
    output    [MAX_TILE_WIDTH-1:0] num_rows_m1,   // number of rows to read minus 1
    output   [MAX_TILE_HEIGHT-1:0] num_cols_m1,   // number of 16-pixel columns to read (rows first, then columns) - 1 
    output                         keep_open,     // (programmable bit)keep banks open (for <=8 banks only // LINEAR: DNU 
    // LINEAR:  [NUM_XFER_BITS-1:0] xfer_num128,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64) 
    output     [MAX_TILE_WIDTH-1:0] xfer_num128,   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8 ( 0 - maximal length, 64)
//    assign xfer_num128= num_cols_r[NUM_XFER_BITS-1:0]; // One bit less!
    
    output                         xfer_partial,  // partial tile (first of 2) , sequencer will not generate page_next at the end of block   
    input                          xfer_page_done,   // transfer to/from the buffer finished (partial transfers should not generate), use rpage_nxt_chn@mclk
    output                         xfer_page_rst_wr, // reset buffer internal page - at each frame start or when specifically reset (write to memory channel), @posedge
    output                         xfer_page_rst_rd  // reset buffer internal page - at each frame start or when specifically reset (read memory channel), @negedge
);
// FIXME: not all tile heights are valid (because of the banks)

//MAX_TILE_WIDTH
    localparam NUM_RC_BURST_BITS=ADDRESS_NUMBER+COLADDR_NUMBER-3;  //to spcify row and col8 == 22
    localparam MPY_WIDTH=        NUM_RC_BURST_BITS; // 22
    localparam PAR_MOD_LATENCY=  9; // TODO: Find actual worst-case latency for:
    reg    [FRAME_WIDTH_BITS-1:0] curr_x;         // (calculated) start of transfer x (relative to window left)
    reg   [FRAME_HEIGHT_BITS-1:0] curr_y;         // (calculated) start of transfer y (relative to window top)
    reg     [FRAME_HEIGHT_BITS:0] next_y;         // (calculated) next row number
    reg   [NUM_RC_BURST_BITS-1:0] line_start_addr;// (calculated) Line start (in {row,col8} in burst8
    reg      [COLADDR_NUMBER-4:0] line_start_page_left; // number of 8-burst left in the memory page from the start of the frame line (LINEAR: DNU)
 // calculating full width from the frame width
//WARNING: [Synth 8-3936] Found unconnected internal register 'frame_y_reg' and it is trimmed from '16' to '3' bits. [memctrl/mcntrl_tiled_linear_rw.v:307]
// Throblem seems to be that frame_y8_r_reg (load of trimmed bits of the frame_y_reg) is (as intended) absorbed into DSP48. The lower 3 bits are used
// outside of the DSP 48.  "dont_touch" seems to work here
`ifndef IGNORE_ATTR
    (* keep = "true" *)
`endif    
    reg   [FRAME_HEIGHT_BITS-1:0] frame_y;     // current line number referenced to the frame top
    reg    [FRAME_WIDTH_BITS-1:0] frame_x;     // current column number referenced to the frame left
    reg   [FRAME_HEIGHT_BITS-4:0] frame_y8_r;  // (13 bits) current row with bank removed, latency2 (to be absorbed when inferred DSP multipler)
    reg      [FRAME_WIDTH_BITS:0] frame_full_width_r;  // (14 bit) register to be absorbed by MPY
    reg           [MPY_WIDTH-1:0] mul_rslt;
    reg   [NUM_RC_BURST_BITS-1:0] start_addr_r;   // 22 bit - to be absorbed by DSP
    reg             [3 * 3 - 1:0] bank_reg;
    wire [FRAME_WIDTH_BITS+FRAME_HEIGHT_BITS-3:0] mul_rslt_w;
    reg      [FRAME_WIDTH_BITS:0] row_left;   // number of 8-bursts left in the current row
    reg                           last_in_row;
    reg      [COLADDR_NUMBER-3:0] mem_page_left; // number of 8-bursts left in the pointed memory page

// (LINEAR: DNU)
    reg        [MAX_TILE_WIDTH:0] lim_by_tile_width;     // number of bursts left limited by the longest transfer (currently 64) (LINEAR: DNU)
    wire     [COLADDR_NUMBER-3:0] remainder_tile_width;  // number of bursts postponed to the next partial tile (because of the page crossing) MSB-sign
    reg                           continued_tile;        // this is a continued tile (caused by page crossing) - only once
    reg      [MAX_TILE_WIDTH-1:0] leftover_cols;         // valid with continued_tile, number of columns left
// (TILED: DNU)
//    reg         [NUM_XFER_BITS:0] lim_by_xfer;   // number of bursts left limited by the longest transfer (currently 64) - using lim_by_tile_width for lim_by_xfer
//    reg        [MAX_TILE_WIDTH:0] lim_by_tile_width;     // number of bursts left limited by the longest transfer (currently 64)
//    wire     [COLADDR_NUMBER-3:0] remainder_in_xfer ;// Use remainder_tile_width;  // number of bursts postponed to the next partial tile (because of the page crossing) MSB-sign
// TODO: in linear mode use continued_tile instead of continued_xfer !
///    reg                           continued_xfer;   //continued_tile;        // this is a continued tile (caused by page crossing) - only once
//    reg       [NUM_XFER_BITS-1:0] leftover; //[MAX_TILE_WIDTH-1:0] leftover_cols;         // valid with continued_tile, number of columns left
// LINEAR using leftover_cols instead of leftover
    
// TODO: LINEAR: use num_cols_r instead of xfer_num128_r
//    reg         [NUM_XFER_BITS:0] xfer_num128_r;   // number of 128-bit words to transfer (8*16 bits) - full bursts of 8
    
// end of (TILED: DNU)
    wire                          pgm_param_w;  // program one of the parameters, invalidate calculated results for PAR_MOD_LATENCY
    reg                     [2:0] xfer_start_r;

// (LINEAR: DNU)
    reg                           xfer_start_rd_r;
    reg                           xfer_start_wr_r;
    reg                           xfer_start32_rd_r;
    reg                           xfer_start32_wr_r;
// (TILED: DNU)
    reg                           xfer_start_lin_rd_r;
    reg                           xfer_start_lin_wr_r;
// end of (TILED: DNU)
    
    reg     [PAR_MOD_LATENCY-1:0] par_mod_r; 
    reg     [PAR_MOD_LATENCY-1:0] recalc_r; // 1-hot CE for re-calculating registers
// SuppressWarnings VEditor unused 
    wire                          calc_valid;   // calculated registers have valid values   - just for simulation
    wire                          chn_en;   // enable requests by channel (continue ones in progress), enable frame_start inputs
    wire                          chn_rst; // resets command, including fifo;
    reg                           chn_rst_d; // delayed by 1 cycle do detect turning off
    wire                          abort_en;     // enable frame abort (mode register bit)
    reg                           aborting_r;   // waiting pending memory transactions at if the frame was not finished at frame sync
    
    reg                           aborting_d;   // aborting_r delayed by 1 cycle // (LINEAR: DNU)
// LINEAR: wire with the same name wire         frame_start_mod = (frame_start_late && !busy_r) || frame_start_delayed; // when frame_start_delayed it will completely miss a frame_start_late
    reg                           frame_start_mod; // either original frame start pulse or delayed during abort (delayed by 1 cycle)
    
    reg                           xfer_page_rst_r=1;
    reg                           xfer_page_rst_pos=1;  
    reg                           xfer_page_rst_neg=1;  
    reg                     [2:0] page_cntr; // to maintain requests - difference between client requests and generated requests
                                             // partial (truncated by memory page) generated requests should not count 
    wire                          cmd_wrmem; //= MCNTRL_TILED_WRITE_MODE; // 0: read from memory, 1:write to memory (change to parameter?) // (LINEAR: DNU)
    
    wire                    [1:0] cmd_extra_pages; // external module needs more than 1 page
//    wire                          skip_too_late; // from LINEAR
    wire                          linear_mode; // use linear mode instead of tiles // (LINEAR: DNU)
    wire                          byte32; // use 32-byte wide colums in each tile (0 - use 16-byte ones)  // (LINEAR: DNU)
    wire                          disable_need; // do not assert need, only want
    wire                          repeat_frames; // mode bit
    wire                          single_frame_w; // pulse
    wire                          rst_frame_num_w;
    wire                          set_copy_frame_num_w; // (LINEAR: DNU)
    reg                           single_frame_r;  // pulse
    reg                     [1:0] rst_frame_num_r; // reset frame number/next start address
    reg                           frame_en;       // enable next frame
    
    reg                           busy_r;
    reg                           want_r;
    reg                           want_d; // want_r delayed (no gap to pending_xfers)
    reg                           need_r;
    reg                           frame_done_r;
    reg                           frame_finished_r;    
    wire                          last_in_row_w;
    wire                          last_row_w;
    reg                           last_block;
    // MCNTRL_TILED_PENDING_CNTR_BITS == LINEAR:MCNTRL_SCANLINE_PENDING_CNTR_BITS
    reg   [MCNTRL_TILED_PENDING_CNTR_BITS-1:0] pending_xfers; // number of requested,. but not finished block transfers   (to genearate frame done)  // LINEAR:MCNTRL_SCANLINE_PENDING_CNTR_BITS
    reg   [NUM_RC_BURST_BITS-1:0] row_col_r;
    reg   [FRAME_HEIGHT_BITS-1:0] line_unfinished_relw_r;
    reg   [FRAME_HEIGHT_BITS-1:0] line_unfinished_r;
    
    wire                          pre_want;
    reg                           pre_want_r1; // LINEAR (equivalent)    
`ifdef DEBUG_MCNTRL_TILED_EXTRA_STATUS    
    wire                   [13:0] status_data;
`else    
  `ifdef REPORT_FRAME_NUMBER
    wire    [LAST_FRAME_BITS+1:0] status_data;
  `else        
    wire                    [1:0] status_data;
  `endif                                               
`endif    
    
    wire                    [3:0] cmd_a; 
    wire                   [31:0] cmd_data; 
    wire                          cmd_we;
    
    wire                          set_mode_w;
    wire                          set_status_w;
    wire                          set_start_addr_w;
    wire                          set_frame_size_w;
    wire                          set_last_frame_w;
    
    wire                          set_frame_width_w;
    wire                          set_window_wh_w;
    wire                          set_window_x0y0_w;
    wire                          set_window_start_w;
    wire                          set_tile_whs_w;
    wire                          lsw13_zero=!(|cmd_data[FRAME_WIDTH_BITS-1:0]); // LSW 13 (FRAME_WIDTH_BITS) low bits are all 0 - set carry bit  
    wire                          msw_zero=  !(|cmd_data[31:16]); // MSW all bits are 0 - set carry bit
    
    wire                          tile_width_zero= !(|cmd_data[ 0+:MAX_TILE_WIDTH]);  // (LINEAR: DNU)
    wire                          tile_height_zero=!(|cmd_data[ 8+:MAX_TILE_HEIGHT]); // (LINEAR: DNU)
    wire                          tile_vstep_zero= !(|cmd_data[16+:MAX_TILE_HEIGHT]); // (LINEAR: DNU)
    
    reg                    [14:0] mode_reg;//mode register: {dis_need,repet,single,rst_frame,na,byte32,keep_open,extra_pages[1:0],write_mode,enable,!reset}
    reg   [NUM_RC_BURST_BITS-1:0] start_range_addr; // (programmed) First frame in range start (in {row,col8} in burst8, bank ==0
    reg   [NUM_RC_BURST_BITS-1:0] frame_size;       // (programmed) First frame in range start (in {row,col8} in burst8, bank ==0
    reg     [LAST_FRAME_BITS-1:0] last_frame_number; 
    reg   [NUM_RC_BURST_BITS-1:0] start_addr;       // (programmed) Frame start (in {row,col8} in burst8, bank ==0
    reg   [NUM_RC_BURST_BITS-1:0] next_frame_start_addr;
    reg     [LAST_FRAME_BITS-1:0] frame_number_cntr;
    reg     [LAST_FRAME_BITS-1:0] frame_number_current;
    reg                           is_last_frame;
    reg                     [4:0] frame_start_r; // increased length to have time from line_unfinished to suspend (external)

    
// (LINEAR: DNU)
    reg        [MAX_TILE_WIDTH:0] tile_cols;  // full number of columns in a tile (in bursts?)
    reg       [MAX_TILE_HEIGHT:0] tile_rows;  // full number of rows in a tile
    reg       [MAX_TILE_HEIGHT:0] tile_vstep; // vertical step between rows of tiles
    reg        [MAX_TILE_WIDTH:0] num_cols_r; // full number of columns to transfer (not minus 1)
    wire       [MAX_TILE_WIDTH:0] num_cols_m1_w; // full number of columns to transfer minus 1 with extra bit
    wire      [MAX_TILE_HEIGHT:0] num_rows_m1_w; // full number of columns to transfer minus 1 with extra bit
// end of (LINEAR: DNU)    
    
    reg      [FRAME_WIDTH_BITS:0] frame_full_width;     // (programmed) increment combined row/col when moving to the next line
                                                  // frame_width rounded up to max transfer (half page) if frame_width> max transfer/2,
                                                  // otherwise (smaller widths) round up to the nearest power of 2
    reg      [FRAME_WIDTH_BITS:0] window_width;   // (programmed) 0- max
    reg     [FRAME_HEIGHT_BITS:0] window_height;  // (programmed) 0- max
    reg    [FRAME_WIDTH_BITS-1:0] window_x0;      // (programmed) window left
    reg   [FRAME_HEIGHT_BITS-1:0] window_y0;      // (programmed) window top
    reg    [FRAME_WIDTH_BITS-1:0] start_x;        // (programmed) normally 0, copied to curr_x on frame_start  
    reg   [FRAME_HEIGHT_BITS-1:0] start_y;        // (programmed) normally 0, copied to curr_y on frame_start 
    
// (LINEAR: DNU)
    reg                           xfer_page_done_d;   // next cycle after xfer_page_done
    reg                           frame_master_pend;  // set frame counter from the master frame number at  next master_set
    reg                           set_frame_from_master; // single-clock copy frame counter from the master channel
    reg                           frames_in_sync_r;
// (TILED: DNU)
//    reg                           xfer_done_d;    // xfer_done delayed by 1 cycle (also includes xfer_skipped)
//    reg [MCNTRL_SCANLINE_DLY_WIDTH-1:0] start_delay; // how much to delay frame start
//    reg [MCNTRL_SCANLINE_DLY_WIDTH:0] start_delay_cntr = {MCNTRL_SCANLINE_DLY_WIDTH+1{1'b1}}; // start delay counter
//    reg                           frame_start_late;
//    wire                          set_start_delay_w; 
    
// end of (TILED: DNU)
    
    
    reg                           buf_reset_pend;  // reset buffer page at next (late)frame sync (compressor should be disabled
                                                   // if total  number of pages in a frame is not multiple of 4
    wire                          chn_dis_delayed = chn_rst || (!chn_en && !busy_r); // reset if real reset or disabled and frame finished 
    
`ifdef REPORT_FRAME_NUMBER
    reg     [LAST_FRAME_BITS-1:0] done_frame_number;
`endif                                               
    
    assign frames_in_sync =     frames_in_sync_r; // (LINEAR: DNU)
    
    assign frame_number =       frame_number_current;
    
    assign set_mode_w =         cmd_we && (cmd_a== MCNTRL_TILED_MODE);
    assign set_status_w =       cmd_we && (cmd_a== MCNTRL_TILED_STATUS_CNTRL);
    assign set_start_addr_w =   cmd_we && (cmd_a== MCNTRL_TILED_STARTADDR);
    assign set_frame_size_w =   cmd_we && (cmd_a== MCNTRL_TILED_FRAME_SIZE);
    assign set_last_frame_w =   cmd_we && (cmd_a== MCNTRL_TILED_FRAME_LAST);
    assign set_frame_width_w =  cmd_we && (cmd_a== MCNTRL_TILED_FRAME_FULL_WIDTH);
    assign set_window_wh_w =    cmd_we && (cmd_a== MCNTRL_TILED_WINDOW_WH);
    assign set_window_x0y0_w =  cmd_we && (cmd_a== MCNTRL_TILED_WINDOW_X0Y0);
    assign set_window_start_w = cmd_we && (cmd_a== MCNTRL_TILED_WINDOW_STARTXY);
    assign set_tile_whs_w =     cmd_we && (cmd_a== MCNTRL_TILED_TILE_WHS); // (LINEAR: DNU)
//    assign set_start_delay_w =  cmd_we && (cmd_a== MCNTRL_SCANLINE_START_DELAY); // (TILED: DNU)   
    
    assign single_frame_w =       cmd_we && (cmd_a== MCNTRL_TILED_MODE) && cmd_data[MCONTR_LINTILE_SINGLE];
    assign rst_frame_num_w =      cmd_we && (cmd_a== MCNTRL_TILED_MODE) && cmd_data[MCONTR_LINTILE_RST_FRAME];
    assign set_copy_frame_num_w = cmd_we && (cmd_a== MCNTRL_TILED_MODE) && cmd_data[MCONTR_LINTILE_COPY_FRAME]; // self-clearing bit  // (LINEAR: DNU)
    
    assign frame_start_conf = frame_start_r[3]; // frame_number valid ; // (LINEAR: DNU)
//    assign frame_run = busy_r;             // (TILED: DNU)
//    assign frame_set = frame_start_r[3];   // (TILED: DNU)
    

    // Set parameter registers
    always @(posedge mclk) begin
        if      (mrst)               mode_reg <= 0;
        else if (set_mode_w)         mode_reg <= cmd_data[14:0]; // [5:0];
        
        if (mrst) single_frame_r <= 0;
        else      single_frame_r <= single_frame_w;
        
        if (mrst) rst_frame_num_r <= 0;
        else      rst_frame_num_r <= {rst_frame_num_r[0], rst_frame_num_w}; // resetting only at specific command

        if      (mrst)               start_range_addr <= 0;
        else if (set_start_addr_w)   start_range_addr <= cmd_data[NUM_RC_BURST_BITS-1:0];

        if      (mrst)               frame_size <= 0;
        else if (set_start_addr_w)   frame_size <= 1; // default number of frames - just one
        else if (set_frame_size_w)   frame_size <= cmd_data[NUM_RC_BURST_BITS-1:0];

        if      (mrst)             last_frame_number <= 0;
        else if (set_last_frame_w) last_frame_number <= cmd_data[LAST_FRAME_BITS-1:0];
        
        if      (mrst)              frame_full_width <=  0;
        else if (set_frame_width_w) frame_full_width <= {lsw13_zero,cmd_data[FRAME_WIDTH_BITS-1:0]};
        
        if (mrst) is_last_frame <= 0;
        else      is_last_frame <= frame_number_cntr >= last_frame_number; // trying to make it safe 
`ifdef REPORT_FRAME_NUMBER
        if      (mrst)         done_frame_number <= 0;
        else if (frame_done_r) done_frame_number <= frame_number_cntr;
`endif                                               

        if (mrst) frame_start_r <= 0;
        else      frame_start_r <= {frame_start_r[3:0], frame_start_mod & frame_en}; // frame_start // LINEAR: frame_start_mod wire, not reg - compare?

        if      (!chn_en)                         frame_en <= 0;
        else if (single_frame_r || repeat_frames) frame_en <= 1;
        else if (frame_start_mod)                 frame_en <= 0; // LINEAR: frame_start_late
        
// (LINEAR: DNU)
        if      (mrst ||master_set)     frame_master_pend <= 0;
        else if (set_copy_frame_num_w)  frame_master_pend <= 1;
        
        // after channel was disabled frame number reported is incorrect, until updated by master_set
        // Without this signal compressor was reading data between the time source frame number was updated and this one.
        if      (chn_dis_delayed)    frames_in_sync_r <= 0; // do not invalidate frames_in_sync_r until busy_r is off
        else if (frame_start_r[3])   frames_in_sync_r <= 1; // to match line_unfinished
// end of (LINEAR: DNU)
        
        // will reset buffer page at next frame start
        if      (mrst ||frame_start_r[0])   buf_reset_pend <= 0;
        else if (rst_frame_num_r[0])        buf_reset_pend <= 1;
        
        set_frame_from_master <= master_set && frame_master_pend; // (LINEAR: DNU)
        
        if      (mrst)                  frame_number_cntr <= 0;
        else if (rst_frame_num_r[0])    frame_number_cntr <= 0;
        else if (set_frame_from_master) frame_number_cntr <= master_frame; // (LINEAR: DNU)
        else if (frame_start_r[2])      frame_number_cntr <= is_last_frame?{LAST_FRAME_BITS{1'b0}}:(frame_number_cntr+1);
        
        if      (mrst)               frame_number_current <= 0;
        else if (rst_frame_num_r[0]) frame_number_current <= 0;
        else if (frame_start_r[2])   frame_number_current <= frame_number_cntr;

        if      (mrst)               next_frame_start_addr <= start_range_addr; // just to use rst
        else if (rst_frame_num_r[1]) next_frame_start_addr <= start_range_addr;
        else if (frame_start_r[2])   next_frame_start_addr <= is_last_frame? start_range_addr : (start_addr+frame_size);

        if      (mrst)               start_addr <= start_range_addr; // just to use rst
        else if (frame_start_r[0])   start_addr <= next_frame_start_addr;

        
        if (mrst) begin
               window_width <= 0; 
               window_height <=  0;
        end else if (set_window_wh_w)  begin
               window_width <= {lsw13_zero,cmd_data[FRAME_WIDTH_BITS-1:0]};
               window_height  <= {msw_zero,cmd_data[FRAME_HEIGHT_BITS+15:16]};
        end

// (LINEAR: DNU)
        if (mrst) begin
               tile_cols <= 0; 
               tile_rows <=  0;
               tile_vstep <= 0;
        end else if (set_tile_whs_w)  begin
               tile_cols <=  {tile_width_zero,  cmd_data[ 0+:MAX_TILE_WIDTH]};
               tile_rows <=  {tile_height_zero, cmd_data[ 8+:MAX_TILE_HEIGHT]};
               tile_vstep <= {tile_vstep_zero,  cmd_data[16+:MAX_TILE_HEIGHT]};
        end
// end of (LINEAR: DNU)

        if (mrst) begin
               window_x0 <= 0; 
               window_y0 <= 0;
        end else if (set_window_x0y0_w)  begin
               window_x0 <= cmd_data[FRAME_WIDTH_BITS-1:0];
               window_y0  <=cmd_data[FRAME_HEIGHT_BITS+15:16];
        end

        if (mrst) begin
               start_x <= 0; 
               start_y <=  0;
        end else if (set_window_start_w)  begin
               start_x <= cmd_data[FRAME_WIDTH_BITS-1:0];
               start_y  <=cmd_data[FRAME_HEIGHT_BITS+15:16];
        end

// (TILED: DNU)
//        if      (mrst)              start_delay <= MCNTRL_SCANLINE_DLY_DEFAULT;
//        else if (set_start_delay_w) start_delay <= cmd_data[MCNTRL_SCANLINE_DLY_WIDTH-1:0];
//        if      (mrst)                                         start_delay_cntr <= {MCNTRL_SCANLINE_DLY_WIDTH+1{1'b1}};
//        else if (frame_start)                                  start_delay_cntr <= {1'b0, start_delay};
//        else if (!start_delay_cntr[MCNTRL_SCANLINE_DLY_WIDTH]) start_delay_cntr <= start_delay_cntr - 1;
//        frame_start_late <= start_delay_cntr == 0;
// end of (TILED: DNU)        

    end
    assign mul_rslt_w=  frame_y8_r * frame_full_width_r; // 5 MSBs will be discarded
    
    assign xfer_num128= num_cols_r[MAX_TILE_WIDTH-1:0]; // One bit less! (TODO: for LINEAR)
    
//    assign xfer_start=  xfer_start_r[0];
    
    assign xfer_start_lin_rd=  xfer_start_lin_rd_r; // NEW
    assign xfer_start_lin_wr=  xfer_start_lin_wr_r; // NEW
    
    assign xfer_start_rd=  xfer_start_rd_r;
    assign xfer_start_wr=  xfer_start_wr_r;
    assign xfer_start32_rd=  xfer_start32_rd_r; // (LINEAR: DNU)
    assign xfer_start32_wr=  xfer_start32_wr_r; // (LINEAR: DNU)
    assign calc_valid=  par_mod_r[PAR_MOD_LATENCY-1]; // MSB, longest 0
    
    assign xfer_page_rst_wr=  xfer_page_rst_r; // MOVED to match LINEAR
    assign xfer_page_rst_rd=  xfer_page_rst_neg;  // MOVED to match LINEAR
    assign xfer_partial=    xfer_limited_by_mem_page_r; // MOVED to match LINEAR
    
    assign frame_done=      frame_done_r;
    assign frame_finished=  frame_finished_r;

// Was, now using from linear - faster/equivalent    
//    assign pre_want=    !chn_rst && busy_r && !want_r && !xfer_start_r[0] && calc_valid && !last_block && !suspend && !(|frame_start_r) && !aborting_r;
// LINEAR:  
    assign pre_want=    pre_want_r1        && !want_r && !xfer_start_r[0] &&               !last_block && !suspend &&                      !aborting_r;
    
    assign last_in_row_w=(row_left=={{(FRAME_WIDTH_BITS-MAX_TILE_WIDTH){1'b0}},num_cols_r}); // what if it crosses page? OK, num_cols_r & row_left know that
// TODO: LINEAR: use num_cols_r instead of xfer_num128_r 
    
// tiles must completely fit window
// all window should be covered (tiles may extend):    
    assign last_row_w=  next_y >= window_height; // LINEAR: "++" instead of ">="
    //window_m_tile_height
    assign xfer_want=   want_r;
    assign xfer_need=   need_r;
    assign xfer_bank=   bank_reg[2*3 +: 3]; // TODO: just a single reg layer
    assign xfer_row= row_col_r[NUM_RC_BURST_BITS-1:COLADDR_NUMBER-3] ;      // memory row
    assign xfer_col= row_col_r[COLADDR_NUMBER-4:0];    // start memory column in 8-bursts
    assign line_unfinished = line_unfinished_r;

    assign chn_en =          mode_reg[MCONTR_LINTILE_NRESET] & mode_reg[MCONTR_LINTILE_EN];   // enable requests by channel (continue ones in progress)
    assign chn_rst =        ~mode_reg[MCONTR_LINTILE_NRESET]; // resets command, including fifo;
    assign cmd_wrmem =       mode_reg[MCONTR_LINTILE_WRITE];// 0: read from memory, 1:write to memory
    assign cmd_extra_pages = mode_reg[MCONTR_LINTILE_EXTRAPG+:MCONTR_LINTILE_EXTRAPG_BITS]; // external module needs more than 1 page
    assign keep_open=        mode_reg[MCONTR_LINTILE_KEEP_OPEN]; // keep banks open (will be used only if number of rows <= 8
    assign byte32=           mode_reg[MCONTR_LINTILE_BYTE32]; // use 32-byte wide columns in each tile (false - 16-byte)
    assign linear_mode =     mode_reg[MCONTR_LINTILE_LINEAR]; // NEW
    assign repeat_frames=    mode_reg[MCONTR_LINTILE_REPEAT];
    assign disable_need =    mode_reg[MCONTR_LINTILE_DIS_NEED];
//    assign skip_too_late =   mode_reg[MCONTR_LINTILE_SKIP_LATE]; // from LINEAR
    assign abort_en =        mode_reg[MCONTR_LINTILE_ABORT_LATE];
`ifdef DEBUG_MCNTRL_TILED_EXTRA_STATUS    
    assign status_data=      {frames_in_sync, suspend, last_row_w, last_in_row,line_unfinished[7:0], frame_finished_r, busy_r}; 
`else    
  `ifdef REPORT_FRAME_NUMBER
    assign status_data=      {done_frame_number, frame_finished_r, busy_r};     // TODO: Add second bit?
  `else
    assign status_data=      {frame_finished_r, busy_r};     // TODO: Add second bit?
  `endif
`endif    
    assign pgm_param_w=      cmd_we;
// LINEAR: matched    
    
    assign rowcol_inc=       frame_full_width;
    assign num_cols_m1_w=    num_cols_r-1;
    assign num_rows_m1_w=    tile_rows-1; // now number of rows == tile height
    assign num_cols_m1=      num_cols_m1_w[MAX_TILE_WIDTH-1:0];  // remove MSB
    assign num_rows_m1=      num_rows_m1_w[MAX_TILE_HEIGHT-1:0]; // remove MSB
    assign remainder_tile_width = {EXTRA_BITS,lim_by_tile_width} - mem_page_left;
    
    integer i;
    localparam [COLADDR_NUMBER-3-MAX_TILE_WIDTH-1:0] EXTRA_BITS=0;
    wire xfer_limited_by_mem_page;
    reg  xfer_limited_by_mem_page_r;
    assign xfer_limited_by_mem_page= keep_open && (mem_page_left < {EXTRA_BITS,lim_by_tile_width}); // if not keep_open - no need to break
//LINEAR - start match    
    always @(posedge mclk) begin // TODO: Match latencies (is it needed?) Reduce consumption by CE?
    // cycle 1
        if (recalc_r[0]) begin
            frame_x <= curr_x + window_x0;
            frame_y <= curr_y + window_y0;
            next_y <= curr_y + (linear_mode? 1 : tile_vstep); // LINEAR: next_y <= curr_y + 1;
            row_left <= window_width - curr_x; // 14 bits - 13 bits
        end
            
// registers to be absorbed in DSP block        
        frame_y8_r <= frame_y[FRAME_HEIGHT_BITS-1:3]; // lat=2 // if (recalc_r[2]) begin
        frame_full_width_r <= frame_full_width; //(cycle 2) // if (recalc_r[2]) begin
        start_addr_r <= start_addr; // // if (recalc_r[2]) begin
        mul_rslt <= mul_rslt_w[MPY_WIDTH-1:0]; // frame_y8_r * frame_width_r; // 7 bits will be discarded lat=3; if (recalc_r[3]) begin
        line_start_addr <= start_addr_r+mul_rslt; // lat=4 if (recalc_r[4]) begin
// TODO: Verify MPY/register timing above        

        if (recalc_r[5]) begin    // cycle 6
            row_col_r <= line_start_addr+frame_x;
            line_start_page_left <=  - line_start_addr[COLADDR_NUMBER-4:0]; // 7 bits
        end
        bank_reg[0 +: 3]   <= frame_y[2:0]; //TODO: is it needed - a pipeline for the bank? - remove! 
        for (i=0; i<2; i = i+1)
            bank_reg[(i+1)*3 +: 3] <= bank_reg[i*3 +: 3];
     
        if (recalc_r[6]) begin    // cycle 7
            mem_page_left <= {1'b1,line_start_page_left} - frame_x[COLADDR_NUMBER-4:0];
/* 
            lim_by_tile_width <= (|row_left[FRAME_WIDTH_BITS:MAX_TILE_WIDTH] || (row_left[MAX_TILE_WIDTH:0] >= tile_cols))?
                                    tile_cols:
                                    row_left[MAX_TILE_WIDTH:0]; // 7 bits, max 'h40
            lim_by_xfer <= (|row_left[FRAME_WIDTH_BITS:NUM_XFER_BITS])? // TODO: used in LINEAR
                (1<<NUM_XFER_BITS):
                row_left[NUM_XFER_BITS:0]; // 7 bits, max 'h40
*/
            lim_by_tile_width <= (|row_left[FRAME_WIDTH_BITS:MAX_TILE_WIDTH] || (!linear_mode && (row_left[MAX_TILE_WIDTH:0] >= tile_cols)))?
//                                    (linear_mode ? (1<< NUM_XFER_BITS)  : tile_cols):
                                    (linear_mode ? {1'b1,{NUM_XFER_BITS{1'b0}}} : tile_cols):
                                    row_left[MAX_TILE_WIDTH:0]; // 7 bits, max 'h40
        end



//LINEAR - start match
        if (recalc_r[7]) begin    // cycle 8
            xfer_limited_by_mem_page_r <= xfer_limited_by_mem_page && !continued_tile; // LINEAR  continued_xfer -> continued_tile  
/*
            num_cols_r<= continued_tile?    // LINEAR xfer_num128_r<= continued_xfer?
                {EXTRA_BITS,leftover_cols}: // LINEAR {EXTRA_BITS,leftover}:
                (xfer_limited_by_mem_page?
                    mem_page_left[MAX_TILE_WIDTH:0]:      // LINEAR: mem_page_left[NUM_XFER_BITS:0]:
                    lim_by_tile_width[MAX_TILE_WIDTH:0]); // LINEAR lim_by_xfer[NUM_XFER_BITS:0]);
                leftover_cols <= remainder_tile_width[MAX_TILE_WIDTH-1:0]; // TODO: !!! LINEAR - see next line
                // LINEAR: if (!continued_xfer) leftover <= remainder_in_xfer[NUM_XFER_BITS-1:0]; //  {EXTRA_BITS, lim_by_xfer}-mem_page_left;
*/            
            num_cols_r<= continued_tile?    // LINEAR xfer_num128_r<= continued_xfer?
                {EXTRA_BITS,leftover_cols}: // LINEAR : using leftover instead of leftover_cols {EXTRA_BITS,leftover}:
                (xfer_limited_by_mem_page?
                    mem_page_left[MAX_TILE_WIDTH:0]:      // LINEAR: mem_page_left[NUM_XFER_BITS:0]:
                    lim_by_tile_width[MAX_TILE_WIDTH:0]); // LINEAR lim_by_xfer[NUM_XFER_BITS:0]);
                
                if (!linear_mode || continued_tile) leftover_cols <= remainder_tile_width[MAX_TILE_WIDTH-1:0];
        end
        
        if (recalc_r[8]) begin    // cycle 9
            last_in_row <= last_in_row_w;
        end
// LINEAR: matched        
        
    end
    
// now have row start address, bank and row_left ;
// calculate number to read (min of row_left, maximal xfer and what is left in the DDR3 page
wire    start_not_partial= xfer_start_r[0] && !xfer_limited_by_mem_page_r;    
    always @(posedge mclk) begin
        // acceletaring pre_want - copied from LINEAR (faster, equivalent), start matching
        
        
        
//        pre_want_r1 <= !chn_rst &&  !frame_done_r && busy_r && par_mod_r[PAR_MOD_LATENCY-2] && !(|frame_start_r[4:1]);
// FIXME: Same in LINEAR module?
        pre_want_r1 <= !chn_rst &&  !frame_done_r && busy_r && par_mod_r[PAR_MOD_LATENCY-2] && !(|frame_start_r[4:1]) &&!xfer_start_r[0];
        if      (mrst)               par_mod_r<=0;
        else if (pgm_param_w ||
                 xfer_start_r[0] ||
                 chn_rst ||
                 frame_start_r[0])   par_mod_r<=0;
        else                         par_mod_r <= {par_mod_r[PAR_MOD_LATENCY-2:0], 1'b1};

        if     (mrst)          chn_rst_d <= 0;
        else                   chn_rst_d <= chn_rst;

        if      (mrst)         recalc_r<=0;
        else if (chn_rst)      recalc_r<=0;
        else                   recalc_r <= {recalc_r[PAR_MOD_LATENCY-2:0],
                                 ((xfer_start_r[0] | frame_start_r[0])  & ~chn_rst) | pgm_param_w | (chn_rst_d & ~chn_rst)};
        
        if      (mrst)              busy_r <= 0;
        else if (chn_rst)           busy_r <= 0;
        else if (frame_start_r[0])  busy_r <= 1;
        else if (frame_done_r)      busy_r <= 0;
        
        if (mrst) xfer_page_done_d <= 0;
        else      xfer_page_done_d <= xfer_page_done; // LINEAR: xfer_done_skipped;

        if (mrst) xfer_start_r <= 0;
        else      xfer_start_r <= {xfer_start_r[1:0],xfer_grant && !chn_rst}; // LINEAR uses skip_run
// LINEAR matched
// TILED and TILED_LIN only:        
        if (mrst) xfer_start_rd_r <= 0;
        else      xfer_start_rd_r <=  xfer_grant && !chn_rst && !cmd_wrmem && !byte32 && !linear_mode;

        if (mrst) xfer_start_wr_r <= 0;
        else      xfer_start_wr_r <=  xfer_grant && !chn_rst && cmd_wrmem && !byte32 && !linear_mode;

        if (mrst) xfer_start32_rd_r <= 0;
        else      xfer_start32_rd_r <=  xfer_grant && !chn_rst && !cmd_wrmem && byte32 && !linear_mode;

        if (mrst) xfer_start32_wr_r <= 0;
        else     xfer_start32_wr_r <=  xfer_grant && !chn_rst && cmd_wrmem && byte32 && !linear_mode;
        
        if (mrst) xfer_start_lin_rd_r <= 0;
        else      xfer_start_lin_rd_r <=  xfer_grant && !chn_rst && !cmd_wrmem && linear_mode; 

        if (mrst) xfer_start_lin_wr_r <= 0;
        else      xfer_start_lin_wr_r <=  xfer_grant && !chn_rst && cmd_wrmem && linear_mode;
        
// end TILED
        if (mrst)                  continued_tile <= 1'b0; // LINEAR: replace continued_xfer with continued_tile
        else if (chn_rst)          continued_tile <= 1'b0;
        else if (frame_start_r[0]) continued_tile <= 1'b0;
        else if (xfer_start_r[0])  continued_tile <= xfer_limited_by_mem_page_r; // only set after actual start if it was partial, not after parameter change


// LINEAR matching start
        if (mrst || disable_need)                         need_r <= 0; 
        else if (chn_rst || xfer_grant)                   need_r <= 0; // LINEAR else if (chn_rst || xfer_grant || start_skip_r)   need_r <= 0;
        else if ((pre_want  || want_r) && (page_cntr>=3)) need_r <= 1; // may raise need if want was already set

        if (mrst)                                                want_r <= 0;
        else if (chn_rst || xfer_grant)                          want_r <= 0; // LINEAR else if (chn_rst || xfer_grant || start_skip_r)          want_r <= 0;
        else if (pre_want && (page_cntr>{1'b0,cmd_extra_pages})) want_r <= 1;
        want_d <= want_r;        
        
        if (mrst)                                  page_cntr <= 0;
//        else if (frame_start_r[0])                 page_cntr <= cmd_wrmem?0:4; // reset here, but compressor is not// LINEAR: not commented out
        else if (xfer_page_rst_pos)                page_cntr <= cmd_wrmem?0:4; // reset here, but compressor is not
        else if ( start_not_partial && !next_page) page_cntr <= page_cntr - 1;     
        else if (!start_not_partial &&  next_page) page_cntr <= page_cntr + 1;
        
        if (mrst) xfer_page_rst_r <= 1;
        else      xfer_page_rst_r <= chn_rst || (buf_reset_pend && (MCNTRL_TILED_FRAME_PAGE_RESET ? (frame_start_r[0] & cmd_wrmem):1'b0));

        if (mrst) xfer_page_rst_pos <= 1;
        else     xfer_page_rst_pos <= chn_rst || (buf_reset_pend && (MCNTRL_TILED_FRAME_PAGE_RESET ? (frame_start_r[0] & ~cmd_wrmem):1'b0));
        
// increment x,y (two cycles)
// TODO: LINEAR: use num_cols_r instead of xfer_num128_r
        if (mrst)                                 curr_x <= 0;
        else if (chn_rst || frame_start_r[0])     curr_x <= start_x;
        else if (xfer_start_r[0])                 curr_x <= last_in_row?0: curr_x + num_cols_r; // LINEAR:  xfer_num128_r;
        
        if (mrst)                                 curr_y <= 0;   
        else if (chn_rst || frame_start_r[0])     curr_y <= start_y;
        else if (xfer_start_r[0] && last_in_row)  curr_y <= next_y[FRAME_HEIGHT_BITS-1:0];  //FIXME: never happens last_in_row
               
        if      (mrst)                            last_block <= 0;
        else if (chn_rst || !busy_r)              last_block <= 0;
        else if (xfer_start_r[0])                 last_block <= last_row_w && last_in_row_w;
 
 // start_not_partial is not generated when partial (first of 2, caused by a tile crossing memory page) transfer is requested       
 // here we need to cout all requests - partial or not
        if      (mrst)                                pending_xfers <= 0;
        else if (chn_rst || !busy_r)                  pending_xfers <= 0;
        else if ( xfer_start_r[0] && !xfer_page_done) pending_xfers <= pending_xfers + 1; // LINEAR use xfer_done_skipped
        else if (!xfer_start_r[0] &&  xfer_page_done) pending_xfers <= pending_xfers - 1; // page done is not generated on partial (first) pages // LINEAR use xfer_done_skipped

        if (mrst)         frame_done_r <= 0;
        else              frame_done_r <= busy_r && (pending_xfers==0) &&
                                          ((last_block && xfer_page_done_d) || (aborting_r && !want_r && !want_d)); // LINEAR use xfer_done_d instead of xfer_page_done_d (same)


        if      (!busy_r)                           aborting_r <= 0;
        else if (abort_en && busy_r && frame_start) aborting_r <= 1;


        aborting_d <= aborting_r;                                                         // (LINEAR: DNU)
        frame_start_mod <= (frame_start && !busy_r) || (aborting_d && !aborting_r);       // LINEAR: wire with the same name wire

        // turns and stays on (used in status)
        if (mrst)                             frame_finished_r <= 0;
        else if (chn_rst || frame_start_r[0]) frame_finished_r <= 0;
        else if (frame_done_r)                frame_finished_r <= 1;

//TODO: ALready modified to include linear mode
// TILED:  if (recalc_r[0]) line_unfinished_relw_r <= curr_y + (cmd_wrmem ? 0: tile_rows);
// LINEAR: if (recalc_r[0]) line_unfinished_relw_r <= curr_y + (cmd_wrmem ? 0: 1);
        if (recalc_r[0]) line_unfinished_relw_r <= curr_y + (cmd_wrmem ? 0: (linear_mode? 1: tile_rows));
        
        if (mrst || (frame_start_mod || chn_dis_delayed))  line_unfinished_r <= {FRAME_HEIGHT_BITS{~cmd_wrmem}}; // lowest/highest value until valid
        else if (recalc_r[2] && busy_r)                    line_unfinished_r <= line_unfinished_relw_r + window_y0;
// LINEAR matching end        
        
    end
    always @ (negedge mclk) begin
        xfer_page_rst_neg <= xfer_page_rst_pos;
    end
    cmd_deser #(
        .ADDR       (MCNTRL_TILED_ADDR),
        .ADDR_MASK  (MCNTRL_TILED_MASK),
        .NUM_CYCLES (6),
        .ADDR_WIDTH (4),
        .DATA_WIDTH (32)
    ) cmd_deser_32bit_i (
        .rst        (1'b0),     // input
        .clk        (mclk),     // input
        .srst       (mrst),     // input
        .ad         (cmd_ad),   // input[7:0] 
        .stb        (cmd_stb),  // input
        .addr       (cmd_a),    // output[15:0] 
        .data       (cmd_data), // output[31:0] 
        .we         (cmd_we)    // output
    );

    status_generate #(
        .STATUS_REG_ADDR  (MCNTRL_TILED_STATUS_REG_ADDR),
`ifdef DEBUG_MCNTRL_TILED_EXTRA_STATUS    
        .PAYLOAD_BITS     (14)
`else    
      `ifdef REPORT_FRAME_NUMBER
        .PAYLOAD_BITS     (2 + LAST_FRAME_BITS)
      `else
        .PAYLOAD_BITS     (2)
      `endif  
`endif    
    ) status_generate_i (
        .rst              (1'b0),          // input
        .clk              (mclk),          // input
        .srst             (mrst),          // input
        .we               (set_status_w),  // input
        .wd               (cmd_data[7:0]), // input[7:0] 
        .status           (status_data),   // input[25:0] 
        .ad               (status_ad),     // output[7:0] 
        .rq               (status_rq),     // output
        .start            (status_start)   // input
    );
endmodule

