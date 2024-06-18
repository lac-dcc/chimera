// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmprs_status
 * @file cmprs_status.v
 * @date 2015-06-25  
 * @author Andrey Filippov     
 *
 * @brief Generate compressor status word
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmprs_status.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmprs_status.v is distributed in the hope that it will be useful,
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

module  cmprs_status #(
    parameter NUM_FRAME_BITS = 4
    ) (
    input                          mrst,
    input                          mclk,         // system clock
    input                          eof_written,
    input                          stuffer_running,
    input                          reading_frame,
    input  [NUM_FRAME_BITS - 1:0] frame_num_compressed,
    input                          set_interrupts, // data = 2: disable, 3 - enable, 1 - reset irq
    input                    [1:0] data_in,
    output    [NUM_FRAME_BITS+7:0] status,
    output                         irq
);

    reg                         stuffer_running_r;
    reg                         flushing_fifo;
    reg                         is_r; // interrupt status (not masked)
    reg                         im_r; // interrupt mask
    reg  [NUM_FRAME_BITS - 1:0] frame_irq;
    
    assign status = {frame_irq[NUM_FRAME_BITS - 1:0],
                     3'b0,
                     flushing_fifo,
                     stuffer_running_r,
                     reading_frame,
                     im_r, is_r};
    assign irq =     is_r && im_r;
    
    always @(posedge mclk) begin
        if      (mrst)                         im_r <= 0;
        else if (set_interrupts && data_in[1]) im_r <= data_in[0];
    
        if      (mrst)                             is_r <= 0;
        else if (eof_written)                      is_r <= 1;
        else if (set_interrupts && (data_in == 1)) is_r <= 0;
        
        if (eof_written)                           frame_irq <= frame_num_compressed;

        stuffer_running_r <= stuffer_running;
        
        if (stuffer_running_r && !stuffer_running) flushing_fifo <= 1;
        else if (eof_written)                      flushing_fifo <= 0;
    end

endmodule

