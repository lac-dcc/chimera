// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>huffman_stuffer_meta
 * @file huffman_stuffer_meta.v
 * @date 2015-10-26  
 * @author Andrey Filippov     
 *
 * @brief Wrapper for several JPEG/JP4 compression modules. It includes
 * - Huffman encoder (huffman_snglclk),
 * - bit stuffer (bit_stuffer_27_32),
 * - escapes 0xff with 0x00 (bit_stuffer_escape)
 * - inserts meta-data (timestamp and data length) (bit_stuffer_metadata)
 *
 * This is a "new" (made for x393 project) part of the JPEG/JP4 comressor
 * that eliminates use of the double frequency clock.
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * huffman_stuffer_meta.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  huffman_stuffer_meta.v is distributed in the hope that it will be useful,
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

module  huffman_stuffer_meta(
    input              mclk,            // system clock to write tables
    input              mrst,
    input              xclk,            // pixel clock, sync to incoming data
    input              en_huffman,      // @xclk
    input              en_stuffer,      // @xclk
    input              abort_stuffer,   // @ any
    
// Interface to program Huffman tables
    input              tser_we,         // enable write to a  table
    input              tser_a_not_d,    // address/not data distributed to submodules
    input       [ 7:0] tser_d,          // byte-wide serialized tables address/data to submodules
    
// Input data     
    input       [15:0] di,              // [15:0]    specially RLL prepared 16-bit data (to FIFO) (sync to xclk)
    input              ds,              // di valid strobe  (sync to xclk)

// time stamping - will copy time at the end of color_first (later than the first hact after vact in the current frame, but before the next one
// and before the data is needed for output 
    input              ts_pre_stb,  // @mclk - 1 cycle before receiving 8 bytes of timestamp data
    input        [7:0] ts_data,     // timestamp data (s0,s1,s2,s3,us0,us1,us2,us3==0)
//TODO: Should be generated fro raw also    
    input              color_first, // @fradv_clk only used for timestamp 
    // outputs @ negedge clk
    output      [31:0] data_out,      // [31:0] output data
    output             data_out_valid,// output data valid
    output             done,        // reset by !en, goes high after some delay after flushing
    output             running,      // from registering timestamp until done
    input              clk_flush,      // other clock to generate synchronized 1-cycle flush_clk output   
    output             flush_clk       // 1-cycle flush output @ clk_flush
    
`ifdef DEBUG_RING
    ,output            test_lbw,
    output             gotLastBlock,   // last block done - flush the rest bits

    output      [3:0]  dbg_etrax_dma
   ,output             dbg_ts_rstb
   ,output      [7:0]  dbg_ts_dout
`endif        
);
    wire    [26:0] huffman_do27;
    wire     [4:0] huffman_dl;
    wire           huffman_dv;
    wire           huffman_flush;
    wire           huffman_last_block;
    
    wire    [31:0] stuffer_do32;
    wire     [1:0] stuffer_bytes;
    wire           stuffer_dv;
    wire           stuffer_flush_out;
    
    wire    [31:0] escape_do32;
    wire     [1:0] escape_bytes;
    wire           escape_dv;
    wire           escape_flush_out;
    huffman_snglclk huffman_snglclk_i (
        .xclk         (xclk), // input
        .rst          (~en_huffman), // input
        .mclk         (mclk), // input
        .tser_we      (tser_we), // input
        .tser_a_not_d (tser_a_not_d), // input
        .tser_d       (tser_d), // input[7:0] 
        .di           (di), // input[15:0] 
        .ds           (ds), // input
        .do27         (huffman_do27), // output[26:0] 
        .dl           (huffman_dl), // output[4:0] 
        .dv           (huffman_dv), // output
        .flush        (huffman_flush), // output
        .last_block   (huffman_last_block), // output
`ifdef DEBUG_RING
        .test_lbw     (test_lbw),
        .gotLastBlock (gotLastBlock),   // last block done - flush the rest bits
`else
        .test_lbw     (),
        .gotLastBlock (),              // last block done - flush the rest bits
`endif        
        .clk_flush    (clk_flush), // input
        .flush_clk    (flush_clk), // output
        .fifo_or_full() // output
    );

    bit_stuffer_27_32 #(
        .DIN_LEN(27)
    ) bit_stuffer_27_32_i (
        .xclk         (xclk),             // input
        .rst          (~en_huffman),      // input
        .din          (huffman_do27),     // input[26:0] 
        .dlen         (huffman_dl),       // input[4:0] 
        .ds           (huffman_dv),       // input
        .flush_in     (huffman_flush),    // input
        .d_out        (stuffer_do32),     // output[31:0] 
        .bytes_out    (stuffer_bytes),    // output[1:0] reg 
        .dv           (stuffer_dv),       // output reg 
        .flush_out    (stuffer_flush_out) // output reg 
    );


    bit_stuffer_escape bit_stuffer_escape_i (
        .xclk         (xclk),              // input
        .rst          (~en_huffman),       // input
        .din          (stuffer_do32),      // input[31:0] 
        .bytes_in     (stuffer_bytes),     // input[1:0] 
        .in_stb       (stuffer_dv),        // input
        .flush_in     (stuffer_flush_out), // input
        .d_out        (escape_do32),       // output[31:0] reg 
        .bytes_out    (escape_bytes),      // output[1:0] reg 
        .dv           (escape_dv),         // output reg 
        .flush_out    (escape_flush_out)   // output reg 
    );

// TODO: Insert raw data here, always 4x bytes (actually 16*16*(1..2))
    bit_stuffer_raw_metadata bit_stuffer_metadata_i (
        .mclk           (mclk),               // input
        .mrst           (mrst),               // input
        .xclk           (xclk),               // input
        .xrst           (~en_stuffer),        // input
        .last_block     (huffman_last_block), // input
        .ts_pre_stb     (ts_pre_stb),         // input
        .ts_data        (ts_data),            // input[7:0] 
        .color_first    (color_first),        // input
        .din            (escape_do32),        // input[31:0] 
        .bytes_in       (escape_bytes),       // input[1:0] 
        .in_stb         (escape_dv),          // input
        .flush          (escape_flush_out),   // input
        .abort          (abort_stuffer),      // input
        .data_out       (data_out),           // output[31:0] reg 
        .data_out_valid (data_out_valid),     // output reg 
        .done           (done),               // output reg 
        .running        (running)             // output reg 
`ifdef DEBUG_RING
        ,.dbg_etrax_dma (dbg_etrax_dma),      // output[3:0] reg 
        .dbg_ts_rstb    (dbg_ts_rstb),        // output
        .dbg_ts_dout    (dbg_ts_dout)         // output[7:0] 
`endif        
    );

endmodule

