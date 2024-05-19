// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>fifo_1cycle
 * @file fifo_1cycle.v
 * @date 2014-05-20  
 * @author Andrey Filippov
 *
 * @brief Configurable synchronous FIFO using the same clock for read and write
 * Single clock cycle latency - simple fifo using sync in, async out RAM,
 * no registers on input and output.
 *
 * @copyright Copyright (c) 2014 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * fifo_1cycle.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  fifo_1cycle.v is distributed in the hope that it will be useful,
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
`include "system_defines.vh" 
//`define DEBUG_FIFO 1 
module fifo_1cycle
#(
  parameter integer DATA_WIDTH=16,
  parameter integer DATA_DEPTH=4
)
    (
  input                   rst,      // reset, active high
  input                   clk,      // clock - positive edge
  input                   sync_rst, // sync reset
  input                   we,       // write enable
  input                   re,       // read enable
  input  [DATA_WIDTH-1:0] data_in,  // input data
  output [DATA_WIDTH-1:0] data_out, // output data
  output reg              nempty,   // FIFO has some data
  output reg              half_full // FIFO half full
`ifdef DEBUG_FIFO
    ,output reg                 under,    // debug outputs - under - attempt to read from empty
    output reg                  over,      // overwritten
    output reg [DATA_DEPTH-1:0] wcount,
    output reg [DATA_DEPTH-1:0] rcount,
    output     [DATA_DEPTH-1:0] num_in_fifo
    
`endif
  );
    localparam integer DATA_2DEPTH=(1<<DATA_DEPTH)-1;
    reg  [DATA_DEPTH-1:0] fill=0; // RAM fill
    reg  [DATA_DEPTH-1:0] ra;
    reg  [DATA_DEPTH-1:0] wa;
    wire [DATA_DEPTH-1:0] next_fill;
    reg  [DATA_WIDTH-1:0] ram [0:DATA_2DEPTH];
    
`ifdef DEBUG_FIFO
    assign num_in_fifo=fill[DATA_DEPTH-1:0];
`endif

    assign next_fill = fill[DATA_DEPTH-1:0]+((we && ~re)?1:((~we && re)?-1:0));
    
    always @ (posedge  clk or posedge  rst) begin
      if      (rst)      fill <= 0;
      else if (sync_rst) fill <= 0;
      else               fill <= next_fill;
      
      if      (rst)      wa <= 0;
      else if (sync_rst) wa <= 0;
      else if (we)       wa <= wa+1;
      
      if      (rst)      ra <=  0;
      else if (sync_rst) ra <=  0;
      else if (re)       ra <= ra+1;
      else if (fill==0)  ra <= wa; // Just recover from bit errors
      
      if      (rst)      nempty <= 0;
      else if (sync_rst) nempty <= 0;
      else               nempty <= (next_fill!=0);


`ifdef DEBUG_FIFO
      if      (rst)   wcount <= 0;
      else if (srst)  wcount <= 0;
      else if (we)    wcount <= wcount + 1;

      if      (rst)   rcount <= 0;
      else if (srst)  rcount <= 0;
      else if (re)    rcount <= rcount + 1;
`endif      
    end

    assign data_out=ram[ra]; // async out
    always @ (posedge  clk) begin
      half_full <=(fill & (1<<(DATA_DEPTH-1)))!=0; // MSB == 1
      if (we)  ram[wa]  <= data_in;
`ifdef DEBUG_FIFO
      under <= ~we & re & ~nempty; // underrun error
      over <=  we & ~re & (fill == (1<< (DATA_DEPTH-1)));    // overrun error
`endif      
    end
endmodule
