//----------------------------------------------------------------------------
// Copyright (C) 2001 Authors
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
// *File Name: sync_debouncer.v
//
// *Module Description:
//                      Super basic 10ms debouncer.
//
// *Author(s):
//              - Olivier Girard,    olgirard@gmail.com
//
//----------------------------------------------------------------------------
// $Rev$
// $LastChangedBy$
// $LastChangedDate$
//----------------------------------------------------------------------------

module sync_debouncer_10ms (

// OUTPUTs
    signal_debounced,          // Synchronized and 10ms debounced signal

// INPUTs
    clk_50mhz,                 // 50MHz clock
    rst,                       // reset
    signal_async               // Asynchonous signal
);

// OUTPUTs
//=========
output     signal_debounced;   // Synchronized and 10ms debounced signal

// INPUTs
//=========
input      clk_50mhz;          // 50MHz clock
input      rst;                // reset
input      signal_async;       // Asynchonous signal


// Synchronize signal
reg [1:0] sync_stage;
always @(posedge clk_50mhz or posedge rst)
  if (rst) sync_stage <= 2'b00;
  else     sync_stage <= {sync_stage[0], signal_async};

wire signal_sync = sync_stage[1];


// Debouncer (10.48ms = 0x7ffff x 50MHz clock cycles)
reg [18:0] debounce_counter;
always @(posedge clk_50mhz or posedge rst)
  if (rst)                               debounce_counter <= 19'h00000;
  else if(signal_debounced==signal_sync) debounce_counter <= 19'h00000;
  else                                   debounce_counter <= debounce_counter+1;

wire debounce_counter_done = (debounce_counter==19'h7ffff);

// Output signal
reg signal_debounced;
always @(posedge clk_50mhz or posedge rst)
  if (rst)                       signal_debounced <= 1'b0;
  else if(debounce_counter_done) signal_debounced <= ~signal_debounced;


endmodule
