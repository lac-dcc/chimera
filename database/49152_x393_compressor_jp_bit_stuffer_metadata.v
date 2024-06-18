// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>bit_stuffer_metadata
 * @file bit_stuffer_metadata.v
 * @date 2015-10-25  
 * @author Andrey Filippov     
 *
 * @brief Bit stuffer combines variable length fragments (up to 16 bits long)
 * from the Huffman encoder to a byte stream, escapes every 0xff byte with 
 * 0x00 and adds file length and timestamp metadata
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * bit_stuffer_metadata.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  bit_stuffer_metadata.v is distributed in the hope that it will be useful,
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

module  bit_stuffer_metadata(
    input              mclk,
    input              mrst,       // @posedge mclk, sync reset
    input              xclk,
    input              xrst,       // @posedge xclk, sync reset
    input              last_block, //  use it to copy timestamp from fifo 
    
    
// time stamping - will copy time at the end of color_first (later than the first hact after vact in the current frame, but before the next one
// and before the data is needed for output 
    input              ts_pre_stb,  // @mclk - 1 cycle before receiving 8 bytes of timestamp data
    input        [7:0] ts_data,     // timestamp data (s0,s1,s2,s3,us0,us1,us2,us3==0)
    input              color_first, // @fradv_clk only used for timestamp

    input       [31:0] din,         // input data, MSB aligned
    input        [1:0] bytes_in,    // number of bytes, valid @ ds (0 means 4)
    input              in_stb,      // input data/bytes_in strobe
    input              flush,       // end of input data 
    input              abort,       // @ any, extracts 0->1 and flushes

    // outputs @ negedge clk
    output reg  [31:0] data_out,      // [31:0] output data
    output reg         data_out_valid,// output data valid
    output reg         done,        // reset by !en, goes high after some delay after flushing
    output reg         running      // from registering timestamp until done
`ifdef DEBUG_RING
,   output reg [3:0]  dbg_etrax_dma
   ,output            dbg_ts_rstb
   ,output [7:0]      dbg_ts_dout

`endif        
);

    reg     [7:0] time_ram0[0:3]; // 0 - seconds, 1 - microseconds MSB in the output 32-bit word, byt LSB of the sec/usec
    reg     [7:0] time_ram1[0:3];
    reg     [7:0] time_ram2[0:3];
    reg     [7:0] time_ram3[0:3];
    reg     [3:0] ts_in=8;         
    reg           last_block_d; // last_block delayed by one clock
    reg           color_first_r;   
    reg     [2:0] abort_r;
    reg           force_flush;
    
//    reg           color_first_r; // registered with the same clock as color_first to extract leading edge
    
// stb_time[2] - single-cycle pulse after color_first goes low 
//    reg    [19:0] imgsz32; // current image size in multiples of 32-bytes
    reg    [21:0] imgsz4; // current image size in multiples of 4-bytes
    reg           last_stb_4; // last stb_in was 4 bytes
    reg           trailer;
    reg           meta_out; 
    reg     [1:0] meta_word;
    reg           zeros_out; // output of 32 bytes (8 words) of zeros 
    wire          trailer_done = (imgsz4[2:0] == 7) && zeros_out;
    wire          meta_last = (imgsz4[2:0] == 7) &&    meta_out;
    // re-clock enable to this clock
    
    wire          ts_rstb= last_block && !last_block_d;  // enough time to have timestamp data; // one cycle before getting timestamp data from FIFO
    wire    [7:0] ts_dout; // timestamp data, byte at a time
    wire          write_size = (in_stb && (bytes_in != 0)) || (flush && last_stb_4);
    wire          stb_start = !color_first && color_first_r;
    wire          stb = in_stb & !trailer && !force_flush;
    always @ (posedge xclk) begin
        if (xrst ||trailer_done) imgsz4 <= 0;
        else if (stb || trailer) imgsz4 <= imgsz4 + 1;
    
        if (stb) last_stb_4 <= (bytes_in == 0);
        
        last_block_d <=  last_block;
        color_first_r <= color_first;
    
        if      (xrst)       ts_in <= 8;
        else if (ts_rstb)    ts_in <= 0;
        else if (!ts_in[3])  ts_in <= ts_in + 1;
        
        if ((!ts_in[3] && (ts_in[1:0] == 0)) || write_size) time_ram0[ts_in[3:2]] <= ts_in[3]? ({imgsz4[5:0],flush?2'b0:bytes_in}):ts_dout; //ts_in[3:2] == 2'b10 when write_size
        if ((!ts_in[3] && (ts_in[1:0] == 1)) || write_size) time_ram1[ts_in[3:2]] <= ts_in[3]? (imgsz4[13:6]):ts_dout;
        if ((!ts_in[3] && (ts_in[1:0] == 2)) || write_size) time_ram2[ts_in[3:2]] <= ts_in[3]? (imgsz4[21:14]):ts_dout;
        if ((!ts_in[3] && (ts_in[1:0] == 3)) || write_size) time_ram3[ts_in[3:2]] <= ts_in[3]? (8'hff):ts_dout;
        
        if      (xrst)                 trailer <= 0;
        else if (flush || force_flush) trailer <= 1;
        else if (trailer_done)         trailer <= 0;

        if      (xrst)                                       meta_out <= 0;
        else if (trailer && (imgsz4[2:0] == 4) &&!zeros_out) meta_out <= 1;
        else if (meta_last)                                  meta_out <= 0;
        
        if (!meta_out) meta_word <= 0;
        else           meta_word <= meta_word + 1;
        
        if      (xrst)         zeros_out <= 0;
        else if (meta_last)    zeros_out <= 1;
        else if (trailer_done) zeros_out <= 0;
        
        data_out <= ({32{stb}} & din) | ({32{meta_out}} & {time_ram0[meta_word],time_ram1[meta_word],time_ram2[meta_word],time_ram3[meta_word]});
        data_out_valid <= stb || trailer;
        
        
        if      (xrst || trailer) running <= 0;
        else if (stb_start)       running <= 1;
        
        done <= trailer_done;
        // re-clock abort, extract leading edge
        abort_r <= {abort_r[0] & ~abort_r[1], abort_r[0], abort & ~trailer};
        
        if      (xrst || trailer)  force_flush <= 0;
        else if (abort_r)          force_flush <= 1;
        
    end
    
    // just for testing
`ifdef DEBUG_RING
    assign dbg_ts_rstb = ts_rstb;
    assign dbg_ts_dout = ts_dout;

    always @ (posedge xclk) begin
       dbg_etrax_dma <= imgsz4[3:0];
    end   
`endif        
    
//color_first && color_first_r
    timestamp_fifo timestamp_fifo_i (
        .sclk     (mclk),         // input
        .srst     (mrst),         // input
        .pre_stb  (ts_pre_stb),   // input
        .din      (ts_data),      // input[7:0] 
        .aclk     (xclk),         //fradv_clk),   // input
        .arst     (xrst),         //fradv_clk),   // input
        .advance  (stb_start),    // triggers at the 0->1
        .rclk     (xclk),         // input
        .rrst     (xrst),         //fradv_clk),   // input
        .rstb     (ts_rstb),      // input
        .dout     (ts_dout)       // output[7:0] reg 
    );

endmodule
