// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*******************************************************************************
 * Module: fifo_same_clock_fill
 * Date:2014-05-20  
 * Author: Andrey Filippov
 * Description: Configurable synchronous FIFO using the same clock for read and write.
 * Provides fill level - number of words currently in FIFO
 *
 * Copyright (c) 2014 Elphel, Inc.
 * fifo_same_clock_fill.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  fifo_same_clock_fill.v is distributed in the hope that it will be useful,
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
 *******************************************************************************/
`timescale 1ns/1ps
`include "system_defines.vh" 
module fifo_same_clock_fill
#(
  parameter integer DATA_WIDTH=16,
  parameter integer DATA_DEPTH=4
)
    (
  input                   rst,      // reset, active high
  input                   clk,      // clock - positive edge
  input                   sync_rst, // synchronously reset fifo;
  input                   we,       // write enable
  input                   re,       // read enable
  input  [DATA_WIDTH-1:0] data_in,  // input data
  output [DATA_WIDTH-1:0] data_out, // output data
  output                  nempty,   // FIFO has some data
  output reg              half_full, // FIFO half full
  output reg                 under,    // debug outputs - under - attempt to read from empty
  output reg                  over,      // overwritten
  output reg [DATA_DEPTH-1:0] wcount,
  output reg [DATA_DEPTH-1:0] rcount,
  output     [DATA_DEPTH:  0] wnum_in_fifo, // number of items in FIFO on write side
  output     [DATA_DEPTH:  0] rnum_in_fifo  // number of items in FIFO on read side
);
    localparam integer DATA_2DEPTH=(1<<DATA_DEPTH)-1;
//ISExst: FF/Latch ddrc_test01.axibram_write_i.waddr_i.fill[4] has a constant value of 0 in block <ddrc_test01>. This FF/Latch will be trimmed during the optimization process.
//ISExst: FF/Latch ddrc_test01.axibram_read_i.raddr_i.fill[4] has a constant value of 0 in block <ddrc_test01>. This FF/Latch will be trimmed during the optimization process.
//ISExst: FF/Latch ddrc_test01.axibram_write_i.wdata_i.fill[4] has a constant value of 0 in block <ddrc_test01>. This FF/Latch will be trimmed during the optimization process.
// Do not understand - why?
    reg  [DATA_DEPTH:  0] fill=0; // RAM fill
    reg  [DATA_DEPTH:  0] wfifo_fill=0; // FIFO (RAM+reg) fill - total number in FIFO
    reg  [DATA_DEPTH:  0] rfifo_fill=0; // number in FIFO, ready to be read out
    reg  [DATA_WIDTH-1:0] inreg;
    reg  [DATA_WIDTH-1:0] outreg;
    reg  [DATA_DEPTH-1:0] ra;
    reg  [DATA_DEPTH-1:0] wa;
    wire   [DATA_DEPTH:0] next_fill;
    reg             [1:0] wem;
    wire rem;
    reg  out_full=0; //output register full
    reg  [DATA_WIDTH-1:0]   ram [0:DATA_2DEPTH];
    
    reg  ram_nempty;
    
    assign next_fill = fill[DATA_DEPTH:0]+((wem[0] && ~rem)?1:((~wem[0] && rem && ram_nempty)?-1:0));
    assign rem= ram_nempty && (re || !out_full); 
    assign data_out=outreg;
    assign nempty=out_full;
//    assign num_in_fifo=fill[DATA_DEPTH:0];
    assign wnum_in_fifo=wfifo_fill[DATA_DEPTH:0];
    assign rnum_in_fifo=rfifo_fill[DATA_DEPTH:0];
    always @ (posedge  clk or posedge  rst) begin
      if      (rst)            fill <= 0;
      else if (sync_rst)       fill <= 0;
      else                     fill <= next_fill;
      
      if      (rst)            wfifo_fill <= 0;
      else if (sync_rst)       wfifo_fill <= 0;
      else if ( we && !re)     wfifo_fill <= wfifo_fill+1;
      else if (!we &&  re)     wfifo_fill <= wfifo_fill-1;

      if      (rst)            rfifo_fill <= 0; // pessimistic, all writes are delayed by 2
      else if (sync_rst)       rfifo_fill <= 0;
      else if ( wem[1] && !re) rfifo_fill <= rfifo_fill+1;
      else if (!wem[1] &&  re) rfifo_fill <= rfifo_fill-1;

      if (rst)           wem <= 0;
      else if (sync_rst) wem <= 0;
      else               wem <= {wem[0], we};
      
      if   (rst)         ram_nempty <= 0;
      else if (sync_rst) ram_nempty <= 0;
      else               ram_nempty <= (next_fill != 0);
     
      if (rst)           wa <= 0;
      else if (sync_rst) wa <= 0;
      else if (wem[0])   wa <= wa+1;
      
      if (rst)              ra <=  0;
      else if (sync_rst)    ra <= 0;
      else if (rem)         ra <= ra+1;
      else if (!ram_nempty) ra <= wa; // Just recover from bit errors

      if (rst)             out_full <= 0;
      else if (sync_rst)   out_full <= 0;
      else if (rem && ~re) out_full <= 1;
      else if (re && ~rem) out_full <= 0;
      if (rst)            wcount <= 0;
      else if (sync_rst)  wcount <= 0;
      else if (we)        wcount <= wcount + 1;

      if (rst)           rcount <= 0;
      else if (sync_rst) rcount <= 0;
      else if (re)       rcount <= rcount + 1;
    end

// no reset elements
    always @ (posedge  clk) begin
      half_full <=(fill & (1<<(DATA_DEPTH-1)))!=0;
      
      if (wem[0]) ram[wa] <= inreg;
      
      if (we)     inreg  <= data_in;
      
      if (rem)    outreg <= ram[ra];
      under <= re & ~nempty; // underrun error
      over <=  wem[0] & ~rem & fill[DATA_DEPTH] & ~fill[DATA_DEPTH-1];    // overrun error
    end
endmodule
