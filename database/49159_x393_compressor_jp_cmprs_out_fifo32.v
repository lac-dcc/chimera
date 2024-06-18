// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmprs_out_fifo32
 * @file cmprs_out_fifo32.v
 * @date 2015-06-25  
 * @author Andrey Filippov     
 *
 * @brief Compressor output FIFO, modified to use 32-bit input and xclk
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmprs_out_fifo32.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmprs_out_fifo32.v is distributed in the hope that it will be useful,
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

module  cmprs_out_fifo32(
//    input              rst,          // mostly for simulation

    // wclk domain
    input              wclk,         // source clock (1x pixel clock)
    input              wrst,         // @posedge wclk, sync reset
    input              we,
    input       [31:0] wdata,
    input              wa_rst,       // reset low address bits when stuffer is disabled (to make sure it is multiple of 32 bytes
    input              wlast,        // written last 32 bytes of a frame (flush FIFO) - stuffer_done (has to be later than we)
    output             eof_written_wclk, // eof_written - reclocked to wclk
    
    // rclk domain
    input              rclk,
    input              rrst,         // @posedge rclk, sync reset
    input              rst_fifo,     // reset FIFO (set read address to write, reset count)
    input              ren,
    output      [63:0] rdata,
    output             eof,          // single rclk pulse signalling EOF
    input              eof_written,  // confirm frame written ofer AFI to the system memory (single rclk pulse)
    output             flush_fifo,   // EOF, need to output all what is in FIFO (Stays active until enough data chunks are read)
    output      [7:0]  fifo_count    // number of 32-byte chunks in FIFO

);
    reg        regen;
    reg [ 8:0] raddr;
    reg [ 7:0] count32;
    reg [ 7:0] lcount32; // counting chunks left in the same frame
    reg [ 9:0] waddr;
    wire       written32b; // written 32 bytes, re-clocked to read clock domain (single-cycle)
    wire       wlast_rclk;
    reg        flush_fifo_r;
    
    assign flush_fifo = flush_fifo_r;
    assign fifo_count = count32;
    assign eof = wlast_rclk;
    
    always @ (posedge wclk) begin
        if      (wrst)   waddr <= 0;
        else if (wa_rst) waddr <= waddr & 10'h3f8; // reset 3 LSBs only
        else if (we)     waddr <= waddr + 1;
    end
    
    always @ (posedge rclk) begin
        regen <= ren;
        
        if (rst_fifo) raddr <= {waddr[9:3],2'b0};
        else if (ren) raddr <= raddr + 1;
        
        if      (rst_fifo)                               count32 <= 0;
        else if ( written32b && !(ren && (&raddr[1:0]))) count32 <=  count32 + 1;
        else if (!written32b &&  (ren && (&raddr[1:0]))) count32 <=  count32 - 1;
        
        
        if      (rst_fifo)                               lcount32 <= 0;
        else if (wlast_rclk)                             lcount32 <= count32;
        else if ((lcount32 !=0) && ren && (&raddr[1:0])) lcount32 <= lcount32 - 1;
        
        if (rst_fifo)                                          flush_fifo_r <= 0;
        else if (wlast_rclk)                                   flush_fifo_r <= 1;
        else if ((count32[7:1] == 0) && ( !count32[0] || ren)) flush_fifo_r <= 0;
        
    end

// wclk -> rclk
    pulse_cross_clock written32b_i (.rst(wrst), .src_clk(wclk), .dst_clk(rclk), .in_pulse(we && (&waddr[2:0])), .out_pulse(written32b),.busy());
    pulse_cross_clock wlast_rclk_i (.rst(wrst), .src_clk(wclk), .dst_clk(rclk), .in_pulse(wlast),               .out_pulse(wlast_rclk),.busy());
// rclk -> wclk
    pulse_cross_clock eof_written_wclk_i (.rst(rrst), .src_clk(rclk), .dst_clk(wclk), .in_pulse(eof_written), .out_pulse(eof_written_wclk),.busy());
    ram_var_w_var_r #(
        .COMMENT("cmprs_out_fifo32"),
        .REGISTERS(1),
        .LOG2WIDTH_WR(5),
        .LOG2WIDTH_RD(6)
    ) fifo_i (
        .rclk     (rclk),                // input
        .raddr    (raddr),               // input[8:0] 
        .ren      (ren),                  // input
        .regen    (regen),                // input
        .data_out (rdata),                // output[63:0] 
        .wclk     (wclk),                 // input - OK, negedge mclk
        .waddr    (waddr),                // input[10:0]
        .we       (we),                   // input
        .web      (8'hff),                // input[7:0]
        .data_in  (wdata)                 // input[15:0]
    );


endmodule

