// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmprs_cmd_decode
 * @file cmprs_cmd_decode.v
 * @date 2015-06-23  
 * @author Andrey Filippov     
 *
 * @brief Decode compressor command/modes, reclock some signals
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmprs_cmd_decode.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmprs_cmd_decode.v is distributed in the hope that it will be useful,
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
//From 353:
// [23] == 1 - set focus mode
// [22:21] 0 - none
//         1 - replace
//         2 - combine for all image
//         3 - combine in window only
// [20] == 1 - set Bayer shift
// [19:18] Bayer shift
// [17] == 1 - set compressor shift
// [16:14] compressor shift
// [13]==1 - enable color modes
// [12:9]== 0 - color, 4:2:0
//          1 - monochrome, 6/4 blocks (as 4:2:0)
//          2 - jp4, 6 blocks, original
//          3 - jp4, 6 blocks, dc -improved
//          4 - mono, 4 blocks (but still not actual monochrome JPEG as the blocks are scanned in 2x2 macroblocks)
//          5 - jp4,  4 blocks, dc-improved
//          6 - jp4,  differential
//          7 - 15 - reserved
// [8:7] == 0,1 - NOP, 2 -   disable, 3 - enable subtracting of average value (DC component), bypassing DCT
// [6] == 1 - enable quantization bank select, 0 - disregard bits [5:3]
// [5:3] = quantization page number (0..7)
// [2]== 1 - enable on/off control:
// [1:0]== 0 - reset compressor, stop immediately
//         1 - enable compressor, disable repetitive mode
//         2 - enable compressor, compress single frame
//         3 - enable compressor, enable repetitive mode
//
//Modified for 393:
// [23] == 1 - set focus mode
// [22:21] 0 - none
//         1 - replace
//         2 - combine for all image
//         3 - combine in window only
// [20] == 1 - set Bayer shift
// [19:18] Bayer shift
// WAS: [17:16] - unused

// [17] == 1 - set BE16 mode 
// [16]    0 - BE16 mode (1 - byte stream is little endian 16-bit, file is big endian 16 bits

// [15] == 1 - set single/multi frame mode
// [14]    0 - multiframe (compare frame numbers for 'suspend' output)
//         1 - single frame buffer
// [13]== 1 - enable color modes
// [12:9]== 0 - color, 4:2:0
//          1 - monochrome, 6/4 blocks (as 4:2:0)
//          2 - jp4, 6 blocks, original
//          3 - jp4, 6 blocks, dc -improved
//          4 - mono, 4 blocks (but still not actual monochrome JPEG as the blocks are scanned in 2x2 macroblocks)
//          5 - jp4,  4 blocks, dc-improved
//          6 - jp4,  differential
//          7 - jp4,  4 blocks, differential
//          8 - jp4,  4 blocks, differential, hdr
//          9 - jp4,  4 blocks, differential, divide by 2
//         10 - jp4,  4 blocks, differential, hdr,divide by 2
//         11 - mono JPEG (not yet implemented)
//         12-13 - RESERVED
//         14 - mono 4 blocks
//         15 - uncompressed

// [8:7] == 0,1 - NOP, 2 -   disable, 3 - enable subtracting of average value (DC component), bypassing DCT
// [6] == 1 - enable quantization bank select, 0 - disregard bits [5:3]
// [5:3] = quantization page number (0..7)
// [2]== 1 - enable compressor on/off control:
// [1:0]== 0 - reset compressor, stop immediately
//         1 - disable compression of the new frames, finish any already started
//         2 - enable compressor, compress single frame from memory (async)
//         3 - enable compressor, enable synchronous compression mode

// TODO WARNING: Switching to/from raw(uncompressed) mode requires stopping/restarting compressor!

module  cmprs_cmd_decode#(
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

        parameter CMPRS_COLOR18 =             0, // JPEG 4:2:0 with 18x18 overlapping tiles for de-bayer
        parameter CMPRS_COLOR20 =             1, // JPEG 4:2:0 with 18x18 overlapping tiles for de-bayer (not implemented)
        parameter CMPRS_MONO16 =              2, // JPEG 4:2:0 with 16x16 non-overlapping tiles, color components zeroed
        parameter CMPRS_JP4 =                 3, // JP4 mode with 16x16 macroblocks
        parameter CMPRS_JP4DIFF =             4, // JP4DIFF mode TODO: see if correct
        parameter CMPRS_RAW =                 6, // Not comressed, raw data
        parameter CMPRS_MONO8 =               7, // Regular JPEG monochrome with 8x8 macroblocks (not yet implemented)
        
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
        parameter CMPRS_CORING_BITS =          3 // number of bits in coring mode
        
    
)(
    input                         xclk,               // global clock input, compressor single clock rate
    input                         mclk,               // global system/memory clock
    input                         mrst,      // @posedge mclk, sync reset
    input                         ctrl_we,            // input - @mclk control register write enable
    input                         format_we,          // input - @mclk write number of tiles and left margin
    input                         color_sat_we,       // input - @mclk write color saturation values
    input                         coring_we,          // input - @mclk write coring values
    
    input                  [31:0] di,     // [15:0] data from CPU (sync to negedge sclk)
    input                         frame_start,        // @mclk
    output                        frame_start_xclk,   // frame start, parameters are copied at this pulse
    
                                  //  outputs sync @ posedge mclk:
    output                        cmprs_en_mclk,      // @mclk 0 resets immediately
    input                         cmprs_en_extend,    // @mclk keep compressor enabled for graceful shutdown
    input                         compressor_running,  // @xclk - reading frame or running stuffer/trailer
    
    output reg                    cmprs_run_mclk,     // @mclk enable propagation of vsync_late to frame_start_dst in bonded(sync to src) mode
    output reg                    cmprs_standalone,   // @mclk single-cycle: generate a single frame_start_dst in unbonded (not synchronized) mode.
                                                      // cmprs_run should be off
    output reg                    sigle_frame_buf,    // memory controller uses a single frame buffer (frame_number_* == 0), use other sync
                                  //  outputs sync @ posedge xclk:
    output reg                    cmprs_en_xclk,      // enable compressor, turn off immedaitely
    output reg                    cmprs_en_xclk_jp,      // enable compressor, turn off immedaitely
    output reg                    cmprs_en_xclk_raw,      // enable compressor, turn off immedaitely

    output reg                    cmprs_en_late_xclk, // enable stuffer, extends control fields for graceful shutdown (should be for raw also?)
                                  // outputs @posedge xclk, frozen when the new frame is requested
    output reg             [ 2:0] cmprs_qpage, // [2:0] - quantizator page number (0..7)
    output reg                    cmprs_dcsub, // subtract dc level before DCT, restore later
    output reg             [ 1:0] cmprs_fmode, //[1:0] - focus mode
    output reg             [ 1:0] bayer_shift, // additional shift to bayer mosaic
                                  
    output reg                    ignore_color,
    output reg                    four_blocks,
    output reg                    jp4_dc_improved,
    output reg             [ 2:0] converter_type, // 0 - color18, 1 - color20, 2 - mono, 3 - jp4, 4 - jp4-diff
    output reg                    scale_diff,
    output reg                    hdr,
    
    output reg [CMPRS_FRMT_LMARG_BITS-1:0] left_marg,          // left margin (for not-yet-implemented) mono JPEG (8 lines tile row) can need 7 bits (mod 32 - tile)
    output reg [CMPRS_FRMT_MBCM1_BITS-1:0] n_blocks_in_row_m1, // number of macroblocks in a macroblock row minus 1
    output reg [CMPRS_FRMT_MBRM1_BITS-1:0] n_block_rows_m1,    // number of macroblock rows in a frame minus 1

    output reg [CMPRS_CSAT_CB_BITS-1:0] color_sat_cb,    // scale for Cb color component (color saturation)
    output reg [CMPRS_CSAT_CR_BITS-1:0] color_sat_cr,    // scale for Cr color component (color saturation)
    
    output reg [CMPRS_CORING_BITS-1:0]  coring,           // scale for Cb color component (color saturation)
    output reg                    compressed,      // late on, early off running compressor chain
    output reg                    uncompressed,    // late on, early off running raw chain
    output reg                    be16
    );

    reg   [30:0]  di_r;
    reg           ctrl_we_r;
    
    reg           format_we_r;
    reg           color_sat_we_r;
    reg           coring_we_r;
    
    
    reg           cmprs_en_mclk_r;
    wire          ctrl_we_xclk;       // single xclk pulse after ctrl_we_r (or use just ctrl_we, not ctrl_we_r)
    wire          format_we_xclk;     // @xclk write number of tiles and left margin
    wire          color_sat_we_xclk;  // @xclk write color saturation values
    wire          coring_we_xclk;     // @xclk write coring values
    
    
    reg   [ 2:0] cmprs_qpage_mclk; // [2:0] - quantizator page number (0..7)
    reg          cmprs_dcsub_mclk; // subtract dc level before DCT, restore later
    reg   [ 3:0] cmprs_mode_mclk;  // [3:0] - compressor mode
    reg   [ 1:0] cmprs_fmode_mclk; //[1:0] - focus mode
    reg   [ 1:0] bayer_shift_mclk; // additional shift to bayer mosaic
    
    reg   [30:0] format_mclk; // left margin and macroblock rows/columns
    reg   [23:0] color_sat_mclk; // color saturation values (only 10 LSB in each 12 are used
    reg   [ 2:0] coring_mclk; // color saturation values (only 10 LSB in each 12 are used
    
    reg   [ 2:0] cmprs_qpage_xclk; // [2:0] - quantizator page number (0..7)
    reg          cmprs_dcsub_xclk; // subtract dc level before DCT, restore later
    reg   [ 3:0] cmprs_mode_xclk;  // [3:0] - compressor mode
    reg   [ 1:0] cmprs_fmode_xclk; //[1:0] - focus mode
    reg   [ 1:0] bayer_shift_xclk; // additional shift to bayer mosaic
    
    reg   [30:0] format_xclk; // left margin and macroblock rows/columns
    reg   [23:0] color_sat_xclk; // color saturation values (only 10 LSB in each 12 are used
    reg   [ 2:0] coring_xclk; // color saturation values (only 10 LSB in each 12 are used
    
    wire         uncompressed_mclk;
    wire         uncompressed_xclk;
    
    assign cmprs_en_mclk = cmprs_en_mclk_r;
    assign uncompressed_mclk = cmprs_mode_mclk[3:0] == CMPRS_CBIT_CMODE_RAW;
    assign uncompressed_xclk = cmprs_mode_xclk[3:0] == CMPRS_CBIT_CMODE_RAW;
    
    always @ (posedge mclk) begin
        if (mrst) ctrl_we_r <= 0;
        else      ctrl_we_r <= ctrl_we;
        
        if (mrst) format_we_r <= 0;
        else      format_we_r <= format_we;
        
        if (mrst) color_sat_we_r <= 0;
        else      color_sat_we_r <= color_sat_we;
        
        if (mrst) coring_we_r <= 0;
        else      coring_we_r <= coring_we;
        
        if (mrst)                                                      di_r <= 0;
        else if (ctrl_we || format_we || color_sat_we || coring_we)    di_r <= di[30:0];
    
        if      (mrst)                              cmprs_en_mclk_r <= 0;
        else if (ctrl_we_r && di_r[CMPRS_CBIT_RUN]) cmprs_en_mclk_r <= (di_r[CMPRS_CBIT_RUN-1 -:CMPRS_CBIT_RUN_BITS] != CMPRS_CBIT_RUN_RST);
        
        if      (mrst)                              cmprs_run_mclk <= 0;
        else if (ctrl_we_r && di_r[CMPRS_CBIT_RUN]) cmprs_run_mclk <= (di_r[CMPRS_CBIT_RUN-1 -:CMPRS_CBIT_RUN_BITS] == CMPRS_CBIT_RUN_ENABLE);
        
        if      (mrst)      cmprs_standalone <= 0;
        else cmprs_standalone <=  ctrl_we_r && di_r[CMPRS_CBIT_RUN] && (di_r[CMPRS_CBIT_RUN-1 -:CMPRS_CBIT_RUN_BITS] == CMPRS_CBIT_RUN_STANDALONE);

        if      (mrst)                                 sigle_frame_buf <= 0;
        else if (ctrl_we_r && di_r[CMPRS_CBIT_FRAMES]) sigle_frame_buf <= (di_r[CMPRS_CBIT_FRAMES-1 -:CMPRS_CBIT_FRAMES_BITS] == CMPRS_CBIT_FRAMES_SINGLE);

        if      (mrst)                                 be16 <= 0;
        else if (ctrl_we_r && di_r[CMPRS_CBIT_BE16])   be16 <= (di_r[CMPRS_CBIT_BE16-1 -:CMPRS_CBIT_BE16_BITS] == 1);

        if      (mrst)                                 cmprs_qpage_mclk <= 0;
        else if (ctrl_we_r && di_r[CMPRS_CBIT_QBANK])  cmprs_qpage_mclk <= di_r[CMPRS_CBIT_QBANK-1 -:CMPRS_CBIT_QBANK_BITS];

        if      (mrst)                                 cmprs_dcsub_mclk <= 0;
        else if (ctrl_we_r && di_r[CMPRS_CBIT_DCSUB])  cmprs_dcsub_mclk <= di_r[CMPRS_CBIT_DCSUB-1 -:CMPRS_CBIT_DCSUB_BITS];
        
        if      (mrst)                                 cmprs_mode_mclk <=  0;
        else if (ctrl_we_r && di_r[CMPRS_CBIT_CMODE])  cmprs_mode_mclk <=  di_r[CMPRS_CBIT_CMODE-1 -:CMPRS_CBIT_CMODE_BITS];
        
        if      (mrst)                                 cmprs_fmode_mclk <=  0;
        else if (ctrl_we_r && di_r[CMPRS_CBIT_FOCUS])  cmprs_fmode_mclk <=  di_r[CMPRS_CBIT_FOCUS-1 -:CMPRS_CBIT_FOCUS_BITS];
        
        if      (mrst)                                 bayer_shift_mclk <=  0;
        else if (ctrl_we_r && di_r[CMPRS_CBIT_BAYER])  bayer_shift_mclk <=  di_r[CMPRS_CBIT_BAYER-1 -:CMPRS_CBIT_BAYER_BITS];
        
        
        if      (mrst)           format_mclk <=  0;
        else if (format_we_r)    format_mclk <=  di_r[30:0];
        
        if      (mrst)           color_sat_mclk <=  'h0b6090; // 'h16c120 - saturation = 2
        else if (color_sat_we_r) color_sat_mclk <=  di_r[23:0];
        
        if      (mrst)           coring_mclk <=  0;
        else if (coring_we_r)    coring_mclk <=  di_r[2:0];

    end
    
    // re-clock to compressor clock
    always @ (posedge xclk)  begin
        cmprs_en_xclk   <=      cmprs_en_mclk_r;
        cmprs_en_late_xclk  <=  cmprs_en_mclk_r || cmprs_en_extend;
        if      (!cmprs_en_mclk_r) cmprs_en_xclk_jp <= 0;
        else if (ctrl_we_xclk)     cmprs_en_xclk_jp <= cmprs_en_mclk_r && !uncompressed_mclk;

        if      (!cmprs_en_mclk_r) cmprs_en_xclk_raw <= 0;
        else if (ctrl_we_xclk)     cmprs_en_xclk_raw <= cmprs_en_mclk_r && uncompressed_mclk;
        
    end    
    always @ (posedge xclk) if (ctrl_we_xclk) begin
        cmprs_qpage_xclk <=     cmprs_qpage_mclk;
        cmprs_dcsub_xclk <=     cmprs_dcsub_mclk;
        cmprs_mode_xclk <=      cmprs_mode_mclk;
        cmprs_fmode_xclk <=     cmprs_fmode_mclk;
        bayer_shift_xclk <=     bayer_shift_mclk;
    end
    
    always @ (posedge xclk) begin
         if (format_we_xclk)    format_xclk <=    format_mclk;
         if (color_sat_we_xclk) color_sat_xclk <= color_sat_mclk; // SuppressThisWarning VivadoSynthesis
         if (coring_we_xclk)    coring_xclk <=    coring_mclk;
    end

    always @ (posedge xclk) if (frame_start_xclk) begin
        cmprs_qpage <=        cmprs_qpage_xclk;
        cmprs_dcsub <=        cmprs_dcsub_xclk;
        cmprs_fmode <=        cmprs_fmode_xclk;
        bayer_shift <=        bayer_shift_xclk;
        
        left_marg <=          format_xclk[CMPRS_FRMT_LMARG +: CMPRS_FRMT_LMARG_BITS];
        n_block_rows_m1 <=    format_xclk[CMPRS_FRMT_MBRM1 +: CMPRS_FRMT_MBRM1_BITS];
        n_blocks_in_row_m1 <= format_xclk[CMPRS_FRMT_MBCM1 +: CMPRS_FRMT_MBCM1_BITS];
        
        color_sat_cr <=       color_sat_xclk[CMPRS_CSAT_CR +: CMPRS_CSAT_CR_BITS];
        color_sat_cb <=       color_sat_xclk[CMPRS_CSAT_CB +: CMPRS_CSAT_CB_BITS];
        
        coring <=             coring_xclk;
        
        
        // Will infer ROM
        case (cmprs_mode_xclk[3:0])
            CMPRS_CBIT_CMODE_MONO6: begin //monochrome, (4:2:0),
                ignore_color     <= 1;
                four_blocks      <= 0;
                jp4_dc_improved  <= 0;
                converter_type[2:0] <= CMPRS_MONO16; // 0 - color18, 1 - color20, 2 - mono, 3 - jp4, 4 - jp4-diff
                scale_diff       <=0;
                hdr              <=0;
              end
            CMPRS_CBIT_CMODE_JPEG18: begin //color, 4:2:0, 18x18(old)
                ignore_color     <= 0;
                four_blocks      <= 0;
                jp4_dc_improved  <= 0;
                converter_type[2:0] <= CMPRS_COLOR18; // 0 - color18, 1 - color20, 2 - mono, 3 - jp4, 4 - jp4-diff
                scale_diff       <=0;
                hdr              <=0;
              end
            CMPRS_CBIT_CMODE_JP46: begin // jp4, original (4:2:0),
                ignore_color     <= 1;
                four_blocks      <= 0;
                jp4_dc_improved  <= 0;
                converter_type[2:0] <= CMPRS_JP4; // 0 - color18, 1 - color20, 2 - mono, 3 - jp4, 4 - jp4-diff
                scale_diff       <=0;
                hdr              <=0;
              end
            CMPRS_CBIT_CMODE_JP46DC: begin // jp4, dc -improved (4:2:0),
                ignore_color     <= 1;
                four_blocks      <= 0;
                jp4_dc_improved  <= 1;
                converter_type[2:0] <= CMPRS_JP4; // 0 - color18, 1 - color20, 2 - mono, 3 - jp4, 4 - jp4-diff
                scale_diff       <=0;
                hdr              <=0;
              end
            CMPRS_CBIT_CMODE_JPEG20: begin // color, 4:2:0, 20x20, middle of the tile (not yet implemented)
                ignore_color     <= 0;
                four_blocks      <= 0;
                jp4_dc_improved  <= 0;
                converter_type[2:0] <= CMPRS_COLOR20; // 0 - color18, 1 - color20, 2 - mono, 3 - jp4, 4 - jp4-diff
                scale_diff       <=0;
                hdr              <=0;
              end
            CMPRS_CBIT_CMODE_JP4: begin // jp4, 4 blocks, (legacy)
                ignore_color     <= 1;
                four_blocks      <= 1;
                jp4_dc_improved  <= 0;
                converter_type[2:0] <= CMPRS_JP4; // 0 - color18, 1 - color20, 2 - mono, 3 - jp4, 4 - jp4-diff
                scale_diff       <=0;
                hdr              <=0;
              end
            CMPRS_CBIT_CMODE_JP4DC: begin // jp4, 4 blocks, dc -improved
                ignore_color     <= 1;
                four_blocks      <= 1;
                jp4_dc_improved  <= 1;
                converter_type[2:0] <= CMPRS_JP4; // 0 - color18, 1 - color20, 2 - mono, 3 - jp4, 4 - jp4-diff
                scale_diff       <=0;
                hdr              <=0;
              end
            CMPRS_CBIT_CMODE_JP4DIFF: begin // jp4, 4 blocks, differential
                ignore_color     <= 1;
                four_blocks      <= 1;
                jp4_dc_improved  <= 0;
                converter_type[2:0] <= CMPRS_JP4DIFF; // 0 - color18, 1 - color20, 2 - mono, 3 - jp4, 4 - jp4-diff
                scale_diff       <=0;
                hdr              <=0;
              end
            CMPRS_CBIT_CMODE_JP4DIFFHDR: begin // jp4, 4 blocks, differential, hdr
                ignore_color     <= 1;
                four_blocks      <= 1;
                jp4_dc_improved  <= 0;
                converter_type[2:0] <= CMPRS_JP4DIFF; // 0 - color18, 1 - color20, 2 - mono, 3 - jp4, 4 - jp4-diff
                scale_diff       <=0;
                hdr              <=1;
              end
            CMPRS_CBIT_CMODE_JP4DIFFDIV2: begin // jp4, 4 blocks, differential, divide diff by 2
                ignore_color     <= 1;
                four_blocks      <= 1;
                jp4_dc_improved  <= 0;
                converter_type[2:0] <= CMPRS_JP4DIFF; // 0 - color18, 1 - color20, 2 - mono, 3 - jp4, 4 - jp4-diff
                scale_diff       <=1;
                hdr              <=0;
              end
            CMPRS_CBIT_CMODE_JP4DIFFHDRDIV2: begin // jp4, 4 blocks, differential, hdr, divide diff by 2
                ignore_color     <= 1;
                four_blocks      <= 1;
                jp4_dc_improved  <= 0;
                converter_type[2:0] <= CMPRS_JP4DIFF; // 0 - color18, 1 - color20, 2 - mono, 3 - jp4, 4 - jp4-diff
                scale_diff       <=1;
                hdr              <=1;
              end
            CMPRS_CBIT_CMODE_MONO4: begin // mono, 4 blocks
                ignore_color     <= 1;
                four_blocks      <= 1;
                jp4_dc_improved  <= 0;
                converter_type[2:0] <= CMPRS_MONO16; // 0 - color18, 1 - color20, 2 - mono, 3 - jp4, 4 - jp4-diff
              end
            CMPRS_CBIT_CMODE_MONO1: begin // mono, 1 block
                ignore_color     <= 1;
                four_blocks      <= 1;
                jp4_dc_improved  <= 0;
                converter_type[2:0] <= CMPRS_MONO8; // 0 - color18, 1 - color20, 2 - mono, 3 - jp4, 4 - jp4-diff
              end

            CMPRS_CBIT_CMODE_RAW:   begin // uncompressed
                converter_type[2:0] <= CMPRS_RAW;   // 0 - color18, 1 - color20, 2 - mono, 3 - jp4, 4 - jp4-diff
              end

            default: begin // 
                ignore_color     <=    'bx;
                four_blocks      <=    'bx;
                jp4_dc_improved  <=    'bx;
                converter_type[2:0] <= 'bx;
              end
       endcase
//       uncompressed <= cmprs_mode_xclk[3:0] == CMPRS_CBIT_CMODE_RAW;
    end
    always @ (posedge xclk) begin
        if (!cmprs_en_mclk_r || (!uncompressed_xclk && !compressor_running)) uncompressed <= 0;
        else if (frame_start_xclk)                                           uncompressed <= uncompressed_xclk;

        if (!cmprs_en_mclk_r || ( uncompressed_xclk && !compressor_running)) compressed <= 0;
        else if (frame_start_xclk)                                           compressed <= !uncompressed_xclk;
    end
    
    
//frame_start_xclk
    pulse_cross_clock ctrl_we_xclk_i       (.rst(mrst), .src_clk(mclk), .dst_clk(xclk), .in_pulse(ctrl_we_r),      .out_pulse(ctrl_we_xclk),.busy());
    pulse_cross_clock format_we_xclk_i     (.rst(mrst), .src_clk(mclk), .dst_clk(xclk), .in_pulse(format_we_r),    .out_pulse(format_we_xclk),.busy());
    pulse_cross_clock color_sat_we_xclk_i  (.rst(mrst), .src_clk(mclk), .dst_clk(xclk), .in_pulse(color_sat_we_r), .out_pulse(color_sat_we_xclk),.busy());
    pulse_cross_clock coring__we_xclk_i    (.rst(mrst), .src_clk(mclk), .dst_clk(xclk), .in_pulse(coring_we_r),    .out_pulse(coring_we_xclk),.busy());
    
    pulse_cross_clock frame_start_xclk_i   (.rst(mrst), .src_clk(mclk), .dst_clk(xclk), .in_pulse(frame_start),    .out_pulse(frame_start_xclk),.busy());

endmodule
