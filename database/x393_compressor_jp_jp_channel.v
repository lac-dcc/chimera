// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>jp_channel
 * @file jp_channel.v
 * @date 2015-06-10  
 * @author Andrey Filippov     
 *
 * @brief Top module of JPEG/JP4 compressor channel
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * jp_channel.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  jp_channel.v is distributed in the hope that it will be useful,
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

module  jp_channel#(
        parameter CMPRS_NUMBER =             0,
        parameter CMPRS_GROUP_ADDR =         'h600,
        parameter CMPRS_BASE_INC =           'h10,
        parameter CMPRS_STATUS_REG_BASE=     'h10,
        parameter CMPRS_HIFREQ_REG_BASE=     'h14, 
        parameter CMPRS_STATUS_REG_INC=       1,
        parameter CMPRS_HIFREQ_REG_INC=       1,
        parameter CMPRS_MASK=                'h7f8,
        parameter CMPRS_CONTROL_REG=          0,
        parameter CMPRS_STATUS_CNTRL=         1,
        parameter CMPRS_FORMAT=               2,
        parameter CMPRS_COLOR_SATURATION=     3,
        parameter CMPRS_CORING_MODE=          4,
        parameter CMPRS_INTERRUPTS=           5,        
        parameter CMPRS_TABLES=               6, // 6(data)..7(address)
        parameter TABLE_QUANTIZATION_INDEX =  0,
        parameter TABLE_CORING_INDEX =        1,
        parameter TABLE_FOCUS_INDEX =         2,
        parameter TABLE_HUFFMAN_INDEX =       3,

        parameter FRAME_HEIGHT_BITS=          16, // Maximal frame height 
        parameter LAST_FRAME_BITS=            16, // number of bits in frame counter (before rolls over)
        // Bit-fields in compressor control word
        parameter CMPRS_CBIT_RUN =            2, // bit # to control compressor run modes
        parameter CMPRS_CBIT_RUN_BITS =       2, // number of bits to control compressor run modes
        parameter CMPRS_CBIT_QBANK =          6, // bit # to control quantization table page
        parameter CMPRS_CBIT_QBANK_BITS =     3, // number of bits to control quantization table page
        parameter CMPRS_CBIT_DCSUB =          8, // bit # to control extracting DC components bypassing DCT
        parameter CMPRS_CBIT_DCSUB_BITS =     1, // bit # to control extracting DC components bypassing DCT
        parameter CMPRS_CBIT_CMODE =         13, // bit # to control compressor color modes
        parameter CMPRS_CBIT_CMODE_BITS =     4, // number of bits to control compressor color modes
        parameter CMPRS_CBIT_FRAMES =        15, // bit # to control compressor multi/single frame buffer modes
        parameter CMPRS_CBIT_FRAMES_BITS =    1, // number of bits to control compressor multi/single frame buffer modes
        parameter CMPRS_CBIT_BE16 =          17, // bit # to control compressor multi/single frame buffer modes
        parameter CMPRS_CBIT_BE16_BITS =      1, // number of bits to control compressor multi/single frame buffer modes
        parameter CMPRS_CBIT_BAYER =         20, // bit # to control compressor Bayer shift mode
        parameter CMPRS_CBIT_BAYER_BITS =     2, // number of bits to control compressor Bayer shift mode
        parameter CMPRS_CBIT_FOCUS =         23, // bit # to control compressor focus display mode
        parameter CMPRS_CBIT_FOCUS_BITS =     2, // number of bits to control compressor focus display mode
        // compressor bit-fields decode
        parameter CMPRS_CBIT_RUN_RST =        2'h0, // reset compressor, stop immediately
//      parameter CMPRS_CBIT_RUN_DISABLE =    2'h1, // disable compression of the new frames, finish any already started
        parameter CMPRS_CBIT_RUN_STANDALONE = 2'h2, // enable compressor, compress single frame from memory (async)
        parameter CMPRS_CBIT_RUN_ENABLE =     2'h3, // enable compressor, enable synchronous compression mode
        parameter CMPRS_CBIT_CMODE_JPEG18 =   4'h0, // color 4:2:0
        parameter CMPRS_CBIT_CMODE_MONO6 =    4'h1, // mono 4:2:0 (6 blocks)
        parameter CMPRS_CBIT_CMODE_JP46 =     4'h2, // jp4, 6 blocks, original
        parameter CMPRS_CBIT_CMODE_JP46DC =   4'h3, // jp4, 6 blocks, dc -improved
        parameter CMPRS_CBIT_CMODE_JPEG20 =   4'h4, // mono, 4 blocks (but still not actual monochrome JPEG as the blocks are scanned in 2x2 macroblocks)
        parameter CMPRS_CBIT_CMODE_JP4 =      4'h5, // jp4,  4 blocks, dc-improved
        parameter CMPRS_CBIT_CMODE_JP4DC =    4'h6, // jp4,  4 blocks, dc-improved
        parameter CMPRS_CBIT_CMODE_JP4DIFF =  4'h7, // jp4,  4 blocks, differential
        parameter CMPRS_CBIT_CMODE_JP4DIFFHDR =  4'h8, // jp4,  4 blocks, differential, hdr
        parameter CMPRS_CBIT_CMODE_JP4DIFFDIV2 = 4'h9, // jp4,  4 blocks, differential, divide by 2
        parameter CMPRS_CBIT_CMODE_JP4DIFFHDRDIV2 = 4'ha, // jp4,  4 blocks, differential, hdr,divide by 2
        parameter CMPRS_CBIT_CMODE_MONO1 =    4'hb, // mono JPEG (not yet implemented)
        parameter CMPRS_CBIT_CMODE_MONO4 =    4'he, // mono 4 blocks
        parameter CMPRS_CBIT_CMODE_RAW =      4'hf, // uncompressed
        
        parameter CMPRS_CBIT_FRAMES_SINGLE =  0, //1, // use a single-frame buffer for images

        parameter CMPRS_COLOR18 =           0, // JPEG 4:2:0 with 18x18 overlapping tiles for de-bayer
        parameter CMPRS_COLOR20 =           1, // JPEG 4:2:0 with 18x18 overlapping tiles for de-bayer (not implemented)
        parameter CMPRS_MONO16 =            2, // JPEG 4:2:0 with 16x16 non-overlapping tiles, color components zeroed
        parameter CMPRS_JP4 =               3, // JP4 mode with 16x16 macroblocks
        parameter CMPRS_JP4DIFF =           4, // JP4DIFF mode TODO: see if correct
        parameter CMPRS_RAW =               6, // Not comressed, raw data
        parameter CMPRS_MONO8 =             7,  // Regular JPEG monochrome with 8x8 macroblocks (not yet implemented)
        
        // TODO: For raw - use:
        // 13 bits hor (x16 bytes), 13 bits vert (x16 lines) + 5 bits (left margin in bytes, skip)
        // lines per page?
        parameter CMPRS_FRMT_MBCM1 =           0, // bit # of number of macroblock columns minus 1 field in format word
        parameter CMPRS_FRMT_MBCM1_BITS =     13, // number of bits in number of macroblock columns minus 1 field in format word
        parameter CMPRS_FRMT_MBRM1 =          13, // bit # of number of macroblock rows minus 1 field in format word
        parameter CMPRS_FRMT_MBRM1_BITS =     13, // number of bits in number of macroblock rows minus 1 field in format word
        parameter CMPRS_FRMT_LMARG =          26, // bit # of left margin field in format word
        parameter CMPRS_FRMT_LMARG_BITS =      5, // number of bits in left margin field in format word
        parameter CMPRS_CSAT_CB =              0, // bit # of number of blue scale field in color saturation word
        parameter CMPRS_CSAT_CB_BITS =        10, // number of bits in blue scale field in color saturation word
        parameter CMPRS_CSAT_CR =             12, // bit # of number of red scale field in color saturation word
        parameter CMPRS_CSAT_CR_BITS =        10, // number of bits in red scale field in color saturation word
        parameter CMPRS_CORING_BITS =          3,  // number of bits in coring mode
        
        parameter CMPRS_TIMEOUT_BITS=         12,
        parameter CMPRS_TIMEOUT=            1000,   // mclk cycles
        parameter NUM_FRAME_BITS =             4 // number of bits use for frame number 
        
`ifdef DEBUG_RING
        ,parameter DEBUG_CMD_LATENCY = 2 //SuppressThisWarning VEditor - not used
`endif        
        
)(
    input                         xclk,          // global clock input, compressor single clock rate
`ifdef  USE_XCLK2X    
    input                         xclk2x,        // global clock input, compressor double clock rate, nominally rising edge aligned
`endif    
    input                         mrst,          // @posedge mclk, sync reset
    input                         xrst,          // @posedge xclk, sync reset
    input                         hrst,          // @posedge xclk, sync reset
    
    // programming interface
    input                         mclk,          // global system/memory clock
    input                   [7:0] cmd_ad,        // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                         cmd_stb,       // strobe (with first byte) for the command a/d
    output                  [7:0] status_ad,     // status address/data - up to 5 bytes: A - {seq,status[1:0]} - status[2:9] - status[10:17] - status[18:25]
    output                        status_rq,     // input request to send status downstream
    input                         status_start,  // Acknowledge of the first status packet byte (address)
    output                        irq,           // processor interrupt
    
    // Buffer interface (buffer to be a part of the memory controller - it is connected there by a 64-bit data, here - by an 9-bit one
    input                         xfer_reset_page_rd, // from mcntrl_tiled_rw (
    input                         buf_wpage_nxt, // advance to next page memory interface writes to
    input                         buf_we,        // @!mclk write buffer from memory, increment write
    input                  [63:0] buf_din,       // data out 
    input                         page_ready_chn,     // single mclk (posedge)
    output                        next_page_chn,      // single mclk (posedge): Done with the page in the  buffer, memory controller may read more data 

// Master(sensor)/slave(compressor) synchronization signals
    output                        frame_start_dst,    // @mclk - trigger receive (tiledc) memory channel (it will take care of single/repetitive
                                                      // this output either follows vsync_late (reclocks it) or generated in non-bonded mode
                                                      // (compress from memory)
    input                         frame_start_conf,   // memory controller confirmed frame_start_dst - normally delayed by 1 clock,
                                                        // or more if there were outstanding memory transactions.                                                           
                                                      
    input [FRAME_HEIGHT_BITS-1:0] line_unfinished_src,// number of the current (unfinished ) line, in the source (sensor) channel (RELATIVE TO FRAME, NOT WINDOW?)
    input   [LAST_FRAME_BITS-1:0] frame_number_src,   // current frame number (for multi-frame ranges) in the source (sensor) channel
    input                         frame_done_src,     // single-cycle pulse when the full frame (window) was transferred to/from DDR3 memory 
                                                      // frame_done_src is later than line_unfinished_src/ frame_number_src changes
                                                      // Used withe a single-frame buffers
     
    input [FRAME_HEIGHT_BITS-1:0] line_unfinished_dst,// number of the current (unfinished ) line in this (compressor) channel
    input   [LAST_FRAME_BITS-1:0] frame_number_dst,   // current frame number (for multi-frame ranges) in this (compressor channel
    input                         frames_in_sync,     // frame number in destination memory channel is valid for bonded mode
    input                         frame_done_dst,     // single-cycle pulse when the full frame (window) was transferred to/from DDR3 memory
                                                      // use as 'eot_real' in 353 
    output                        suspend,            // suspend reading data for this channel - waiting for the source data
//    output                        master_follow,      // compressor is following sensor, copy sesnor frame number instead of reset. 
    
    output reg [LAST_FRAME_BITS-1:0] frame_number_finished,   // valid after stuffer done
    

// statistics data was not used in late nc353    
    input                         dccout,         //enable output of DC and HF components for brightness/color/focus adjustments
    input                   [2:0] hfc_sel,        // [2:0] (for autofocus) only components with both spacial frequencies higher than specified will be added
    output                        statistics_dv,
    output                 [15:0] statistics_do,

// Timestamp messages (@mclk)    
    input                         ts_pre_stb,  // @mclk - 1 cycle before receiving 8 bytes of timestamp data
    input                   [7:0] ts_data,     // timestamp data (s0,s1,s2,s3,us0,us1,us2,us3==0)
    
    output                        eof_written_mclk,
    output                        stuffer_done_mclk,
    
//    output                 [31:0] hifreq,             //  accumulated high frequency components in a frame sub-window
    input                         vsync_late,         // delayed start of frame, @mclk. In 353 it was 16 lines after VACT active
                                                      // source channel should already start, some delay give time for sequencer commands
                                                      // that should arrive before it
    input  [NUM_FRAME_BITS-1:0] frame_num_compressed,
    
    // Output interface to the AFI mux
    input                         hclk,
    input                         fifo_rst,      // reset FIFO (set read address to write, reset count)
    input                         fifo_ren,
    output                 [63:0] fifo_rdata,
    output                        fifo_eof,      // single rclk pulse signaling EOF
    input                         eof_written,   // confirm frame written over AFI to the system memory (single rclk pulse)
    output                        fifo_flush,    // EOF, need to output all what is in FIFO (Stays active until enough data chunks are read)
    output                        flush_hclk,    // output before writing last chunk - use it to suspend AFI to have
                                                 // last burst marked as the last one (otherwise last may be empty if frame had %4==0 chunks) 
    output                 [7:0]  fifo_count     // number of 32-byte chunks in FIFO
`ifdef DEBUG_RING       
    ,output                       debug_do, // output to the debug ring
     input                        debug_sl, // 0 - idle, (1,0) - shift, (1,1) - load // SuppressThisWarning VEditor - not used
     input                        debug_di  // input from the debug ring
`endif         
);
//`ifdef DEBUG_RING
//     assign  debug_do = debug_di; // just temporarily to short-circuit the ring
//`endif        

    localparam CMPRS_ADDR = CMPRS_GROUP_ADDR + CMPRS_NUMBER * CMPRS_BASE_INC;
    localparam CMPRS_STATUS_REG_ADDR = CMPRS_STATUS_REG_BASE + CMPRS_NUMBER *  CMPRS_STATUS_REG_INC;
    localparam CMPRS_HIFREQ_REG_ADDR = CMPRS_HIFREQ_REG_BASE + CMPRS_NUMBER *  CMPRS_HIFREQ_REG_INC;
    wire                      [31:0] hifreq;   //  accumulated high frequency components in a frame sub-window was output, now - with status
    
    // Control signals to be defined
    wire                             frame_en;           // if 0 - will reset logic immediately (but not page number)
    wire                             frame_en_jp;        // if 0 - will reset logic immediately (but not page number)
    wire                             frame_en_raw;       // if 0 - will reset logic immediately (but not page number)
    wire                             frame_start_xclk;   // re-clocked, parameters are copied at this pulse
    wire                             stuffer_en;         //  extended enable to allow stuffer to gracefully finish 
    
    wire                             frame_go_jp=frame_en_jp;  // start frame: if idle, will start reading data (if available),
    wire                             frame_go_raw=frame_en_raw;  // start frame: if idle, will start reading data (if available),
                                      // if running - will not restart a new frame if 0.
    wire [CMPRS_FRMT_LMARG_BITS-1:0] left_marg;          // left margin (for not-yet-implemented) mono JPEG (8 lines tile row) can need 7 bits (mod 32 - tile)
    wire [CMPRS_FRMT_MBCM1_BITS-1:0] n_blocks_in_row_m1; // number of macroblocks in a macroblock row minus 1
    wire [CMPRS_FRMT_MBRM1_BITS-1:0] n_block_rows_m1;    // number of macroblock rows in a frame minus 1
    wire                             ignore_color;       // zero Cb/Cr components (TODO: maybe include into converter_type?)
    wire                      [ 1:0] bayer_phase;        // [1:0])  bayer color filter phase 0:(GR/BG), 1:(RG/GB), 2: (BG/GR), 3: (GB/RG)
//    wire                             four_blocks;        // use only 6 blocks for the output, not 6
    wire                             jp4_dc_improved;    // in JP4 mode, compare DC coefficients to the same color ones
//    wire   [ 1:0] tile_margin;        // margins around 16x16 tiles (0/1/2)
//    wire   [ 2:0] tile_shift;         // tile shift from top left corner
    wire                      [ 2:0] converter_type;     // 0 - color18, 1 - color20, 2 - mono, 3 - jp4, 4 - jp4-diff, 7 - mono8 (not yet implemented)
    wire                             scale_diff;         // divide differences by 2 (to fit in 8-bit range)
    wire                             hdr;                // second green absolute, not difference
    wire                             subtract_dc;        // subtract/restore DC components
    wire    [CMPRS_CSAT_CB_BITS-1:0] m_cb;               // [9:0] scale for CB - default 0.564 (10'h90)
    wire    [CMPRS_CSAT_CR_BITS-1:0] m_cr;               // [9:0] scale for CR - default 0.713 (10'hb6)

    wire   [ 1:0] cmprs_fmode;        // focusing/overlay mode

    //TODO: assign next 5 values from converter_type[2:0]
    wire   [ 5:0] mb_w_m1;            // macroblock width minus 1
    wire   [ 5:0] mb_h_m1;            // macroblock height -1
    wire   [ 4:0] mb_hper;            // macroblock horizontal period (8/16) // 3 LSB not used
    wire   [ 1:0] tile_width;         // memory tile width (can be 128 for monochrome JPEG)   Can be 32/64/128: 0 - 16, 1 - 32, 2 - 64, 3 - 128
    wire          tile_col_width;     // 0 - 16 pixels,  1 -32 pixels
    
    
    // signals connecting modules: cmprs_macroblock_buf_iface_i and cmprs_pixel_buf_iface_i:
    wire          mb_pre_end;         // from cmprs_pixel_buf_iface - just in time to start a new macroblock w/o gaps
    wire          mb_release_buf;     // send required "next_page" pulses to buffer. Having rather long minimal latency in the memory
                                      // controller this can just be the same as mb_pre_end_in        
    wire          mb_pre_start;       // 1 clock cycle before stream of addresses to the buffer
    wire   [ 1:0] start_page;         // page to read next tile from (or first of several pages)
    wire   [ 6:0] macroblock_x;       // macroblock left pixel x relative to a tile (page) Maximal page - 128 bytes wide
    
    // signals connecting modules: cmprs_macroblock_buf_iface_i and cmprs_buf_average:
    
     wire         first_mb;           // output reg 
     wire         last_mb;            // output
    
    // signals connecting modules: cmprs_pixel_buf_iface_i and chn_rd_buf_i:
    wire   [ 1:0] buf_rd;             // buf {regen, re}
    wire   [ 7:0] buf_pxd;            // 8-bit pixel data from the memory buffer
    wire   [11:0] buf_ra;             // Memory buffer read address
    
    wire   [ 1:0] raw_buf_rd;         // buf {regen, re} in raw mode
    wire   [11:0] raw_buf_ra;         // Memory buffer read address in raw mode
    
    
    // signals connecting modules: chn_rd_buf_i and ???:
    wire   [ 7:0] mb_data_out;       // Macroblock data out in scanline order 
    wire          mb_pre_first_out;  // Macroblock data out strobe - 1 cycle just before data valid
    wire          mb_pre2_first_out;  // Macroblock data out strobe - 2 cycles just before data valid
//    wire          mb_data_valid;     // Macroblock data out valid
    
    wire           limit_diff     = 1'b1;  // as in the prototype - just a constant 1
    
    // signals connecting modules: csconvert and cmprs_buf_average:
    
 
    wire   [8:0]  signed_y; // was y_in
    wire   [8:0]  signed_c; // was c_in
    wire   [7:0]  yaddrw; 
    wire          ywe; 
    wire   [7:0]  caddrw; 
    wire          cwe; 
    wire          yc_pre_first_out; // pre first output from color converter (was  pre_first_out) - last cycle of writing (may inc wpage
    // How they are used? Can it be average instead?  
    wire   [7:0]  n000;  // number of all 0 in macroblock (255 for 256), valid only for color JPEG 
    wire   [7:0]  n255;  // number of all 255 in macroblock (255 for 256), valid only for color JPEG 
    
    // signals connecting modules: cmprs_buf_average and ???:

    wire   [ 9:0] yc_nodc;         // [9:0] data out (4:2:0) (signed, average=0)
    wire   [ 8:0] yc_avr;          // [8:0]    DC (average value) - RAM output, no register. For Y components 9'h080..9'h07f, for C - 9'h100..9'h0ff!
//    wire          yc_nodc_dv;         // out data valid (will go high for at least 64 cycles)
    wire          dct_start;         // single-cycle mark of the first_r pixel in a 64 (8x8) - pixel block
    wire   [ 2:0] color_tn;   // [2:0] tile number 0..3 - Y, 4 - Cb, 5 - Cr (valid with start)
    wire          color_first;      // sending first_r MCU (valid @ ds)
    wire          color_last;       // sending last_r MCU (valid @ ds)
// below signals valid at ds ( 1 later than tn, first_r, last_r)
    wire    [2:0] component_num;    //[2:0] - component number (YCbCr: 0 - Y, 1 - Cb, 2 - Cr, JP4: 0-1-2-3 in sequence (depends on shift) 4 - don't use
    wire          component_color;  // use color quantization table (YCbCR, jp4diff)
    wire          component_first;  // first this component in a frame (DC absolute, otherwise - difference to previous)
    
    wire          component_lastinmb; // last_r component in a macroblock;


// control signals valid @ mclk
    wire          cmprs_en_extend;  // extend cmprs_en_xclk to include flushing
    wire          cmprs_en_mclk;    // resets immediately
    wire          cmprs_run_mclk;   // enable propagation of vsync_late to frame_start_dst in bonded(sync to src) mode
    wire          cmprs_standalone; // single-cycle: generate a single frame_start_dst in unbonded (not synchronized) mode. cmprs_run should be off
    wire          sigle_frame_buf;  // input - memory controller uses a single frame buffer (frame_number_* == 0), use other sync



    wire          force_flush_long; 
///    wire          enc_last; not used
    wire   [15:0] enc_do; 
    wire          enc_dv;

//TODO: use next signals for status
    wire          stuffer_running_mclk;
    wire          reading_frame;
// SuppressWarnings VEditor unused 
    wire          frame_started_mclk;// store frame number ? Wrong, frame number should come from the sensor channel
    reg           stuffer_running_mclk_d;          
    reg [LAST_FRAME_BITS-1:0] frame_number_started;   // valid when stuffer started
    
//    output reg [LAST_FRAME_BITS-1:0] frame_number_finished,   // valid after stuffer done
    always @ (posedge mclk) begin
        stuffer_running_mclk_d <=stuffer_running_mclk;
        if ( stuffer_running_mclk && !stuffer_running_mclk_d) frame_number_started <= frame_number_dst;
        if (!stuffer_running_mclk &&  stuffer_running_mclk_d) frame_number_finished <= frame_number_started;
        
    end
    
`ifdef   USE_XCLK2X
    wire   [15:0] huff_do;     // output[15:0] reg 
    wire    [3:0] huff_dl;     // output[3:0] reg 
    wire          huff_dv;     // output reg 
    wire          flush;       // output reg @ negedge xclk2x
    wire          last_block;  // @negedge xxlk2x - used to copy timestamp in stuffer
    wire          stuffer_rdy; // receiver (bit stuffer) is ready to accept data;
`endif
    

    wire   [31:0] cmd_data;       // 32-bit data to write to tables and registers(LSB first) - from cmd_deser
    wire          cmd_we;         // control register write enable
    wire   [2:0]  cmd_a;          // control register write enable
    
    wire          set_ctrl_reg_w;
    wire          set_status_w;
    wire          set_format_w;
    wire          set_color_saturation_w;
    wire          set_coring_w;
    wire          set_interrupts_w;
    wire          set_tables_w;
    
    wire          stuffer_running;   // @negedge xclk2x from registering timestamp until done
    
    wire   [12:0] quant_do; 
    wire          quant_ds;
    wire   [15:0] quant_dc_tdo;// MSB aligned coefficient for the DC component (used in focus module)
    wire   [ 2:0] cmprs_qpage;
    wire   [ 2:0] coring_num;
    wire          compressed;
    wire          uncompressed;
    wire          raw_be16;    // raw bytes in little-endian order need to be converted to big endian 16-bit ones
    wire          raw_start;   // input
    wire          raw_prefb;   // input
    wire          raw_ts_copy; // input
    wire          raw_flush;   // input
    
    
    reg           dcc_en;
    

    wire   [15:0] dccdata; // was not used in late nc353
    wire          dccvld;  // was not used in late nc353
    
    wire          next_page_chn_jp;
    wire          next_page_chn_raw;
    
    assign next_page_chn = next_page_chn_jp | next_page_chn_raw;
    
    
    assign set_ctrl_reg_w =          cmd_we && (cmd_a==       CMPRS_CONTROL_REG);
    assign set_status_w =            cmd_we && (cmd_a==       CMPRS_STATUS_CNTRL);
    assign set_format_w =            cmd_we && (cmd_a==       CMPRS_FORMAT);
    assign set_color_saturation_w =  cmd_we && (cmd_a==       CMPRS_COLOR_SATURATION);
    assign set_coring_w =            cmd_we && (cmd_a==       CMPRS_CORING_MODE);
    assign set_interrupts_w =        cmd_we && (cmd_a==       CMPRS_INTERRUPTS);
    assign set_tables_w =            cmd_we && ((cmd_a & 6)== CMPRS_TABLES);
    
    

`ifdef DEBUG_RING
    `ifndef   USE_XCLK2X
//        wire   [15:0] huff_do;     // output[15:0] reg 
//        wire    [3:0] huff_dl;     // output[3:0] reg 
//        wire          huff_dv;     // output reg 
//        wire          flush;       // output reg @ negedge xclk2x
        wire          last_block =  0;  // @negedge xxlk2x - used to copy timestamp in stuffer
        wire          stuffer_rdy = 1; // receiver (bit stuffer) is ready to accept data;
        wire          xrst2xn =     xrst;
    `endif



    reg [31:0] debug_fifo_in;
    reg [31:0] debug_fifo_out;
    reg [15:0] pre_start_cntr;
    reg [15:0] pre_end_cntr;
    reg        debug_frame_done;
    reg [15:0] pages_requested;
    reg [15:0] pages_got;
    wire [1:0] dbg_add_invalid;
    wire       dbg_mb_release_buf;
    reg [15:0] pages_needed;  // count number requested
    reg [15:0] page_requests; // count regardless of how many requested
    reg        dbg_stuffer_ext_running;
    reg        dbg_reset_fifo;
    wire [3:0] etrax_dma;
    wire       dbg_ts_rstb; // output
    wire [7:0] dbg_ts_dout; //output [7:0]
    wire [31:0] dbg_sec;
    wire [31:0] dbg_usec;
    
    wire       dbg_flushing;
    reg        dbg_flush_hclk;
    reg        dbg_en_hclk;
    
    reg        dbg_en_n2x;
    reg        dbg_last_block_persist;
    wire       dbg_test_lbw;
    wire       dbg_gotLastBlock;
    wire       dbg_frame_start_hclk;
    wire       dbg_last_DCAC;
    reg        dbg_gotLastBlock_persist;
    reg        dbg_lastBlock_sent;
    wire       dbg_fifo_or_full;
    wire       dbg_comp_lastinmbo;
    wire [2:0] dbg_block_mem_ra;
    reg [15:0] dbg_stb_cntr;
    reg [15:0] dbg_zds_cntr;
    wire [2:0] dbg_block_mem_wa;
    wire [2:0] dbg_block_mem_wa_save;
  `ifndef  USE_XCLK2X
        // temporarily assigning unused debug signals to 0
//        assign dbg_add_invalid =    0;
//        assign dbg_mb_release_buf = 0;
//        assign etrax_dma =          0;
//        assign dbg_ts_rstb =        0; // output
//        assign dbg_ts_dout =        0; //output [7:0]
        assign dbg_flushing =       0; // still not used in huffman_stuffer_meta 
//        assign dbg_test_lbw =       0;
//        assign dbg_gotLastBlock =   0;
        assign dbg_fifo_or_full =   0; // still not used in huffman_stuffer_meta
       
  `endif    
    timestamp_to_parallel dbg_timestamp_to_parallel_i (
        .clk      (xclk),        // input
        .pre_stb  (dbg_ts_rstb), // input
        .tdata    (dbg_ts_dout), // input[7:0] 
        .sec      (dbg_sec),     // output[31:0] reg 
        .usec     (dbg_usec[19:0]),    // output[19:0] reg 
        .done()                  // output
    );
    
    
// cmprs_standalone - use to reset flush     
    always @ (posedge xclk) begin
        dbg_reset_fifo <= fifo_rst;
        if (xrst2xn || dbg_reset_fifo) debug_fifo_in <= 0;
        else if (stuffer_dv)           debug_fifo_in <= debug_fifo_in + 1;
        
        dbg_en_n2x <= stuffer_en;
        
        if      (!dbg_en_n2x) dbg_last_block_persist <= 0;
        else if (last_block)  dbg_last_block_persist <= 1;

        if      (!dbg_en_n2x)      dbg_gotLastBlock_persist <= 0;
        else if (dbg_gotLastBlock) dbg_gotLastBlock_persist <= 1;
        
//dbg_last_block_persist        
    end
    always @ (posedge hclk) begin
        if      (hrst)     debug_fifo_out <= 0;
        else if (fifo_rst) debug_fifo_out <= 0; // debug_fifo_in >> 2;
        else if (fifo_ren) debug_fifo_out <= debug_fifo_out + 1;
        
        dbg_en_hclk <= cmprs_en_mclk;
        
        if (!dbg_en_hclk || dbg_frame_start_hclk) dbg_flush_hclk <= 0;
        else if (flush_hclk)                      dbg_flush_hclk <= 1;
    end
    
    always @ (posedge mclk) begin
        if      (!cmprs_en_mclk) pages_requested <= 0;
        else if  (next_page_chn) pages_requested <= pages_requested + 1;
        
        if      (!cmprs_en_mclk) pages_got <= 0;
        else if (page_ready_chn) pages_got <= pages_got + 1;
        
        if      (!cmprs_en_mclk) debug_frame_done <= 0;
        else if (frame_done_dst) debug_frame_done <= 1;
        
        if      (!cmprs_en_mclk || stuffer_done_mclk) dbg_stuffer_ext_running <= 0;
        else if (stuffer_running_mclk)                dbg_stuffer_ext_running <= 1;
        
    end
    /// Just for debugging, keeping in both compressed/raw modes
    always @ (posedge xclk) begin 
        if         (!frame_en) pre_start_cntr <= 0;
        else if (mb_pre_start) pre_start_cntr <= pre_start_cntr + 1;

        if       (!frame_en) pre_end_cntr <= 0;
        else if (mb_pre_end) pre_end_cntr <= pre_end_cntr + 1;
        
        if      (!frame_en)          pages_needed <= 0;
        else if (dbg_mb_release_buf) pages_needed <= pages_needed + {14'b0,dbg_add_invalid};
        
        if      (!frame_en)          page_requests <= 0;
        else if (dbg_mb_release_buf) page_requests <= page_requests + 1;
        
        if (!frame_en)                                              dbg_lastBlock_sent <= 0;
        else if (enc_dv && enc_do[15] && enc_do[14] && enc_do[12] ) dbg_lastBlock_sent <= 1;
//        else if enc_do[15:0]
        
        if      (!frame_en) dbg_stb_cntr <= 0;
        else if (dct_start) dbg_stb_cntr <= dbg_stb_cntr + 1;
        
        if      (!frame_en) dbg_zds_cntr <= 0;
        else if  (focus_ds) dbg_zds_cntr <= dbg_zds_cntr + 1;

    end
//frame_start_dst
    
    debug_slave #(
        .SHIFT_WIDTH       (384),
        .READ_WIDTH        (384),
        .WRITE_WIDTH       (32),
        .DEBUG_CMD_LATENCY (DEBUG_CMD_LATENCY)
    ) debug_slave_i (
        .mclk       (mclk),          // input
        .mrst       (mrst),          // input
        .debug_di   (debug_di), // input
        .debug_sl   (debug_sl),      // input
        .debug_do   (debug_do), // output
        .rd_data   ({
        dbg_usec,
        dbg_sec,
        26'h0, dbg_block_mem_wa_save[2:0],dbg_block_mem_wa[2:0],
        dbg_zds_cntr[15:0],
        dbg_stb_cntr[15:0],
        pages_needed[15:0],
        page_requests[15:0],
        pre_end_cntr[15:0],
        pre_start_cntr[15:0],
        pages_got[15:0],
        pages_requested[15:0],
        dbg_comp_lastinmbo, dbg_block_mem_ra[2:0], debug_fifo_out[27:0],
        debug_fifo_in[31:0],
        color_last, dbg_last_block_persist, dbg_gotLastBlock, dbg_test_lbw, last_block,
         dbg_flush_hclk, dbg_flushing, stuffer_rdy, etrax_dma[3:0], dbg_stuffer_ext_running, stuffer_running_mclk, debug_frame_done, reading_frame,
        fifo_count[7:0],
        2'b0, dbg_fifo_or_full, dbg_gotLastBlock_persist, dbg_lastBlock_sent, dbg_last_DCAC, sigle_frame_buf, suspend,
        frame_number_dst[15:0],
        line_unfinished_dst[15:0],
        frame_number_src[15:0],
        line_unfinished_src[15:0]
        }), // input[31:0]
        .wr_data    (), // output[31:0]  - not used
        .stb        () // output  - not used
    );
//    wire [2:0] dbg_block_mem_wa;
//    wire [2:0] dbg_block_mem_wa_save;
    
    pulse_cross_clock dbg_fs_hclk_i (
        .rst       (!cmprs_en_mclk),
        .src_clk   (mclk),
        .dst_clk   (hclk),
//        .in_pulse  (frame_start_dst),
        .in_pulse  (frame_start_conf),
        .out_pulse (dbg_frame_start_hclk),
        .busy      ());
    
    
`endif    

    cmd_deser #(
        .ADDR       (CMPRS_ADDR),
        .ADDR_MASK  (CMPRS_MASK),
        .NUM_CYCLES (6),
        .ADDR_WIDTH (3),
        .DATA_WIDTH (32)
    ) cmd_deser_32bit_i (
        .rst        (1'b0), //rst),      // input
        .clk        (mclk),     // input
        .srst       (mrst),      // input
        .ad         (cmd_ad),   // input[7:0] 
        .stb        (cmd_stb),  // input
        .addr       (cmd_a),    // output[3:0] 
        .data       (cmd_data), // output[31:0] 
        .we         (cmd_we)    // output
    );
    
    wire [11:0] status_data; 
    cmprs_status  #(
        .NUM_FRAME_BITS(4)
    ) cmprs_status_i (
        .mrst                 (mrst),                  // input
        .mclk                 (mclk),                  // input
        .eof_written          (eof_written_mclk),      // input
        .stuffer_running      (stuffer_running_mclk),  // input
        .reading_frame        (reading_frame),         // input
        .frame_num_compressed (frame_num_compressed),  // input[3:0]
        .set_interrupts       (set_interrupts_w),      // input
        .data_in              (cmd_data[1:0]),         // input[1:0] 
        .status               (status_data),           // output[9:0] 
        .irq                  (irq)                    // output
    );

    status_generate #(
        .STATUS_REG_ADDR  (CMPRS_STATUS_REG_ADDR),
        .PAYLOAD_BITS     (14),
        .EXTRA_WORDS      (1),
        .EXTRA_REG_ADDR   (CMPRS_HIFREQ_REG_ADDR)
        
    ) status_generate_i (
        .rst              (1'b0),                      // input
        .clk              (mclk),                      // input
        .srst             (mrst),                      // input
        .we               (set_status_w),              // input
        .wd               (cmd_data[7:0]),             // input[7:0] 
        .status           ({hifreq,status_data,2'b0}), // input[45:0] 
        .ad               (status_ad),                 // output[7:0] 
        .rq               (status_rq),                 // output
        .start            (status_start)               // input
    );
    
//hifreq
// Not needed?
//    reg   emul64;
//    always @ (negedge mclk) begin
//        emul64 <= tile_width[1]; // will not work for monochrome (128 pixel wide) - chnge to 64?
//    end
    

    mcntrl_buf_rd #(
        .LOG2WIDTH_RD(3) // 64 bit external interface
    ) chn_rd_buf_i (
        .ext_clk      (xclk),               // input
        .ext_raddr    (uncompressed?raw_buf_ra:    buf_ra),       // input[11:0] 
        .ext_rd       (uncompressed?raw_buf_rd[0]: buf_rd[0]), // input
        .ext_regen    (uncompressed?raw_buf_rd[1] :buf_rd[1]), // input
        .ext_data_out (buf_pxd),            // output[7:0]
// Memory interface
        .wclk         (!mclk),              // input
        .wpage_in     (2'b0),               // input[1:0] 
        .wpage_set    (xfer_reset_page_rd), // input  TODO: Generate @ negedge mclk on frame start
        .page_next    (buf_wpage_nxt),      // input
        .page         (),                   // output[1:0]
        .we           (buf_we),             // input
        .data_in      (buf_din)             // input[63:0] 
    );
    
    cmprs_cmd_decode #(
        .CMPRS_CBIT_RUN                  (CMPRS_CBIT_RUN),
        .CMPRS_CBIT_RUN_BITS             (CMPRS_CBIT_RUN_BITS),
        .CMPRS_CBIT_QBANK                (CMPRS_CBIT_QBANK),
        .CMPRS_CBIT_QBANK_BITS           (CMPRS_CBIT_QBANK_BITS),
        .CMPRS_CBIT_DCSUB                (CMPRS_CBIT_DCSUB),
        .CMPRS_CBIT_DCSUB_BITS           (CMPRS_CBIT_DCSUB_BITS),
        .CMPRS_CBIT_CMODE                (CMPRS_CBIT_CMODE),
        .CMPRS_CBIT_CMODE_BITS           (CMPRS_CBIT_CMODE_BITS),
        .CMPRS_CBIT_FRAMES               (CMPRS_CBIT_FRAMES),
        .CMPRS_CBIT_FRAMES_BITS          (CMPRS_CBIT_FRAMES_BITS),
        .CMPRS_CBIT_BE16                 (CMPRS_CBIT_BE16),
        .CMPRS_CBIT_BE16_BITS            (CMPRS_CBIT_BE16_BITS),        
        .CMPRS_CBIT_BAYER                (CMPRS_CBIT_BAYER),
        .CMPRS_CBIT_BAYER_BITS           (CMPRS_CBIT_BAYER_BITS),
        .CMPRS_CBIT_FOCUS                (CMPRS_CBIT_FOCUS),
        .CMPRS_CBIT_FOCUS_BITS           (CMPRS_CBIT_FOCUS_BITS),
        .CMPRS_CBIT_RUN_RST              (CMPRS_CBIT_RUN_RST),
        .CMPRS_CBIT_RUN_STANDALONE       (CMPRS_CBIT_RUN_STANDALONE),
        .CMPRS_CBIT_RUN_ENABLE           (CMPRS_CBIT_RUN_ENABLE),
        .CMPRS_CBIT_CMODE_JPEG18         (CMPRS_CBIT_CMODE_JPEG18),
        .CMPRS_CBIT_CMODE_MONO6          (CMPRS_CBIT_CMODE_MONO6),
        .CMPRS_CBIT_CMODE_JP46           (CMPRS_CBIT_CMODE_JP46),
        .CMPRS_CBIT_CMODE_JP46DC         (CMPRS_CBIT_CMODE_JP46DC),
        .CMPRS_CBIT_CMODE_JPEG20         (CMPRS_CBIT_CMODE_JPEG20),
        .CMPRS_CBIT_CMODE_JP4            (CMPRS_CBIT_CMODE_JP4),
        .CMPRS_CBIT_CMODE_JP4DC          (CMPRS_CBIT_CMODE_JP4DC),
        .CMPRS_CBIT_CMODE_JP4DIFF        (CMPRS_CBIT_CMODE_JP4DIFF),
        .CMPRS_CBIT_CMODE_JP4DIFFHDR     (CMPRS_CBIT_CMODE_JP4DIFFHDR),
        .CMPRS_CBIT_CMODE_JP4DIFFDIV2    (CMPRS_CBIT_CMODE_JP4DIFFDIV2),
        .CMPRS_CBIT_CMODE_JP4DIFFHDRDIV2 (CMPRS_CBIT_CMODE_JP4DIFFHDRDIV2),
        .CMPRS_CBIT_CMODE_MONO1          (CMPRS_CBIT_CMODE_MONO1),
        .CMPRS_CBIT_CMODE_MONO4          (CMPRS_CBIT_CMODE_MONO4),
        .CMPRS_CBIT_CMODE_RAW            (CMPRS_CBIT_CMODE_RAW),
        .CMPRS_CBIT_FRAMES_SINGLE        (CMPRS_CBIT_FRAMES_SINGLE),
        .CMPRS_COLOR18                   (CMPRS_COLOR18),
        .CMPRS_COLOR20                   (CMPRS_COLOR20),
        .CMPRS_MONO16                    (CMPRS_MONO16),
        .CMPRS_JP4                       (CMPRS_JP4),
        .CMPRS_JP4DIFF                   (CMPRS_JP4DIFF),
        .CMPRS_RAW                       (CMPRS_RAW),
        .CMPRS_MONO8                     (CMPRS_MONO8),
        .CMPRS_FRMT_MBCM1                (CMPRS_FRMT_MBCM1),
        .CMPRS_FRMT_MBCM1_BITS           (CMPRS_FRMT_MBCM1_BITS),
        .CMPRS_FRMT_MBRM1                (CMPRS_FRMT_MBRM1),
        .CMPRS_FRMT_MBRM1_BITS           (CMPRS_FRMT_MBRM1_BITS),
        .CMPRS_FRMT_LMARG                (CMPRS_FRMT_LMARG),
        .CMPRS_FRMT_LMARG_BITS           (CMPRS_FRMT_LMARG_BITS),
        .CMPRS_CSAT_CB                   (CMPRS_CSAT_CB),
        .CMPRS_CSAT_CB_BITS              (CMPRS_CSAT_CB_BITS),
        .CMPRS_CSAT_CR                   (CMPRS_CSAT_CR),
        .CMPRS_CSAT_CR_BITS              (CMPRS_CSAT_CR_BITS),
        .CMPRS_CORING_BITS               (CMPRS_CORING_BITS)
    ) cmprs_cmd_decode_i (
        .xclk               (xclk),                // input - global clock input, compressor single clock rate
        .mclk               (mclk),                // input - global system/memory clock
        .mrst               (mrst),                // input
        .ctrl_we            (set_ctrl_reg_w),      // input - control register write enable
        .format_we          (set_format_w),        // input - write number of tiles and left margin
        .color_sat_we       (set_color_saturation_w), // input - write color saturation values
        .coring_we          (set_coring_w),        // input - write color saturation values
        .di                 (cmd_data),            // input[31:0] - 32-bit data to write to control register (24LSB are used)
        .frame_start        (frame_start_conf),     // input @mclk
        .frame_start_xclk   (frame_start_xclk),    // output re-clocked, parameters are copied during this pulse
        .cmprs_en_mclk      (cmprs_en_mclk),       // output
        .cmprs_en_extend    (cmprs_en_extend),     // input
        .compressor_running (reading_frame || stuffer_running), // input
        .cmprs_run_mclk     (cmprs_run_mclk),      // output reg 
        .cmprs_standalone   (cmprs_standalone),    // output reg 
        .sigle_frame_buf    (sigle_frame_buf),     // output reg 
        .cmprs_en_xclk      (frame_en),            // output reg
        .cmprs_en_xclk_jp   (frame_en_jp),            // output reg
        .cmprs_en_xclk_raw  (frame_en_raw),            // output reg
        .cmprs_en_late_xclk (stuffer_en),          // output reg - extended enable to allow stuffer to gracefully finish 
        .cmprs_qpage        (cmprs_qpage),         // output[2:0] reg 
        .cmprs_dcsub        (subtract_dc),         // output reg 
        .cmprs_fmode        (cmprs_fmode),         // output[1:0] reg 
        .bayer_shift        (bayer_phase),         // output[1:0] reg 
        .ignore_color       (ignore_color),        // output reg 
        .four_blocks        (),                    // output reg Not used?
        .jp4_dc_improved    (jp4_dc_improved),     // output reg 
        .converter_type     (converter_type),      // output[2:0] reg 
        .scale_diff         (scale_diff),          // output reg 
        .hdr                (hdr),                 // output reg 
        .left_marg          (left_marg),           // output[4:0] reg 
        .n_blocks_in_row_m1 (n_blocks_in_row_m1),  // output[12:0] reg 
        .n_block_rows_m1    (n_block_rows_m1),     // output[12:0] reg 
        .color_sat_cb       (m_cb),                // output[9:0] reg 
        .color_sat_cr       (m_cr),                // output[9:0] reg 
        .coring             (coring_num),          // output[2:0] reg 
        .compressed         (compressed),          // output reg 
        .uncompressed       (uncompressed),        // output reg 
        .be16               (raw_be16) // output reg         
    );

// set derived parameters from converter_type
//    wire   [ 2:0] converter_type;    // 0 - color18, 1 - color20, 2 - mono, 3 - jp4, 4 - jp4-diff, 7 - mono8 (not yet implemented)
    cmprs_tile_mode_decode #( // fully combinatorial
        .CMPRS_COLOR18   (CMPRS_COLOR18),
        .CMPRS_COLOR20   (CMPRS_COLOR20),
        .CMPRS_MONO16    (CMPRS_MONO16),
        .CMPRS_JP4       (CMPRS_JP4),
        .CMPRS_JP4DIFF   (CMPRS_JP4DIFF),
        .CMPRS_MONO8     (CMPRS_MONO8)
    ) cmprs_tile_mode_decode_i (
        .converter_type  (converter_type), // input[2:0] 
        .mb_w_m1         (mb_w_m1),        // output[5:0] reg 
        .mb_h_m1         (mb_h_m1),        // output[5:0] reg 
        .mb_hper         (mb_hper),        // output[4:0] reg 
        .tile_width      (tile_width),     // output[1:0] reg 
        .tile_col_width  (tile_col_width)  // output reg 
    );


    cmprs_frame_sync #(
        .FRAME_HEIGHT_BITS  (FRAME_HEIGHT_BITS),
        .LAST_FRAME_BITS    (LAST_FRAME_BITS),
        .CMPRS_TIMEOUT_BITS (CMPRS_TIMEOUT_BITS),
        .CMPRS_TIMEOUT      (CMPRS_TIMEOUT)
    ) cmprs_frame_sync_i (
        .xclk               (xclk),                // input - global clock input, compressor single clock rate
        .mclk               (mclk),                // input - global system/memory clock
        .mrst               (mrst),                // input
        .xrst               (xrst),                // input
        .cmprs_en           (cmprs_en_mclk),       // input - @mclk 0 resets immediately
        .cmprs_en_extend    (cmprs_en_extend),     // output
        .cmprs_run          (cmprs_run_mclk),      // input - @mclk enable propagation of vsync_late to frame_start_dst in bonded(sync to src) mode
        .cmprs_standalone   (cmprs_standalone),    // input - @mclk single-cycle: generate a single frame_start_dst in unbonded (not synchronized) mode.
                                                   // cmprs_run should be off
        .sigle_frame_buf    (sigle_frame_buf),     // input - memory controller uses a single frame buffer (frame_number_* == 0), use other sync
        .vsync_late         (vsync_late),          // input - @mclk delayed start of frame, @xclk. In 353 it was 16 lines after VACT active
                                                   // source channel should already start, some delay give time for sequencer commands
                                                   // that should arrive before it, in NC393 it is programmable
        .frame_started      (first_mb && mb_pre_start), // @xclk started first macroblock (checking for broken frames)
        .frame_start_dst    (frame_start_dst),     // output reg @mclk - trigger receive (tiled) memory channel (it will take care of
                                                   // single/repetitive modes itself this output either follows vsync_late (reclocks it)
                                                   // or generated in non-bonded mode (compress from memory once)
        .frame_start_conf   (frame_start_conf),    // input: memory controller confirmed cmprs_frame_start_dst - normally delayed by 1 clock,
                                                   // or more if there were outstanding memory transactions.                                                           
        .line_unfinished_src(line_unfinished_src), // input[15:0] - number of the current (unfinished ) line, in the source (sensor) channel
        .frame_number_src   (frame_number_src),    // input[15:0] - current frame number (for multi-frame ranges) in the source (sensor) channel
        .frame_done_src     (frame_done_src),      // input - single-cycle pulse when the full frame (window) was transferred to/from DDR3 memory 
                                                   // frame_done_src is later than line_unfinished_src/ frame_number_src changes
                                                   // Used withe a single-frame buffers
        .line_unfinished    (line_unfinished_dst), // input[15:0] - number of the current (unfinished ) line in this (compressor) channel
        .frame_number       (frame_number_dst),    // input[15:0] - current frame number (for multi-frame ranges) in this (compressor channel
        .frames_in_sync     (frames_in_sync),      // frame number in destination memory channel is valid for bonded mode
        .frame_done         (frame_done_dst),      // input - single-cycle pulse when the full frame (window) was transferred to/from DDR3 memory
        .last_mb_started    (last_mb && mb_pre2_first_out), // input 
        .suspend            (suspend),             // output reg - suspend reading data for this channel - waiting for the source data
        .stuffer_running    (stuffer_running),     // input
        .force_flush_long   (force_flush_long),    // output reg - @ mclk tried to start frame compression before the previous one was finished, raw also
        .stuffer_running_mclk(stuffer_running_mclk), // output
        .reading_frame      (reading_frame),       // output
        .frame_started_mclk (frame_started_mclk)
    );


    cmprs_macroblock_buf_iface cmprs_macroblock_buf_iface_i (
        .xclk               (xclk),               // input
        .mclk               (mclk),               // input
        .mrst               (mrst),               // input
        .xrst               (xrst),               // input
        .xfer_reset_page_rd (xfer_reset_page_rd), // input
        .page_ready_chn     (page_ready_chn),     // input
        .next_page_chn      (next_page_chn_jp),   // output
        .frame_en           (frame_en_jp),       // input
        .frame_start_xclk   (frame_start_xclk),   // input@posedge xclk - parameters are copied @ this pulse
        .frame_go           (frame_go_jp),        // input - do not use - assign to frame_en? Running frames can be controlled by other means
        .cmprs_run_mclk     (cmprs_run_mclk),     // input used to reset frame_pre_run (enable vsync_late for the new frame after stop)
        .left_marg          (left_marg),          // input[4:0] 
        .n_blocks_in_row_m1 (n_blocks_in_row_m1), // input[12:0] 
        .n_block_rows_m1    (n_block_rows_m1),    // input[12:0] 
        .mb_w_m1            (mb_w_m1),            // input[5:0]   // macroblock width minus 1 // 3 LSB not used here
        .mb_hper            (mb_hper),            // input[4:0]   // macroblock horizontal period (8/16) // 3 LSB not used (set them 0)
        .tile_width         (tile_width),         // input[1:0]   // memory tile width. Can be 32/64/128: 0 - 16, 1 - 32, 2 - 64, 3 - 128
        .mb_pre_end_in      (mb_pre_end),         // input
        .mb_release_buf     (mb_release_buf),     // input
        .mb_pre_start_out   (mb_pre_start),       // output
        .start_page         (start_page),         // output[1:0] 
        .macroblock_x       (macroblock_x),       // output[6:0] 
        .first_mb           (first_mb),           // output reg 
        .last_mb            (last_mb)             // output
`ifdef DEBUG_RING
        ,.dbg_add_invalid   (dbg_add_invalid),
        .dbg_mb_release_buf (dbg_mb_release_buf)
`endif        
    );

    cmprs_raw_buf_iface #(
        .FRAME_QUEUE_WIDTH(2)
    ) cmprs_raw_buf_iface_i (
        .xclk               (xclk),               // input
        .mclk               (mclk),               // input
        .mrst               (mrst),               // input
        .xrst               (xrst),               // input
        .xfer_reset_page_rd (xfer_reset_page_rd), // input
        .page_ready_chn     (page_ready_chn),     // input
        .next_page_chn      (next_page_chn_raw),  // output
        .frame_en           (frame_en_raw),       // input
        .frame_start_xclk   (frame_start_xclk),   // input
        .frame_go           (frame_go_raw),       // input
        .cmprs_run_mclk     (cmprs_run_mclk),     // input
        .n_blocks_in_row_m1 (n_blocks_in_row_m1), // input[12:0] 
        .n_block_rows_m1    (n_block_rows_m1),    // input[12:0] 
        .stuffer_running    (stuffer_running),    // input
        .raw_be16           (raw_be16),           // input
        .buf_ra             (raw_buf_ra),         // output[11:0] 
        .buf_rd             (raw_buf_rd),         // output[1:0] 
        .raw_start          (raw_start),          // output
        .raw_prefb          (raw_prefb),          // output
        .raw_ts_copy        (raw_ts_copy),        // output
        .raw_flush          (raw_flush)           // output
    );

    cmprs_pixel_buf_iface #(
        .CMPRS_PREEND_EARLY      (6), // TODO:Check / Adjust
        .CMPRS_RELEASE_EARLY     (16),
        .CMPRS_BUF_EXTRA_LATENCY (0),
        .CMPRS_COLOR18           (CMPRS_COLOR18),
        .CMPRS_COLOR20           (CMPRS_COLOR20),
        .CMPRS_MONO16            (CMPRS_MONO16),
        .CMPRS_JP4               (CMPRS_JP4),
        .CMPRS_JP4DIFF           (CMPRS_JP4DIFF),
        .CMPRS_MONO8             (CMPRS_MONO8)
         
    ) cmprs_pixel_buf_iface_i (
        .xclk               (xclk),             // input
        .frame_en           (frame_en_jp),         // input
        .buf_di             (buf_pxd),          // input[7:0] 
        .buf_ra             (buf_ra),           // output[11:0] 
        .buf_rd             (buf_rd),           // output[1:0] 
        .converter_type     (converter_type),   // input[2:0] 
        .mb_w_m1            (mb_w_m1),          // input[5:0] 
        .mb_h_m1            (mb_h_m1),          // input[5:0] 
        .tile_width         (tile_width),       // input[1:0] 
        .tile_col_width     (tile_col_width),   // input
        .mb_pre_end         (mb_pre_end),       // output
        .mb_release_buf     (mb_release_buf),   // output
        .mb_pre_start       (mb_pre_start),     // input
        .start_page         (start_page),       // input[1:0] 
        .macroblock_x       (macroblock_x),     // input[6:0] 
        .data_out           (mb_data_out),      // output[7:0] // Macroblock data out in scanline order
        .pre_first_out      (mb_pre_first_out), // output // Macroblock data out strobe - 1 cycle just before data valid  == old pre_first_pixel?
        .pre2_first_out     (mb_pre2_first_out), // output reg  
        .data_valid         () // output reg     // Macroblock data out valid Unused
    );

    csconvert #(
        .CMPRS_COLOR18   (CMPRS_COLOR18),
        .CMPRS_COLOR20   (CMPRS_COLOR20),
        .CMPRS_MONO16    (CMPRS_MONO16),
        .CMPRS_JP4       (CMPRS_JP4),
        .CMPRS_JP4DIFF   (CMPRS_JP4DIFF),
        .CMPRS_MONO8     (CMPRS_MONO8)
    ) csconvert_i (
        .xclk           (xclk),             // input
        .frame_en       (frame_en_jp),      // input
        .converter_type (converter_type),   // input[2:0] 
        .ignore_color   (ignore_color),     // input
        .scale_diff     (scale_diff),       // input
        .hdr            (hdr),              // input
        .limit_diff     (limit_diff),       // input
        .m_cb           (m_cb),             // input[9:0] 
        .m_cr           (m_cr),             // input[9:0] 
        .mb_din         (mb_data_out),      // input[7:0] 
        .bayer_phase    (bayer_phase),      // input[1:0] 
        .pre2_first_in  (mb_pre2_first_out),// input
        .signed_y       (signed_y),         // output[8:0] reg 
        .signed_c       (signed_c),         // output[8:0] reg 
        .yaddrw         (yaddrw),           // output[7:0] reg 
        .ywe            (ywe),              // output reg 
        .caddrw         (caddrw),           // output[7:0] reg 
        .cwe            (cwe),              // output reg 
        .pre_first_out  (yc_pre_first_out), // output reg 
        .n000           (n000),             // output[7:0] reg 
        .n255           (n255)              // output[7:0] reg 
    );


    cmprs_buf_average #(
        .CMPRS_COLOR18   (CMPRS_COLOR18),
        .CMPRS_COLOR20   (CMPRS_COLOR20),
        .CMPRS_MONO16    (CMPRS_MONO16),
        .CMPRS_JP4       (CMPRS_JP4),
        .CMPRS_JP4DIFF   (CMPRS_JP4DIFF),
        .CMPRS_MONO8     (CMPRS_MONO8)
    ) cmprs_buf_average_i (
        .xclk               (xclk),             // input
        .frame_en           (frame_en_jp),      // input
        .converter_type     (converter_type),   // input[2:0] 
        .pre_first_in       (mb_pre_first_out), // input
        .yc_pre_first_out   (yc_pre_first_out), // input
        .bayer_phase        (bayer_phase),      // input[1:0] 
        .jp4_dc_improved    (jp4_dc_improved),  // input
        .hdr                (hdr),              // input
        .subtract_dc_in     (subtract_dc),      // input
        .first_mb_in        (first_mb),         // input - calculate in cmprs_macroblock_buf_iface 
        .last_mb_in         (last_mb),          // input - calculate in cmprs_macroblock_buf_iface
        .yaddrw             (yaddrw),           // input[7:0] 
        .ywe                (ywe),              // input
        .signed_y           (signed_y),         // input[8:0] 
        .caddrw             (caddrw),           // input[7:0] 
        .cwe                (cwe),              // input
        .signed_c           (signed_c),         // input[8:0] 
        .dout               (yc_nodc),          // output[9:0] 
        .avr                (yc_avr),           // output[8:0] 
//        .dv                 (yc_nodc_dv),       // output
        .dv                 (),                 // output unused?
        .ds                 (dct_start),        // output
        .tn                 (color_tn),         // output[2:0] 
        .first              (color_first),      // output reg 
        .last               (color_last),       // output reg 
        .component_num      (component_num),    // output[2:0] 
        .component_color    (component_color),  // output
        .component_first    (component_first),  // output
        .component_lastinmb (component_lastinmb)// output reg 
    );
//  wire   [ 9:0] yc_nodc;         // [9:0] data out (4:2:0) (signed, average=0)


///TODO: Replace always@ with a module?

    wire          dct_last_in;
    wire          dct_pre_first_out;
//    wire          dct_dv;
    wire   [12:0] dct_out;
    
    
 //propagation of first block through compressor pipeline
 
    wire          first_block_color=(color_tn[2:0]==3'h0) && color_first;        // while color conversion,
    reg           first_block_color_after;  // after color conversion,
    reg           first_block_dct;          // after DCT
    wire          first_block_quant;        // after quantizer
    always @ (posedge xclk) begin
        if (dct_start)   first_block_color_after <= first_block_color;
        if (dct_last_in) first_block_dct   <= first_block_color_after;
    end
    
    // 8x8 DCT implementing Chen algorithm and 2 passes
    // Each pass (1d) uses 5 DSP48E1 modules (2 - multipliers and 3 SIMD (2x24) adder/subracters
    // Needs a small (<48, but did not calculate yet) pause between block if they did not come
    // immediately after each other. This pause is needed to restart pipeline
`ifdef DEBUG_COMPRESSOR_SCRAMBLE
    wire DBG_DCT_DV;
    wire [31:0] DBG_DCT_SCRAMBLED;
    scrambler #(
        .DATA_BYTE_WIDTH(4)
    ) scrambler_i (
        .clk      (xclk),                                                 // input wire 
        .rst      (first_block_dct && !DBG_DCT_DV && !dct_pre_first_out), // input wire 
        .val_in   (DBG_DCT_DV),                                           // input wire 
        .data_in  ({19'b0, dct_out}),                                     // input[31:0] wire 
        .data_out (DBG_DCT_SCRAMBLED)                                     // output[31:0] wire 
    );
    
`endif    
    dct2d8x8_chen #(
        .INPUT_WIDTH      (10),
        .OUTPUT_WIDTH     (13),
        .STAGE1_SAFE_BITS (3),
        .STAGE2_SAFE_BITS (3),
        .TRANSPOSE_WIDTH  (16),
        .TRIM_STAGE_1     (1),
        .TRIM_STAGE_2     (0),
        .DSP_WIDTH        (24),
        .DSP_B_WIDTH      (18),
        .DSP_A_WIDTH      (25),
        .DSP_P_WIDTH      (48)
    ) dct2d8x8_chen_i (
        .clk           (xclk),              // input
        .rst           (!frame_en_jp),      // input
        .start         (dct_start),         // input
        .xin           (yc_nodc),           // input[9:0] signed 
        .last_in       (dct_last_in),       // output reg 
        .pre_first_out (dct_pre_first_out), // output
`ifdef DEBUG_COMPRESSOR_SCRAMBLE
        .dv            (DBG_DCT_DV),        // output
`else
        .dv            (),                  // output
`endif        
        .d_out         (dct_out)            // output[12:0] signed 
    );
    
    wire          quant_start;
    dly_16 #(.WIDTH(1)) i_quant_start (.clk(xclk),.rst(1'b0), .dly(4'd0), .din(dct_pre_first_out), .dout(quant_start));    // dly=0+1
 
    
    always @ (posedge xclk) begin
        if (!dccout) dcc_en <=1'b0;
        else if (dct_start && color_first && (color_tn[2:0]==3'b001)) dcc_en <=1'b1; // 3'b001 - closer to the first "start" in quantizator
    end
    
    
//    wire          table_a_not_d; // writing table address /not data (a[0] from cmd_deser)
//  wire          table_we;      // writing to tables               (decoded stb from cmd_deser)
    wire          tser_a_not_d;  // address/not data distributed to submodules
    wire   [ 7:0] tser_d;        // byte-wide serialized tables address/data to submodules
    wire   [ 3:0] tser_sel;      // vector of individual table selects (decoded from the 8 MSBs of the table address)
    wire          tser_qe = tser_sel[TABLE_QUANTIZATION_INDEX];  // write serialized table data to quantizer
    wire          tser_ce = tser_sel[TABLE_CORING_INDEX];        // write serialized table data to coring
    wire          tser_fe = tser_sel[TABLE_FOCUS_INDEX];         // write serialized table data to focusing
    wire          tser_he = tser_sel[TABLE_HUFFMAN_INDEX];       // write serialized table data to Huffman
//{tser_he,tser_fe,tser_ce,tser_qe}
// As all commands are 32-bit data, all 4 bytes will be written to a designated table (usually 2 of 16-bit writes)    
    table_ad_transmit #(
        .NUM_CHANNELS(4),
        .ADDR_BITS(3)
    ) table_ad_transmit_i (
        .clk             (mclk),                  // input @posedge
        .srst             (mrst),                  // @posedge mclk
        .a_not_d_in      (cmd_a[0]),              // input writing table address /not data (a[0] from cmd_deser)
        .we              (set_tables_w),          // input writing to tables               (decoded stb from cmd_deser)
        .din             (cmd_data),              // input[31:0] 32-bit data to serialize/write to tables (LSB first) - from cmd_deser
        .ser_d           (tser_d),                // output[7:0] byte-wide serialized tables address/data to submodules
        .a_not_d         (tser_a_not_d),          // output reg address/not data distributed to submodules
//        .chn_en          ({tser_he,tser_fe,tser_ce,tser_qe}) // output[0:0] reg - table 1-hot select outputs
        .chn_en          (tser_sel) // output[0:0] reg - table 1-hot select outputs
    );
    
    
    
    quantizer393 quantizer393_i (
        .clk                (xclk),                   // input
        .en                 (frame_en_jp),            // input 
        .mclk               (mclk),                   // input system clock, twqe, twce, ta,tdi - valid @posedge (ra, tdi - 2 cycles ahead (was negedge)
        .tser_qe            (tser_qe),                // input - write to a quantization table
        .tser_ce            (tser_ce),                // input - write to a coring table
        .tser_a_not_d       (tser_a_not_d),           // input - address/not data to tables
        .tser_d             (tser_d),                 // input[7:0] - byte-wide data to tables
        .ctypei             (component_color),        // input component type input (Y/C)
        .dci                (yc_avr),                 // input[8:0] - average value in a block - subtracted before DCT. now normal signed number
        .first_stb          (first_block_color),      // input - this is first stb pulse in a frame
        .stb                (dct_start),              // input - strobe that writes ctypei, dci
        .tsi                (cmprs_qpage[2:0]),       // input[2:0] - table (quality) select [2:0]
        .pre_start          (dct_pre_first_out),      // input - marks first input pixel (one before)
        .first_in           (first_block_dct),        // input - first block in (valid @ start)
        .first_out          (first_block_quant),      // output reg - valid @ ds
        .di                 (dct_out[12:0]),          // input[12:0] -  pixel data in (signed)
        .dout               (quant_do[12:0]),         // output[12:0] - pixel data out (AC is only 9 bits long?) - changed to 10
        .dv                 (),                       // output reg - data out valid
        .ds                 (quant_ds),               // output reg - data out strobe (one ahead of the start of dv)
        .dc_tdo             (quant_dc_tdo[15:0]),     // output[15:0] reg -  MSB aligned coefficient for the DC component (used in focus module)
        .dcc_en             (dcc_en),                 // input - enable dcc (sync to beginning of a new frame)
        .hfc_sel            (hfc_sel),                // input[2:0] - hight frequency components select [2:0] (includes components with both numbers >=hfc_sel
        .color_first        (color_first),            // input - first MCU in a frame
        .coring_num         (coring_num),             // input[2:0] - coring table pair number (0..7)
        .dcc_vld            (dccvld),                 // output reg  - single cycle when dcc_data is valid
        .dcc_data           (dccdata[15:0]),          // output[15:0] - dc component data out (for reading by software) 
        .n000               (n000),                   // input[7:0] - number of zero pixels (255 if 256) - to be multiplexed with dcc
        .n255               (n255)                    // input[7:0] - number of 0xff pixels (255 if 256) - to be multiplexed with dcc
    );

    // focus sharp module calculates amount of high-frequency components and optioanlly overlays/replaces actual image
    wire   [12:0] focus_do;     // output[12:0] reg  pixel data out, make timing ignore (valid 1.5 clk earlier that Quantizer output)
    wire          focus_ds;     // output reg data out strobe (one ahead of the start of dv)
    // TODO: Verify focus_sharp393: quantizer output (with strobes) is now 2 cycles later than in 353 (relative to xdct out). Seems to be OK.
    focus_sharp393 focus_sharp393_i (
        .clk                (xclk),                   // input - pixel clock
        .clk2x              (xclk),                   // FIXME: fix the module not to use xclk2x
        .en                 (frame_en_jp),            // input 

        .mclk               (mclk),                   // input system clock to write tables
        .tser_we            (tser_fe),                // input - write to a focus sharpness table
        .tser_a_not_d       (tser_a_not_d),           // input - address/not data to tables
        .tser_d             (tser_d),                 // input[7:0] - byte-wide data to tables
        
        .mode               (cmprs_fmode[1:0]),  // input[1:0] focus mode (combine image with focus info) - 0 - none, 1 - replace, 2 - combine all,  3 - combine woi
        .firsti             (color_first),            // input first macroblock
        .lasti              (color_last),             // input last macroblock
        .tni                (color_tn[2:0]),          // input[2:0] block number in a macronblock - 0..3 - Y, >=4 - color (sync to stb)
        .stb                (dct_start),              // input strobe that writes ctypei, dci
        .start              (quant_start),            // input marks first input pixel (needs 1 cycle delay from previous DCT stage)
        .di                 (dct_out),                // input[12:0] pixel data in (signed)
        .quant_ds           (quant_ds),               // input quantizator ds
        .quant_d            (quant_do[12:0]),         // input[12:0] quantizator data output
        .quant_dc_tdo       (quant_dc_tdo),           // input[15:0] MSB aligned coefficient for the DC component (used in focus module)
        .dout               (focus_do[12:0]),         // output[12:0] reg  pixel data out, make timing ignore (valid 1.5 clk earlier that Quantizer output)
        .ds                 (focus_ds),               // output reg data out strobe (one ahead of the start of dv)
        .hifreq             (hifreq[31:0])            // output[31:0] reg accumulated high frequency components in a frame sub-window
    );

    // Format DC components to be output as a mini-frame. Was not used in the late NC353 as the dma1 channel was used for IMU instead of dcc
    wire          finish_dcc;
    wire   [31:0] stuffer_do;
    wire          stuffer_dv;
    wire          stuffer_done;
    
    assign finish_dcc = stuffer_done;

    dcc_sync393 dcc_sync393_i (
        .sclk               (xclk),                  // input
        .dcc_en             (dcc_en),                // input xclk rising, sync with start of the frame
        .finish_dcc         (finish_dcc),            // input @ sclk rising
        .dcc_vld            (dccvld),                // input xclk rising
        .dcc_data           (dccdata[15:0]),         // input[15:0] @clk rising
        .statistics_dv      (statistics_dv),         // output reg 
        .statistics_do      (statistics_do[15:0])    // output[15:0] reg @ sclk
    );
    

// generate DC data/strobe for the direct output (re) using sdram channel3 buffering
// encoderDCAC is updated to handle 13-bit signed data instead of the 12-bit. It will limit the values on ot's own
    encoderDCAC393 encoderDCAC393_i (
        .clk                (xclk),                   // input
        .en                 (frame_en_jp),            // input 
        .lasti              (color_last),             // input - was "last MCU in a frame" (@ stb)
        .first_blocki       (first_block_color),      // input - first block in frame - save fifo write address (@ stb)
        .comp_numberi       (component_num[2:0]),     // input[2:0] - component number 0..2 in color, 0..3 - in jp4diff, >= 4 - don't use (@ stb)
        .comp_firsti        (component_first),        // input - first this component in a frame (reset DC) (@ stb)
        .comp_colori        (component_color),        // input - use color - huffman? (@ stb)
        .comp_lastinmbi     (component_lastinmb),     // input - last component in a macroblock (@ stb) is it needed?
        .stb                (dct_start),              // input - strobe that writes firsti, lasti, tni,average
        .zdi                (focus_do[12:0]),         // input[12:0] - zigzag-reordered data input
        .first_blockz       (first_block_quant),      // input - first block input (@zds)
        .zds                (focus_ds),               // input - strobe - one ahead of the DC component output
`ifdef DEBUG_RING
        .last               (dbg_last_DCAC),                       // output reg - not used
`else
        .last               (),                       // output reg - not used
`endif
        .dout               (enc_do[15:0]),           // output[15:0] reg 
        .dv                 (enc_dv)                  // output reg 
`ifdef DEBUG_RING
        ,.comp_lastinmbo               (dbg_comp_lastinmbo)
        ,.dbg_block_mem_ra             (dbg_block_mem_ra)
        ,.dbg_block_mem_wa             (dbg_block_mem_wa)
        ,.dbg_block_mem_wa_save        (dbg_block_mem_wa_save)
`else
        ,.comp_lastinmbo               ()
        ,.dbg_block_mem_ra             ()
       ,.dbg_block_mem_wa              ()
        ,.dbg_block_mem_wa_save        ()
`endif
    );

//    wire [2:0] dbg_block_mem_wa;
//    wire [2:0] dbg_block_mem_wa_save;


    huffman_stuffer_raw_meta huffman_stuffer_meta_i (
        .mclk              (mclk),             // input
        .mrst              (mrst),             // input
        .xclk              (xclk),             // input
        .en_huffman        (frame_en_jp),      // input
        .en_stuffer        (stuffer_en),       // input
        .abort_stuffer     (force_flush_long), // input
        .tser_we           (tser_he),          // input
        .tser_a_not_d      (tser_a_not_d),     // input
        .tser_d            (tser_d),           // input[7:0] 
        .di                (enc_do[15:0]),     // input[15:0] 
        .ds                (enc_dv),           // input
        .ts_pre_stb        (ts_pre_stb),       // input
        .ts_data           (ts_data),          // input[7:0] 
        .color_first       (color_first),      // input valid @xclk - only for sec/usec

        .compressed_mode   (compressed),       // input
        .raw_mode          (uncompressed),     // input
        .raw_be16          (1'b0), // raw_be16),         // input
        .raw_bytes         (buf_pxd),          // input[7:0] 
        .raw_start         (raw_start),        // input
        .raw_prefb         (raw_prefb),        // input
        .raw_ts_copy       (raw_ts_copy),      // input
        .raw_flush         (raw_flush),        // input
        
        .data_out          (stuffer_do),       // output[31:0] 
        .data_out_valid    (stuffer_dv),       // output
        .done              (stuffer_done),     // output   // after trailer
        .running           (stuffer_running),  // output   // DID not include trailer (bug?), now includes (after raw debugging)
        .clk_flush          (hclk),            // input
        .flush_clk          (flush_hclk)       // output
        
    `ifdef DEBUG_RING
       ,.test_lbw          (dbg_test_lbw),     // output reg ??
        .gotLastBlock      (dbg_gotLastBlock), // output ?? - unused (was for debug)
        .dbg_etrax_dma     (etrax_dma),        // output[3:0]
        .dbg_ts_rstb       (dbg_ts_rstb),      // output             
        .dbg_ts_dout       (dbg_ts_dout)       //output[7:0]
    `endif        
    );
    wire          eof_written_xclk;
    pulse_cross_clock stuffer_done_mclk_i (.rst(xrst), .src_clk(xclk), .dst_clk(mclk), .in_pulse(stuffer_done), .out_pulse(stuffer_done_mclk),.busy());
    cmprs_out_fifo32 cmprs_out_fifo_i (
        // source (stuffer) clock domain
        .wclk                (xclk),        // input source clock (1x pixel clock, inverted) - same as stuffer out
        .wrst                (xrst),         // input mostly for simulation
        
        .we                  (stuffer_dv),     // @ posedge(~xclk2x) input write data from stuffer
        .wdata               ({stuffer_do[7:0],stuffer_do[15:8],stuffer_do[23:16],stuffer_do[31:24]}),     // input[15:0] data from stuffer module;
        .wa_rst              (!stuffer_en),    // input reset low address bits when stuffer is disabled (to make sure it is multiple of 32 bytes
        .wlast               (stuffer_done),   // input - written last 32 bytes of a frame (flush FIFO) - stuffer_done (has to be later than we)
        .eof_written_wclk    (eof_written_xclk),    // output - AFI had transferred frame data to the system memory
        // AFI clock domain
        .rclk                (hclk),           // @posedge(hclk) input - AFI clock
        .rrst                (hrst),           // input - AFI clock
        .rst_fifo            (fifo_rst),       // input - reset FIFO (set read address to write, reset count)
        .ren                 (fifo_ren),       // input - fifo read from AFI channel mux
        .rdata               (fifo_rdata),     // output[63:0] - data to AFI channel mux (latency == 2 from fifo_ren)
        .eof                 (fifo_eof),       // output single hclk pulse signalling EOF
        .eof_written         (eof_written),    // input single hclk pulse confirming frame data is written to the system memory
        .flush_fifo          (fifo_flush),     // output level signalling that FIFO has data from the current frame (use short AXI burst if needed)
        .fifo_count          (fifo_count)      // output[7:0] - number of 32-byte chunks available in FIFO
    );
    pulse_cross_clock eof_written_mclk_i (.rst(xrst), .src_clk(xclk), .dst_clk(mclk), .in_pulse(eof_written_xclk), .out_pulse(eof_written_mclk),.busy());
    
  `ifdef DISPLAY_COMPRESSED_DATA
    integer stuffer_word_number;
    always @ (posedge xclk) begin
        if (stuffer_dv) begin
            $display ("COMPRESSOR CHN%d 0x%x -> 0x%x", CMPRS_NUMBER, stuffer_word_number, stuffer_do);
        end
        if (stuffer_done) begin
            $display ("COMPRESSOR CHN%d ***** DONE *****",CMPRS_NUMBER);
        end
        if (!stuffer_en || stuffer_done) stuffer_word_number = 0;
        else if (stuffer_dv)             stuffer_word_number =  stuffer_word_number + 1;
    end
  `endif
    

// TODO: Add status module to combine/FF, re-clock status signals


endmodule

