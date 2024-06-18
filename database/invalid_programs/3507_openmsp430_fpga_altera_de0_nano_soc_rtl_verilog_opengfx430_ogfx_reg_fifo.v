// This program was cloned from: https://github.com/olgirard/openmsp430
// License: BSD 3-Clause "New" or "Revised" License

//----------------------------------------------------------------------------
// Copyright (C) 2015 Authors
//
// This source file may be used and distributed without restriction provided
// that this copyright statement is not removed from the file and that any
// derivative work contains the original copyright notice and the associated
// disclaimer.
//
// This source file is free software; you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published
// by the Free Software Foundation; either version 2.1 of the License, or
// (at your option) any later version.
//
// This source is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public
// License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this source; if not, write to the Free Software Foundation,
// Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
//
//----------------------------------------------------------------------------
//
// *File Name: ogfx_backend_lut_fifo.v
//
// *Module Description:
//                      Simple FIFO module
//
// *Author(s):
//              - Olivier Girard,    olgirard@gmail.com
//
//----------------------------------------------------------------------------
// $Rev$
// $LastChangedBy$
// $LastChangedDate$
//----------------------------------------------------------------------------
`ifdef OGFX_NO_INCLUDE
`else
`include "openGFX430_defines.v"
`endif

module  ogfx_reg_fifo (

// OUTPUTs
    fifo_cnt_o,                          // Fifo counter
    fifo_empty_cnt_o,                    // Fifo empty words counter
    fifo_data_o,                         // Read data output
    fifo_done_evt_o,                     // Fifo has been emptied
    fifo_empty_o,                        // Fifo is currentely empty
    fifo_full_o,                         // Fifo is currentely full
    fifo_ovfl_evt_o,                     // Fifo overflow event

// INPUTs
    mclk,                                // Main system clock
    puc_rst,                             // Main system reset

    fifo_data_i,                         // Read data input
    fifo_enable_i,                       // Enable fifo (flushed when disabled)
    fifo_pop_i,                          // Pop data from the fifo
    fifo_push_i                          // Push new data to the fifo
);

// OUTPUTs
//=========
output         [3:0] fifo_cnt_o;         // Fifo counter
output         [3:0] fifo_empty_cnt_o;   // Fifo empty word counter
output        [15:0] fifo_data_o;        // Read data output
output               fifo_done_evt_o;    // Fifo has been emptied
output               fifo_empty_o;       // Fifo is currentely empty
output               fifo_full_o;        // Fifo is currentely full
output               fifo_ovfl_evt_o;    // Fifo overflow event

// INPUTs
//=========
input                mclk;               // Main system clock
input                puc_rst;            // Main system reset

input         [15:0] fifo_data_i;        // Read data input
input                fifo_enable_i;      // Enable fifo (flushed when disabled)
input                fifo_pop_i;         // Pop data from the fifo
input                fifo_push_i;        // Push new data to the fifo


//=============================================================================
// 1)  WIRE, REGISTERS AND PARAMETER DECLARATION
//=============================================================================

// Some parameter(s)
parameter    FIFO_EMPTY        =  4'h0,
             FIFO_FULL         =  4'hf;

// Others
reg    [3:0] fifo_cnt_o;
wire   [3:0] fifo_cnt_nxt;


//============================================================================
// 5) FIFO COUNTER
//============================================================================

// Control signals
assign    fifo_full_o        =  (fifo_cnt_o == FIFO_FULL);
assign    fifo_empty_o       =  (fifo_cnt_o == FIFO_EMPTY);
assign    fifo_empty_cnt_o   =  (FIFO_FULL-fifo_cnt_o);
wire      fifo_push_int      =  fifo_push_i & !fifo_full_o;
wire      fifo_pop_int       =  fifo_pop_i  & !fifo_empty_o;

// Events
assign    fifo_done_evt_o = ~fifo_empty_o & (fifo_cnt_nxt == FIFO_EMPTY);
assign    fifo_ovfl_evt_o =  fifo_push_i  &  fifo_full_o;


// Fifo counter
assign fifo_cnt_nxt = ~fifo_enable_i                 ?  FIFO_EMPTY        : // Initialize
                      (fifo_push_int & fifo_pop_int) ?  fifo_cnt_o        : // Keep value (pop & push at the same time)
                       fifo_push_int                 ?  fifo_cnt_o + 3'h1 : // Push
                       fifo_pop_int                  ?  fifo_cnt_o - 3'h1 : // Pop
                                                        fifo_cnt_o;         // Hold

always @(posedge mclk or posedge puc_rst)
  if (puc_rst) fifo_cnt_o <= FIFO_EMPTY;
  else         fifo_cnt_o <= fifo_cnt_nxt;


//============================================================================
// 6) FIFO MEMORY & RD/WR POINTERS
//============================================================================

// Write pointer
reg [3:0] wr_ptr;
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                    wr_ptr  <=  4'h0;
  else if (~fifo_enable_i)        wr_ptr  <=  4'h0;
  else if (fifo_push_int)
    begin
       if (wr_ptr==(FIFO_FULL-1)) wr_ptr  <=  4'h0;
       else                       wr_ptr  <=  wr_ptr + 4'h1;
    end

// Memory
reg [15:0] fifo_mem [0:15];
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)
    begin
       fifo_mem[0]      <=  16'h0000;
       fifo_mem[1]      <=  16'h0000;
       fifo_mem[2]      <=  16'h0000;
       fifo_mem[3]      <=  16'h0000;
       fifo_mem[4]      <=  16'h0000;
       fifo_mem[5]      <=  16'h0000;
       fifo_mem[6]      <=  16'h0000;
       fifo_mem[7]      <=  16'h0000;
       fifo_mem[8]      <=  16'h0000;
       fifo_mem[9]      <=  16'h0000;
       fifo_mem[10]     <=  16'h0000;
       fifo_mem[11]     <=  16'h0000;
       fifo_mem[12]     <=  16'h0000;
       fifo_mem[13]     <=  16'h0000;
       fifo_mem[14]     <=  16'h0000;
       fifo_mem[15]     <=  16'h0000;
    end
  else if (fifo_push_int)
    begin
       fifo_mem[wr_ptr] <=  fifo_data_i;
    end

// Read pointer
reg [3:0] rd_ptr;
always @(posedge mclk or posedge puc_rst)
  if (puc_rst)                    rd_ptr  <=  4'h0;
  else if (~fifo_enable_i)        rd_ptr  <=  4'h0;
  else if (fifo_pop_int)
    begin
       if (rd_ptr==(FIFO_FULL-1)) rd_ptr  <=  4'h0;
       else                       rd_ptr  <=  rd_ptr + 4'h1;
    end

assign fifo_data_o = fifo_mem[rd_ptr];


endmodule // ogfx_reg_fifo

`ifdef OGFX_NO_INCLUDE
`else
`include "openGFX430_undefines.v"
`endif
