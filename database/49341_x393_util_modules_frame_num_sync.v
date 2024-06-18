// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>frame_num_sync
 * @file frame_num_sync.v
 * @date 2016-04-28  
 * @author Andrey Filippov     
 *
 * @brief Propagating frame number from acquisition to compressor output
 *
 * @copyright Copyright (c) 2016 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * frame_num_sync.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  frame_num_sync.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 */
`timescale 1ns/1ps

module  frame_num_sync  #(
    parameter NUM_FRAME_BITS = 4,
    parameter LAST_FRAME_BITS = 16,
    parameter FRAME_BITS_KEEP = 4    // number of bits from mcntrl frame number used to index absolute sensor frame number 
)(
// SuppressWarnings VEditor unused 
    input                             mrst,
    input                             mclk, // for command/status
    input      [NUM_FRAME_BITS*4-1:0] absolute_frames,          // per-channel current sensor frame number
    input                       [3:0] first_wr_in_frame,        // sensor writes first block in a frame
//    input                     [3:0] first_rd_in_frame,        // compressor gets first block in a frame
    input     [4*LAST_FRAME_BITS-1:0] memory_frames_sensor,     // 4 channels of frame numbers as defined for memory allocation
    input     [4*LAST_FRAME_BITS-1:0] memory_frames_compressor, // 4 channels of frame numbers as defined for memory allocation, valid after compression (before done)
    output reg [NUM_FRAME_BITS*4-1:0] compressed_frames         // frame numbers valid at compressor done (TODO: keep until IRQ cleared? pointers will change anyway) 
);
    reg      [NUM_FRAME_BITS-1:0] frames_ram0[0: (1<<FRAME_BITS_KEEP) -1];
    reg      [NUM_FRAME_BITS-1:0] frames_ram1[0: (1<<FRAME_BITS_KEEP) -1];
    reg      [NUM_FRAME_BITS-1:0] frames_ram2[0: (1<<FRAME_BITS_KEEP) -1];
    reg      [NUM_FRAME_BITS-1:0] frames_ram3[0: (1<<FRAME_BITS_KEEP) -1];
    always @ (posedge mclk) begin
        if (first_wr_in_frame[0]) frames_ram0[memory_frames_sensor[0*LAST_FRAME_BITS+:FRAME_BITS_KEEP]] <= absolute_frames[0*NUM_FRAME_BITS +: NUM_FRAME_BITS];
        if (first_wr_in_frame[1]) frames_ram1[memory_frames_sensor[1*LAST_FRAME_BITS+:FRAME_BITS_KEEP]] <= absolute_frames[1*NUM_FRAME_BITS +: NUM_FRAME_BITS];
        if (first_wr_in_frame[2]) frames_ram2[memory_frames_sensor[2*LAST_FRAME_BITS+:FRAME_BITS_KEEP]] <= absolute_frames[2*NUM_FRAME_BITS +: NUM_FRAME_BITS];
        if (first_wr_in_frame[3]) frames_ram3[memory_frames_sensor[3*LAST_FRAME_BITS+:FRAME_BITS_KEEP]] <= absolute_frames[3*NUM_FRAME_BITS +: NUM_FRAME_BITS];
        compressed_frames[0*NUM_FRAME_BITS +: NUM_FRAME_BITS] <= frames_ram0[memory_frames_compressor[0*LAST_FRAME_BITS+:FRAME_BITS_KEEP]];
        compressed_frames[1*NUM_FRAME_BITS +: NUM_FRAME_BITS] <= frames_ram1[memory_frames_compressor[1*LAST_FRAME_BITS+:FRAME_BITS_KEEP]];
        compressed_frames[2*NUM_FRAME_BITS +: NUM_FRAME_BITS] <= frames_ram2[memory_frames_compressor[2*LAST_FRAME_BITS+:FRAME_BITS_KEEP]];
        compressed_frames[3*NUM_FRAME_BITS +: NUM_FRAME_BITS] <= frames_ram3[memory_frames_compressor[3*LAST_FRAME_BITS+:FRAME_BITS_KEEP]];
    end


endmodule

//    wire   [4*LAST_FRAME_BITS-1:0] cmprs_frame_number_src;// input[15:0] current frame number (for multi-frame ranges) in the source (sensor) channel
