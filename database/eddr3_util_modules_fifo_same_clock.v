/*******************************************************************************
 * Module: fifo_same_clock
 * Date:2014-05-20  
 * Author: Andrey Filippov
 * Description: Configurable synchronous FIFO using the same clock for read and write
 *
 * Copyright (c) 2014 Elphel, Inc.
 * fifo_same_clock.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  fifo_same_clock.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps
`define DEBUG_FIFO 1 
module fifo_same_clock
#(
  parameter integer DATA_WIDTH=16,
  parameter integer DATA_DEPTH=4
)
    (
  input                   rst,      // reset, active high
  input                   clk,      // clock - positive edge
  input                   we,       // write enable
  input                   re,       // read enable
  input  [DATA_WIDTH-1:0] data_in,  // input data
  output [DATA_WIDTH-1:0] data_out, // output data
  output                  nempty,   // FIFO has some data
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
//ISExst: FF/Latch ddrc_test01.axibram_write_i.waddr_i.fill[4] has a constant value of 0 in block <ddrc_test01>. This FF/Latch will be trimmed during the optimization process.
//ISExst: FF/Latch ddrc_test01.axibram_read_i.raddr_i.fill[4] has a constant value of 0 in block <ddrc_test01>. This FF/Latch will be trimmed during the optimization process.
//ISExst: FF/Latch ddrc_test01.axibram_write_i.wdata_i.fill[4] has a constant value of 0 in block <ddrc_test01>. This FF/Latch will be trimmed during the optimization process.
// Do not understand - why?
    reg  [DATA_DEPTH-1:0] fill=0; // RAM fill
    reg  [DATA_WIDTH-1:0] inreg;
    reg  [DATA_WIDTH-1:0] outreg;
    reg  [DATA_DEPTH-1:0] ra;
    reg  [DATA_DEPTH-1:0] wa;
    wire [DATA_DEPTH-1:0] next_fill;
    reg  wem;
    wire rem;
    reg  out_full=0; //output register full
    reg  [DATA_WIDTH-1:0]   ram [0:DATA_2DEPTH];
    
    reg  ram_nempty;
    
    assign next_fill = fill[DATA_DEPTH-1:0]+((wem && ~rem)?1:((~wem && rem && ram_nempty)?-1:0));
    assign rem= ram_nempty && (re || !out_full); 
    assign data_out=outreg;
    assign nempty=out_full;
    
`ifdef DEBUG_FIFO
    assign num_in_fifo=fill[DATA_DEPTH-1:0];
`endif
    
    always @ (posedge  clk or posedge  rst) begin
      if   (rst) fill <= 0;
      else fill <= next_fill;
      if (rst) wem <= 0;
      else     wem <= we;
      if   (rst) ram_nempty <= 0;
      else ram_nempty <= (next_fill != 0);
     
      if (rst)      wa <= 0;
      else if (wem) wa <= wa+1;
      if (rst)      ra <=  0;
      else if (rem) ra <= ra+1;
      else if (!ram_nempty) ra <= wa; // Just recover from bit errors

      if (rst)             out_full <= 0;
      else if (rem && ~re) out_full <= 1;
      else if (re && ~rem) out_full <= 0;

`ifdef DEBUG_FIFO
      if (rst)     wcount <= 0;
      else if (we) wcount <= wcount + 1;

      if (rst)     rcount <= 0;
      else if (re) rcount <= rcount + 1;
`endif      
    end

// no reset elements
    always @ (posedge  clk) begin
      half_full <=(fill & (1<<(DATA_DEPTH-1)))!=0;
      if (wem) ram[wa] <= inreg;
      if (we)  inreg  <= data_in;
      if (rem) outreg <= ram[ra];
`ifdef DEBUG_FIFO
      under <= ~we & re & ~nempty; // underrun error
      over <=  we & ~re & (fill == (1<< (DATA_DEPTH-1)));    // overrun error
`endif      
    end
endmodule
